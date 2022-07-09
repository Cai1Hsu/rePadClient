package org.jivesoftware.smackx.jingle.nat;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUN.class */
public class STUN extends IQ {
    public static final String DOMAIN = "stun";
    public static final String ELEMENT_NAME = "query";
    private static final SmackLogger LOGGER = SmackLogger.getLogger(STUN.class);
    public static final String NAMESPACE = "google:jingleinfo";
    private List<StunServerAddress> servers = new ArrayList();
    private String publicIp = null;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUN$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            String str;
            boolean z = false;
            if (!xmlPullParser.getNamespace().equals(STUN.NAMESPACE)) {
                throw new Exception("Not a STUN packet");
            }
            STUN stun = new STUN();
            while (!z) {
                int next = xmlPullParser.next();
                String name = xmlPullParser.getName();
                xmlPullParser.getNamespace();
                if (next == 2) {
                    if (name.equals("server")) {
                        String str2 = null;
                        String str3 = null;
                        int i = 0;
                        while (i < xmlPullParser.getAttributeCount()) {
                            if (xmlPullParser.getAttributeName(i).equals("host")) {
                                str = xmlPullParser.getAttributeValue(i);
                            } else {
                                str = str2;
                                if (xmlPullParser.getAttributeName(i).equals("udp")) {
                                    str3 = xmlPullParser.getAttributeValue(i);
                                    str = str2;
                                }
                            }
                            i++;
                            str2 = str;
                        }
                        if (str2 != null && str3 != null) {
                            stun.servers.add(new StunServerAddress(str2, str3));
                        }
                    } else if (name.equals("publicip")) {
                        String str4 = null;
                        for (int i2 = 0; i2 < xmlPullParser.getAttributeCount(); i2++) {
                            if (xmlPullParser.getAttributeName(i2).equals("ip")) {
                                str4 = xmlPullParser.getAttributeValue(i2);
                            }
                        }
                        if (str4 != null && !str4.equals("")) {
                            stun.setPublicIp(str4);
                        }
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return stun;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUN$StunServerAddress.class */
    public static class StunServerAddress {
        private String port;
        private String server;

        public StunServerAddress(String str, String str2) {
            this.server = str;
            this.port = str2;
        }

        public String getPort() {
            return this.port;
        }

        public String getServer() {
            return this.server;
        }
    }

    static {
        ProviderManager.getInstance().addIQProvider(ELEMENT_NAME, NAMESPACE, new Provider());
    }

    public static STUN getSTUNServer(Connection connection) {
        STUN stun;
        if (!connection.isConnected()) {
            stun = null;
        } else {
            STUN stun2 = new STUN();
            stun2.setTo("stun." + connection.getServiceName());
            PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(stun2.getPacketID()));
            connection.sendPacket(stun2);
            stun = (STUN) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector.cancel();
        }
        return stun;
    }

    public static boolean serviceAvailable(Connection connection) {
        boolean z;
        DiscoverItems.Item next;
        if (!connection.isConnected()) {
            z = false;
        } else {
            LOGGER.debug("Service listing");
            ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(connection);
            try {
                Iterator<DiscoverItems.Item> items = instanceFor.discoverItems(connection.getServiceName()).getItems();
                loop0: while (true) {
                    z = false;
                    if (!items.hasNext()) {
                        break;
                    }
                    DiscoverInfo discoverInfo = instanceFor.discoverInfo(items.next().getEntityID());
                    Iterator<DiscoverInfo.Identity> identities = discoverInfo.getIdentities();
                    while (identities.hasNext()) {
                        DiscoverInfo.Identity next2 = identities.next();
                        if (next2.getCategory().equals("proxy") && next2.getType().equals(DOMAIN) && discoverInfo.containsFeature(NAMESPACE)) {
                            z = true;
                            break loop0;
                        }
                    }
                    LOGGER.debug(next.getName() + "-" + discoverInfo.getType());
                }
            } catch (XMPPException e) {
                e.printStackTrace();
                z = false;
            }
        }
        return z;
    }

    public void setPublicIp(String str) {
        this.publicIp = str;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<query xmlns='google:jingleinfo'/>";
    }

    public String getPublicIp() {
        return this.publicIp;
    }

    public List<StunServerAddress> getServers() {
        return this.servers;
    }
}
