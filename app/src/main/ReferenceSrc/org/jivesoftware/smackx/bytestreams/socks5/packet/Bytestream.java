package org.jivesoftware.smackx.bytestreams.socks5.packet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream.class */
public class Bytestream extends IQ {
    private String sessionID;
    private Activate toActivate;
    private StreamHostUsed usedHost;
    private Mode mode = Mode.tcp;
    private final List<StreamHost> streamHosts = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$Activate.class */
    public static class Activate implements PacketExtension {
        public static String ELEMENTNAME = "activate";
        public String NAMESPACE = "";
        private final String target;

        public Activate(String str) {
            this.target = str;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return ELEMENTNAME;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return this.NAMESPACE;
        }

        public String getTarget() {
            return this.target;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName()).append(">");
            sb.append(getTarget());
            sb.append("</").append(getElementName()).append(">");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$Mode.class */
    public enum Mode {
        tcp,
        udp;

        public static Mode fromName(String str) {
            Mode mode;
            try {
                mode = valueOf(str);
            } catch (Exception e) {
                mode = tcp;
            }
            return mode;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost.class */
    public static class StreamHost implements PacketExtension {
        private final String JID;
        private final String addy;
        private int port = 0;
        public static String NAMESPACE = "";
        public static String ELEMENTNAME = "streamhost";

        public StreamHost(String str, String str2) {
            this.JID = str;
            this.addy = str2;
        }

        public String getAddress() {
            return this.addy;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return ELEMENTNAME;
        }

        public String getJID() {
            return this.JID;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return NAMESPACE;
        }

        public int getPort() {
            return this.port;
        }

        public void setPort(int i) {
            this.port = i;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName()).append(" ");
            sb.append("jid=\"").append(getJID()).append("\" ");
            sb.append("host=\"").append(getAddress()).append("\" ");
            if (getPort() != 0) {
                sb.append("port=\"").append(getPort()).append("\"");
            } else {
                sb.append("zeroconf=\"_jabber.bytestreams\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHostUsed.class */
    public static class StreamHostUsed implements PacketExtension {
        public static String ELEMENTNAME = "streamhost-used";
        private final String JID;
        public String NAMESPACE = "";

        public StreamHostUsed(String str) {
            this.JID = str;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return ELEMENTNAME;
        }

        public String getJID() {
            return this.JID;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return this.NAMESPACE;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName()).append(" ");
            sb.append("jid=\"").append(getJID()).append("\" ");
            sb.append("/>");
            return sb.toString();
        }
    }

    public Bytestream() {
    }

    public Bytestream(String str) {
        setSessionID(str);
    }

    public StreamHost addStreamHost(String str, String str2) {
        return addStreamHost(str, str2, 0);
    }

    public StreamHost addStreamHost(String str, String str2, int i) {
        StreamHost streamHost = new StreamHost(str, str2);
        streamHost.setPort(i);
        addStreamHost(streamHost);
        return streamHost;
    }

    public void addStreamHost(StreamHost streamHost) {
        this.streamHosts.add(streamHost);
    }

    public int countStreamHosts() {
        return this.streamHosts.size();
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        String sb;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("<query xmlns=\"http://jabber.org/protocol/bytestreams\"");
        if (getType().equals(IQ.Type.SET)) {
            if (getSessionID() != null) {
                sb2.append(" sid=\"").append(getSessionID()).append("\"");
            }
            if (getMode() != null) {
                sb2.append(" mode = \"").append(getMode()).append("\"");
            }
            sb2.append(">");
            if (getToActivate() == null) {
                for (StreamHost streamHost : getStreamHosts()) {
                    sb2.append(streamHost.toXML());
                }
            } else {
                sb2.append(getToActivate().toXML());
            }
        } else if (!getType().equals(IQ.Type.RESULT)) {
            sb = getType().equals(IQ.Type.GET) ? sb2.append("/>").toString() : null;
            return sb;
        } else {
            sb2.append(">");
            if (getUsedHost() != null) {
                sb2.append(getUsedHost().toXML());
            } else if (countStreamHosts() > 0) {
                for (StreamHost streamHost2 : this.streamHosts) {
                    sb2.append(streamHost2.toXML());
                }
            }
        }
        sb2.append("</query>");
        sb = sb2.toString();
        return sb;
    }

    public Mode getMode() {
        return this.mode;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public StreamHost getStreamHost(String str) {
        StreamHost streamHost;
        if (str != null) {
            Iterator<StreamHost> it = this.streamHosts.iterator();
            while (true) {
                if (!it.hasNext()) {
                    streamHost = null;
                    break;
                }
                StreamHost next = it.next();
                if (next.getJID().equals(str)) {
                    streamHost = next;
                    break;
                }
            }
        } else {
            streamHost = null;
        }
        return streamHost;
    }

    public Collection<StreamHost> getStreamHosts() {
        return Collections.unmodifiableCollection(this.streamHosts);
    }

    public Activate getToActivate() {
        return this.toActivate;
    }

    public StreamHostUsed getUsedHost() {
        return this.usedHost;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
    }

    public void setToActivate(String str) {
        this.toActivate = new Activate(str);
    }

    public void setUsedHost(String str) {
        this.usedHost = new StreamHostUsed(str);
    }
}
