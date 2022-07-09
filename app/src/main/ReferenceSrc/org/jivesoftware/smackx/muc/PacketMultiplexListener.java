package org.jivesoftware.smackx.muc;

import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/PacketMultiplexListener.class */
class PacketMultiplexListener implements PacketListener {
    private PacketListener declinesListener;
    private ConnectionDetachedPacketCollector messageCollector;
    private PacketListener presenceListener;
    private PacketListener subjectListener;
    private static final PacketFilter MESSAGE_FILTER = new MessageTypeFilter(Message.Type.groupchat);
    private static final PacketFilter PRESENCE_FILTER = new PacketTypeFilter(Presence.class);
    private static final PacketFilter SUBJECT_FILTER = new PacketFilter() { // from class: org.jivesoftware.smackx.muc.PacketMultiplexListener.1
        @Override // org.jivesoftware.smack.filter.PacketFilter
        public boolean accept(Packet packet) {
            return ((Message) packet).getSubject() != null;
        }
    };
    private static final PacketFilter DECLINES_FILTER = new PacketExtensionFilter("x", "http://jabber.org/protocol/muc#user");

    public PacketMultiplexListener(ConnectionDetachedPacketCollector connectionDetachedPacketCollector, PacketListener packetListener, PacketListener packetListener2, PacketListener packetListener3) {
        if (connectionDetachedPacketCollector == null) {
            throw new IllegalArgumentException("MessageCollector is null");
        }
        if (packetListener == null) {
            throw new IllegalArgumentException("Presence listener is null");
        }
        if (packetListener2 == null) {
            throw new IllegalArgumentException("Subject listener is null");
        }
        if (packetListener3 == null) {
            throw new IllegalArgumentException("Declines listener is null");
        }
        this.messageCollector = connectionDetachedPacketCollector;
        this.presenceListener = packetListener;
        this.subjectListener = packetListener2;
        this.declinesListener = packetListener3;
    }

    @Override // org.jivesoftware.smack.PacketListener
    public void processPacket(Packet packet) {
        if (PRESENCE_FILTER.accept(packet)) {
            this.presenceListener.processPacket(packet);
        } else if (!MESSAGE_FILTER.accept(packet)) {
            if (!DECLINES_FILTER.accept(packet)) {
                return;
            }
            this.declinesListener.processPacket(packet);
        } else {
            this.messageCollector.processPacket(packet);
            if (!SUBJECT_FILTER.accept(packet)) {
                return;
            }
            this.subjectListener.processPacket(packet);
        }
    }
}
