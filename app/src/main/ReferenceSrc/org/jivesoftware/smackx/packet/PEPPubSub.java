package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/PEPPubSub.class */
public class PEPPubSub extends IQ {
    PEPItem item;

    public PEPPubSub(PEPItem pEPItem) {
        this.item = pEPItem;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        sb.append("<publish node=\"").append(this.item.getNode()).append("\">");
        sb.append(this.item.toXML());
        sb.append("</publish>");
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }

    public String getElementName() {
        return "pubsub";
    }

    public String getNamespace() {
        return "http://jabber.org/protocol/pubsub";
    }
}
