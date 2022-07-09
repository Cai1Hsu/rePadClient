package com.mongodb;

import android.support.v4.view.accessibility.AccessibilityEventCompat;
import com.mongodb.MongoException;
import com.mongodb.OutMessage;
import com.mongodb.util.ThreadUtil;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.sasl.Sasl;
import javax.security.sasl.SaslClient;
import javax.security.sasl.SaslException;
import org.apache.tools.ant.taskdefs.Execute;
import org.bson.util.Assertions;
import org.ietf.jgss.GSSCredential;
import org.ietf.jgss.GSSException;
import org.ietf.jgss.GSSManager;
import org.ietf.jgss.GSSName;
import org.ietf.jgss.Oid;
import org.jivesoftware.smackx.workgroup.packet.UserID;

@Deprecated
/* loaded from: classes.dex */
public class DBPort implements Connection {
    static final long CONN_RETRY_TIME_MS = 15000;
    public static final int PORT = 27017;
    static final boolean USE_NAGLE = false;
    private static Logger _rootLogger = Logger.getLogger("com.mongodb.port");
    private volatile ActiveState _activeState;
    private final ServerAddress _addr;
    private final DBDecoder _decoder;
    private volatile InputStream _in;
    private final Logger _logger;
    private final MongoOptions _options;
    private volatile OutputStream _out;
    private final ServerAddress _sa;
    private volatile Socket _socket;
    private final Set<String> authenticatedDatabases;
    private volatile boolean closed;
    private final int generation;
    private volatile long lastUsedAt;
    private final long openedAt;
    private final PooledConnectionProvider provider;
    private volatile long usageCount;

    /* loaded from: classes.dex */
    interface Operation<T> {
        T execute() throws IOException;
    }

    public DBPort(ServerAddress addr) {
        this(addr, null, new MongoOptions(), 0);
    }

    DBPort(ServerAddress addr, PooledConnectionProvider pool, MongoOptions options, int generation) {
        this.authenticatedDatabases = Collections.synchronizedSet(new HashSet());
        this._options = options;
        this._sa = addr;
        this._addr = addr;
        this.provider = pool;
        this.generation = generation;
        this._logger = Logger.getLogger(_rootLogger.getName() + "." + addr.toString());
        try {
            ensureOpen();
            this._decoder = this._options.dbDecoderFactory.create();
            this.openedAt = System.currentTimeMillis();
            this.lastUsedAt = this.openedAt;
        } catch (IOException e) {
            throw new MongoException.Network("Exception opening the socket", e);
        }
    }

    @Override // com.mongodb.Connection
    public int getGeneration() {
        return this.generation;
    }

    @Override // com.mongodb.Connection
    public long getOpenedAt() {
        return this.openedAt;
    }

    @Override // com.mongodb.Connection
    public long getLastUsedAt() {
        return this.lastUsedAt;
    }

    Response call(OutMessage msg, DBCollection coll) throws IOException {
        Assertions.isTrue("open", !this.closed);
        return call(msg, coll, null);
    }

    Response call(final OutMessage msg, final DBCollection coll, final DBDecoder decoder) throws IOException {
        Assertions.isTrue("open", !this.closed);
        return (Response) doOperation(new Operation<Response>() { // from class: com.mongodb.DBPort.1
            @Override // com.mongodb.DBPort.Operation
            public Response execute() throws IOException {
                DBPort.this.setActiveState(new ActiveState(msg));
                msg.prepare();
                msg.pipe(DBPort.this._out);
                return new Response(DBPort.this._sa, coll, DBPort.this._in, decoder == null ? DBPort.this._decoder : decoder);
            }
        });
    }

    void say(final OutMessage msg) throws IOException {
        Assertions.isTrue("open", !this.closed);
        doOperation(new Operation<Void>() { // from class: com.mongodb.DBPort.2
            @Override // com.mongodb.DBPort.Operation
            public Void execute() throws IOException {
                DBPort.this.setActiveState(new ActiveState(msg));
                msg.prepare();
                msg.pipe(DBPort.this._out);
                return null;
            }
        });
    }

