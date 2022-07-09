package com.mongodb;

import com.mongodb.util.SimplePool;
import java.util.concurrent.Semaphore;

@Deprecated
/* loaded from: classes.dex */
public class DBPortPool extends SimplePool<DBPort> {
    final ServerAddress _addr;
    final MongoOptions _options;
    private final Semaphore _waitingSem;

    public String getHost() {
        return this._addr.getHost();
    }

    public int getPort() {
        return this._addr.getPort();
    }

    @Deprecated
    /* loaded from: classes.dex */
    public static class NoMoreConnection extends MongoClientException {
        private static final long serialVersionUID = -4415279469780082174L;

        public NoMoreConnection(String msg) {
            super(msg);
        }
    }

    @Deprecated
    /* loaded from: classes.dex */
    public static class SemaphoresOut extends MongoWaitQueueFullException {
        private static final String message = "Concurrent requests for database connection have exceeded limit";
        private static final long serialVersionUID = -4415279469780082174L;

        SemaphoresOut() {
            super(message);
        }

        SemaphoresOut(int numPermits) {
            super("Concurrent requests for database connection have exceeded limit of " + numPermits);
        }
    }

    @Deprecated
    /* loaded from: classes.dex */
    public static class ConnectionWaitTimeOut extends MongoTimeoutException {
        private static final long serialVersionUID = -4415279469780082174L;

        ConnectionWaitTimeOut(int timeout) {
            super("Connection wait timeout after " + timeout + " ms");
        }
    }

    DBPortPool(ServerAddress addr, MongoOptions options) {
        super("DBPortPool-" + addr.toString() + ", options = " + options.toString(), options.connectionsPerHost);
        this._options = options;
        this._addr = addr;
        this._waitingSem = new Semaphore(this._options.connectionsPerHost * this._options.threadsAllowedToBlockForConnectionMultiplier);
    }

    @Override // com.mongodb.util.SimplePool
    public DBPort get() {
        if (!this._waitingSem.tryAcquire()) {
            throw new SemaphoresOut(this._options.connectionsPerHost * this._options.threadsAllowedToBlockForConnectionMultiplier);
        }
        try {
            try {
                DBPort port = get(this._options.maxWaitTime);
                if (port == null) {
                    throw new ConnectionWaitTimeOut(this._options.maxWaitTime);
                }
                return port;
            } catch (InterruptedException e) {
                throw new MongoInterruptedException(e);
            }
        } finally {
            this._waitingSem.release();
        }
    }

    public void cleanup(DBPort p) {
        p.close();
    }

    @Override // com.mongodb.util.SimplePool
    public DBPort createNew() {
        return new DBPort(this._addr);
    }

    public ServerAddress getServerAddress() {
        return this._addr;
    }
}
