package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Bind.class */
public class Bind extends IQ {
    private String resource = null;
    private String jid = null;

    public Bind() {
        setType(IQ.Type.SET);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<bind xmlns=\"urn:ietf:params:xml:ns:xmpp-bind\">");
        if (this.resource != null) {
            sb.append("<resource>").append(this.resource).append("</resource>");
        }
        if (this.jid != null) {
            sb.append("<jid>").append(this.jid).append("</jid>");
        }
        sb.append("</bind>");
        return sb.toString();
    }

    public String getJid() {
        return this.jid;
    }

    public String getResource() {
        return this.resource;
    }

    public void setJid(String str) {
        this.jid = str;
    }

    public void setResource(String str) {
        this.resource = str;
    }
}
