package org.jivesoftware.smackx;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smackx.packet.LastActivity;

/* loaded from: classes.jar:org/jivesoftware/smackx/LastActivityManager.class */
public class LastActivityManager {
    private Connection connection;
    private long lastMessageSent;

    /* renamed from: org.jivesoftware.smackx.LastActivityManager$5 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/LastActivityManager$5.class */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smack$packet$Presence$Mode = new int[Presence.Mode.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0024 -> B:11:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smack$packet$Presence$Mode[Presence.Mode.available.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smack$packet$Presence$Mode[Presence.Mode.chat.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.LastActivityManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new LastActivityManager(connection);
            }
        });
    }

    private LastActivityManager(Connection connection) {
        this.connection = connection;
        connection.addPacketSendingListener(new PacketListener() { // from class: org.jivesoftware.smackx.LastActivityManager.2
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Presence.Mode mode = ((Presence) packet).getMode();
                if (mode == null) {
                    return;
                }
                switch (AnonymousClass5.$SwitchMap$org$jivesoftware$smack$packet$Presence$Mode[mode.ordinal()]) {
                    case 1:
                    case 2:
                        LastActivityManager.this.resetIdleTime();
                        return;
                    default:
                        return;
                }
            }
        }, new PacketTypeFilter(Presence.class));
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.LastActivityManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (((Message) packet).getType() == Message.Type.error) {
                    return;
                }
                LastActivityManager.this.resetIdleTime();
            }
        }, new PacketTypeFilter(Message.class));
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.LastActivityManager.4
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                LastActivity lastActivity = new LastActivity();
                lastActivity.setType(IQ.Type.RESULT);
                lastActivity.setTo(packet.getFrom());
                lastActivity.setFrom(packet.getTo());
                lastActivity.setPacketID(packet.getPacketID());
                lastActivity.setLastActivity(LastActivityManager.this.getIdleTime());
                LastActivityManager.this.connection.sendPacket(lastActivity);
            }
        }, new AndFilter(new IQTypeFilter(IQ.Type.GET), new PacketTypeFilter(LastActivity.class)));
        ServiceDiscoveryManager.getInstanceFor(connection).addFeature(LastActivity.NAMESPACE);
        resetIdleTime();
    }

    public long getIdleTime() {
        long j;
        long currentTimeMillis = System.currentTimeMillis();
        synchronized (this) {
            j = this.lastMessageSent;
        }
        return (currentTimeMillis - j) / 1000;
    }

    public static LastActivity getLastActivity(Connection connection, String str) throws XMPPException {
        LastActivity lastActivity = new LastActivity();
        lastActivity.setTo(str);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(lastActivity.getPacketID()));
        connection.sendPacket(lastActivity);
        LastActivity lastActivity2 = (LastActivity) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (lastActivity2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (lastActivity2.getError() == null) {
            return lastActivity2;
        }
        throw new XMPPException(lastActivity2.getError());
    }

    public static boolean isLastActivitySupported(Connection connection, String str) {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(str).containsFeature(LastActivity.NAMESPACE);
        } catch (XMPPException e) {
            z = false;
        }
        return z;
    }

    public void resetIdleTime() {
        long currentTimeMillis = System.currentTimeMillis();
        synchronized (this) {
            this.lastMessageSent = currentTimeMillis;
        }
    }
}
