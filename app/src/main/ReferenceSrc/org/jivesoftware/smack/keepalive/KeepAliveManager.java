package org.jivesoftware.smack.keepalive;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.ping.PingFailedListener;
import org.jivesoftware.smack.ping.packet.Ping;

/* loaded from: classes.jar:org/jivesoftware/smack/keepalive/KeepAliveManager.class */
public class KeepAliveManager {
    private static Map<Connection, KeepAliveManager> instances = new HashMap();
    private static volatile ScheduledExecutorService periodicPingExecutorService;
    private Connection connection;
    private volatile long lastSuccessfulContact;
    private volatile ScheduledFuture<?> periodicPingTask;
    private Set<PingFailedListener> pingFailedListeners;
    private long pingInterval;

    static {
        if (SmackConfiguration.getKeepAliveInterval() > 0) {
            Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.1
                @Override // org.jivesoftware.smack.ConnectionCreationListener
                public void connectionCreated(Connection connection) {
                    new KeepAliveManager(connection);
                }
            });
        }
    }

    private KeepAliveManager(Connection connection) {
        this.pingInterval = SmackConfiguration.getKeepAliveInterval();
        this.pingFailedListeners = Collections.synchronizedSet(new HashSet());
        this.lastSuccessfulContact = -1L;
        this.connection = connection;
        init();
        handleConnect();
    }

    private static void enableExecutorService() {
        synchronized (KeepAliveManager.class) {
            try {
                if (periodicPingExecutorService == null) {
                    periodicPingExecutorService = new ScheduledThreadPoolExecutor(1, new ThreadFactory() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.2
                        @Override // java.util.concurrent.ThreadFactory
                        public Thread newThread(Runnable runnable) {
                            Thread thread = new Thread(runnable, "Smack Keepalive");
                            thread.setDaemon(true);
                            return thread;
                        }
                    });
                }
            } finally {
            }
        }
    }

    public static KeepAliveManager getInstanceFor(Connection connection) {
        KeepAliveManager keepAliveManager;
        synchronized (KeepAliveManager.class) {
            try {
                KeepAliveManager keepAliveManager2 = instances.get(connection);
                keepAliveManager = keepAliveManager2;
                if (keepAliveManager2 == null) {
                    keepAliveManager = new KeepAliveManager(connection);
                    instances.put(connection, keepAliveManager);
                }
            } finally {
            }
        }
        return keepAliveManager;
    }

    public void handleConnect() {
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                KeepAliveManager.this.lastSuccessfulContact = System.currentTimeMillis();
                KeepAliveManager.this.schedulePingServerTask();
            }
        }, null);
    }

    public static void handleDisconnect(Connection connection) {
        synchronized (KeepAliveManager.class) {
            try {
                if (periodicPingExecutorService != null) {
                    instances.remove(connection);
                    if (instances.isEmpty()) {
                        periodicPingExecutorService.shutdownNow();
                        periodicPingExecutorService = null;
                    }
                }
            } finally {
            }
        }
    }

    private void init() {
        this.connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.4
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                KeepAliveManager.this.stopPingServerTask();
                KeepAliveManager.handleDisconnect(KeepAliveManager.this.connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                KeepAliveManager.this.stopPingServerTask();
                KeepAliveManager.handleDisconnect(KeepAliveManager.this.connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int i) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception exc) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
                KeepAliveManager.this.handleConnect();
                KeepAliveManager.this.schedulePingServerTask();
            }
        });
        instances.put(this.connection, this);
        schedulePingServerTask();
    }

    public void schedulePingServerTask() {
        synchronized (this) {
            enableExecutorService();
            stopPingServerTask();
            if (this.pingInterval > 0) {
                this.periodicPingTask = periodicPingExecutorService.schedule(new Runnable() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.5
                    @Override // java.lang.Runnable
                    public void run() {
                        Ping ping = new Ping();
                        final PacketCollector createPacketCollector = KeepAliveManager.this.connection.createPacketCollector(new PacketIDFilter(ping.getPacketID()));
                        KeepAliveManager.this.connection.sendPacket(ping);
                        if (!KeepAliveManager.this.pingFailedListeners.isEmpty()) {
                            KeepAliveManager.periodicPingExecutorService.schedule(new Runnable() { // from class: org.jivesoftware.smack.keepalive.KeepAliveManager.5.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    Packet nextResult = createPacketCollector.nextResult(1L);
                                    createPacketCollector.cancel();
                                    if (nextResult == null) {
                                        for (PingFailedListener pingFailedListener : KeepAliveManager.this.pingFailedListeners) {
                                            pingFailedListener.pingFailed();
                                        }
                                    }
                                }
                            }, SmackConfiguration.getPacketReplyTimeout(), TimeUnit.MILLISECONDS);
                        }
                    }
                }, getPingInterval(), TimeUnit.MILLISECONDS);
            }
        }
    }

    public void stopPingServerTask() {
        if (this.periodicPingTask != null) {
            this.periodicPingTask.cancel(true);
            this.periodicPingTask = null;
        }
    }

    public void addPingFailedListener(PingFailedListener pingFailedListener) {
        this.pingFailedListeners.add(pingFailedListener);
    }

    public long getPingInterval() {
        return this.pingInterval;
    }

    public long getTimeSinceLastContact() {
        long j;
        if (this.lastSuccessfulContact == -1) {
            j = this.lastSuccessfulContact;
        } else {
            long currentTimeMillis = System.currentTimeMillis() - this.lastSuccessfulContact;
            j = currentTimeMillis;
            if (currentTimeMillis < 0) {
                j = 0;
            }
        }
        return j;
    }

    public void removePingFailedListener(PingFailedListener pingFailedListener) {
        this.pingFailedListeners.remove(pingFailedListener);
    }

    public void setPingInterval(long j) {
        if (this.pingInterval == j) {
            return;
        }
        if (j > 0) {
            enableExecutorService();
        }
        this.pingInterval = j;
        if (this.pingInterval < 0) {
            stopPinging();
        } else {
            schedulePingServerTask();
        }
    }

    public void stopPinging() {
        this.pingInterval = -1L;
        stopPingServerTask();
    }
}
