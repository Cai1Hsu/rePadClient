package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import org.apache.tools.ant.taskdefs.Execute;
import org.bson.util.annotations.NotThreadSafe;

@NotThreadSafe
/* loaded from: classes.dex */
public class DBCursor implements Cursor, Iterable<DBObject> {
    private final DBCollection _collection;
    private DBDecoderFactory _decoderFact;
    private final DBObject _keysWanted;
    private long _maxTimeMS;
    private int _options;
    private final DBObject _query;
    private ReadPreference _readPref;
    private DBObject _specialFields;
    private DBObject _orderBy = null;
    private String _hint = null;
    private DBObject _hintDBObj = null;
    private boolean _explain = false;
    private int _limit = 0;
    private int _batchSize = 0;
    private int _skip = 0;
    private boolean _snapshot = false;
    private QueryResultIterator _it = null;
    private CursorType _cursorType = null;
    private DBObject _cur = null;
    private int _num = 0;
    private final ArrayList<DBObject> _all = new ArrayList<>();

    /* loaded from: classes.dex */
    enum CursorType {
        ITERATOR,
        ARRAY
    }

    public DBCursor(DBCollection collection, DBObject q, DBObject k, ReadPreference preference) {
        this._options = 0;
        if (collection == null) {
            throw new IllegalArgumentException("collection is null");
        }
        this._collection = collection;
        this._query = q == null ? new BasicDBObject() : q;
        this._keysWanted = k;
        this._options = this._collection.getOptions();
        this._readPref = preference;
        this._decoderFact = collection.getDBDecoderFactory();
    }

    public DBCursor comment(String comment) {
        addSpecial(QueryOperators.COMMENT, comment);
        return this;
    }

    public DBCursor maxScan(int max) {
        addSpecial(QueryOperators.MAX_SCAN, Integer.valueOf(max));
        return this;
    }

    public DBCursor max(DBObject max) {
        addSpecial(QueryOperators.MAX, max);
        return this;
    }

    public DBCursor min(DBObject min) {
        addSpecial(QueryOperators.MIN, min);
        return this;
    }

    public DBCursor returnKey() {
        addSpecial(QueryOperators.RETURN_KEY, true);
        return this;
    }

    public DBCursor showDiskLoc() {
        addSpecial(QueryOperators.SHOW_DISK_LOC, true);
        return this;
    }

    public DBCursor copy() {
        DBCursor c = new DBCursor(this._collection, this._query, this._keysWanted, this._readPref);
        c._orderBy = this._orderBy;
        c._hint = this._hint;
        c._hintDBObj = this._hintDBObj;
        c._limit = this._limit;
        c._skip = this._skip;
        c._options = this._options;
        c._batchSize = this._batchSize;
        c._snapshot = this._snapshot;
        c._explain = this._explain;
        c._maxTimeMS = this._maxTimeMS;
        if (this._specialFields != null) {
            c._specialFields = new BasicDBObject(this._specialFields.toMap());
        }
        return c;
    }

    @Override // java.lang.Iterable
    public Iterator<DBObject> iterator() {
        return copy();
    }

    public DBCursor sort(DBObject orderBy) {
        if (this._it != null) {
            throw new IllegalStateException("can't sort after executing query");
        }
        this._orderBy = orderBy;
        return this;
    }

    public DBCursor addSpecial(String name, Object o) {
        if (this._specialFields == null) {
            this._specialFields = new BasicDBObject();
        }
        this._specialFields.put(name, o);
        return this;
    }

    public DBCursor hint(DBObject indexKeys) {
        if (this._it != null) {
            throw new IllegalStateException("can't hint after executing query");
        }
        this._hintDBObj = indexKeys;
        return this;
    }

    public DBCursor hint(String indexName) {
        if (this._it != null) {
            throw new IllegalStateException("can't hint after executing query");
        }
        this._hint = indexName;
        return this;
    }

    public DBCursor maxTime(long maxTime, TimeUnit timeUnit) {
        this._maxTimeMS = TimeUnit.MILLISECONDS.convert(maxTime, timeUnit);
        return this;
    }

    public DBCursor snapshot() {
        if (this._it != null) {
            throw new IllegalStateException("can't snapshot after executing the query");
        }
        this._snapshot = true;
        return this;
    }

    public DBObject explain() {
        DBCursor c = copy();
        c._explain = true;
        if (c._limit > 0) {
            c._batchSize = c._limit * (-1);
            c._limit = 0;
        }
        return c.next();
    }

    public DBCursor limit(int n) {
        if (this._it != null) {
            throw new IllegalStateException("can't set limit after executing query");
        }
        if (n > 0) {
            this._limit = n;
        } else if (n < 0) {
            batchSize(n);
        }
        return this;
    }

    public DBCursor batchSize(int n) {
        if (n == 1) {
            n = 2;
        }
        if (this._it != null) {
            this._it.setBatchSize(n);
        }
        this._batchSize = n;
        return this;
    }

    public DBCursor skip(int n) {
        if (this._it != null) {
            throw new IllegalStateException("can't set skip after executing query");
        }
        this._skip = n;
        return this;
    }

    @Override // com.mongodb.Cursor
    public long getCursorId() {
        if (this._it == null) {
            return 0L;
        }
        return this._it.getCursorId();
    }

