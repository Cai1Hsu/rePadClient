package com.mongodb;

import android.net.http.Headers;
import com.mongodb.ConcurrentPool;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class PooledConnectionProvider {
    private static final Logger LOGGER = Loggers.getLogger(Headers.CONN_DIRECTIVE);
    private volatile boolean closed;
    private final String clusterId;
    private final ConnectionFactory connectionFactory;
    private final ConnectionPoolListener connectionPoolListener;
    private volatile boolean hasWorked;
    private final ConcurrentPool<Connection> pool;
    private final ServerAddress serverAddress;
    private final ConnectionPoolSettings settings;
    private final AtomicInteger waitQueueSize = new AtomicInteger(0);
    private final AtomicInteger generation = new AtomicInteger(0);
    private final Runnable maintenanceTask = createMaintenanceTask();
    private final ExecutorService sizeMaintenanceTimer = createTimer();

    static /* synthetic */ boolean access$100(PooledConnectionProvider x0) {
        return x0.shouldPrune();
    }

    static /* synthetic */ ConnectionPoolListener access$1000(PooledConnectionProvider x0) {
        return x0.connectionPoolListener;
    }

    static /* synthetic */ boolean access$1100(PooledConnectionProvider x0, Connection x1) {
        return x0.fromPreviousGeneration(x1);
    }

    static /* synthetic */ boolean access$1200(PooledConnectionProvider x0, Connection x1) {
        return x0.pastMaxLifeTime(x1);
    }

    static /* synthetic */ boolean access$1300(PooledConnectionProvider x0, Connection x1) {
        return x0.pastMaxIdleTime(x1);
    }

    static /* synthetic */ boolean access$1400(PooledConnectionProvider x0) {
        return x0.closed;
    }

    static /* synthetic */ boolean access$1500(PooledConnectionProvider x0, Connection x1) {
        return x0.shouldPrune(x1);
    }

    static /* synthetic */ ServerAddress access$200(PooledConnectionProvider x0) {
        return x0.serverAddress;
    }

    static /* synthetic */ Logger access$300() {
        return LOGGER;
    }

    static /* synthetic */ ConcurrentPool access$400(PooledConnectionProvider x0) {
        return x0.pool;
    }

    static /* synthetic */ boolean access$500(PooledConnectionProvider x0) {
        return x0.shouldEnsureMinSize();
    }

    static /* synthetic */ ConnectionPoolSettings access$600(PooledConnectionProvider x0) {
        return x0.settings;
    }

    static /* synthetic */ AtomicInteger access$700(PooledConnectionProvider x0) {
        return x0.generation;
    }

    static /* synthetic */ ConnectionFactory access$800(PooledConnectionProvider x0) {
        return x0.connectionFactory;
    }

    static /* synthetic */ String access$900(PooledConnectionProvider x0) {
        return x0.clusterId;
    }

    public PooledConnectionProvider(String clusterId, ServerAddress serverAddress, ConnectionFactory connectionFactory, ConnectionPoolSettings settings, ConnectionPoolListener connectionPoolListener) {
        this.connectionFactory = connectionFactory;
        this.clusterId = (String) Assertions.notNull("clusterId", clusterId);
        this.serverAddress = (ServerAddress) Assertions.notNull("serverAddress", serverAddress);
        this.settings = (ConnectionPoolSettings) Assertions.notNull("settings", settings);
        ConnectionItemFactory connectionItemFactory = new ConnectionItemFactory(this, null);
        this.pool = new ConcurrentPool<>(settings.getMaxSize(), connectionItemFactory);
        this.connectionPoolListener = (ConnectionPoolListener) Assertions.notNull("connectionPoolListener", connectionPoolListener);
        connectionPoolListener.connectionPoolOpened(new ConnectionPoolOpenedEvent(clusterId, serverAddress, settings));
    }

    public Connection get() {
        return get(this.settings.getMaxWaitTime(TimeUnit.MILLISECONDS), TimeUnit.MILLISECONDS);
    }

    public Connection get(long timeout, TimeUnit timeUnit) {
        try {
            if (this.waitQueueSize.incrementAndGet() > this.settings.getMaxWaitQueueSize()) {
                throw new MongoWaitQueueFullException(String.format("Too many threads are already waiting for a connection. Max number of threads (maxWaitQueueSize) of %d has been exceeded.", Integer.valueOf(this.settings.getMaxWaitQueueSize())));
            }
            this.connectionPoolListener.waitQueueEntered(new ConnectionPoolWaitQueueEvent(this.clusterId, this.serverAddress, Thread.currentThread().getId()));
            Connection connection = this.pool.get(timeout, timeUnit);
            this.hasWorked = true;
            while (shouldPrune(connection)) {
                this.pool.release(connection, true);
                Connection connection2 = this.pool.get(timeout, timeUnit);
                connection = connection2;
            }
            this.connectionPoolListener.connectionCheckedOut(new ConnectionEvent(this.clusterId, this.serverAddress));
            return connection;
        } finally {
            this.waitQueueSize.decrementAndGet();
            this.connectionPoolListener.waitQueueExited(new ConnectionPoolWaitQueueEvent(this.clusterId, this.serverAddress, Thread.currentThread().getId()));
        }
    }

    public void release(Connection connection) {
        if (!this.closed) {
            this.connectionPoolListener.connectionCheckedIn(new ConnectionEvent(this.clusterId, this.serverAddress));
        }
        this.pool.release(connection, connection.isClosed() || shouldPrune(connection));
    }

    public boolean hasWorked() {
        return this.hasWorked;
    }

    public void close() {
        if (!this.closed) {
            this.pool.close();
            if (this.sizeMaintenanceTimer != null) {
                this.sizeMaintenanceTimer.shutdownNow();
            }
            this.closed = true;
            this.connectionPoolListener.connectionPoolClosed(new ConnectionPoolEvent(this.clusterId, this.serverAddress));
        }
    }

    public void doMaintenance() {
        if (this.maintenanceTask != null) {
            this.maintenanceTask.run();
        }
    }

    private Runnable createMaintenanceTask() {
        if (!shouldPrune() && !shouldEnsureMinSize()) {
            return null;
        }
        Runnable newMaintenanceTask = new AnonymousClass1();
        return newMaintenanceTask;
    }

    /* renamed from: com.mongodb.PooledConnectionProvider$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Runnable {
        AnonymousClass1() {
            PooledConnectionProvider.this = r1;
        }

        @Override // java.lang.Runnable
        public synchronized void run() {
            if (PooledConnectionProvider.access$100(PooledConnectionProvider.this)) {
                PooledConnectionProvider.access$300().fine(String.format("Pruning pooled connections to %s", PooledConnectionProvider.access$200(PooledConnectionProvider.this)));
                PooledConnectionProvider.access$400(PooledConnectionProvider.this).prune();
            }
            if (PooledConnectionProvider.access$500(PooledConnectionProvider.this)) {
                PooledConnectionProvider.access$300().fine(String.format("Ensuring minimum pooled connections to %s", PooledConnectionProvider.access$200(PooledConnectionProvider.this)));
                PooledConnectionProvider.access$400(PooledConnectionProvider.this).ensureMinSize(PooledConnectionProvider.access$600(PooledConnectionProvider.this).getMinSize());
            }
        }
    }

    private ExecutorService createTimer() {
        if (this.maintenanceTask == null) {
            return null;
        }
        ScheduledExecutorService newTimer = Executors.newSingleThreadScheduledExecutor();
        newTimer.scheduleAtFixedRate(this.maintenanceTask, this.settings.getMaintenanceInitialDelay(TimeUnit.MILLISECONDS), this.settings.getMaintenanceFrequency(TimeUnit.MILLISECONDS), TimeUnit.MILLISECONDS);
        return newTimer;
    }

    private boolean shouldEnsureMinSize() {
        return this.settings.getMinSize() > 0;
    }

    private boolean shouldPrune() {
        return this.settings.getMaxConnectionIdleTime(TimeUnit.MILLISECONDS) > 0 || this.settings.getMaxConnectionLifeTime(TimeUnit.MILLISECONDS) > 0;
    }

    private boolean shouldPrune(Connection connection) {
        return fromPreviousGeneration(connection) || pastMaxLifeTime(connection) || pastMaxIdleTime(connection);
    }

    private boolean pastMaxIdleTime(Connection connection) {
        return expired(connection.getLastUsedAt(), System.currentTimeMillis(), this.settings.getMaxConnectionIdleTime(TimeUnit.MILLISECONDS));
    }

    private boolean pastMaxLifeTime(Connection connection) {
        return expired(connection.getOpenedAt(), System.currentTimeMillis(), this.settings.getMaxConnectionLifeTime(TimeUnit.MILLISECONDS));
    }

    private boolean fromPreviousGeneration(Connection connection) {
        return this.generation.get() > connection.getGeneration();
    }

    private boolean expired(long startTime, long curTime, long maxTime) {
        return maxTime != 0 && curTime - startTime > maxTime;
    }

    public void invalidate() {
        this.generation.incrementAndGet();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private class ConnectionItemFactory implements ConcurrentPool.ItemFactory<Connection> {
        private ConnectionItemFactory() {
            PooledConnectionProvider.this = r1;
        }

        /* synthetic */ ConnectionItemFactory(PooledConnectionProvider x0, AnonymousClass1 x1) {
            this();
        }

        @Override // com.mongodb.ConcurrentPool.ItemFactory
        public Connection create() {
            Connection connection = PooledConnectionProvider.access$800(PooledConnectionProvider.this).create(PooledConnectionProvider.access$200(PooledConnectionProvider.this), PooledConnectionProvider.this, PooledConnectionProvider.access$700(PooledConnectionProvider.this).get());
            PooledConnectionProvider.access$300().fine(String.format("Opened connection to %s", PooledConnectionProvider.access$200(PooledConnectionProvider.this)));
            PooledConnectionProvider.access$1000(PooledConnectionProvider.this).connectionAdded(new ConnectionEvent(PooledConnectionProvider.access$900(PooledConnectionProvider.this), PooledConnectionProvider.access$200(PooledConnectionProvider.this)));
            return connection;
        }

        public void close(Connection connection) {
            String reason;
            if (PooledConnectionProvider.access$1100(PooledConnectionProvider.this, connection)) {
                reason = "there was a socket exception raised on another connection from this pool";
            } else if (PooledConnectionProvider.access$1200(PooledConnectionProvider.this, connection)) {
                reason = "it is past its maximum allowed life time";
            } else if (PooledConnectionProvider.access$1300(PooledConnectionProvider.this, connection)) {
                reason = "it is past its maximum allowed idle time";
            } else {
                reason = "the pool has been closed";
            }
            if (!PooledConnectionProvider.access$1400(PooledConnectionProvider.this)) {
                PooledConnectionProvider.access$1000(PooledConnectionProvider.this).connectionRemoved(new ConnectionEvent(PooledConnectionProvider.access$900(PooledConnectionProvider.this), PooledConnectionProvider.access$200(PooledConnectionProvider.this)));
            }
            connection.close();
            PooledConnectionProvider.access$300().fine(String.format("Closed connection to %s because %s.", PooledConnectionProvider.access$200(PooledConnectionProvider.this), reason));
        }

        public boolean shouldPrune(Connection connection) {
            return PooledConnectionProvider.access$1500(PooledConnectionProvider.this, connection);
        }
    }
}
