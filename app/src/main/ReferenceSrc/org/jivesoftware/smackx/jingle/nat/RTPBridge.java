package org.jivesoftware.smackx.jingle.nat;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.Iterator;
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
import org.jivesoftware.smackx.packet.JingleTransport;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/RTPBridge.class */
public class RTPBridge extends IQ {
    public static final String ELEMENT_NAME = "rtpbridge";
    private static final SmackLogger LOGGER = SmackLogger.getLogger(RTPBridge.class);
    public static final String NAME = "rtpbridge";
    public static final String NAMESPACE = "http://www.jivesoftware.com/protocol/rtpbridge";
    private BridgeAction bridgeAction;
    private String hostA;
    private String hostB;
    private String ip;
    private String name;
    private String pass;
    private int portA;
    private int portB;
    private String sid;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction.class */
    private enum BridgeAction {
        create,
        change,
        publicip
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/RTPBridge$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            boolean z;
            if (!xmlPullParser.getNamespace().equals(RTPBridge.NAMESPACE)) {
                throw new Exception("Not a RTP Bridge packet");
            }
            RTPBridge rTPBridge = new RTPBridge();
            int i = 0;
            while (true) {
                z = false;
                if (i < xmlPullParser.getAttributeCount()) {
                    if (xmlPullParser.getAttributeName(i).equals("sid")) {
                        rTPBridge.setSid(xmlPullParser.getAttributeValue(i));
                    }
                    i++;
                }
            }
            while (!z) {
                int next = xmlPullParser.next();
                String name = xmlPullParser.getName();
                xmlPullParser.getNamespace();
                if (next == 2) {
                    if (name.equals(JingleTransport.JingleTransportCandidate.NODENAME)) {
                        for (int i2 = 0; i2 < xmlPullParser.getAttributeCount(); i2++) {
                            if (xmlPullParser.getAttributeName(i2).equals("ip")) {
                                rTPBridge.setIp(xmlPullParser.getAttributeValue(i2));
                            } else if (xmlPullParser.getAttributeName(i2).equals("pass")) {
                                rTPBridge.setPass(xmlPullParser.getAttributeValue(i2));
                            } else if (xmlPullParser.getAttributeName(i2).equals("name")) {
                                rTPBridge.setName(xmlPullParser.getAttributeValue(i2));
                            } else if (xmlPullParser.getAttributeName(i2).equals("porta")) {
                                rTPBridge.setPortA(Integer.parseInt(xmlPullParser.getAttributeValue(i2)));
                            } else if (xmlPullParser.getAttributeName(i2).equals("portb")) {
                                rTPBridge.setPortB(Integer.parseInt(xmlPullParser.getAttributeValue(i2)));
                            }
                        }
                    } else if (name.equals("publicip")) {
                        xmlPullParser.getAttributeCount();
                        for (int i3 = 0; i3 < xmlPullParser.getAttributeCount(); i3++) {
                            if (xmlPullParser.getAttributeName(i3).equals("ip")) {
                                rTPBridge.setIp(xmlPullParser.getAttributeValue(i3));
                            }
                        }
                    }
                } else if (next == 3 && xmlPullParser.getName().equals("rtpbridge")) {
                    z = true;
                }
            }
            return rTPBridge;
        }
    }

    static {
        ProviderManager.getInstance().addIQProvider("rtpbridge", NAMESPACE, new Provider());
    }

    public RTPBridge() {
        this.portA = -1;
        this.portB = -1;
        this.bridgeAction = BridgeAction.create;
    }

    public RTPBridge(String str) {
        this.portA = -1;
        this.portB = -1;
        this.bridgeAction = BridgeAction.create;
        this.sid = str;
    }

    public RTPBridge(String str, BridgeAction bridgeAction) {
        this.portA = -1;
        this.portB = -1;
        this.bridgeAction = BridgeAction.create;
        this.sid = str;
        this.bridgeAction = bridgeAction;
    }

    public RTPBridge(BridgeAction bridgeAction) {
        this.portA = -1;
        this.portB = -1;
        this.bridgeAction = BridgeAction.create;
        this.bridgeAction = bridgeAction;
    }

    public static String getPublicIP(Connection connection) {
        String str;
        if (!connection.isConnected()) {
            str = null;
        } else {
            RTPBridge rTPBridge = new RTPBridge(BridgeAction.publicip);
            rTPBridge.setTo("rtpbridge." + connection.getServiceName());
            rTPBridge.setType(IQ.Type.SET);
            PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(rTPBridge.getPacketID()));
            connection.sendPacket(rTPBridge);
            RTPBridge rTPBridge2 = (RTPBridge) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector.cancel();
            str = null;
            if (rTPBridge2 != null) {
                str = null;
                if (rTPBridge2.getIp() != null) {
                    str = null;
                    if (!rTPBridge2.getIp().equals("")) {
                        Enumeration<NetworkInterface> enumeration = null;
                        try {
                            enumeration = NetworkInterface.getNetworkInterfaces();
                        } catch (SocketException e) {
                            e.printStackTrace();
                        }
                        loop0: while (enumeration != null && enumeration.hasMoreElements()) {
                            Enumeration<InetAddress> inetAddresses = enumeration.nextElement().getInetAddresses();
                            while (inetAddresses.hasMoreElements()) {
                                InetAddress nextElement = inetAddresses.nextElement();
                                if (!nextElement.isLoopbackAddress() && nextElement.getHostAddress().indexOf(rTPBridge2.getIp()) >= 0) {
                                    str = null;
                                    break loop0;
                                }
                            }
                        }
                        str = rTPBridge2.getIp();
                    }
                }
            }
        }
        return str;
    }

    public static RTPBridge getRTPBridge(Connection connection, String str) {
        RTPBridge rTPBridge;
        if (!connection.isConnected()) {
            rTPBridge = null;
        } else {
            RTPBridge rTPBridge2 = new RTPBridge(str);
            rTPBridge2.setTo("rtpbridge." + connection.getServiceName());
            PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(rTPBridge2.getPacketID()));
            connection.sendPacket(rTPBridge2);
            rTPBridge = (RTPBridge) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector.cancel();
        }
        return rTPBridge;
    }

    public static RTPBridge relaySession(Connection connection, String str, String str2, TransportCandidate transportCandidate, TransportCandidate transportCandidate2) {
        RTPBridge rTPBridge;
        if (!connection.isConnected()) {
            rTPBridge = null;
        } else {
            RTPBridge rTPBridge2 = new RTPBridge(str, BridgeAction.change);
            rTPBridge2.setTo("rtpbridge." + connection.getServiceName());
            rTPBridge2.setType(IQ.Type.SET);
            rTPBridge2.setPass(str2);
            rTPBridge2.setPortA(transportCandidate2.getPort());
            rTPBridge2.setPortB(transportCandidate.getPort());
            rTPBridge2.setHostA(transportCandidate2.getIp());
            rTPBridge2.setHostB(transportCandidate.getIp());
            PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(rTPBridge2.getPacketID()));
            connection.sendPacket(rTPBridge2);
            rTPBridge = (RTPBridge) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            createPacketCollector.cancel();
        }
        return rTPBridge;
    }

    public static boolean serviceAvailable(Connection connection) {
        boolean z;
        if (!connection.isConnected()) {
            z = false;
        } else {
            LOGGER.debug("Service listing");
            try {
                Iterator<DiscoverInfo.Identity> identities = ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(connection.getServiceName()).getIdentities();
                while (true) {
                    z = false;
                    if (!identities.hasNext()) {
                        break;
                    }
                    DiscoverInfo.Identity next = identities.next();
                    if (next.getName() != null && next.getName().startsWith("rtpbridge")) {
                        z = true;
                        break;
                    }
                }
            } catch (XMPPException e) {
                e.printStackTrace();
                z = false;
            }
        }
        return z;
    }

    public String getAttributes() {
        StringBuilder sb = new StringBuilder();
        if (getSid() != null) {
            sb.append(" sid='").append(getSid()).append("'");
        }
        if (getPass() != null) {
            sb.append(" pass='").append(getPass()).append("'");
        }
        if (getPortA() != -1) {
            sb.append(" porta='").append(getPortA()).append("'");
        }
        if (getPortB() != -1) {
            sb.append(" portb='").append(getPortB()).append("'");
        }
        if (getHostA() != null) {
            sb.append(" hosta='").append(getHostA()).append("'");
        }
        if (getHostB() != null) {
            sb.append(" hostb='").append(getHostB()).append("'");
        }
        return sb.toString();
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<rtpbridge xmlns='http://www.jivesoftware.com/protocol/rtpbridge' sid='").append(this.sid).append("'>");
        if (this.bridgeAction.equals(BridgeAction.create)) {
            sb.append("<candidate/>");
        } else if (this.bridgeAction.equals(BridgeAction.change)) {
            sb.append("<relay ").append(getAttributes()).append(" />");
        } else {
            sb.append("<publicip ").append(getAttributes()).append(" />");
        }
        sb.append("</rtpbridge>");
        return sb.toString();
    }

    public String getHostA() {
        return this.hostA;
    }

    public String getHostB() {
        return this.hostB;
    }

    public String getIp() {
        return this.ip;
    }

    public String getName() {
        return this.name;
    }

    public String getPass() {
        return this.pass;
    }

    public int getPortA() {
        return this.portA;
    }

    public int getPortB() {
        return this.portB;
    }

    public String getSid() {
        return this.sid;
    }

    public void setHostA(String str) {
        this.hostA = str;
    }

    public void setHostB(String str) {
        this.hostB = str;
    }

    public void setIp(String str) {
        this.ip = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setPass(String str) {
        this.pass = str;
    }

    public void setPortA(int i) {
        this.portA = i;
    }

    public void setPortB(int i) {
        this.portB = i;
    }

    public void setSid(String str) {
        this.sid = str;
    }
}
