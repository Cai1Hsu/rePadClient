package com.mongodb;

import com.edutech.json.KeyEnvironment;
import com.mongodb.AggregationOptions;
import com.mongodb.Bytes;
import com.mongodb.MapReduceCommand;
import com.mongodb.ReflectionDBObject;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.bson.types.ObjectId;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.dex */
public abstract class DBCollection {
    final DB _db;
    private DBDecoderFactory _decoderFactory;
    private DBEncoderFactory _encoderFactory;
    @Deprecated
    protected final String _fullName;
    @Deprecated
    protected List<DBObject> _hintFields;
    @Deprecated
    protected final String _name;
    final Bytes.OptionHolder _options;
    private WriteConcern _concern = null;
    private ReadPreference _readPref = null;
    @Deprecated
    protected Class _objectClass = null;
    private Map<String, Class> _internalClass = Collections.synchronizedMap(new HashMap());
    private ReflectionDBObject.JavaWrapper _wrapper = null;
    @Deprecated
    private final Set<String> _createdIndexes = new HashSet();

    public abstract Cursor aggregate(List<DBObject> list, AggregationOptions aggregationOptions, ReadPreference readPreference);

    @Deprecated
    public abstract void createIndex(DBObject dBObject, DBObject dBObject2, DBEncoder dBEncoder);

    protected abstract void doapply(DBObject dBObject);

    abstract BulkWriteResult executeBulkWriteOperation(boolean z, List<WriteRequest> list, WriteConcern writeConcern, DBEncoder dBEncoder);

    abstract QueryResultIterator find(DBObject dBObject, DBObject dBObject2, int i, int i2, int i3, int i4, ReadPreference readPreference, DBDecoder dBDecoder);

    abstract QueryResultIterator find(DBObject dBObject, DBObject dBObject2, int i, int i2, int i3, int i4, ReadPreference readPreference, DBDecoder dBDecoder, DBEncoder dBEncoder);

    public abstract WriteResult insert(List<DBObject> list, WriteConcern writeConcern, DBEncoder dBEncoder);

    public abstract List<Cursor> parallelScan(ParallelScanOptions parallelScanOptions);

    public abstract WriteResult remove(DBObject dBObject, WriteConcern writeConcern, DBEncoder dBEncoder);

    public abstract WriteResult update(DBObject dBObject, DBObject dBObject2, boolean z, boolean z2, WriteConcern writeConcern, DBEncoder dBEncoder);

    public WriteResult insert(DBObject[] arr, WriteConcern concern) {
        return insert(arr, concern, getDBEncoder());
    }

    public WriteResult insert(DBObject[] arr, WriteConcern concern, DBEncoder encoder) {
        return insert(Arrays.asList(arr), concern, encoder);
    }

    public WriteResult insert(DBObject o, WriteConcern concern) {
        return insert(Arrays.asList(o), concern);
    }

    public WriteResult insert(DBObject... arr) {
        return insert(arr, getWriteConcern());
    }

    public WriteResult insert(WriteConcern concern, DBObject... arr) {
        return insert(arr, concern);
    }

    public WriteResult insert(List<DBObject> list) {
        return insert(list, getWriteConcern());
    }

    public WriteResult insert(List<DBObject> list, WriteConcern concern) {
        return insert(list, concern, getDBEncoder());
    }

    public WriteResult update(DBObject q, DBObject o, boolean upsert, boolean multi, WriteConcern concern) {
        return update(q, o, upsert, multi, concern, getDBEncoder());
    }

    public WriteResult update(DBObject q, DBObject o, boolean upsert, boolean multi) {
        return update(q, o, upsert, multi, getWriteConcern());
    }

    public WriteResult update(DBObject q, DBObject o) {
        return update(q, o, false, false);
    }

    public WriteResult updateMulti(DBObject q, DBObject o) {
        return update(q, o, false, true);
    }

    public WriteResult remove(DBObject o, WriteConcern concern) {
        return remove(o, concern, getDBEncoder());
    }

    public WriteResult remove(DBObject o) {
        return remove(o, getWriteConcern());
    }

    @Deprecated
    public DBCursor find(DBObject query, DBObject fields, int numToSkip, int batchSize, int options) {
        return find(query, fields, numToSkip, batchSize).addOption(options);
    }

