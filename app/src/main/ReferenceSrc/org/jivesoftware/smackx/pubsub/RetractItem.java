package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/RetractItem.class */
public class RetractItem implements PacketExtension {
    private String id;

    public RetractItem(String str) {
        if (str == null) {
            throw new IllegalArgumentException("itemId must not be 'null'");
        }
        this.id = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "retract";
    }

    public String getId() {
        return this.id;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return PubSubNamespace.EVENT.getXmlns();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return "<retract id='" + this.id + "'/>";
    }
}
