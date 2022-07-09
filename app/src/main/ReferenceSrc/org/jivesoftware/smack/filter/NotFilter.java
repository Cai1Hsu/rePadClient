package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/NotFilter.class */
public class NotFilter implements PacketFilter {
    private PacketFilter filter;

    public NotFilter(PacketFilter packetFilter) {
        if (packetFilter == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.filter = packetFilter;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return !this.filter.accept(packet);
    }
}
