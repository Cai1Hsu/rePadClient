package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/PEPEvent.class */
public class PEPEvent implements PacketExtension {
    PEPItem item;

    public PEPEvent() {
    }

    public PEPEvent(PEPItem pEPItem) {
        this.item = pEPItem;
    }

    public void addPEPItem(PEPItem pEPItem) {
        this.item = pEPItem;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "event";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/pubsub";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        sb.append(this.item.toXML());
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
