package org.jivesoftware.smackx;

import java.util.Hashtable;
import java.util.Map;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.DefaultPrivateData;
import org.jivesoftware.smackx.packet.PrivateData;
import org.jivesoftware.smackx.provider.PrivateDataProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/PrivateDataManager.class */
public class PrivateDataManager {
    private static Map<String, PrivateDataProvider> privateDataProviders = new Hashtable();
    private Connection connection;
    private String user;

    /* loaded from: classes.jar:org/jivesoftware/smackx/PrivateDataManager$PrivateDataIQProvider.class */
    public static class PrivateDataIQProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            DefaultPrivateData defaultPrivateData = null;
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    String name = xmlPullParser.getName();
                    String namespace = xmlPullParser.getNamespace();
                    PrivateDataProvider privateDataProvider = PrivateDataManager.getPrivateDataProvider(name, namespace);
                    if (privateDataProvider != null) {
                        defaultPrivateData = privateDataProvider.parsePrivateData(xmlPullParser);
                    } else {
                        defaultPrivateData = new DefaultPrivateData(name, namespace);
                        boolean z2 = false;
                        while (!z2) {
                            int next2 = xmlPullParser.next();
                            if (next2 == 2) {
                                String name2 = xmlPullParser.getName();
                                if (xmlPullParser.isEmptyElementTag()) {
                                    defaultPrivateData.setValue(name2, "");
                                } else if (xmlPullParser.next() == 4) {
                                    defaultPrivateData.setValue(name2, xmlPullParser.getText());
                                }
                            } else if (next2 == 3 && xmlPullParser.getName().equals(name)) {
                                z2 = true;
                            }
                        }
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return new PrivateDataResult(defaultPrivateData);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/PrivateDataManager$PrivateDataResult.class */
    private static class PrivateDataResult extends IQ {
        private PrivateData privateData;

        PrivateDataResult(PrivateData privateData) {
            this.privateData = privateData;
        }

        @Override // org.jivesoftware.smack.packet.IQ
        public String getChildElementXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<query xmlns=\"jabber:iq:private\">");
            if (this.privateData != null) {
                this.privateData.toXML();
            }
            sb.append("</query>");
            return sb.toString();
        }

        public PrivateData getPrivateData() {
            return this.privateData;
        }
    }

    public PrivateDataManager(Connection connection) {
        if (!connection.isAuthenticated()) {
            throw new IllegalStateException("Must be logged in to XMPP server.");
        }
        this.connection = connection;
    }

    public PrivateDataManager(Connection connection, String str) {
        if (!connection.isAuthenticated()) {
            throw new IllegalStateException("Must be logged in to XMPP server.");
        }
        this.connection = connection;
        this.user = str;
    }

    public static void addPrivateDataProvider(String str, String str2, PrivateDataProvider privateDataProvider) {
        privateDataProviders.put(getProviderKey(str, str2), privateDataProvider);
    }

    public static PrivateDataProvider getPrivateDataProvider(String str, String str2) {
        return privateDataProviders.get(getProviderKey(str, str2));
    }

    private static String getProviderKey(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(str).append("/><").append(str2).append("/>");
        return sb.toString();
    }

    public static void removePrivateDataProvider(String str, String str2) {
        privateDataProviders.remove(getProviderKey(str, str2));
    }

    public PrivateData getPrivateData(final String str, final String str2) throws XMPPException {
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.PrivateDataManager.1
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                StringBuilder sb = new StringBuilder();
                sb.append("<query xmlns=\"jabber:iq:private\">");
                sb.append("<").append(str).append(" xmlns=\"").append(str2).append("\"/>");
                sb.append("</query>");
                return sb.toString();
            }
        };
        iq.setType(IQ.Type.GET);
        if (this.user != null) {
            iq.setTo(this.user);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(iq.getPacketID()));
        this.connection.sendPacket(iq);
        IQ iq2 = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq2 == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq2.getType() != IQ.Type.ERROR) {
            return ((PrivateDataResult) iq2).getPrivateData();
        }
        throw new XMPPException(iq2.getError());
    }

    public void setPrivateData(final PrivateData privateData) throws XMPPException {
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.PrivateDataManager.2
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return "<query xmlns=\"jabber:iq:private\">" + privateData.toXML() + "</query>";
            }
        };
        iq.setType(IQ.Type.SET);
        if (this.user != null) {
            iq.setTo(this.user);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(iq.getPacketID()));
        this.connection.sendPacket(iq);
        IQ iq2 = (IQ) createPacketCollector.nextResult(5000L);
        createPacketCollector.cancel();
        if (iq2 == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq2.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq2.getError());
    }
}