    synchronized <T> T doOperation(Operation<T> operation) throws IOException {
        T execute;
        Assertions.isTrue("open", !this.closed);
        this.usageCount++;
        try {
            execute = operation.execute();
            this.lastUsedAt = System.currentTimeMillis();
            this._activeState = null;
        } catch (IOException ioe) {
            close();
            throw ioe;
        }
        return execute;
    }

    void setActiveState(ActiveState activeState) {
        Assertions.isTrue("open", !this.closed);
        this._activeState = activeState;
    }

    synchronized CommandResult getLastError(DB db, WriteConcern concern) throws IOException {
        Assertions.isTrue("open", !this.closed);
        return runCommand(db, concern.getCommand());
    }

    private synchronized Response findOne(DB db, String coll, DBObject q) throws IOException {
        Response call;
        OutMessage msg = OutMessage.query(db.getCollection(coll), 0, 0, -1, q, null, AccessibilityEventCompat.TYPE_WINDOWS_CHANGED);
        call = call(msg, db.getCollection(coll), null);
        msg.doneWithMessage();
        return call;
    }

    synchronized CommandResult runCommand(DB db, DBObject cmd) throws IOException {
        Response res;
        Assertions.isTrue("open", !this.closed);
        res = findOne(db, MongoNamespace.COMMAND_COLLECTION_NAME, cmd);
        return convertToCommandResult(cmd, res);
    }

    private CommandResult convertToCommandResult(DBObject cmd, Response res) {
        if (res.size() == 0) {
            return null;
        }
        if (res.size() > 1) {
            throw new MongoInternalException("something is wrong.  size:" + res.size());
        }
        DBObject data = res.get(0);
        if (data == null) {
            throw new MongoInternalException("something is wrong, no command result");
        }
        CommandResult cr = new CommandResult(res.serverUsed());
        cr.putAll(data);
        return cr;
    }

    synchronized CommandResult tryGetLastError(DB db, long last, WriteConcern concern) throws IOException {
        CommandResult lastError;
        Assertions.isTrue("open", !this.closed);
        if (last != this.usageCount) {
            lastError = null;
        } else {
            lastError = getLastError(db, concern);
        }
        return lastError;
    }

    OutputStream getOutputStream() throws IOException {
        Assertions.isTrue("open", !this.closed);
        return this._out;
    }

    InputStream getInputStream() throws IOException {
        Assertions.isTrue("open", !this.closed);
        return this._in;
    }

    public synchronized void ensureOpen() throws IOException {
        if (this._socket == null) {
            long sleepTime = 100;
            long maxAutoConnectRetryTime = CONN_RETRY_TIME_MS;
            if (this._options.maxAutoConnectRetryTime > 0) {
                maxAutoConnectRetryTime = this._options.maxAutoConnectRetryTime;
            }
            boolean successfullyConnected = false;
            long start = System.currentTimeMillis();
            do {
                try {
                    this._socket = this._options.socketFactory.createSocket();
                    this._socket.connect(this._addr.getSocketAddress(), this._options.connectTimeout);
                    this._socket.setTcpNoDelay(true);
                    this._socket.setKeepAlive(this._options.socketKeepAlive);
                    this._socket.setSoTimeout(this._options.socketTimeout);
                    this._in = new BufferedInputStream(this._socket.getInputStream());
                    this._out = this._socket.getOutputStream();
                    successfullyConnected = true;
                    continue;
                } catch (IOException e) {
                    close();
                    if (!this._options.autoConnectRetry || (this.provider != null && !this.provider.hasWorked())) {
                        throw e;
                    }
                    long waitSoFar = System.currentTimeMillis() - start;
                    if (waitSoFar >= maxAutoConnectRetryTime) {
                        throw e;
                    }
                    if (sleepTime + waitSoFar > maxAutoConnectRetryTime) {
                        sleepTime = maxAutoConnectRetryTime - waitSoFar;
                    }
                    this._logger.log(Level.WARNING, "Exception connecting to " + serverAddress().getHost() + ": " + e + ".  Total wait time so far is " + waitSoFar + " ms.  Will retry after sleeping for " + sleepTime + " ms.");
                    ThreadUtil.sleep(sleepTime);
                    sleepTime *= 2;
                    continue;
                }
            } while (!successfullyConnected);
        }
    }

