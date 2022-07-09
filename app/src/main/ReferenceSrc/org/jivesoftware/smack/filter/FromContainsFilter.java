package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/FromContainsFilter.class */
public class FromContainsFilter implements PacketFilter {
    private String from;

    public FromContainsFilter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.from = str.toLowerCase();
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        boolean z = false;
        if (packet.getFrom() != null && packet.getFrom().toLowerCase().indexOf(this.from) != -1) {
            z = true;
        }
        return z;
    }
}
