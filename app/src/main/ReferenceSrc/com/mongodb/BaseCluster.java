package com.mongodb;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Logger;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class BaseCluster implements Cluster {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private final String clusterId;
    private final ClusterListener clusterListener;
    private volatile ClusterDescription description;
    private volatile boolean isClosed;
    private final AtomicReference<CountDownLatch> phase = new AtomicReference<>(new CountDownLatch(1));
    private final ThreadLocal<Random> random = new ThreadLocal<>();
    private final ClusterableServerFactory serverFactory;
    private final ClusterSettings settings;

    protected abstract void connect();

    protected abstract ClusterableServer getServer(ServerAddress serverAddress);

    public BaseCluster(String clusterId, ClusterSettings settings, ClusterableServerFactory serverFactory, ClusterListener clusterListener) {
        this.clusterId = (String) Assertions.notNull("clusterId", clusterId);
        this.settings = (ClusterSettings) Assertions.notNull("settings", settings);
        this.serverFactory = (ClusterableServerFactory) Assertions.notNull("serverFactory", serverFactory);
        this.clusterListener = (ClusterListener) Assertions.notNull("clusterListener", clusterListener);
        clusterListener.clusterOpened(new ClusterEvent(clusterId));
    }

    @Override // com.mongodb.Cluster
    public Server getServer(ServerSelector serverSelector, long maxWaitTime, TimeUnit timeUnit) {
        ClusterableServer server;
        Assertions.isTrue("open", !isClosed());
        try {
            CountDownLatch currentPhase = this.phase.get();
            ClusterDescription curDescription = this.description;
            List<ServerDescription> serverDescriptions = serverSelector.choose(curDescription);
            boolean selectionFailureLogged = false;
            long startTimeNanos = System.nanoTime();
            long endTimeNanos = startTimeNanos + TimeUnit.NANOSECONDS.convert(maxWaitTime, timeUnit);
            long curTimeNanos = startTimeNanos;
            while (true) {
                throwIfIncompatible(curDescription);
                if (!serverDescriptions.isEmpty() && (server = getRandomServer(new ArrayList(serverDescriptions))) != null) {
                    return new WrappedServer(server);
                }
                if (curTimeNanos > endTimeNanos) {
                    throw new MongoTimeoutException(String.format("Timed out after %d ms while waiting for a server that matches %s. Client view of cluster state is %s", Long.valueOf(TimeUnit.MILLISECONDS.convert(maxWaitTime, timeUnit)), serverSelector, curDescription.getShortDescription()));
                }
                if (!selectionFailureLogged) {
                    LOGGER.info(String.format("No server chosen by %s from cluster description %s. Waiting for %d ms before timing out", serverSelector, curDescription, Long.valueOf(TimeUnit.MILLISECONDS.convert(maxWaitTime, timeUnit))));
                    selectionFailureLogged = true;
                }
                connect();
                currentPhase.await(Math.min(endTimeNanos - curTimeNanos, this.serverFactory.getSettings().getHeartbeatConnectRetryFrequency(TimeUnit.NANOSECONDS)), TimeUnit.NANOSECONDS);
                curTimeNanos = System.nanoTime();
                CountDownLatch currentPhase2 = this.phase.get();
                currentPhase = currentPhase2;
                curDescription = this.description;
                serverDescriptions = serverSelector.choose(curDescription);
            }
        } catch (InterruptedException e) {
            throw new MongoInterruptedException(String.format("Interrupted while waiting for a server that matches %s ", serverSelector), e);
        }
    }

    @Override // com.mongodb.Cluster
    public ClusterDescription getDescription(long maxWaitTime, TimeUnit timeUnit) {
        Assertions.isTrue("open", !isClosed());
        try {
            CountDownLatch currentPhase = this.phase.get();
            ClusterDescription curDescription = this.description;
            boolean selectionFailureLogged = false;
            long startTimeNanos = System.nanoTime();
            long endTimeNanos = startTimeNanos + TimeUnit.NANOSECONDS.convert(maxWaitTime, timeUnit);
            long curTimeNanos = startTimeNanos;
            while (curDescription.getType() == ClusterType.Unknown) {
                if (curTimeNanos > endTimeNanos) {
                    throw new MongoTimeoutException(String.format("Timed out after %d ms while waiting to connect. Client view of cluster state is %s", Long.valueOf(TimeUnit.MILLISECONDS.convert(maxWaitTime, timeUnit)), curDescription.getShortDescription()));
                }
                if (!selectionFailureLogged) {
                    LOGGER.info(String.format("Cluster description not yet available. Waiting for %d ms before timing out", Long.valueOf(TimeUnit.MILLISECONDS.convert(maxWaitTime, timeUnit))));
                    selectionFailureLogged = true;
                }
                connect();
                currentPhase.await(Math.min(endTimeNanos - curTimeNanos, this.serverFactory.getSettings().getHeartbeatConnectRetryFrequency(TimeUnit.NANOSECONDS)), TimeUnit.NANOSECONDS);
                curTimeNanos = System.nanoTime();
                CountDownLatch currentPhase2 = this.phase.get();
                currentPhase = currentPhase2;
                curDescription = this.description;
            }
            return curDescription;
        } catch (InterruptedException e) {
            throw new MongoInterruptedException(String.format("Interrupted while waiting to connect", new Object[0]), e);
        }
    }

    public ClusterSettings getSettings() {
        return this.settings;
    }

    @Override // com.mongodb.Cluster
    public void close() {
        if (!isClosed()) {
            this.isClosed = true;
            this.phase.get().countDown();
            this.clusterListener.clusterClosed(new ClusterEvent(this.clusterId));
        }
    }

    @Override // com.mongodb.Cluster
    public boolean isClosed() {
        return this.isClosed;
    }

    public synchronized void updateDescription(ClusterDescription newDescription) {
        LOGGER.fine(String.format("Updating cluster description to  %s", newDescription.getShortDescription()));
        this.description = newDescription;
        CountDownLatch current = this.phase.getAndSet(new CountDownLatch(1));
        current.countDown();
    }

    public void fireChangeEvent() {
        this.clusterListener.clusterDescriptionChanged(new ClusterDescriptionChangedEvent(this.clusterId, this.description));
    }

    private ClusterableServer getRandomServer(List<ServerDescription> serverDescriptions) {
        while (!serverDescriptions.isEmpty()) {
            int serverPos = getRandom().nextInt(serverDescriptions.size());
            ClusterableServer server = getServer(serverDescriptions.get(serverPos).getAddress());
            if (server == null) {
                serverDescriptions.remove(serverPos);
            } else {
                return server;
            }
        }
        return null;
    }

    private void throwIfIncompatible(ClusterDescription curDescription) {
        if (!curDescription.isCompatibleWithDriver()) {
            throw new MongoIncompatibleDriverException(String.format("This version of the driver is not compatible with one or more of the servers to which it is connected: %s", curDescription));
        }
    }

    private Random getRandom() {
        Random result = this.random.get();
        if (result == null) {
            Random result2 = new Random();
            this.random.set(result2);
            return result2;
        }
        return result;
    }

    public ClusterableServer createServer(ServerAddress serverAddress, ChangeListener<ServerDescription> serverStateListener) {
        ClusterableServer server = this.serverFactory.create(serverAddress);
        server.addChangeListener(serverStateListener);
        return server;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static final class WrappedServer implements Server {
        private final ClusterableServer wrapped;

        public WrappedServer(ClusterableServer server) {
            this.wrapped = server;
        }

        @Override // com.mongodb.Server
        public ServerDescription getDescription() {
            return this.wrapped.getDescription();
        }

        @Override // com.mongodb.Server
        public Connection getConnection(long maxWaitTime, TimeUnit timeUnit) {
            return this.wrapped.getConnection(maxWaitTime, timeUnit);
        }

        @Override // com.mongodb.Server
        public void invalidate() {
            this.wrapped.invalidate();
        }
    }
}
