package com.mongodb;

import android.support.v4.view.accessibility.AccessibilityEventCompat;
import com.mongodb.DBPort;
import com.mongodb.MongoAuthority;
import com.mongodb.MongoException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.bson.util.Assertions;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DBTCPConnector implements DBConnector {
    private static final AtomicInteger NEXT_CLUSTER_ID = new AtomicInteger(1);
    private volatile boolean _closed;
    private final Mongo _mongo;
    private Cluster cluster;
    private final ClusterConnectionMode connectionMode;
    private MongosHAServerSelector mongosHAServerSelector;
    private final MyPort _myPort = new MyPort();
    private ClusterType type = ClusterType.Unknown;

    static /* synthetic */ WriteResult access$000(DBTCPConnector x0, DB x1, DBPort x2, WriteConcern x3) throws IOException {
        return x0._checkWriteError(x1, x2, x3);
    }

    static /* synthetic */ ServerSelector access$100(DBTCPConnector x0, ReadPreference x1) {
        return x0.createServerSelector(x1);
    }

    static /* synthetic */ ClusterDescription access$200(DBTCPConnector x0) {
        return x0.getClusterDescription();
    }

    static /* synthetic */ Server access$300(DBTCPConnector x0, ServerSelector x1) {
        return x0.getServer(x1);
    }

    static /* synthetic */ int access$400(DBTCPConnector x0) {
        return x0.getConnectionWaitTimeMS();
    }

    public DBTCPConnector(Mongo mongo) {
        this._mongo = mongo;
        this.connectionMode = (this._mongo.getAuthority().getType() == MongoAuthority.Type.Set || this._mongo.getMongoOptions().getRequiredReplicaSetName() != null) ? ClusterConnectionMode.Multiple : ClusterConnectionMode.Single;
    }

    public void start() {
        Assertions.isTrue("open", !this._closed);
        MongoOptions options = this._mongo.getMongoOptions();
        String clusterId = Integer.toString(NEXT_CLUSTER_ID.getAndIncrement());
        this.cluster = Clusters.create(clusterId, ClusterSettings.builder().hosts(this._mongo.getAuthority().getServerAddresses()).mode(this.connectionMode).requiredReplicaSetName(this._mongo.getMongoOptions().getRequiredReplicaSetName()).build(), ServerSettings.builder().heartbeatFrequency(options.heartbeatFrequencyMS, TimeUnit.MILLISECONDS).heartbeatConnectRetryFrequency(options.heartbeatConnectRetryFrequencyMS, TimeUnit.MILLISECONDS).heartbeatSocketSettings(SocketSettings.builder().connectTimeout(options.heartbeatConnectTimeoutMS, TimeUnit.MILLISECONDS).readTimeout(options.heartbeatReadTimeoutMS, TimeUnit.MILLISECONDS).socketFactory(this._mongo.getMongoOptions().getSocketFactory()).build()).build(), null, this._mongo);
    }

    @Override // com.mongodb.DBConnector
    public void requestStart() {
        Assertions.isTrue("open", !this._closed);
        this._myPort.requestStart();
    }

    @Override // com.mongodb.DBConnector
    public void requestDone() {
        Assertions.isTrue("open", !this._closed);
        this._myPort.requestDone();
    }

    @Override // com.mongodb.DBConnector
    public void requestEnsureConnection() {
        Assertions.isTrue("open", !this._closed);
        this._myPort.requestEnsureConnection();
    }

    private WriteResult _checkWriteError(DB db, DBPort port, WriteConcern concern) throws IOException {
        CommandResult e = port.runCommand(db, concern.getCommand());
        e.throwOnError();
        return new WriteResult(e, concern);
    }

    @Override // com.mongodb.DBConnector
    public WriteResult say(DB db, OutMessage m, WriteConcern concern) {
        Assertions.isTrue("open", !this._closed);
        return say(db, m, concern, (ServerAddress) null);
    }

    @Override // com.mongodb.DBConnector
    public WriteResult say(DB db, OutMessage m, WriteConcern concern, ServerAddress hostNeeded) {
        Assertions.isTrue("open", !this._closed);
        DBPort port = this._myPort.get(true, ReadPreference.primary(), hostNeeded);
        try {
            return say(db, m, concern, port);
        } finally {
            this._myPort.done(port);
        }
    }

    public WriteResult say(DB db, OutMessage m, WriteConcern concern, DBPort port) {
        WriteResult writeResult;
        boolean z = false;
        if (!this._closed) {
            z = true;
        }
        Assertions.isTrue("open", z);
        try {
        } catch (MongoException.Network e) {
            if (concern.raiseNetworkErrors()) {
                throw e;
            }
            CommandResult res = new CommandResult(port.serverAddress());
            res.put("ok", (Object) false);
            res.put("$err", (Object) "NETWORK ERROR");
            writeResult = new WriteResult(res, concern);
        } finally {
            m.doneWithMessage();
        }
        if (concern == null) {
            throw new IllegalArgumentException("Write concern is null");
        }
        writeResult = (WriteResult) doOperation(db, port, new AnonymousClass1(port, m, concern, db));
        return writeResult;
    }

    /* renamed from: com.mongodb.DBTCPConnector$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements DBPort.Operation<WriteResult> {
        final /* synthetic */ WriteConcern val$concern;
        final /* synthetic */ DB val$db;
        final /* synthetic */ OutMessage val$m;
        final /* synthetic */ DBPort val$port;

        AnonymousClass1(DBPort dBPort, OutMessage outMessage, WriteConcern writeConcern, DB db) {
            DBTCPConnector.this = r1;
            this.val$port = dBPort;
            this.val$m = outMessage;
            this.val$concern = writeConcern;
            this.val$db = db;
        }

        @Override // com.mongodb.DBPort.Operation
        public WriteResult execute() throws IOException {
            this.val$port.say(this.val$m);
            return this.val$concern.callGetLastError() ? DBTCPConnector.access$000(DBTCPConnector.this, this.val$db, this.val$port, this.val$concern) : new WriteResult(this.val$db, this.val$port, this.val$concern);
        }
    }

    public <T> T doOperation(DB db, DBPort port, DBPort.Operation<T> operation) {
        Assertions.isTrue("open", !this._closed);
        try {
            port.checkAuth(db.getMongo());
            return operation.execute();
        } catch (MongoException re) {
            throw re;
        } catch (IOException ioe) {
            this._myPort.error(port, ioe);
            throw new MongoException.Network("Operation on server " + port.getAddress() + " failed", ioe);
        } catch (RuntimeException re2) {
            this._myPort.error(port, re2);
            throw re2;
        }
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, DBDecoder decoder) {
        Assertions.isTrue("open", !this._closed);
        return call(db, coll, m, hostNeeded, 2, null, decoder);
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int retries) {
        Assertions.isTrue("open", !this._closed);
        return call(db, coll, m, hostNeeded, retries, null, null);
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int retries, ReadPreference readPref, DBDecoder decoder) {
        Assertions.isTrue("open", !this._closed);
        try {
            return innerCall(db, coll, m, hostNeeded, retries, readPref, decoder);
        } finally {
            m.doneWithMessage();
        }
    }

    private Response innerCall(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int remainingRetries, ReadPreference readPref, DBDecoder decoder) {
        if (readPref == null) {
            readPref = ReadPreference.primary();
        }
        if (readPref == ReadPreference.primary() && m.hasOption(4)) {
            readPref = ReadPreference.secondaryPreferred();
        }
        DBPort port = this._myPort.get(false, readPref, hostNeeded);
        Response res = null;
        boolean retry = false;
        try {
            try {
                try {
                    port.checkAuth(db.getMongo());
                    res = port.call(m, coll, decoder);
                } catch (RuntimeException re) {
                    this._myPort.error(port, re);
                    throw re;
                }
            } catch (IOException ioe) {
                this._myPort.error(port, ioe);
                retry = shouldRetryQuery(readPref, coll, ioe, remainingRetries);
                if (!retry) {
                    throw new MongoException.Network("Read operation to server " + port.host() + " failed on database " + db, ioe);
                }
                this._myPort.done(port);
            }
            if (res._responseTo != m.getId()) {
                throw new MongoException("ids don't match");
            }
            this._myPort.done(port);
            if (retry) {
                Response res2 = innerCall(db, coll, m, hostNeeded, remainingRetries - 1, readPref, decoder);
                return res2;
            }
            ServerError err = res.getError();
            if (err != null && err.isNotMasterError()) {
                if (remainingRetries <= 0) {
                    throw new MongoException("not talking to master and retries used up");
                }
                Response res3 = innerCall(db, coll, m, hostNeeded, remainingRetries - 1, readPref, decoder);
                return res3;
            }
            return res;
        } catch (Throwable th) {
            this._myPort.done(port);
            throw th;
        }
    }

    public ServerAddress getAddress() {
        Assertions.isTrue("open", !this._closed);
        ClusterDescription clusterDescription = getClusterDescription();
        if (this.connectionMode == ClusterConnectionMode.Single) {
            return clusterDescription.getAny().get(0).getAddress();
        }
        if (clusterDescription.getPrimaries().isEmpty()) {
            return null;
        }
        return clusterDescription.getPrimaries().get(0).getAddress();
    }

    public List<ServerAddress> getAllAddress() {
        Assertions.isTrue("open", !this._closed);
        return this._mongo._authority.getServerAddresses();
    }

    public List<ServerAddress> getServerAddressList() {
        Assertions.isTrue("open", !this._closed);
        List<ServerAddress> serverAddressList = new ArrayList<>();
        ClusterDescription clusterDescription = getClusterDescription();
        for (ServerDescription serverDescription : clusterDescription.getAll()) {
            serverAddressList.add(serverDescription.getAddress());
        }
        return serverAddressList;
    }

    public ReplicaSetStatus getReplicaSetStatus() {
        Assertions.isTrue("open", !this._closed);
        if (getType() == ClusterType.ReplicaSet && this.connectionMode == ClusterConnectionMode.Multiple) {
            return new ReplicaSetStatus(getClusterDescription());
        }
        return null;
    }

    public boolean isMongosConnection() {
        Assertions.isTrue("open", !this._closed);
        return getType() == ClusterType.Sharded;
    }

    public String getConnectPoint() {
        Assertions.isTrue("open", !this._closed);
        ServerAddress master = getAddress();
        if (master != null) {
            return master.toString();
        }
        return null;
    }

    private boolean shouldRetryQuery(ReadPreference readPreference, DBCollection coll, IOException ioe, int remainingRetries) {
        return remainingRetries != 0 && !coll._name.equals(MongoNamespace.COMMAND_COLLECTION_NAME) && !(ioe instanceof SocketTimeoutException) && !readPreference.equals(ReadPreference.primary()) && this.connectionMode == ClusterConnectionMode.Multiple && getType() == ClusterType.ReplicaSet;
    }

    private ClusterDescription getClusterDescription() {
        return this.cluster.getDescription(getClusterWaitTimeMS(), TimeUnit.MILLISECONDS);
    }

    private int getClusterWaitTimeMS() {
        return Math.min(this._mongo.getMongoOptions().maxWaitTime, this._mongo.getMongoOptions().connectTimeout);
    }

    private int getConnectionWaitTimeMS() {
        return this._mongo.getMongoOptions().maxWaitTime;
    }

    public DBPort getPrimaryPort() {
        Assertions.isTrue("open", !this._closed);
        return this._myPort.get(true, ReadPreference.primary(), null);
    }

    public void releasePort(DBPort port) {
        Assertions.isTrue("open", !this._closed);
        this._myPort.done(port);
    }

    public ServerDescription getServerDescription(ServerAddress address) {
        Assertions.isTrue("open", !this._closed);
        return getClusterDescription().getByServerAddress(address);
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class MyPort {
        private final ThreadLocal<PinnedRequestStatus> pinnedRequestStatusThreadLocal = new ThreadLocal<>();

        MyPort() {
            DBTCPConnector.this = r2;
        }

        DBPort get(boolean keep, ReadPreference readPref, ServerAddress hostNeeded) {
            DBPort pinnedRequestPort = getPinnedRequestPortForThread();
            if (hostNeeded != null) {
                if (pinnedRequestPort == null || !pinnedRequestPort.serverAddress().equals(hostNeeded)) {
                    return getConnection(new ServerAddressSelector(hostNeeded));
                }
                return pinnedRequestPort;
            }
            if (pinnedRequestPort != null) {
                if (!portIsAPrimary(pinnedRequestPort) && keep) {
                    pinnedRequestPort.getProvider().release(pinnedRequestPort);
                    setPinnedRequestPortForThread(null);
                } else {
                    return pinnedRequestPort;
                }
            }
            DBPort port = getConnection(DBTCPConnector.access$100(DBTCPConnector.this, readPref));
            if (threadHasPinnedRequest()) {
                setPinnedRequestPortForThread(port);
            }
            return port;
        }

        private boolean portIsAPrimary(DBPort pinnedRequestPort) {
            for (ServerDescription cur : DBTCPConnector.access$200(DBTCPConnector.this).getPrimaries()) {
                if (cur.getAddress().equals(pinnedRequestPort.serverAddress())) {
                    return true;
                }
            }
            return false;
        }

        void done(DBPort port) {
            Connection requestPort = getPinnedRequestPortForThread();
            if (port != requestPort) {
                port.getProvider().release(port);
            }
        }

        void error(DBPort port, Exception e) {
            if (!(e instanceof InterruptedIOException)) {
                DBTCPConnector.access$300(DBTCPConnector.this, new ServerAddressSelector(port.getAddress())).invalidate();
            }
            port.close();
            this.pinnedRequestStatusThreadLocal.remove();
        }

        void requestEnsureConnection() {
            if (threadHasPinnedRequest() && getPinnedRequestPortForThread() == null) {
                setPinnedRequestPortForThread(getConnection(DBTCPConnector.access$100(DBTCPConnector.this, ReadPreference.primary())));
            }
        }

        private DBPort getConnection(ServerSelector serverSelector) {
            return (DBPort) DBTCPConnector.access$300(DBTCPConnector.this, serverSelector).getConnection(DBTCPConnector.access$400(DBTCPConnector.this), TimeUnit.MILLISECONDS);
        }

        void requestStart() {
            PinnedRequestStatus current = getPinnedRequestStatusForThread();
            if (current == null) {
                this.pinnedRequestStatusThreadLocal.set(new PinnedRequestStatus());
            } else {
                current.nestedBindings++;
            }
        }

        void requestDone() {
            PinnedRequestStatus current = getPinnedRequestStatusForThread();
            if (current != null) {
                if (current.nestedBindings > 0) {
                    current.nestedBindings--;
                    return;
                }
                this.pinnedRequestStatusThreadLocal.remove();
                if (current.requestPort != null) {
                    current.requestPort.getProvider().release(current.requestPort);
                }
            }
        }

        PinnedRequestStatus getPinnedRequestStatusForThread() {
            return this.pinnedRequestStatusThreadLocal.get();
        }

        boolean threadHasPinnedRequest() {
            return this.pinnedRequestStatusThreadLocal.get() != null;
        }

        DBPort getPinnedRequestPortForThread() {
            if (threadHasPinnedRequest()) {
                return this.pinnedRequestStatusThreadLocal.get().requestPort;
            }
            return null;
        }

        void setPinnedRequestPortForThread(DBPort port) {
            this.pinnedRequestStatusThreadLocal.get().requestPort = port;
        }
    }

    private ServerSelector createServerSelector(ReadPreference readPreference) {
        if (this.connectionMode == ClusterConnectionMode.Multiple) {
            List<ServerSelector> serverSelectorList = new ArrayList<>();
            if (getType() == ClusterType.Sharded) {
                serverSelectorList.add(getMongosHAServerSelector());
            } else if (getType() == ClusterType.ReplicaSet) {
                serverSelectorList.add(new ReadPreferenceServerSelector(readPreference));
            } else {
                serverSelectorList.add(new AnyServerSelector());
            }
            serverSelectorList.add(new LatencyMinimizingServerSelector(this._mongo.getMongoOptions().acceptableLatencyDifferenceMS, TimeUnit.MILLISECONDS));
            return new CompositeServerSelector(serverSelectorList);
        }
        return new AnyServerSelector();
    }

    private synchronized ClusterType getType() {
        if (this.type == ClusterType.Unknown) {
            this.type = getClusterDescription().getType();
        }
        return this.type;
    }

    private synchronized MongosHAServerSelector getMongosHAServerSelector() {
        if (this.mongosHAServerSelector == null) {
            this.mongosHAServerSelector = new MongosHAServerSelector();
        }
        return this.mongosHAServerSelector;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class PinnedRequestStatus {
        public int nestedBindings;
        DBPort requestPort;

        PinnedRequestStatus() {
        }
    }

    public String debugString() {
        return getClusterDescription().getShortDescription();
    }

    public void close() {
        this._closed = true;
        if (this.cluster != null) {
            this.cluster.close();
            this.cluster = null;
        }
    }

    public void updatePortPool(ServerAddress addr) {
    }

    public DBPortPool getDBPortPool(ServerAddress addr) {
        throw new UnsupportedOperationException();
    }

    @Override // com.mongodb.DBConnector
    public boolean isOpen() {
        return !this._closed;
    }

    @Override // com.mongodb.DBConnector
    public CommandResult authenticate(MongoCredential credentials) {
        DBPort port = this._myPort.get(false, ReadPreference.primaryPreferred(), null);
        try {
            CommandResult result = port.authenticate(this._mongo, credentials);
            this._mongo.getAuthority().getCredentialsStore().add(credentials);
            return result;
        } finally {
            this._myPort.done(port);
        }
    }

    public int getMaxBsonObjectSize() {
        ClusterDescription clusterDescription = getClusterDescription();
        return clusterDescription.getPrimaries().isEmpty() ? AccessibilityEventCompat.TYPE_WINDOWS_CHANGED : clusterDescription.getPrimaries().get(0).getMaxDocumentSize();
    }

    MyPort getMyPort() {
        return this._myPort;
    }

    private Server getServer(ServerSelector serverSelector) {
        return this.cluster.getServer(serverSelector, getClusterWaitTimeMS(), TimeUnit.MILLISECONDS);
    }
}
