package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/IQTypeFilter.class */
public class IQTypeFilter implements PacketFilter {
    private IQ.Type type;

    public IQTypeFilter(IQ.Type type) {
        this.type = type;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return (packet instanceof IQ) && ((IQ) packet).getType().equals(this.type);
    }
}
