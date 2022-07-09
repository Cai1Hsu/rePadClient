package org.jivesoftware.smackx.packet;

import java.util.Date;
import org.apache.tools.ant.taskdefs.condition.ParserSupports;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/StreamInitiation.class */
public class StreamInitiation extends IQ {
    private Feature featureNegotiation;
    private File file;
    private String id;
    private String mimeType;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/StreamInitiation$Feature.class */
    public class Feature implements PacketExtension {
        private final DataForm data;

        public Feature(DataForm dataForm) {
            StreamInitiation.this = r4;
            this.data = dataForm;
        }

        public DataForm getData() {
            return this.data;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return ParserSupports.FEATURE;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "http://jabber.org/protocol/feature-neg";
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            return "<feature xmlns=\"http://jabber.org/protocol/feature-neg\">" + this.data.toXML() + "</feature>";
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/StreamInitiation$File.class */
    public static class File implements PacketExtension {
        private Date date;
        private String desc;
        private String hash;
        private boolean isRanged;
        private final String name;
        private final long size;

        public File(String str, long j) {
            if (str == null) {
                throw new NullPointerException("name cannot be null");
            }
            this.name = str;
            this.size = j;
        }

        public Date getDate() {
            return this.date;
        }

        public String getDesc() {
            return this.desc;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return "file";
        }

        public String getHash() {
            return this.hash;
        }

        public String getName() {
            return this.name;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "http://jabber.org/protocol/si/profile/file-transfer";
        }

        public long getSize() {
            return this.size;
        }

        public boolean isRanged() {
            return this.isRanged;
        }

        public void setDate(Date date) {
            this.date = date;
        }

        public void setDesc(String str) {
            this.desc = str;
        }

        public void setHash(String str) {
            this.hash = str;
        }

        public void setRanged(boolean z) {
            this.isRanged = z;
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\" ");
            if (getName() != null) {
                sb.append("name=\"").append(StringUtils.escapeForXML(getName())).append("\" ");
            }
            if (getSize() > 0) {
                sb.append("size=\"").append(getSize()).append("\" ");
            }
            if (getDate() != null) {
                sb.append("date=\"").append(StringUtils.formatXEP0082Date(this.date)).append("\" ");
            }
            if (getHash() != null) {
                sb.append("hash=\"").append(getHash()).append("\" ");
            }
            if ((this.desc == null || this.desc.length() <= 0) && !this.isRanged) {
                sb.append("/>");
            } else {
                sb.append(">");
                if (getDesc() != null && this.desc.length() > 0) {
                    sb.append("<desc>").append(StringUtils.escapeForXML(getDesc())).append("</desc>");
                }
                if (isRanged()) {
                    sb.append("<range/>");
                }
                sb.append("</").append(getElementName()).append(">");
            }
            return sb.toString();
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        if (getType().equals(IQ.Type.SET)) {
            sb.append("<si xmlns=\"http://jabber.org/protocol/si\" ");
            if (getSessionID() != null) {
                sb.append("id=\"").append(getSessionID()).append("\" ");
            }
            if (getMimeType() != null) {
                sb.append("mime-type=\"").append(getMimeType()).append("\" ");
            }
            sb.append("profile=\"http://jabber.org/protocol/si/profile/file-transfer\">");
            String xml = this.file.toXML();
            if (xml != null) {
                sb.append(xml);
            }
        } else if (!getType().equals(IQ.Type.RESULT)) {
            throw new IllegalArgumentException("IQ Type not understood");
        } else {
            sb.append("<si xmlns=\"http://jabber.org/protocol/si\">");
        }
        if (this.featureNegotiation != null) {
            sb.append(this.featureNegotiation.toXML());
        }
        sb.append("</si>");
        return sb.toString();
    }

    public DataForm getFeatureNegotiationForm() {
        return this.featureNegotiation.getData();
    }

    public File getFile() {
        return this.file;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public String getSessionID() {
        return this.id;
    }

    public void setFeatureNegotiationForm(DataForm dataForm) {
        this.featureNegotiation = new Feature(dataForm);
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setMimeType(String str) {
        this.mimeType = str;
    }

    public void setSesssionID(String str) {
        this.id = str;
    }
}