    @Deprecated
    public DBCursor find(DBObject query, DBObject fields, int numToSkip, int batchSize) {
        DBCursor cursor = find(query, fields).skip(numToSkip).batchSize(batchSize);
        return cursor;
    }

    public DBObject findOne(Object obj) {
        return findOne(obj, (DBObject) null);
    }

    public DBObject findOne(Object obj, DBObject fields) {
        return findOne((DBObject) new BasicDBObject("_id", obj), fields);
    }

    public DBObject findAndModify(DBObject query, DBObject fields, DBObject sort, boolean remove, DBObject update, boolean returnNew, boolean upsert) {
        return findAndModify(query, fields, sort, remove, update, returnNew, upsert, 0L, TimeUnit.MILLISECONDS);
    }

    public DBObject findAndModify(DBObject query, DBObject fields, DBObject sort, boolean remove, DBObject update, boolean returnNew, boolean upsert, long maxTime, TimeUnit maxTimeUnit) {
        BasicDBObject cmd = new BasicDBObject("findandmodify", this._name);
        if (query != null && !query.keySet().isEmpty()) {
            cmd.append(STUN.ELEMENT_NAME, (Object) query);
        }
        if (fields != null && !fields.keySet().isEmpty()) {
            cmd.append("fields", (Object) fields);
        }
        if (sort != null && !sort.keySet().isEmpty()) {
            cmd.append("sort", (Object) sort);
        }
        if (maxTime > 0) {
            cmd.append("maxTimeMS", (Object) Long.valueOf(TimeUnit.MILLISECONDS.convert(maxTime, maxTimeUnit)));
        }
        if (remove) {
            cmd.append(DiscoverItems.Item.REMOVE_ACTION, (Object) Boolean.valueOf(remove));
        } else {
            if (update != null && !update.keySet().isEmpty()) {
                String key = update.keySet().iterator().next();
                if (key.charAt(0) != '$') {
                    _checkObject(update, false, false);
                }
                cmd.append("update", (Object) update);
            }
            if (returnNew) {
                cmd.append("new", (Object) Boolean.valueOf(returnNew));
            }
            if (upsert) {
                cmd.append("upsert", (Object) Boolean.valueOf(upsert));
            }
        }
        if (remove && update != null && !update.keySet().isEmpty() && !returnNew) {
            throw new MongoException("FindAndModify: Remove cannot be mixed with the Update, or returnNew params!");
        }
        CommandResult res = this._db.command(cmd);
        if (res.ok() || res.getErrorMessage().equals("No matching object found")) {
            return replaceWithObjectClass((DBObject) res.get(SizeSelector.SIZE_KEY));
        }
        res.throwOnError();
        return null;
    }

    private DBObject replaceWithObjectClass(DBObject oldObj) {
        if (oldObj != null) {
            if (!((getObjectClass() == null) & this._internalClass.isEmpty())) {
                DBObject newObj = instantiateObjectClassInstance();
                for (String key : oldObj.keySet()) {
                    newObj.put(key, oldObj.get(key));
                }
                return newObj;
            }
        }
        return oldObj;
    }

    private DBObject instantiateObjectClassInstance() {
        try {
            return (DBObject) getObjectClass().newInstance();
        } catch (IllegalAccessException e) {
            throw new MongoInternalException("can't create instance of type " + getObjectClass(), e);
        } catch (InstantiationException e2) {
            throw new MongoInternalException("can't create instance of type " + getObjectClass(), e2);
        }
    }

    public DBObject findAndModify(DBObject query, DBObject sort, DBObject update) {
        return findAndModify(query, null, sort, false, update, false, false);
    }

    public DBObject findAndModify(DBObject query, DBObject update) {
        return findAndModify(query, null, null, false, update, false, false);
    }

    public DBObject findAndRemove(DBObject query) {
        return findAndModify(query, null, null, true, null, false, false);
    }

    public void createIndex(DBObject keys) {
        createIndex(keys, defaultOptions(keys));
    }

    public void createIndex(DBObject keys, DBObject options) {
        createIndex(keys, options, getDBEncoder());
    }

