package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/NodeExtension.class */
public class NodeExtension implements PacketExtension {
    private PubSubElementType element;
    private String node;

    public NodeExtension(PubSubElementType pubSubElementType) {
        this(pubSubElementType, null);
    }

    public NodeExtension(PubSubElementType pubSubElementType, String str) {
        this.element = pubSubElementType;
        this.node = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.element.getElementName();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.element.getNamespace().getXmlns();
    }

    public String getNode() {
        return this.node;
    }

    public String toString() {
        return getClass().getName() + " - content [" + toXML() + "]";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return '<' + getElementName() + (this.node == null ? "" : " node='" + this.node + '\'') + "/>";
    }
}
