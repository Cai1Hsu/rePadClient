package com.mongodb;

import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.jivesoftware.smackx.jingle.nat.STUN;

/* loaded from: classes.dex */
public class MapReduceCommand {
    DBObject _extra;
    String _finalize;
    final String _input;
    int _limit;
    final String _map;
    private long _maxTimeMS;
    final String _outputTarget;
    final OutputType _outputType;
    final DBObject _query;
    ReadPreference _readPref;
    final String _reduce;
    Map<String, Object> _scope;
    DBObject _sort;
    String _outputDB = null;
    Boolean _verbose = true;

    /* loaded from: classes.dex */
    public enum OutputType {
        REPLACE,
        MERGE,
        REDUCE,
        INLINE
    }

    public MapReduceCommand(DBCollection inputCollection, String map, String reduce, String outputCollection, OutputType type, DBObject query) {
        this._input = inputCollection.getName();
        this._map = map;
        this._reduce = reduce;
        this._outputTarget = outputCollection;
        this._outputType = type;
        this._query = query;
    }

    public void setVerbose(Boolean verbose) {
        this._verbose = verbose;
    }

    public Boolean isVerbose() {
        return this._verbose;
    }

    public String getInput() {
        return this._input;
    }

    public String getMap() {
        return this._map;
    }

    public String getReduce() {
        return this._reduce;
    }

    public String getOutputTarget() {
        return this._outputTarget;
    }

    public OutputType getOutputType() {
        return this._outputType;
    }

    public String getFinalize() {
        return this._finalize;
    }

    public void setFinalize(String finalize) {
        this._finalize = finalize;
    }

    public DBObject getQuery() {
        return this._query;
    }

    public DBObject getSort() {
        return this._sort;
    }

    public void setSort(DBObject sort) {
        this._sort = sort;
    }

    public int getLimit() {
        return this._limit;
    }

    public void setLimit(int limit) {
        this._limit = limit;
    }

    public long getMaxTime(TimeUnit timeUnit) {
        return timeUnit.convert(this._maxTimeMS, TimeUnit.MILLISECONDS);
    }

    public void setMaxTime(long maxTime, TimeUnit timeUnit) {
        this._maxTimeMS = TimeUnit.MILLISECONDS.convert(maxTime, timeUnit);
    }

    public Map<String, Object> getScope() {
        return this._scope;
    }

    public void setScope(Map<String, Object> scope) {
        this._scope = scope;
    }

    public void setOutputDB(String outputDB) {
        this._outputDB = outputDB;
    }

    public DBObject toDBObject() {
        BasicDBObject cmd = new BasicDBObject();
        cmd.put("mapreduce", (Object) this._input);
        cmd.put("map", (Object) this._map);
        cmd.put("reduce", (Object) this._reduce);
        cmd.put("verbose", (Object) this._verbose);
        BasicDBObject out = new BasicDBObject();
        switch (this._outputType) {
            case INLINE:
                out.put("inline", (Object) 1);
                break;
            case REPLACE:
                out.put(MSVSSConstants.WRITABLE_REPLACE, (Object) this._outputTarget);
                break;
            case MERGE:
                out.put("merge", (Object) this._outputTarget);
                break;
            case REDUCE:
                out.put("reduce", (Object) this._outputTarget);
                break;
        }
        if (this._outputDB != null) {
            out.put("db", (Object) this._outputDB);
        }
        cmd.put("out", (Object) out);
        if (this._query != null) {
            cmd.put(STUN.ELEMENT_NAME, (Object) this._query);
        }
        if (this._finalize != null) {
            cmd.put("finalize", (Object) this._finalize);
        }
        if (this._sort != null) {
            cmd.put("sort", (Object) this._sort);
        }
        if (this._limit > 0) {
            cmd.put("limit", (Object) Integer.valueOf(this._limit));
        }
        if (this._scope != null) {
            cmd.put("scope", (Object) this._scope);
        }
        if (this._extra != null) {
            cmd.putAll(this._extra);
        }
        if (this._maxTimeMS != 0) {
            cmd.put("maxTimeMS", (Object) Long.valueOf(this._maxTimeMS));
        }
        return cmd;
    }

    public void addExtraOption(String name, Object value) {
        if (this._extra == null) {
            this._extra = new BasicDBObject();
        }
        this._extra.put(name, value);
    }

    public DBObject getExtraOptions() {
        return this._extra;
    }

    public void setReadPreference(ReadPreference preference) {
        this._readPref = preference;
    }

    public ReadPreference getReadPreference() {
        return this._readPref;
    }

    public String toString() {
        return toDBObject().toString();
    }
}