    @Deprecated
    public void ensureIndex(String name) {
        ensureIndex(new BasicDBObject(name, 1));
    }

    @Deprecated
    public void ensureIndex(DBObject keys) {
        ensureIndex(keys, defaultOptions(keys));
    }

    @Deprecated
    public void ensureIndex(DBObject keys, String name) {
        ensureIndex(keys, name, false);
    }

    @Deprecated
    public void ensureIndex(DBObject keys, String name, boolean unique) {
        DBObject options = defaultOptions(keys);
        if (name != null && name.length() > 0) {
            options.put("name", name);
        }
        if (unique) {
            options.put("unique", Boolean.TRUE);
        }
        ensureIndex(keys, options);
    }

    @Deprecated
    public void ensureIndex(DBObject keys, DBObject optionsIN) {
        if (!checkReadOnly(false)) {
            DBObject options = defaultOptions(keys);
            for (String k : optionsIN.keySet()) {
                options.put(k, optionsIN.get(k));
            }
            String name = options.get("name").toString();
            if (!this._createdIndexes.contains(name)) {
                createIndex(keys, options);
                this._createdIndexes.add(name);
            }
        }
    }

    @Deprecated
    public void resetIndexCache() {
        this._createdIndexes.clear();
    }

    DBObject defaultOptions(DBObject keys) {
        DBObject o = new BasicDBObject();
        o.put("name", genIndexName(keys));
        o.put("ns", this._fullName);
        return o;
    }

    @Deprecated
    public static String genIndexName(DBObject keys) {
        StringBuilder name = new StringBuilder();
        for (String s : keys.keySet()) {
            if (name.length() > 0) {
                name.append('_');
            }
            name.append(s).append('_');
            Object val = keys.get(s);
            if ((val instanceof Number) || (val instanceof String)) {
                name.append(val.toString().replace(' ', '_'));
            }
        }
        return name.toString();
    }

    public void setHintFields(List<DBObject> lst) {
        this._hintFields = lst;
    }

    protected List<DBObject> getHintFields() {
        return this._hintFields;
    }

    public DBCursor find(DBObject ref) {
        return new DBCursor(this, ref, null, getReadPreference());
    }

    public DBCursor find(DBObject ref, DBObject keys) {
        return new DBCursor(this, ref, keys, getReadPreference());
    }

    public DBCursor find() {
        return new DBCursor(this, null, null, getReadPreference());
    }

    public DBObject findOne() {
        return findOne((DBObject) new BasicDBObject());
    }

    public DBObject findOne(DBObject o) {
        return findOne(o, null, null, getReadPreference());
    }

    public DBObject findOne(DBObject o, DBObject fields) {
        return findOne(o, fields, null, getReadPreference());
    }

    public DBObject findOne(DBObject o, DBObject fields, DBObject orderBy) {
        return findOne(o, fields, orderBy, getReadPreference());
    }

    public DBObject findOne(DBObject o, DBObject fields, ReadPreference readPref) {
        return findOne(o, fields, null, readPref);
    }

    public DBObject findOne(DBObject o, DBObject fields, DBObject orderBy, ReadPreference readPref) {
        return findOne(o, fields, orderBy, readPref, 0L, TimeUnit.MILLISECONDS);
    }

    DBObject findOne(DBObject o, DBObject fields, DBObject orderBy, ReadPreference readPref, long maxTime, TimeUnit maxTimeUnit) {
        QueryOpBuilder queryOpBuilder = new QueryOpBuilder().addQuery(o).addOrderBy(orderBy).addMaxTimeMS(TimeUnit.MILLISECONDS.convert(maxTime, maxTimeUnit));
        if (getDB().getMongo().isMongosConnection()) {
            queryOpBuilder.addReadPreference(readPref);
        }
        Iterator<DBObject> i = find(queryOpBuilder.get(), fields, 0, -1, 0, getOptions(), readPref, getDecoder());
        DBObject obj = i.hasNext() ? i.next() : null;
        if (obj != null && fields != null && fields.keySet().size() > 0) {
            obj.markAsPartialObject();
        }
        return obj;
    }

    DBDecoder getDecoder() {
        if (getDBDecoderFactory() != null) {
            return getDBDecoderFactory().create();
        }
        return null;
    }

