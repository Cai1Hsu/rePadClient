package com.mongodb;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class DefaultServer implements ClusterableServer {
    private final PooledConnectionProvider connectionProvider;
    private volatile ServerDescription description;
    private volatile boolean isClosed;
    private final ServerAddress serverAddress;
    private final ServerMonitor serverMonitor;
    private final Map<ChangeListener<ServerDescription>, Boolean> changeListeners = new ConcurrentHashMap();
    private final ChangeListener<ServerDescription> serverStateListener = new DefaultServerStateListener(this, null);

    static /* synthetic */ ServerDescription access$102(DefaultServer x0, ServerDescription x1) {
        x0.description = x1;
        return x1;
    }

    static /* synthetic */ Map access$200(DefaultServer x0) {
        return x0.changeListeners;
    }

    public DefaultServer(ServerAddress serverAddress, ServerSettings settings, String clusterId, PooledConnectionProvider connectionProvider, Mongo mongo) {
        this.serverAddress = (ServerAddress) Assertions.notNull("serverAddress", serverAddress);
        this.description = ServerDescription.builder().state(ServerConnectionState.Connecting).address(serverAddress).build();
        this.connectionProvider = connectionProvider;
        this.serverMonitor = new ServerMonitor(serverAddress, this.serverStateListener, settings.getHeartbeatSocketSettings(), settings, clusterId, mongo, connectionProvider);
        this.serverMonitor.start();
    }

    @Override // com.mongodb.Server
    public ServerDescription getDescription() {
        Assertions.isTrue("open", !isClosed());
        return this.description;
    }

    @Override // com.mongodb.Server
    public Connection getConnection(long maxWaitTime, TimeUnit timeUnit) {
        return this.connectionProvider.get(maxWaitTime, timeUnit);
    }

    @Override // com.mongodb.ClusterableServer
    public void addChangeListener(ChangeListener<ServerDescription> changeListener) {
        Assertions.isTrue("open", !isClosed());
        this.changeListeners.put(changeListener, true);
    }

    @Override // com.mongodb.ClusterableServer, com.mongodb.Server
    public void invalidate() {
        Assertions.isTrue("open", !isClosed());
        this.serverStateListener.stateChanged(new ChangeEvent<>(this.description, ServerDescription.builder().state(ServerConnectionState.Connecting).address(this.serverAddress).build()));
        this.connectionProvider.invalidate();
    }

    @Override // com.mongodb.ClusterableServer
    public void close() {
        if (!isClosed()) {
            this.serverMonitor.close();
            this.connectionProvider.close();
            this.isClosed = true;
        }
    }

    @Override // com.mongodb.ClusterableServer
    public boolean isClosed() {
        return this.isClosed;
    }

    @Override // com.mongodb.ClusterableServer
    public void connect() {
        this.serverMonitor.connect();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private final class DefaultServerStateListener implements ChangeListener<ServerDescription> {
        private DefaultServerStateListener() {
            DefaultServer.this = r1;
        }

        /* synthetic */ DefaultServerStateListener(DefaultServer x0, AnonymousClass1 x1) {
            this();
        }

        @Override // com.mongodb.ChangeListener
        public void stateChanged(ChangeEvent<ServerDescription> event) {
            DefaultServer.access$102(DefaultServer.this, event.getNewValue());
            for (ChangeListener<ServerDescription> listener : DefaultServer.access$200(DefaultServer.this).keySet()) {
                listener.stateChanged(event);
            }
        }
    }
}
