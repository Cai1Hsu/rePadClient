package org.jivesoftware.smack.filter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/AndFilter.class */
public class AndFilter implements PacketFilter {
    private List<PacketFilter> filters = new ArrayList();

    public AndFilter() {
    }

    public AndFilter(PacketFilter... packetFilterArr) {
        if (packetFilterArr == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        for (PacketFilter packetFilter : packetFilterArr) {
            if (packetFilter == null) {
                throw new IllegalArgumentException("Parameter cannot be null.");
            }
            this.filters.add(packetFilter);
        }
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        boolean z;
        Iterator<PacketFilter> it = this.filters.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = true;
                break;
            } else if (!it.next().accept(packet)) {
                z = false;
                break;
            }
        }
        return z;
    }

    public void addFilter(PacketFilter packetFilter) {
        if (packetFilter == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.filters.add(packetFilter);
    }

    public String toString() {
        return this.filters.toString();
    }
}