    private DBEncoder getDBEncoder() {
        if (getDBEncoderFactory() != null) {
            return getDBEncoderFactory().create();
        }
        return null;
    }

    public Object apply(DBObject o) {
        return apply(o, true);
    }

    public Object apply(DBObject jo, boolean ensureID) {
        Object id = jo.get("_id");
        if (ensureID && id == null) {
            id = ObjectId.get();
            jo.put("_id", id);
        }
        doapply(jo);
        return id;
    }

    public WriteResult save(DBObject jo) {
        return save(jo, getWriteConcern());
    }

    public WriteResult save(DBObject jo, WriteConcern concern) {
        if (checkReadOnly(true)) {
            return null;
        }
        _checkObject(jo, false, false);
        Object id = jo.get("_id");
        if (id == null || ((id instanceof ObjectId) && ((ObjectId) id).isNew())) {
            if (id != null) {
                ((ObjectId) id).notNew();
            }
            return concern == null ? insert(jo) : insert(jo, concern);
        }
        DBObject q = new BasicDBObject();
        q.put("_id", id);
        if (concern == null) {
            return update(q, jo, true, false);
        }
        return update(q, jo, true, false, concern);
    }

    public void dropIndexes() {
        dropIndexes("*");
    }

    public void dropIndexes(String name) {
        DBObject cmd = BasicDBObjectBuilder.start().add("deleteIndexes", getName()).add("index", name).get();
        resetIndexCache();
        CommandResult res = this._db.command(cmd);
        if (!res.ok() && !res.getErrorMessage().equals("ns not found")) {
            res.throwOnError();
        }
    }

    public void drop() {
        resetIndexCache();
        CommandResult res = this._db.command(BasicDBObjectBuilder.start().add("drop", getName()).get());
        if (!res.ok() && !res.getErrorMessage().equals("ns not found")) {
            res.throwOnError();
        }
    }

    public long count() {
        return getCount(new BasicDBObject(), null);
    }

    public long count(DBObject query) {
        return getCount(query, null);
    }

    public long count(DBObject query, ReadPreference readPrefs) {
        return getCount(query, null, readPrefs);
    }

    public long getCount() {
        return getCount(new BasicDBObject(), null);
    }

    public long getCount(ReadPreference readPrefs) {
        return getCount(new BasicDBObject(), null, readPrefs);
    }

    public long getCount(DBObject query) {
        return getCount(query, null);
    }

    public long getCount(DBObject query, DBObject fields) {
        return getCount(query, fields, 0L, 0L);
    }

    public long getCount(DBObject query, DBObject fields, ReadPreference readPrefs) {
        return getCount(query, fields, 0L, 0L, readPrefs);
    }

    public long getCount(DBObject query, DBObject fields, long limit, long skip) {
        return getCount(query, fields, limit, skip, getReadPreference());
    }

    public long getCount(DBObject query, DBObject fields, long limit, long skip, ReadPreference readPrefs) {
        return getCount(query, fields, limit, skip, readPrefs, 0L, TimeUnit.MILLISECONDS);
    }

    long getCount(DBObject query, DBObject fields, long limit, long skip, ReadPreference readPrefs, long maxTime, TimeUnit maxTimeUnit) {
        BasicDBObject cmd = new BasicDBObject();
        cmd.put(KeyEnvironment.COUNT, (Object) getName());
        cmd.put(STUN.ELEMENT_NAME, (Object) query);
        if (fields != null) {
            cmd.put("fields", (Object) fields);
        }
        if (limit > 0) {
            cmd.put("limit", (Object) Long.valueOf(limit));
        }
        if (skip > 0) {
            cmd.put(MSVSSConstants.WRITABLE_SKIP, (Object) Long.valueOf(skip));
        }
        if (maxTime > 0) {
            cmd.put("maxTimeMS", (Object) Long.valueOf(TimeUnit.MILLISECONDS.convert(maxTime, maxTimeUnit)));
        }
        CommandResult res = this._db.command(cmd, getOptions(), readPrefs);
        if (!res.ok()) {
            String errmsg = res.getErrorMessage();
            if (errmsg.equals("ns does not exist") || errmsg.equals("ns missing")) {
                return 0L;
            }
            res.throwOnError();
        }
        return res.getLong("n");
    }

