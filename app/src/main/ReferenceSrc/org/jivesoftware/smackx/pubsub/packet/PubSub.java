package org.jivesoftware.smackx.pubsub.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.pubsub.PubSubElementType;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/packet/PubSub.class */
public class PubSub extends IQ {
    private PubSubNamespace ns = PubSubNamespace.BASIC;

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        sb.append(getExtensionsXML());
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }

    public String getElementName() {
        return "pubsub";
    }

    public PacketExtension getExtension(PubSubElementType pubSubElementType) {
        return getExtension(pubSubElementType.getElementName(), pubSubElementType.getNamespace().getXmlns());
    }

    public String getNamespace() {
        return this.ns.getXmlns();
    }

    public PubSubNamespace getPubSubNamespace() {
        return this.ns;
    }

    public void setPubSubNamespace(PubSubNamespace pubSubNamespace) {
        this.ns = pubSubNamespace;
    }
}