    public int hashCode() {
        return this._addr.hashCode();
    }

    public String host() {
        return this._addr.toString();
    }

    public ServerAddress serverAddress() {
        return this._sa;
    }

    public String toString() {
        return "{DBPort  " + host() + "}";
    }

    ActiveState getActiveState() {
        Assertions.isTrue("open", !this.closed);
        return this._activeState;
    }

    int getLocalPort() {
        Assertions.isTrue("open", !this.closed);
        if (this._socket != null) {
            return this._socket.getLocalPort();
        }
        return -1;
    }

    ServerAddress getAddress() {
        return this._addr;
    }

    @Override // com.mongodb.Connection
    public boolean isClosed() {
        return this.closed;
    }

    @Override // com.mongodb.Connection
    public void close() {
        this.closed = true;
        this.authenticatedDatabases.clear();
        if (this._socket != null) {
            try {
                this._socket.close();
            } catch (Exception e) {
            }
        }
        this._in = null;
        this._out = null;
        this._socket = null;
    }

    CommandResult authenticate(Mongo mongo, MongoCredential credentials) {
        Authenticator authenticator;
        if (credentials.getMechanism().equals(MongoCredential.MONGODB_CR_MECHANISM)) {
            authenticator = new NativeAuthenticator(mongo, credentials);
        } else if (credentials.getMechanism().equals("GSSAPI")) {
            authenticator = new GSSAPIAuthenticator(mongo, credentials);
        } else if (credentials.getMechanism().equals(MongoCredential.PLAIN_MECHANISM)) {
            authenticator = new PlainAuthenticator(mongo, credentials);
        } else if (credentials.getMechanism().equals(MongoCredential.MONGODB_X509_MECHANISM)) {
            authenticator = new X509Authenticator(mongo, credentials);
        } else {
            throw new IllegalArgumentException("Unsupported authentication protocol: " + credentials.getMechanism());
        }
        CommandResult res = authenticator.authenticate();
        this.authenticatedDatabases.add(credentials.getSource());
        return res;
    }

    void checkAuth(Mongo mongo) throws IOException {
        Set<String> unauthenticatedDatabases = new HashSet<>(mongo.getAuthority().getCredentialsStore().getDatabases());
        unauthenticatedDatabases.removeAll(this.authenticatedDatabases);
        for (String databaseName : unauthenticatedDatabases) {
            authenticate(mongo, mongo.getAuthority().getCredentialsStore().get(databaseName));
        }
    }

    public DBPortPool getPool() {
        return null;
    }

    public long getUsageCount() {
        return this.usageCount;
    }

    PooledConnectionProvider getProvider() {
        return this.provider;
    }

    Set<String> getAuthenticatedDatabases() {
        return Collections.unmodifiableSet(this.authenticatedDatabases);
    }

    /* loaded from: classes.dex */
    class ActiveState {
        private final String namespace;
        private int numDocuments;
        private final OutMessage.OpCode opCode;
        private final DBObject query;
        private final long startTime = System.nanoTime();
        private final String threadName = Thread.currentThread().getName();

        ActiveState(OutMessage outMessage) {
            DBPort.this = r3;
            this.namespace = outMessage.getNamespace();
            this.opCode = outMessage.getOpCode();
            this.query = outMessage.getQuery();
            this.numDocuments = outMessage.getNumDocuments();
        }

        String getNamespace() {
            return this.namespace;
        }

        OutMessage.OpCode getOpCode() {
            return this.opCode;
        }

        DBObject getQuery() {
            return this.query;
        }

        int getNumDocuments() {
            return this.numDocuments;
        }

        long getStartTime() {
            return this.startTime;
        }

        String getThreadName() {
            return this.threadName;
        }
    }

    /* loaded from: classes.dex */
    class PlainAuthenticator extends SaslAuthenticator {
        private static final String DEFAULT_PROTOCOL = "mongodb";
        private static final String MECHANISM = "PLAIN";

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        PlainAuthenticator(Mongo mongo, MongoCredential credentials) {
            super(mongo, credentials);
            DBPort.this = r1;
        }

