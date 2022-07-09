package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/ToContainsFilter.class */
public class ToContainsFilter implements PacketFilter {
    private String to;

    public ToContainsFilter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.to = str.toLowerCase();
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        boolean z = false;
        if (packet.getTo() != null && packet.getTo().toLowerCase().indexOf(this.to) != -1) {
            z = true;
        }
        return z;
    }
}
