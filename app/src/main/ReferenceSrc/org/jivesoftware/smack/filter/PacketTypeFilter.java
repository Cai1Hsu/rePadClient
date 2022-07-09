package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/PacketTypeFilter.class */
public class PacketTypeFilter implements PacketFilter {
    Class<? extends Packet> packetType;

    public PacketTypeFilter(Class<? extends Packet> cls) {
        if (!Packet.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Packet type must be a sub-class of Packet.");
        }
        this.packetType = cls;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return this.packetType.isInstance(packet);
    }

    public String toString() {
        return "PacketTypeFilter: " + this.packetType.getName();
    }
}
