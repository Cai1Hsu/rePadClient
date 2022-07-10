package com.mongodb;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.util.annotations.ThreadSafe;
@ThreadSafe
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ServerMonitor {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private final PooledConnectionProvider connectionProvider;
    private int count;
    private long elapsedNanosSum;
    private volatile boolean isClosed;
    private final Mongo mongo;
    private final Thread monitorThread;
    private ServerAddress serverAddress;
    private final ChangeListener<ServerDescription> serverStateListener;
    private final ServerSettings settings;
    private final SocketSettings socketSettings;
    private final Lock lock = new ReentrantLock();
    private final Condition condition = this.lock.newCondition();

    static /* synthetic */ ServerDescription access$000(ServerMonitor x0, Throwable x1) {
        return x0.getConnectingServerDescription(x1);
    }

    static /* synthetic */ boolean access$100(ServerMonitor x0) {
        return x0.isClosed;
    }

    static /* synthetic */ ServerSettings access$1000(ServerMonitor x0) {
        return x0.settings;
    }

    static /* synthetic */ Lock access$1100(ServerMonitor x0) {
        return x0.lock;
    }

    static /* synthetic */ Condition access$1200(ServerMonitor x0) {
        return x0.condition;
    }

    static /* synthetic */ ServerAddress access$200(ServerMonitor x0) {
        return x0.serverAddress;
    }

    static /* synthetic */ MongoOptions access$300(ServerMonitor x0) {
        return x0.getOptions();
    }

    static /* synthetic */ ServerDescription access$400(ServerMonitor x0, DBPort x1) throws IOException {
        return x0.lookupServerDescription(x1);
    }

    static /* synthetic */ int access$502(ServerMonitor x0, int x1) {
        x0.count = x1;
        return x1;
    }

    static /* synthetic */ long access$602(ServerMonitor x0, long x1) {
        x0.elapsedNanosSum = x1;
        return x1;
    }

    static /* synthetic */ PooledConnectionProvider access$700(ServerMonitor x0) {
        return x0.connectionProvider;
    }

    static /* synthetic */ Logger access$800() {
        return LOGGER;
    }

    static /* synthetic */ ChangeListener access$900(ServerMonitor x0) {
        return x0.serverStateListener;
    }

    public ServerMonitor(ServerAddress serverAddress, ChangeListener<ServerDescription> serverStateListener, SocketSettings socketSettings, ServerSettings settings, String clusterId, Mongo mongo, PooledConnectionProvider connectionProvider) {
        this.serverAddress = serverAddress;
        this.serverStateListener = serverStateListener;
        this.socketSettings = socketSettings;
        this.settings = settings;
        this.mongo = mongo;
        this.connectionProvider = connectionProvider;
        this.monitorThread = new Thread(new ServerMonitorRunnable(), "cluster-" + clusterId + "-" + serverAddress);
        this.monitorThread.setDaemon(true);
    }

    public void start() {
        this.monitorThread.start();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class ServerMonitorRunnable implements Runnable {
        ServerMonitorRunnable() {
            ServerMonitor.this = r1;
        }

        /* JADX WARN: Removed duplicated region for block: B:13:0x0037 A[Catch: Throwable -> 0x0089, TRY_ENTER, TRY_LEAVE, TryCatch #3 {all -> 0x0097, blocks: (B:3:0x0001, B:10:0x0029, B:11:0x002f, B:14:0x003d, B:22:0x0073, B:28:0x0082, B:13:0x0037), top: B:45:0x0001 }] */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            Throwable th;
            DBPort connection;
            DBPort connection2 = null;
            try {
                ServerDescription currentServerDescription = ServerMonitor.access$000(ServerMonitor.this, null);
                Throwable currentException = null;
                while (true) {
                    try {
                        connection = connection2;
                        if (!ServerMonitor.access$100(ServerMonitor.this)) {
                            ServerDescription previousServerDescription = currentServerDescription;
                            Throwable previousException = currentException;
                            if (connection == null) {
                                try {
                                    connection2 = new DBPort(ServerMonitor.access$200(ServerMonitor.this), null, ServerMonitor.access$300(ServerMonitor.this), 0);
                                } catch (Throwable th2) {
                                    t = th2;
                                    connection2 = connection;
                                    currentException = t;
                                    currentServerDescription = ServerMonitor.access$000(ServerMonitor.this, t);
                                    if (!ServerMonitor.access$100(ServerMonitor.this)) {
                                    }
                                    waitForNext();
                                }
                            } else {
                                connection2 = connection;
                            }
                            try {
                                try {
                                    currentServerDescription = ServerMonitor.access$400(ServerMonitor.this, connection2);
                                } catch (Throwable th3) {
                                    t = th3;
                                    currentException = t;
                                    currentServerDescription = ServerMonitor.access$000(ServerMonitor.this, t);
                                    if (!ServerMonitor.access$100(ServerMonitor.this)) {
                                    }
                                    waitForNext();
                                }
                            } catch (IOException e) {
                                ServerMonitor.access$502(ServerMonitor.this, 0);
                                ServerMonitor.access$602(ServerMonitor.this, 0L);
                                if (connection2 != null) {
                                    connection2.close();
                                    connection2 = null;
                                    ServerMonitor.access$700(ServerMonitor.this).invalidate();
                                }
                                connection = connection2;
                                connection2 = new DBPort(ServerMonitor.access$200(ServerMonitor.this), null, ServerMonitor.access$300(ServerMonitor.this), 0);
                                try {
                                    currentServerDescription = ServerMonitor.access$400(ServerMonitor.this, connection2);
                                } catch (IOException e1) {
                                    connection2.close();
                                    connection2 = null;
                                    throw e1;
                                    break;
                                }
                            }
                            if (!ServerMonitor.access$100(ServerMonitor.this)) {
                                logStateChange(previousServerDescription, previousException, currentServerDescription, currentException);
                                sendStateChangedEvent(previousServerDescription, currentServerDescription);
                            }
                            waitForNext();
                        } else if (connection != null) {
                            connection.close();
                            return;
                        } else {
                            return;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        connection2 = connection;
                        if (connection2 != null) {
                            connection2.close();
                        }
                        throw th;
                    }
                }
            } catch (Throwable th5) {
                th = th5;
            }
        }

        private void sendStateChangedEvent(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
            if (ServerMonitor.stateHasChanged(previousServerDescription, currentServerDescription)) {
                ServerMonitor.access$900(ServerMonitor.this).stateChanged(new ChangeEvent(previousServerDescription, currentServerDescription));
            }
        }

        private void logStateChange(ServerDescription previousServerDescription, Throwable previousException, ServerDescription currentServerDescription, Throwable currentException) {
            if (ServerMonitor.descriptionHasChanged(previousServerDescription, currentServerDescription) || ServerMonitor.exceptionHasChanged(previousException, currentException)) {
                if (currentException != null) {
                    ServerMonitor.access$800().log(Level.INFO, String.format("Exception in monitor thread while connecting to server %s", ServerMonitor.access$200(ServerMonitor.this)), currentException);
                } else {
                    ServerMonitor.access$800().info(String.format("Monitor thread successfully connected to server with description %s", currentServerDescription));
                }
            }
        }

        private void waitForNext() {
            try {
                long timeRemaining = waitForSignalOrTimeout();
                if (timeRemaining > 0) {
                    long timeWaiting = ServerMonitor.access$1000(ServerMonitor.this).getHeartbeatFrequency(TimeUnit.NANOSECONDS) - timeRemaining;
                    long minimumNanosToWait = ServerMonitor.access$1000(ServerMonitor.this).getHeartbeatConnectRetryFrequency(TimeUnit.NANOSECONDS);
                    if (timeWaiting < minimumNanosToWait) {
                        long millisToSleep = TimeUnit.MILLISECONDS.convert(minimumNanosToWait - timeWaiting, TimeUnit.NANOSECONDS);
                        if (millisToSleep > 0) {
                            Thread.sleep(millisToSleep);
                        }
                    }
                }
            } catch (InterruptedException e) {
            }
        }

        private long waitForSignalOrTimeout() throws InterruptedException {
            ServerMonitor.access$1100(ServerMonitor.this).lock();
            try {
                return ServerMonitor.access$1200(ServerMonitor.this).awaitNanos(ServerMonitor.access$1000(ServerMonitor.this).getHeartbeatFrequency(TimeUnit.NANOSECONDS));
            } finally {
                ServerMonitor.access$1100(ServerMonitor.this).unlock();
            }
        }
    }

    public void connect() {
        this.lock.lock();
        try {
            this.condition.signal();
        } finally {
            this.lock.unlock();
        }
    }

    public void close() {
        this.isClosed = true;
        this.monitorThread.interrupt();
    }

    private MongoOptions getOptions() {
        MongoOptions options = new MongoOptions();
        options.setConnectTimeout(this.socketSettings.getConnectTimeout(TimeUnit.MILLISECONDS));
        options.setSocketTimeout(this.socketSettings.getReadTimeout(TimeUnit.MILLISECONDS));
        options.setSocketFactory(this.socketSettings.getSocketFactory());
        return options;
    }

    static boolean descriptionHasChanged(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
        return !previousServerDescription.equals(currentServerDescription);
    }

    static boolean stateHasChanged(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
        return descriptionHasChanged(previousServerDescription, currentServerDescription) || previousServerDescription.getAverageLatencyNanos() != currentServerDescription.getAverageLatencyNanos();
    }

    static boolean exceptionHasChanged(Throwable previousException, Throwable currentException) {
        if (currentException == null) {
            return previousException != null;
        } else if (previousException == null || !currentException.getClass().equals(previousException.getClass())) {
            return true;
        } else {
            return currentException.getMessage() == null ? previousException.getMessage() != null : !currentException.getMessage().equals(previousException.getMessage());
        }
    }

    private ServerDescription lookupServerDescription(DBPort connection) throws IOException {
        LOGGER.fine(String.format("Checking status of %s", this.serverAddress));
        long startNanoTime = System.nanoTime();
        CommandResult isMasterResult = connection.runCommand(this.mongo.getDB("admin"), new BasicDBObject("ismaster", 1));
        this.count++;
        this.elapsedNanosSum += System.nanoTime() - startNanoTime;
        CommandResult buildInfoResult = connection.runCommand(this.mongo.getDB("admin"), new BasicDBObject("buildinfo", 1));
        return createDescription(isMasterResult, buildInfoResult, this.elapsedNanosSum / this.count);
    }

    private ServerDescription createDescription(CommandResult commandResult, CommandResult buildInfoResult, long averageLatencyNanos) {
        return ServerDescription.builder().state(ServerConnectionState.Connected).version(getVersion(buildInfoResult)).address(commandResult.getServerUsed()).type(getServerType(commandResult)).hosts(listToSet((List) commandResult.get("hosts"))).passives(listToSet((List) commandResult.get("passives"))).arbiters(listToSet((List) commandResult.get("arbiters"))).primary(commandResult.getString("primary")).maxDocumentSize(commandResult.getInt("maxBsonObjectSize", ServerDescription.getDefaultMaxDocumentSize())).maxMessageSize(commandResult.getInt("maxMessageSizeBytes", ServerDescription.getDefaultMaxMessageSize())).maxWriteBatchSize(commandResult.getInt("maxWriteBatchSize", ServerDescription.getDefaultMaxWriteBatchSize())).tags(getTagsFromDocument((DBObject) commandResult.get("tags"))).setName(commandResult.getString("setName")).minWireVersion(commandResult.getInt("minWireVersion", ServerDescription.getDefaultMinWireVersion())).maxWireVersion(commandResult.getInt("maxWireVersion", ServerDescription.getDefaultMaxWireVersion())).averageLatency(averageLatencyNanos, TimeUnit.NANOSECONDS).ok(commandResult.ok()).build();
    }

    private static ServerVersion getVersion(CommandResult buildInfoResult) {
        return new ServerVersion(((List) buildInfoResult.get("versionArray")).subList(0, 3));
    }

    private Set<String> listToSet(List<String> list) {
        return (list == null || list.isEmpty()) ? Collections.emptySet() : new HashSet(list);
    }

    private static ServerType getServerType(BasicDBObject isMasterResult) {
        if (isReplicaSetMember(isMasterResult)) {
            if (isMasterResult.getBoolean("ismaster", false)) {
                return ServerType.ReplicaSetPrimary;
            }
            if (isMasterResult.getBoolean("secondary", false)) {
                return ServerType.ReplicaSetSecondary;
            }
            if (isMasterResult.getBoolean("arbiterOnly", false)) {
                return ServerType.ReplicaSetArbiter;
            }
            if (isMasterResult.containsKey("setName") && isMasterResult.containsField("hosts")) {
                return ServerType.ReplicaSetOther;
            }
            return ServerType.ReplicaSetGhost;
        } else if (isMasterResult.containsKey("msg") && isMasterResult.get("msg").equals("isdbgrid")) {
            return ServerType.ShardRouter;
        } else {
            return ServerType.StandAlone;
        }
    }

    private static boolean isReplicaSetMember(BasicDBObject isMasterResult) {
        return isMasterResult.containsKey("setName") || isMasterResult.getBoolean("isreplicaset", false);
    }

    private static Tags getTagsFromDocument(DBObject tagsDocuments) {
        if (tagsDocuments == null) {
            return new Tags();
        }
        Tags tags = new Tags();
        for (String key : tagsDocuments.keySet()) {
            tags.put(key, tagsDocuments.get(key).toString());
        }
        return tags;
    }

    private ServerDescription getConnectingServerDescription(Throwable throwable) {
        return ServerDescription.builder().type(ServerType.Unknown).state(ServerConnectionState.Connecting).address(this.serverAddress).exception(throwable).build();
    }
}