        @Override // com.mongodb.DBPort.SaslAuthenticator
        protected SaslClient createSaslClient() {
            try {
                return Sasl.createSaslClient(new String[]{"PLAIN"}, this.credential.getUserName(), "mongodb", DBPort.this.serverAddress().getHost(), (Map) null, new CallbackHandler() { // from class: com.mongodb.DBPort.PlainAuthenticator.1
                    @Override // javax.security.auth.callback.CallbackHandler
                    public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
                        for (Callback callback : callbacks) {
                            if (callback instanceof PasswordCallback) {
                                ((PasswordCallback) callback).setPassword(PlainAuthenticator.this.credential.getPassword());
                            } else if (callback instanceof NameCallback) {
                                ((NameCallback) callback).setName(PlainAuthenticator.this.credential.getUserName());
                            }
                        }
                    }
                });
            } catch (SaslException e) {
                throw new MongoException("Exception initializing SASL client", (Throwable) e);
            }
        }

        @Override // com.mongodb.DBPort.SaslAuthenticator
        public String getMechanismName() {
            return "PLAIN";
        }
    }

    /* loaded from: classes.dex */
    class GSSAPIAuthenticator extends SaslAuthenticator {
        public static final String CANONICALIZE_HOST_NAME_KEY = "CANONICALIZE_HOST_NAME";
        public static final String GSSAPI_MECHANISM = "GSSAPI";
        public static final String GSSAPI_OID = "1.2.840.113554.1.2.2";
        public static final String SERVICE_NAME_DEFAULT_VALUE = "mongodb";
        public static final String SERVICE_NAME_KEY = "SERVICE_NAME";

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        GSSAPIAuthenticator(Mongo mongo, MongoCredential credentials) {
            super(mongo, credentials);
            DBPort.this = r4;
            if (!this.credential.getMechanism().equals("GSSAPI")) {
                throw new MongoException("Incorrect mechanism: " + this.credential.getMechanism());
            }
        }

        @Override // com.mongodb.DBPort.SaslAuthenticator
        protected SaslClient createSaslClient() {
            try {
                Map<String, Object> props = new HashMap<>();
                props.put("javax.security.sasl.credentials", getGSSCredential(this.credential.getUserName()));
                return Sasl.createSaslClient(new String[]{"GSSAPI"}, this.credential.getUserName(), (String) this.credential.getMechanismProperty(SERVICE_NAME_KEY, SERVICE_NAME_DEFAULT_VALUE), getHostName(), props, (CallbackHandler) null);
            } catch (GSSException e) {
                throw new MongoException("Exception initializing GSSAPI credentials", (Throwable) e);
            } catch (SaslException e2) {
                throw new MongoException("Exception initializing SASL client", (Throwable) e2);
            } catch (UnknownHostException e3) {
                throw new MongoException("Unknown host " + DBPort.this.serverAddress().getHost(), e3);
            }
        }

        @Override // com.mongodb.DBPort.SaslAuthenticator
        public String getMechanismName() {
            return "GSSAPI";
        }

        private String getHostName() throws UnknownHostException {
            return ((Boolean) this.credential.getMechanismProperty(CANONICALIZE_HOST_NAME_KEY, false)).booleanValue() ? InetAddress.getByName(DBPort.this.serverAddress().getHost()).getCanonicalHostName() : DBPort.this.serverAddress().getHost();
        }

        private GSSCredential getGSSCredential(String userName) throws GSSException {
            Oid krb5Mechanism = new Oid(GSSAPI_OID);
            GSSManager manager = GSSManager.getInstance();
            GSSName name = manager.createName(userName, GSSName.NT_USER_NAME);
            return manager.createCredential(name, (int) Execute.INVALID, krb5Mechanism, 1);
        }
    }

    /* loaded from: classes.dex */
    abstract class SaslAuthenticator extends Authenticator {
        protected abstract SaslClient createSaslClient();

        public abstract String getMechanismName();

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        SaslAuthenticator(Mongo mongo, MongoCredential credentials) {
            super(mongo, credentials);
            DBPort.this = r1;
        }

        @Override // com.mongodb.DBPort.Authenticator
        public CommandResult authenticate() {
            SaslClient saslClient = createSaslClient();
            try {
                try {
                    CommandResult res = sendSaslStart(saslClient.hasInitialResponse() ? saslClient.evaluateChallenge(new byte[0]) : null);
                    res.throwOnError();
                    int conversationId = ((Integer) res.get("conversationId")).intValue();
                    while (!((Boolean) res.get("done")).booleanValue()) {
                        byte[] response = saslClient.evaluateChallenge((byte[]) res.get("payload"));
                        if (response == null) {
                            throw new MongoException("SASL protocol error: no client response to challenge");
                        }
                        res = sendSaslContinue(conversationId, response);
                        res.throwOnError();
                    }
                    return res;
                } finally {
                    try {
                        saslClient.dispose();
                    } catch (SaslException e) {
                    }
                }
            } catch (IOException e2) {
                throw new MongoException.Network("IOException authenticating the connection", e2);
            }
        }

        protected DB getDatabase() {
            return this.mongo.getDB(this.credential.getSource());
        }

        private CommandResult sendSaslStart(byte[] outToken) throws IOException {
            BasicDBObject append = new BasicDBObject("saslStart", 1).append("mechanism", (Object) getMechanismName());
            if (outToken == null) {
                outToken = new byte[0];
            }
            DBObject cmd = append.append("payload", (Object) outToken);
            return DBPort.this.runCommand(getDatabase(), cmd);
        }

        private CommandResult sendSaslContinue(int conversationId, byte[] outToken) throws IOException {
            DB adminDB = getDatabase();
            DBObject cmd = new BasicDBObject("saslContinue", 1).append("conversationId", (Object) Integer.valueOf(conversationId)).append("payload", (Object) outToken);
            return DBPort.this.runCommand(adminDB, cmd);
        }
    }

    /* loaded from: classes.dex */
    class X509Authenticator extends Authenticator {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        X509Authenticator(Mongo mongo, MongoCredential credential) {
            super(mongo, credential);
            DBPort.this = r1;
        }

        @Override // com.mongodb.DBPort.Authenticator
        CommandResult authenticate() {
            try {
                DB db = this.mongo.getDB(this.credential.getSource());
                CommandResult res = DBPort.this.runCommand(db, getAuthCommand());
                res.throwOnError();
                return res;
            } catch (IOException e) {
                throw new MongoException.Network("IOException authenticating the connection", e);
            }
        }

        private DBObject getAuthCommand() {
            return new BasicDBObject("authenticate", 1).append(UserID.ELEMENT_NAME, (Object) this.credential.getUserName()).append("mechanism", (Object) MongoCredential.MONGODB_X509_MECHANISM);
        }
    }

    /* loaded from: classes.dex */
    class NativeAuthenticator extends Authenticator {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        NativeAuthenticator(Mongo mongo, MongoCredential credentials) {
            super(mongo, credentials);
            DBPort.this = r1;
        }

        @Override // com.mongodb.DBPort.Authenticator
        public CommandResult authenticate() {
            try {
                DB db = this.mongo.getDB(this.credential.getSource());
                CommandResult res = DBPort.this.runCommand(db, NativeAuthenticationHelper.getNonceCommand());
                res.throwOnError();
                CommandResult res2 = DBPort.this.runCommand(db, NativeAuthenticationHelper.getAuthCommand(this.credential.getUserName(), this.credential.getPassword(), res.getString("nonce")));
                res2.throwOnError();
                return res2;
            } catch (IOException e) {
                throw new MongoException.Network("IOException authenticating the connection", e);
            }
        }
    }

    /* loaded from: classes.dex */
    abstract class Authenticator {
        protected final MongoCredential credential;
        protected final Mongo mongo;

        abstract CommandResult authenticate();

        Authenticator(Mongo mongo, MongoCredential credential) {
            DBPort.this = r1;
            this.mongo = mongo;
            this.credential = credential;
        }
    }
}
