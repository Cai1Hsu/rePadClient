package org.jivesoftware.smackx.pubsub;

import java.util.Arrays;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.pubsub.packet.PubSubNamespace;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/EventElement.class */
public class EventElement implements EmbeddedPacketExtension {
    private NodeExtension ext;
    private EventElementType type;

    public EventElement(EventElementType eventElementType, NodeExtension nodeExtension) {
        this.type = eventElementType;
        this.ext = nodeExtension;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "event";
    }

    public NodeExtension getEvent() {
        return this.ext;
    }

    public EventElementType getEventType() {
        return this.type;
    }

    @Override // org.jivesoftware.smackx.pubsub.EmbeddedPacketExtension
    public List<PacketExtension> getExtensions() {
        return Arrays.asList(getEvent());
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return PubSubNamespace.EVENT.getXmlns();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return ("<event xmlns='" + PubSubNamespace.EVENT.getXmlns() + "'>") + this.ext.toXML() + "</event>";
    }
}