    @Override // com.mongodb.Cursor, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this._it != null) {
            this._it.close();
        }
    }

    @Deprecated
    public DBCursor slaveOk() {
        return addOption(4);
    }

    public DBCursor addOption(int option) {
        int i = this._options | option;
        this._options = i;
        setOptions(i);
        return this;
    }

    public DBCursor setOptions(int options) {
        if ((options & 64) != 0) {
            throw new IllegalArgumentException("The exhaust option is not user settable.");
        }
        if ((options & 2) != 0) {
            options |= 32;
        }
        this._options = options;
        return this;
    }

    public DBCursor resetOptions() {
        this._options = 0;
        return this;
    }

    public int getOptions() {
        return this._options;
    }

    private void _check() {
        if (this._it == null) {
            _lookForHints();
            QueryOpBuilder builder = new QueryOpBuilder().addQuery(this._query).addOrderBy(this._orderBy).addHint(this._hintDBObj).addHint(this._hint).addExplain(this._explain).addSnapshot(this._snapshot).addSpecialFields(this._specialFields).addMaxTimeMS(this._maxTimeMS);
            if (this._collection.getDB().getMongo().isMongosConnection()) {
                builder.addReadPreference(this._readPref);
            }
            this._it = this._collection.find(builder.get(), this._keysWanted, this._skip, this._batchSize, this._limit, this._options, this._readPref, getDecoder());
        }
    }

    private DBDecoder getDecoder() {
        if (this._decoderFact != null) {
            return this._decoderFact.create();
        }
        return null;
    }

    private void _lookForHints() {
        if (this._hint == null && this._collection._hintFields != null) {
            Set<String> mykeys = this._query.keySet();
            for (DBObject o : this._collection._hintFields) {
                Set<String> hintKeys = o.keySet();
                if (mykeys.containsAll(hintKeys)) {
                    hint(o);
                    return;
                }
            }
        }
    }

    void _checkType(CursorType type) {
        if (this._cursorType == null) {
            this._cursorType = type;
        } else if (type == this._cursorType) {
        } else {
            throw new IllegalArgumentException("can't switch cursor access methods");
        }
    }

    private DBObject _next() {
        if (this._cursorType == null) {
            _checkType(CursorType.ITERATOR);
        }
        _check();
        this._cur = this._it.next();
        this._num++;
        if (this._keysWanted != null && this._keysWanted.keySet().size() > 0) {
            this._cur.markAsPartialObject();
        }
        if (this._cursorType == CursorType.ARRAY) {
            this._all.add(this._cur);
        }
        return this._cur;
    }

    @Deprecated
    public int numGetMores() {
        if (this._it == null) {
            return 0;
        }
        return this._it.numGetMores();
    }

    @Deprecated
    public List<Integer> getSizes() {
        return this._it == null ? Collections.emptyList() : this._it.getSizes();
    }

    private boolean _hasNext() {
        _check();
        if (this._limit <= 0 || this._num < this._limit) {
            return this._it.hasNext();
        }
        return false;
    }

    public int numSeen() {
        return this._num;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        _checkType(CursorType.ITERATOR);
        return _hasNext();
    }

    @Override // java.util.Iterator
    public DBObject next() {
        _checkType(CursorType.ITERATOR);
        return _next();
    }

    public DBObject curr() {
        _checkType(CursorType.ITERATOR);
        return this._cur;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("can't remove from a cursor");
    }

    void _fill(int n) {
        _checkType(CursorType.ARRAY);
        while (n >= this._all.size() && _hasNext()) {
            _next();
        }
    }

    public int length() {
        _checkType(CursorType.ARRAY);
        _fill(Execute.INVALID);
        return this._all.size();
    }

    public List<DBObject> toArray() {
        return toArray(Execute.INVALID);
    }

    public List<DBObject> toArray(int max) {
        _checkType(CursorType.ARRAY);
        _fill(max - 1);
        return this._all;
    }

    public int itcount() {
        int n = 0;
        while (hasNext()) {
            next();
            n++;
        }
        return n;
    }

    public int count() {
        return (int) this._collection.getCount(this._query, this._keysWanted, 0L, 0L, getReadPreference(), this._maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public DBObject one() {
        return this._collection.findOne(this._query, this._keysWanted, this._orderBy, getReadPreference(), this._maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public int size() {
        return (int) this._collection.getCount(this._query, this._keysWanted, this._limit, this._skip, getReadPreference(), this._maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public DBObject getKeysWanted() {
        return this._keysWanted;
    }

    public DBObject getQuery() {
        return this._query;
    }

    public DBCollection getCollection() {
        return this._collection;
    }

    @Override // com.mongodb.Cursor
    public ServerAddress getServerAddress() {
        if (this._it == null) {
            return null;
        }
        return this._it.getServerAddress();
    }

    public DBCursor setReadPreference(ReadPreference preference) {
        this._readPref = preference;
        return this;
    }

    public ReadPreference getReadPreference() {
        return this._readPref;
    }

    public DBCursor setDecoderFactory(DBDecoderFactory fact) {
        this._decoderFact = fact;
        return this;
    }

    public DBDecoderFactory getDecoderFactory() {
        return this._decoderFact;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Cursor id=").append(getCursorId());
        sb.append(", ns=").append(getCollection().getFullName());
        sb.append(", query=").append(getQuery());
        if (getKeysWanted() != null) {
            sb.append(", fields=").append(getKeysWanted());
        }
        sb.append(", numIterated=").append(this._num);
        if (this._skip != 0) {
            sb.append(", skip=").append(this._skip);
        }
        if (this._limit != 0) {
            sb.append(", limit=").append(this._limit);
        }
        if (this._batchSize != 0) {
            sb.append(", batchSize=").append(this._batchSize);
        }
        ServerAddress addr = getServerAddress();
        if (addr != null) {
            sb.append(", addr=").append(addr);
        }
        if (this._readPref != null) {
            sb.append(", readPreference=").append(this._readPref.toString());
        }
        return sb.toString();
    }

    boolean hasFinalizer() {
        if (this._it == null) {
            return false;
        }
        return this._it.hasFinalizer();
    }
}
