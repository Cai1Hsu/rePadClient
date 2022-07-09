package org.jivesoftware.smackx.pubsub;

import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/EmbeddedPacketExtension.class */
public interface EmbeddedPacketExtension extends PacketExtension {
    List<PacketExtension> getExtensions();
}
