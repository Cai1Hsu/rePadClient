package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.jingle.media.ContentInfo;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo.class */
public class JingleContentInfo implements PacketExtension {
    protected ContentInfo mediaInfoElement;
    private String namespace;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio.class */
    public static class Audio extends JingleContentInfo {
        public static final String NAMESPACE = "urn:xmpp:tmp:jingle:apps:rtp";

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio$Busy.class */
        public static class Busy extends Audio {
            public Busy() {
                super(ContentInfo.Audio.BUSY);
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio$Hold.class */
        public static class Hold extends Audio {
            public Hold() {
                super(ContentInfo.Audio.HOLD);
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio$Mute.class */
        public static class Mute extends Audio {
            public Mute() {
                super(ContentInfo.Audio.MUTE);
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio$Queued.class */
        public static class Queued extends Audio {
            public Queued() {
                super(ContentInfo.Audio.QUEUED);
            }
        }

        /* loaded from: classes.jar:org/jivesoftware/smackx/packet/JingleContentInfo$Audio$Ringing.class */
        public static class Ringing extends Audio {
            public Ringing() {
                super(ContentInfo.Audio.RINGING);
            }
        }

        public Audio(ContentInfo contentInfo) {
            super(contentInfo);
            setNamespace("urn:xmpp:tmp:jingle:apps:rtp");
        }

        @Override // org.jivesoftware.smackx.packet.JingleContentInfo, org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "urn:xmpp:tmp:jingle:apps:rtp";
        }
    }

    public JingleContentInfo() {
        this(null);
    }

    public JingleContentInfo(ContentInfo contentInfo) {
        this.mediaInfoElement = contentInfo;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return getMediaInfo().toString();
    }

    public ContentInfo getMediaInfo() {
        return this.mediaInfoElement;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.namespace;
    }

    protected void setNamespace(String str) {
        this.namespace = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"");
        sb.append(getNamespace()).append("\" ");
        sb.append("/>");
        return sb.toString();
    }
}