    CommandResult command(DBObject cmd, int options, ReadPreference readPrefs) {
        return this._db.command(cmd, getOptions(), readPrefs);
    }

    public DBCollection rename(String newName) {
        return rename(newName, false);
    }

    public DBCollection rename(String newName, boolean dropTarget) {
        CommandResult ret = this._db.getSisterDB("admin").command(BasicDBObjectBuilder.start().add("renameCollection", this._fullName).add("to", this._db._name + "." + newName).add("dropTarget", Boolean.valueOf(dropTarget)).get());
        ret.throwOnError();
        resetIndexCache();
        return this._db.getCollection(newName);
    }

    public DBObject group(DBObject key, DBObject cond, DBObject initial, String reduce) {
        return group(key, cond, initial, reduce, null);
    }

    public DBObject group(DBObject key, DBObject cond, DBObject initial, String reduce, String finalize) {
        GroupCommand cmd = new GroupCommand(this, key, cond, initial, reduce, finalize);
        return group(cmd);
    }

    public DBObject group(DBObject key, DBObject cond, DBObject initial, String reduce, String finalize, ReadPreference readPrefs) {
        GroupCommand cmd = new GroupCommand(this, key, cond, initial, reduce, finalize);
        return group(cmd, readPrefs);
    }

    public DBObject group(GroupCommand cmd) {
        return group(cmd, getReadPreference());
    }

    public DBObject group(GroupCommand cmd, ReadPreference readPrefs) {
        CommandResult res = this._db.command(cmd.toDBObject(), getOptions(), readPrefs);
        res.throwOnError();
        return (DBObject) res.get("retval");
    }

    @Deprecated
    public DBObject group(DBObject args) {
        args.put("ns", getName());
        CommandResult res = this._db.command(new BasicDBObject("group", args), getOptions(), getReadPreference());
        res.throwOnError();
        return (DBObject) res.get("retval");
    }

    public List distinct(String key) {
        return distinct(key, new BasicDBObject());
    }

    public List distinct(String key, ReadPreference readPrefs) {
        return distinct(key, new BasicDBObject(), readPrefs);
    }

    public List distinct(String key, DBObject query) {
        return distinct(key, query, getReadPreference());
    }

    public List distinct(String key, DBObject query, ReadPreference readPrefs) {
        DBObject c = BasicDBObjectBuilder.start().add("distinct", getName()).add("key", key).add(STUN.ELEMENT_NAME, query).get();
        CommandResult res = this._db.command(c, getOptions(), readPrefs);
        res.throwOnError();
        return (List) res.get("values");
    }

    public MapReduceOutput mapReduce(String map, String reduce, String outputTarget, DBObject query) {
        return mapReduce(new MapReduceCommand(this, map, reduce, outputTarget, MapReduceCommand.OutputType.REPLACE, query));
    }

    public MapReduceOutput mapReduce(String map, String reduce, String outputTarget, MapReduceCommand.OutputType outputType, DBObject query) {
        return mapReduce(new MapReduceCommand(this, map, reduce, outputTarget, outputType, query));
    }

    public MapReduceOutput mapReduce(String map, String reduce, String outputTarget, MapReduceCommand.OutputType outputType, DBObject query, ReadPreference readPrefs) {
        MapReduceCommand command = new MapReduceCommand(this, map, reduce, outputTarget, outputType, query);
        command.setReadPreference(readPrefs);
        return mapReduce(command);
    }

    public MapReduceOutput mapReduce(MapReduceCommand command) {
        DBObject cmd = command.toDBObject();
        CommandResult res = this._db.command(cmd, getOptions(), command.getReadPreference() != null ? command.getReadPreference() : getReadPreference());
        res.throwOnError();
        return new MapReduceOutput(this, cmd, res);
    }

    @Deprecated
    public MapReduceOutput mapReduce(DBObject command) {
        if (command.get("mapreduce") == null && command.get("mapReduce") == null) {
            throw new IllegalArgumentException("need mapreduce arg");
        }
        CommandResult res = this._db.command(command, getOptions(), getReadPreference());
        res.throwOnError();
        return new MapReduceOutput(this, command, res);
    }

