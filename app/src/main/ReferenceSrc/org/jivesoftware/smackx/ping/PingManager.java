package org.jivesoftware.smackx.ping;

import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.SmackError;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.ping.packet.Ping;
import org.jivesoftware.smack.util.SyncPacketSend;
import org.jivesoftware.smackx.ServiceDiscoveryManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/ping/PingManager.class */
public class PingManager {
    private static Map<Connection, PingManager> instances = Collections.synchronizedMap(new WeakHashMap());
    private Connection connection;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.ping.PingManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new PingManager(connection);
            }
        });
    }

    private PingManager(Connection connection) {
        this.connection = connection;
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.connection);
        (instanceFor == null ? new ServiceDiscoveryManager(this.connection) : instanceFor).addFeature(Ping.NAMESPACE);
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.ping.PingManager.2
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                PingManager.this.connection.sendPacket(IQ.createResultIQ((Ping) packet));
            }
        }, new AndFilter(new PacketTypeFilter(Ping.class), new IQTypeFilter(IQ.Type.GET)));
    }

    public static PingManager getInstanceFor(Connection connection) {
        PingManager pingManager;
        synchronized (PingManager.class) {
            try {
                PingManager pingManager2 = instances.get(connection);
                pingManager = pingManager2;
                if (pingManager2 == null) {
                    pingManager = new PingManager(connection);
                }
            } finally {
            }
        }
        return pingManager;
    }

    public boolean isPingSupported(String str) throws XMPPException {
        return ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(str).containsFeature(Ping.NAMESPACE);
    }

    public boolean ping(String str) {
        return ping(str, SmackConfiguration.getPacketReplyTimeout());
    }

    public boolean ping(String str, long j) {
        boolean z = true;
        try {
            SyncPacketSend.getReply(this.connection, new Ping(str));
        } catch (XMPPException e) {
            if (!str.equals(this.connection.getServiceName()) || e.getSmackError() == SmackError.NO_RESPONSE_FROM_SERVER) {
                z = false;
            }
        }
        return z;
    }

    public boolean pingMyServer() {
        return ping(this.connection.getServiceName());
    }
}
