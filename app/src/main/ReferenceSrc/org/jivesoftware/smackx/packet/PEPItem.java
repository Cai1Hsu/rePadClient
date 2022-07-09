package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/PEPItem.class */
public abstract class PEPItem implements PacketExtension {
    String id;

    public PEPItem(String str) {
        this.id = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "item";
    }

    abstract String getItemDetailsXML();

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/pubsub";
    }

    abstract String getNode();

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" id=\"").append(this.id).append("\">");
        sb.append(getItemDetailsXML());
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
