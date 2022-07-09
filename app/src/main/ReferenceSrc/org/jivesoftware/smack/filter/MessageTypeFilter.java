package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/MessageTypeFilter.class */
public class MessageTypeFilter implements PacketFilter {
    private final Message.Type type;

    public MessageTypeFilter(Message.Type type) {
        this.type = type;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return !(packet instanceof Message) ? false : ((Message) packet).getType().equals(this.type);
    }
}
