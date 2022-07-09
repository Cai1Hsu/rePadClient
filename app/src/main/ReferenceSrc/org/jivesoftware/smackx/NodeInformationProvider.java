package org.jivesoftware.smackx;

import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/NodeInformationProvider.class */
public interface NodeInformationProvider {
    List<String> getNodeFeatures();

    List<DiscoverInfo.Identity> getNodeIdentities();

    List<DiscoverItems.Item> getNodeItems();

    List<PacketExtension> getNodePacketExtensions();
}
