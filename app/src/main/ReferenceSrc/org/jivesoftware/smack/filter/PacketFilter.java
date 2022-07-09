package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/PacketFilter.class */
public interface PacketFilter {
    boolean accept(Packet packet);
}