    @Deprecated
    public AggregationOutput aggregate(DBObject firstOp, DBObject... additionalOps) {
        List<DBObject> pipeline = new ArrayList<>();
        pipeline.add(firstOp);
        Collections.addAll(pipeline, additionalOps);
        return aggregate(pipeline);
    }

    public AggregationOutput aggregate(List<DBObject> pipeline) {
        return aggregate(pipeline, getReadPreference());
    }

    public AggregationOutput aggregate(List<DBObject> pipeline, ReadPreference readPreference) {
        AggregationOptions options = AggregationOptions.builder().outputMode(AggregationOptions.OutputMode.INLINE).build();
        DBObject command = prepareCommand(pipeline, options);
        CommandResult res = this._db.command(command, getOptions(), readPreference);
        res.throwOnError();
        return new AggregationOutput(command, res);
    }

    public Cursor aggregate(List<DBObject> pipeline, AggregationOptions options) {
        return aggregate(pipeline, options, getReadPreference());
    }

    public CommandResult explainAggregate(List<DBObject> pipeline, AggregationOptions options) {
        DBObject command = prepareCommand(pipeline, options);
        command.put("explain", true);
        CommandResult res = this._db.command(command, getOptions(), getReadPreference());
        res.throwOnError();
        return res;
    }

    public BulkWriteOperation initializeOrderedBulkOperation() {
        return new BulkWriteOperation(true, this);
    }

    public BulkWriteOperation initializeUnorderedBulkOperation() {
        return new BulkWriteOperation(false, this);
    }

    BulkWriteResult executeBulkWriteOperation(boolean ordered, List<WriteRequest> requests) {
        return executeBulkWriteOperation(ordered, requests, getWriteConcern());
    }

    BulkWriteResult executeBulkWriteOperation(boolean ordered, List<WriteRequest> requests, WriteConcern writeConcern) {
        return executeBulkWriteOperation(ordered, requests, writeConcern, getDBEncoder());
    }

    DBObject prepareCommand(List<DBObject> pipeline, AggregationOptions options) {
        if (pipeline.isEmpty()) {
            throw new MongoException("Aggregation pipelines can not be empty");
        }
        DBObject command = new BasicDBObject("aggregate", getName());
        command.put("pipeline", pipeline);
        if (options.getOutputMode() == AggregationOptions.OutputMode.CURSOR) {
            BasicDBObject cursor = new BasicDBObject();
            if (options.getBatchSize() != null) {
                cursor.put("batchSize", (Object) options.getBatchSize());
            }
            command.put("cursor", cursor);
        }
        if (options.getMaxTime(TimeUnit.MILLISECONDS) > 0) {
            command.put("maxTimeMS", Long.valueOf(options.getMaxTime(TimeUnit.MILLISECONDS)));
        }
        if (options.getAllowDiskUse() != null) {
            command.put("allowDiskUse", options.getAllowDiskUse());
        }
        return command;
    }

    public List<DBObject> getIndexInfo() {
        BasicDBObject cmd = new BasicDBObject();
        cmd.put("ns", (Object) getFullName());
        DBCursor cur = this._db.getCollection("system.indexes").find(cmd);
        List<DBObject> list = new ArrayList<>();
        while (cur.hasNext()) {
            list.add(cur.next());
        }
        return list;
    }

    public void dropIndex(DBObject keys) {
        dropIndexes(genIndexName(keys));
    }

    public void dropIndex(String name) {
        dropIndexes(name);
    }

    public CommandResult getStats() {
        return getDB().command(new BasicDBObject("collstats", getName()), getOptions(), getReadPreference());
    }

    public boolean isCapped() {
        CommandResult stats = getStats();
        Object capped = stats.get("capped");
        return capped != null && (capped.equals(1) || capped.equals(true));
    }

    protected DBCollection(DB base, String name) {
        this._db = base;
        this._name = name;
        this._fullName = this._db.getName() + "." + name;
        this._options = new Bytes.OptionHolder(this._db._options);
    }

