package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/PacketIDFilter.class */
public class PacketIDFilter implements PacketFilter {
    private String packetID;

    public PacketIDFilter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Packet ID cannot be null.");
        }
        this.packetID = str;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return this.packetID.equals(packet.getPacketID());
    }

    public String toString() {
        return "PacketIDFilter by id: " + this.packetID;
    }
}
