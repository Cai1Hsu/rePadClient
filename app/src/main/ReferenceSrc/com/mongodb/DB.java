package com.mongodb;

import com.edutech.json.KeyEnvironment;
import com.mongodb.Bytes;
import com.mongodb.util.Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.bson.BSONObject;
import org.jivesoftware.smackx.workgroup.packet.UserID;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class DB {
    private static final Set<String> _obedientCommands = new HashSet();
    private WriteConcern _concern;
    final Mongo _mongo;
    final String _name;
    final Bytes.OptionHolder _options;
    @Deprecated
    protected boolean _readOnly = false;
    private ReadPreference _readPref;
    private volatile CommandResult authenticationTestCommandResult;

    @Deprecated
    public abstract void cleanCursors(boolean z);

    abstract CommandResult doAuthenticate(MongoCredential mongoCredential);

    protected abstract DBCollection doGetCollection(String str);

    public abstract void requestDone();

    public abstract void requestEnsureConnection();

    public abstract void requestStart();

    static {
        _obedientCommands.add("group");
        _obedientCommands.add("aggregate");
        _obedientCommands.add("collstats");
        _obedientCommands.add("dbstats");
        _obedientCommands.add(KeyEnvironment.COUNT);
        _obedientCommands.add("distinct");
        _obedientCommands.add("geonear");
        _obedientCommands.add("geosearch");
        _obedientCommands.add("geowalk");
        _obedientCommands.add(ContainsSelector.CONTAINS_KEY);
        _obedientCommands.add("parallelcollectionscan");
    }

    public DB(Mongo mongo, String name) {
        if (!isValidName(name)) {
            throw new IllegalArgumentException("Invalid database name format. Database name is either empty or it contains spaces.");
        }
        this._mongo = mongo;
        this._name = name;
        this._options = new Bytes.OptionHolder(this._mongo._netOptions);
    }

    ReadPreference getCommandReadPreference(DBObject command, ReadPreference requestedPreference) {
        boolean primaryRequired = true;
        if (this._mongo.getReplicaSetStatus() != null) {
            String comString = command.keySet().iterator().next();
            if (comString.equals("getnonce") || comString.equals("authenticate")) {
                return ReadPreference.primaryPreferred();
            }
            if (comString.equals("mapreduce")) {
                Object out = command.get("out");
                if (out instanceof BSONObject) {
                    BSONObject outMap = (BSONObject) out;
                    if (outMap.get("inline") != null) {
                        primaryRequired = false;
                    }
                } else {
                    primaryRequired = true;
                }
            } else if (comString.equals("aggregate")) {
                List<DBObject> pipeline = (List) command.get("pipeline");
                if (pipeline.get(pipeline.size() - 1).get("$out") == null) {
                    primaryRequired = false;
                }
            } else if (_obedientCommands.contains(comString.toLowerCase())) {
                primaryRequired = false;
            }
            if (primaryRequired) {
                return ReadPreference.primary();
            }
            if (requestedPreference == null) {
                return ReadPreference.primary();
            }
            return requestedPreference;
        }
        return requestedPreference;
    }

    public DBCollection getCollection(String name) {
        DBCollection c = doGetCollection(name);
        return c;
    }

    public DBCollection createCollection(String name, DBObject options) {
        if (options != null) {
            DBObject createCmd = new BasicDBObject("create", name);
            createCmd.putAll(options);
            CommandResult result = command(createCmd);
            result.throwOnError();
        }
        return getCollection(name);
    }

    public DBCollection getCollectionFromString(String s) {
        DBCollection foo = null;
        int idx = s.indexOf(".");
        while (idx >= 0) {
            String b = s.substring(0, idx);
            s = s.substring(idx + 1);
            if (foo == null) {
                foo = getCollection(b);
            } else {
                foo = foo.getCollection(b);
            }
            idx = s.indexOf(".");
        }
        return foo != null ? foo.getCollection(s) : getCollection(s);
    }

    public CommandResult command(DBObject cmd) {
        return command(cmd, 0);
    }

    public CommandResult command(DBObject cmd, DBEncoder encoder) {
        return command(cmd, 0, encoder);
    }

    @Deprecated
    public CommandResult command(DBObject cmd, int options, DBEncoder encoder) {
        return command(cmd, options, getReadPreference(), encoder);
    }

    @Deprecated
    public CommandResult command(DBObject cmd, int options, ReadPreference readPreference) {
        return command(cmd, options, readPreference, DefaultDBEncoder.FACTORY.create());
    }

    @Deprecated
    public CommandResult command(DBObject cmd, int options, ReadPreference readPreference, DBEncoder encoder) {
        ReadPreference effectiveReadPrefs = getCommandReadPreference(cmd, readPreference);
        QueryResultIterator i = getCollection(MongoNamespace.COMMAND_COLLECTION_NAME).find(wrapCommand(cmd, effectiveReadPrefs), new BasicDBObject(), 0, -1, 0, options, effectiveReadPrefs, DefaultDBDecoder.FACTORY.create(), encoder);
        if (!i.hasNext()) {
            return null;
        }
        CommandResult cr = new CommandResult(i.getServerAddress());
        cr.putAll(i.next());
        return cr;
    }

    public CommandResult command(DBObject cmd, ReadPreference readPreference, DBEncoder encoder) {
        return command(cmd, 0, readPreference, encoder);
    }

    private DBObject wrapCommand(DBObject cmd, ReadPreference readPreference) {
        if (getMongo().isMongosConnection() && !ReadPreference.primary().equals(readPreference) && !ReadPreference.secondaryPreferred().equals(readPreference) && (cmd instanceof BasicDBObject)) {
            return new BasicDBObject("$query", cmd).append("$readPreference", (Object) readPreference.toDBObject());
        }
        return cmd;
    }

    @Deprecated
    public CommandResult command(DBObject cmd, int options) {
        return command(cmd, options, getReadPreference());
    }

    public CommandResult command(DBObject cmd, ReadPreference readPreference) {
        return command(cmd, 0, readPreference);
    }

    public CommandResult command(String cmd) {
        return command(new BasicDBObject(cmd, Boolean.TRUE));
    }

    @Deprecated
    public CommandResult command(String cmd, int options) {
        return command(new BasicDBObject(cmd, Boolean.TRUE), options);
    }

    public CommandResult command(String cmd, ReadPreference readPreference) {
        return command(new BasicDBObject(cmd, Boolean.TRUE), 0, readPreference);
    }

    public CommandResult doEval(String code, Object... args) {
        return command(BasicDBObjectBuilder.start().add("$eval", code).add("args", args).get());
    }

    public Object eval(String code, Object... args) {
        CommandResult res = doEval(code, args);
        res.throwOnError();
        return res.get("retval");
    }

    public CommandResult getStats() {
        CommandResult result = command("dbstats");
        result.throwOnError();
        return result;
    }

    public String getName() {
        return this._name;
    }

    @Deprecated
    public void setReadOnly(Boolean b) {
        this._readOnly = b.booleanValue();
    }

    public Set<String> getCollectionNames() {
        DBCollection namespaces = getCollection("system.namespaces");
        if (namespaces == null) {
            throw new RuntimeException("this is impossible");
        }
        Iterator<DBObject> i = namespaces.find(new BasicDBObject(), null, 0, 0, 0, getOptions(), getReadPreference(), null);
        if (i == null) {
            return new HashSet();
        }
        List<String> tables = new ArrayList<>();
        while (i.hasNext()) {
            DBObject o = i.next();
            if (o.get("name") == null) {
                throw new MongoException("how is name null : " + o);
            }
            String n = o.get("name").toString();
            int idx = n.indexOf(".");
            String root = n.substring(0, idx);
            if (root.equals(this._name) && n.indexOf("$") < 0) {
                String table = n.substring(idx + 1);
                tables.add(table);
            }
        }
        Collections.sort(tables);
        return new LinkedHashSet(tables);
    }

    public boolean collectionExists(String collectionName) {
        if (collectionName == null || "".equals(collectionName)) {
            return false;
        }
        Set<String> collections = getCollectionNames();
        if (collections.isEmpty()) {
            return false;
        }
        for (String collection : collections) {
            if (collectionName.equalsIgnoreCase(collection)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        return this._name;
    }

    @Deprecated
    public CommandResult getLastError() {
        return command(new BasicDBObject("getlasterror", 1));
    }

    @Deprecated
    public CommandResult getLastError(WriteConcern concern) {
        return command(concern.getCommand());
    }

    @Deprecated
    public CommandResult getLastError(int w, int wtimeout, boolean fsync) {
        return command(new WriteConcern(w, wtimeout, fsync).getCommand());
    }

    public void setWriteConcern(WriteConcern concern) {
        if (concern == null) {
            throw new IllegalArgumentException();
        }
        this._concern = concern;
    }

    public WriteConcern getWriteConcern() {
        return this._concern != null ? this._concern : this._mongo.getWriteConcern();
    }

    public void setReadPreference(ReadPreference preference) {
        this._readPref = preference;
    }

    public ReadPreference getReadPreference() {
        return this._readPref != null ? this._readPref : this._mongo.getReadPreference();
    }

    public void dropDatabase() {
        CommandResult res = command(new BasicDBObject("dropDatabase", 1));
        res.throwOnError();
        this._mongo._dbs.remove(getName());
    }

    @Deprecated
    public boolean isAuthenticated() {
        return getAuthenticationCredentials() != null;
    }

    @Deprecated
    public boolean authenticate(String username, char[] password) {
        return authenticateCommandHelper(username, password).failure == null;
    }

    @Deprecated
    public synchronized CommandResult authenticateCommand(String username, char[] password) {
        CommandResultPair commandResultPair;
        commandResultPair = authenticateCommandHelper(username, password);
        if (commandResultPair.failure != null) {
            throw commandResultPair.failure;
        }
        return commandResultPair.result;
    }

    private CommandResultPair authenticateCommandHelper(String username, char[] password) {
        MongoCredential credentials = MongoCredential.createMongoCRCredential(username, getName(), password);
        if (getAuthenticationCredentials() != null) {
            if (getAuthenticationCredentials().equals(credentials)) {
                if (this.authenticationTestCommandResult != null) {
                    return new CommandResultPair(this.authenticationTestCommandResult);
                }
            } else {
                throw new IllegalStateException("can't authenticate twice on the same database");
            }
        }
        try {
            this.authenticationTestCommandResult = doAuthenticate(credentials);
            return new CommandResultPair(this.authenticationTestCommandResult);
        } catch (CommandFailureException commandFailureException) {
            return new CommandResultPair(commandFailureException);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class CommandResultPair {
        CommandFailureException failure;
        CommandResult result;

        public CommandResultPair(CommandResult result) {
            DB.this = r1;
            this.result = result;
        }

        public CommandResultPair(CommandFailureException failure) {
            DB.this = r1;
            this.failure = failure;
        }
    }

    @Deprecated
    public WriteResult addUser(String username, char[] passwd) {
        return addUser(username, passwd, false);
    }

    @Deprecated
    public WriteResult addUser(String username, char[] passwd, boolean readOnly) {
        DBCollection c = getCollection("system.users");
        DBObject o = c.findOne((DBObject) new BasicDBObject(UserID.ELEMENT_NAME, username));
        if (o == null) {
            o = new BasicDBObject(UserID.ELEMENT_NAME, username);
        }
        o.put("pwd", _hash(username, passwd));
        o.put("readOnly", Boolean.valueOf(readOnly));
        return c.save(o);
    }

    @Deprecated
    public WriteResult removeUser(String username) {
        DBCollection c = getCollection("system.users");
        return c.remove(new BasicDBObject(UserID.ELEMENT_NAME, username));
    }

    public String _hash(String username, char[] passwd) {
        ByteArrayOutputStream bout = new ByteArrayOutputStream(username.length() + 20 + passwd.length);
        try {
            bout.write(username.getBytes());
            bout.write(":mongo:".getBytes());
            for (int i = 0; i < passwd.length; i++) {
                if (passwd[i] >= 128) {
                    throw new IllegalArgumentException("can't handle non-ascii passwords yet");
                }
                bout.write((byte) passwd[i]);
            }
            return Util.hexMD5(bout.toByteArray());
        } catch (IOException ioe) {
            throw new RuntimeException("impossible", ioe);
        }
    }

    @Deprecated
    public CommandResult getPreviousError() {
        return command(new BasicDBObject("getpreverror", 1));
    }

    @Deprecated
    public void resetError() {
        command(new BasicDBObject("reseterror", 1));
    }

    @Deprecated
    public void forceError() {
        command(new BasicDBObject("forceerror", 1));
    }

    public Mongo getMongo() {
        return this._mongo;
    }

    public DB getSisterDB(String name) {
        return this._mongo.getDB(name);
    }

    @Deprecated
    public void slaveOk() {
        addOption(4);
    }

    public void addOption(int option) {
        this._options.add(option);
    }

    public void setOptions(int options) {
        this._options.set(options);
    }

    public void resetOptions() {
        this._options.reset();
    }

    public int getOptions() {
        return this._options.get();
    }

    private boolean isValidName(String dbname) {
        return dbname.length() != 0 && !dbname.contains(" ");
    }

    MongoCredential getAuthenticationCredentials() {
        return getMongo().getAuthority().getCredentialsStore().get(getName());
    }
}
