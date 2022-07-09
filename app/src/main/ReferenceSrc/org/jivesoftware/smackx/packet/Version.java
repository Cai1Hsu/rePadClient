package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/Version.class */
public class Version extends IQ {
    private String name;
    private String os;
    private String version;

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:version\">");
        if (this.name != null) {
            sb.append("<name>").append(this.name).append("</name>");
        }
        if (this.version != null) {
            sb.append("<version>").append(this.version).append("</version>");
        }
        if (this.os != null) {
            sb.append("<os>").append(this.os).append("</os>");
        }
        sb.append("</query>");
        return sb.toString();
    }

    public String getName() {
        return this.name;
    }

    public String getOs() {
        return this.os;
    }

    public String getVersion() {
        return this.version;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setOs(String str) {
        this.os = str;
    }

    public void setVersion(String str) {
        this.version = str;
    }
}
