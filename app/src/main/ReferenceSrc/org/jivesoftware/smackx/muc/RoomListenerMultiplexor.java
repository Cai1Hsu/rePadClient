package org.jivesoftware.smackx.muc;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/RoomListenerMultiplexor.class */
class RoomListenerMultiplexor implements ConnectionListener {
    private static final Map<Connection, WeakReference<RoomListenerMultiplexor>> monitors = new WeakHashMap();
    private Connection connection;
    private RoomMultiplexFilter filter;
    private RoomMultiplexListener listener;

    /* loaded from: classes.jar:org/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter.class */
    private static class RoomMultiplexFilter implements PacketFilter {
        private Map<String, String> roomAddressTable;

        private RoomMultiplexFilter() {
            this.roomAddressTable = new ConcurrentHashMap();
        }

        @Override // org.jivesoftware.smack.filter.PacketFilter
        public boolean accept(Packet packet) {
            String from = packet.getFrom();
            return from == null ? false : this.roomAddressTable.containsKey(StringUtils.parseBareAddress(from).toLowerCase());
        }

        public void addRoom(String str) {
            if (str == null) {
                return;
            }
            this.roomAddressTable.put(str.toLowerCase(), str);
        }

        public void removeRoom(String str) {
            if (str == null) {
                return;
            }
            this.roomAddressTable.remove(str.toLowerCase());
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener.class */
    private static class RoomMultiplexListener implements PacketListener {
        private Map<String, PacketMultiplexListener> roomListenersByAddress;

        private RoomMultiplexListener() {
            this.roomListenersByAddress = new ConcurrentHashMap();
        }

        public void addRoom(String str, PacketMultiplexListener packetMultiplexListener) {
            if (str == null) {
                return;
            }
            this.roomListenersByAddress.put(str.toLowerCase(), packetMultiplexListener);
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            PacketMultiplexListener packetMultiplexListener;
            String from = packet.getFrom();
            if (from == null || (packetMultiplexListener = this.roomListenersByAddress.get(StringUtils.parseBareAddress(from).toLowerCase())) == null) {
                return;
            }
            packetMultiplexListener.processPacket(packet);
        }

        public void removeRoom(String str) {
            if (str == null) {
                return;
            }
            this.roomListenersByAddress.remove(str.toLowerCase());
        }
    }

    private RoomListenerMultiplexor(Connection connection, RoomMultiplexFilter roomMultiplexFilter, RoomMultiplexListener roomMultiplexListener) {
        if (connection == null) {
            throw new IllegalArgumentException("Connection is null");
        }
        if (roomMultiplexFilter == null) {
            throw new IllegalArgumentException("Filter is null");
        }
        if (roomMultiplexListener == null) {
            throw new IllegalArgumentException("Listener is null");
        }
        this.connection = connection;
        this.filter = roomMultiplexFilter;
        this.listener = roomMultiplexListener;
    }

    private void cancel() {
        this.connection.removeConnectionListener(this);
        this.connection.removePacketListener(this.listener);
    }

    public static RoomListenerMultiplexor getRoomMultiplexor(Connection connection) {
        RoomListenerMultiplexor roomListenerMultiplexor;
        synchronized (monitors) {
            if (!monitors.containsKey(connection) || monitors.get(connection).get() == null) {
                RoomListenerMultiplexor roomListenerMultiplexor2 = new RoomListenerMultiplexor(connection, new RoomMultiplexFilter(), new RoomMultiplexListener());
                roomListenerMultiplexor2.init();
                monitors.put(connection, new WeakReference<>(roomListenerMultiplexor2));
            }
            roomListenerMultiplexor = monitors.get(connection).get();
        }
        return roomListenerMultiplexor;
    }

    public void addRoom(String str, PacketMultiplexListener packetMultiplexListener) {
        this.filter.addRoom(str);
        this.listener.addRoom(str, packetMultiplexListener);
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosed() {
        cancel();
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void connectionClosedOnError(Exception exc) {
        cancel();
    }

    public void init() {
        this.connection.addConnectionListener(this);
        this.connection.addPacketListener(this.listener, this.filter);
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectingIn(int i) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionFailed(Exception exc) {
    }

    @Override // org.jivesoftware.smack.ConnectionListener
    public void reconnectionSuccessful() {
    }

    public void removeRoom(String str) {
        this.filter.removeRoom(str);
        this.listener.removeRoom(str);
    }
}