    @Deprecated
    protected DBObject _checkObject(DBObject o, boolean canBeNull, boolean query) {
        if (o == null) {
            if (canBeNull) {
                return null;
            }
            throw new IllegalArgumentException("can't be null");
        } else if (o.isPartialObject() && !query) {
            throw new IllegalArgumentException("can't save partial objects");
        } else {
            if (!query) {
                _checkKeys(o);
                return o;
            }
            return o;
        }
    }

    private void _checkKeys(DBObject o) {
        if (!(o instanceof LazyDBObject) && !(o instanceof LazyDBList)) {
            for (String s : o.keySet()) {
                validateKey(s);
                _checkValue(o.get(s));
            }
        }
    }

    private void _checkKeys(Map<String, Object> o) {
        for (Map.Entry<String, Object> cur : o.entrySet()) {
            validateKey(cur.getKey());
            _checkValue(cur.getValue());
        }
    }

    private void _checkValues(List list) {
        for (Object cur : list) {
            _checkValue(cur);
        }
    }

    private void _checkValue(Object value) {
        if (value instanceof DBObject) {
            _checkKeys((DBObject) value);
        } else if (value instanceof Map) {
            _checkKeys((Map) value);
        } else if (value instanceof List) {
            _checkValues((List) value);
        }
    }

    private void validateKey(String s) {
        if (s.contains("\u0000")) {
            throw new IllegalArgumentException("Document field names can't have a NULL character. (Bad Key: '" + s + "')");
        }
        if (s.contains(".")) {
            throw new IllegalArgumentException("Document field names can't have a . in them. (Bad Key: '" + s + "')");
        }
        if (s.startsWith("$")) {
            throw new IllegalArgumentException("Document field names can't start with '$' (Bad Key: '" + s + "')");
        }
    }

    public DBCollection getCollection(String n) {
        return this._db.getCollection(this._name + "." + n);
    }

    public String getName() {
        return this._name;
    }

    public String getFullName() {
        return this._fullName;
    }

    public DB getDB() {
        return this._db;
    }

    @Deprecated
    protected boolean checkReadOnly(boolean strict) {
        if (!this._db._readOnly) {
            return false;
        }
        if (!strict) {
            return true;
        }
        throw new IllegalStateException("db is read only");
    }

    public int hashCode() {
        return this._fullName.hashCode();
    }

    public boolean equals(Object o) {
        return o == this;
    }

    public String toString() {
        return this._name;
    }

    public void setObjectClass(Class c) {
        if (c == null) {
            this._wrapper = null;
            this._objectClass = null;
        } else if (!DBObject.class.isAssignableFrom(c)) {
            throw new IllegalArgumentException(c.getName() + " is not a DBObject");
        } else {
            this._objectClass = c;
            if (ReflectionDBObject.class.isAssignableFrom(c)) {
                this._wrapper = ReflectionDBObject.getWrapper(c);
            } else {
                this._wrapper = null;
            }
        }
    }

    public Class getObjectClass() {
        return this._objectClass;
    }

    public void setInternalClass(String path, Class c) {
        this._internalClass.put(path, c);
    }

    protected Class getInternalClass(String path) {
        Class c = this._internalClass.get(path);
        if (c == null) {
            if (this._wrapper == null) {
                return null;
            }
            return this._wrapper.getInternalClass(path);
        }
        return c;
    }

    public void setWriteConcern(WriteConcern concern) {
        this._concern = concern;
    }

    public WriteConcern getWriteConcern() {
        return this._concern != null ? this._concern : this._db.getWriteConcern();
    }

    public void setReadPreference(ReadPreference preference) {
        this._readPref = preference;
    }

    public ReadPreference getReadPreference() {
        return this._readPref != null ? this._readPref : this._db.getReadPreference();
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

    public synchronized void setDBDecoderFactory(DBDecoderFactory fact) {
        this._decoderFactory = fact;
    }

    public synchronized DBDecoderFactory getDBDecoderFactory() {
        return this._decoderFactory;
    }

    public synchronized void setDBEncoderFactory(DBEncoderFactory fact) {
        this._encoderFactory = fact;
    }

    public synchronized DBEncoderFactory getDBEncoderFactory() {
        return this._encoderFactory;
    }
}
