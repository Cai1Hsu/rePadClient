package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/ThreadFilter.class */
public class ThreadFilter implements PacketFilter {
    private String thread;

    public ThreadFilter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Thread cannot be null.");
        }
        this.thread = str;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return (packet instanceof Message) && this.thread.equals(((Message) packet).getThread());
    }
}
