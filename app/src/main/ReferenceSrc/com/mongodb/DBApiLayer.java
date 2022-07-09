package com.mongodb;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;

@Deprecated
/* loaded from: classes.dex */
public class DBApiLayer extends DB {
    static final int NUM_CURSORS_BEFORE_KILL = 100;
    static final int NUM_CURSORS_PER_BATCH = 20000;
    final DBTCPConnector _connector;
    final String _root;
    final String _rootPlusDot;
    final ConcurrentHashMap<String, DBCollectionImpl> _collections = new ConcurrentHashMap<>();
    ConcurrentLinkedQueue<DeadCursor> _deadCursorIds = new ConcurrentLinkedQueue<>();

    DBTCPConnector getConnector() {
        return this._connector;
    }

    protected DBApiLayer(Mongo mongo, String name, DBConnector connector) {
        super(mongo, name);
        if (connector == null) {
            throw new IllegalArgumentException("need a connector: " + name);
        }
        this._root = name;
        this._rootPlusDot = this._root + ".";
        this._connector = (DBTCPConnector) connector;
    }

    @Override // com.mongodb.DB
    public void requestStart() {
        this._connector.requestStart();
    }

    @Override // com.mongodb.DB
    public void requestDone() {
        this._connector.requestDone();
    }

    @Override // com.mongodb.DB
    public void requestEnsureConnection() {
        this._connector.requestEnsureConnection();
    }

    @Override // com.mongodb.DB
    public WriteResult addUser(String username, char[] passwd, boolean readOnly) {
        WriteResult addUser;
        requestStart();
        try {
            if (useUserCommands(this._connector.getPrimaryPort())) {
                CommandResult userInfoResult = command(new BasicDBObject("usersInfo", username));
                userInfoResult.throwOnError();
                DBObject userCommandDocument = getUserCommandDocument(username, passwd, readOnly, ((List) userInfoResult.get("users")).isEmpty() ? "createUser" : "updateUser");
                CommandResult commandResult = command(userCommandDocument);
                commandResult.throwOnError();
                addUser = new WriteResult(commandResult, getWriteConcern());
            } else {
                addUser = super.addUser(username, passwd, readOnly);
            }
            return addUser;
        } finally {
            requestDone();
        }
    }

    @Override // com.mongodb.DB
    public WriteResult removeUser(String username) {
        WriteResult removeUser;
        requestStart();
        try {
            if (useUserCommands(this._connector.getPrimaryPort())) {
                CommandResult res = command(new BasicDBObject("dropUser", username));
                res.throwOnError();
                removeUser = new WriteResult(res, getWriteConcern());
            } else {
                removeUser = super.removeUser(username);
            }
            return removeUser;
        } finally {
            requestDone();
        }
    }

    private DBObject getUserCommandDocument(String username, char[] passwd, boolean readOnly, String commandName) {
        return new BasicDBObject(commandName, username).append("pwd", (Object) _hash(username, passwd)).append("digestPassword", (Object) false).append("roles", (Object) Arrays.asList(getUserRoleName(readOnly)));
    }

    private String getUserRoleName(boolean readOnly) {
        return getName().equals("admin") ? readOnly ? "readAnyDatabase" : "root" : readOnly ? "read" : "dbOwner";
    }

    @Override // com.mongodb.DB
    public DBCollectionImpl doGetCollection(String name) {
        DBCollectionImpl c = this._collections.get(name);
        if (c != null) {
            return c;
        }
        DBCollectionImpl c2 = new DBCollectionImpl(this, name);
        DBCollectionImpl old = this._collections.putIfAbsent(name, c2);
        return old == null ? c2 : old;
    }

    @Override // com.mongodb.DB
    public void cleanCursors(boolean force) {
        int sz = this._deadCursorIds.size();
        if (sz != 0) {
            if (force || sz >= 100) {
                Bytes.LOGGER.info("going to kill cursors : " + sz);
                Map<ServerAddress, List<Long>> m = new HashMap<>();
                while (true) {
                    DeadCursor c = this._deadCursorIds.poll();
                    if (c == null) {
                        break;
                    }
                    List<Long> x = m.get(c.host);
                    if (x == null) {
                        x = new LinkedList<>();
                        m.put(c.host, x);
                    }
                    x.add(Long.valueOf(c.id));
                }
                for (Map.Entry<ServerAddress, List<Long>> e : m.entrySet()) {
                    try {
                        killCursors(e.getKey(), e.getValue());
                    } catch (Throwable t) {
                        Bytes.LOGGER.log(Level.WARNING, "can't clean cursors", t);
                        for (Long x2 : e.getValue()) {
                            this._deadCursorIds.add(new DeadCursor(x2.longValue(), e.getKey()));
                        }
                    }
                }
            }
        }
    }

    void killCursors(ServerAddress addr, List<Long> all) {
        if (all != null && all.size() != 0) {
            OutMessage om = OutMessage.killCursors(this._mongo, Math.min((int) NUM_CURSORS_PER_BATCH, all.size()));
            int soFar = 0;
            int totalSoFar = 0;
            for (Long l : all) {
                om.writeLong(l.longValue());
                totalSoFar++;
                soFar++;
                if (soFar >= NUM_CURSORS_PER_BATCH) {
                    this._connector.say(this, om, WriteConcern.NONE);
                    om = OutMessage.killCursors(this._mongo, Math.min((int) NUM_CURSORS_PER_BATCH, all.size() - totalSoFar));
                    soFar = 0;
                }
            }
            this._connector.say(this, om, WriteConcern.NONE, addr);
        }
    }

    @Override // com.mongodb.DB
    CommandResult doAuthenticate(MongoCredential credentials) {
        return this._connector.authenticate(credentials);
    }

    private boolean useUserCommands(DBPort port) {
        return this._connector.getServerDescription(port.getAddress()).getVersion().compareTo(new ServerVersion(2, 6)) >= 0;
    }

    void addDeadCursor(DeadCursor deadCursor) {
        this._deadCursorIds.add(deadCursor);
    }

    /* loaded from: classes.dex */
    static class DeadCursor {
        final ServerAddress host;
        final long id;

        DeadCursor(long a, ServerAddress b) {
            this.id = a;
            this.host = b;
        }
    }
}
