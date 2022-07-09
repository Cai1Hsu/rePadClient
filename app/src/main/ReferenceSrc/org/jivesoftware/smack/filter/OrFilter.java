package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/OrFilter.class */
public class OrFilter implements PacketFilter {
    private PacketFilter[] filters;
    private int size;

    public OrFilter() {
        this.size = 0;
        this.filters = new PacketFilter[3];
    }

    public OrFilter(PacketFilter packetFilter, PacketFilter packetFilter2) {
        if (packetFilter == null || packetFilter2 == null) {
            throw new IllegalArgumentException("Parameters cannot be null.");
        }
        this.size = 2;
        this.filters = new PacketFilter[2];
        this.filters[0] = packetFilter;
        this.filters[1] = packetFilter2;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= this.size) {
                z = false;
                break;
            } else if (this.filters[i].accept(packet)) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public void addFilter(PacketFilter packetFilter) {
        if (packetFilter == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        if (this.size == this.filters.length) {
            PacketFilter[] packetFilterArr = new PacketFilter[this.filters.length + 2];
            for (int i = 0; i < this.filters.length; i++) {
                packetFilterArr[i] = this.filters[i];
            }
            this.filters = packetFilterArr;
        }
        this.filters[this.size] = packetFilter;
        this.size++;
    }

    public String toString() {
        return this.filters.toString();
    }
}
