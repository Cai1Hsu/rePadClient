package com.mongodb;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class WriteConcern implements Serializable {
    private static final long serialVersionUID = 1884671104750417011L;
    final boolean _continueOnError;
    final boolean _fsync;
    final boolean _j;
    Object _w;
    final int _wtimeout;
    @Deprecated
    public static final WriteConcern ERRORS_IGNORED = new WriteConcern(-1);
    public static final WriteConcern ACKNOWLEDGED = new WriteConcern(1);
    public static final WriteConcern UNACKNOWLEDGED = new WriteConcern(0);
    public static final WriteConcern FSYNCED = new WriteConcern(true);
    public static final WriteConcern JOURNALED = new WriteConcern(1, 0, false, true);
    public static final WriteConcern REPLICA_ACKNOWLEDGED = new WriteConcern(2);
    @Deprecated
    public static final WriteConcern NONE = new WriteConcern(-1);
    public static final WriteConcern NORMAL = new WriteConcern(0);
    public static final WriteConcern SAFE = new WriteConcern(1);
    public static final WriteConcern MAJORITY = new Majority();
    public static final WriteConcern FSYNC_SAFE = new WriteConcern(true);
    public static final WriteConcern JOURNAL_SAFE = new WriteConcern(1, 0, false, true);
    public static final WriteConcern REPLICAS_SAFE = new WriteConcern(2);
    private static Map<String, WriteConcern> _namedConcerns = null;

    public WriteConcern() {
        this(0);
    }

    public WriteConcern(int w) {
        this(w, 0, false);
    }

    public WriteConcern(String w) {
        this(w, 0, false, false);
    }

    public WriteConcern(int w, int wtimeout) {
        this(w, wtimeout, false);
    }

    public WriteConcern(boolean fsync) {
        this(1, 0, fsync);
    }

    public WriteConcern(int w, int wtimeout, boolean fsync) {
        this(w, wtimeout, fsync, false);
    }

    public WriteConcern(int w, int wtimeout, boolean fsync, boolean j) {
        this(w, wtimeout, fsync, j, false);
    }

    public WriteConcern(int w, int wtimeout, boolean fsync, boolean j, boolean continueOnError) {
        this._w = Integer.valueOf(w);
        this._wtimeout = wtimeout;
        this._fsync = fsync;
        this._j = j;
        this._continueOnError = continueOnError;
    }

    public WriteConcern(String w, int wtimeout, boolean fsync, boolean j) {
        this(w, wtimeout, fsync, j, false);
    }

    public WriteConcern(String w, int wtimeout, boolean fsync, boolean j, boolean continueOnError) {
        if (w == null) {
            throw new IllegalArgumentException("w can not be null");
        }
        this._w = w;
        this._wtimeout = wtimeout;
        this._fsync = fsync;
        this._j = j;
        this._continueOnError = continueOnError;
    }

    public BasicDBObject getCommand() {
        BasicDBObject command = new BasicDBObject("getlasterror", 1);
        if (((this._w instanceof Integer) && ((Integer) this._w).intValue() > 1) || (this._w instanceof String)) {
            command.put("w", this._w);
        }
        addWTimeout(command);
        addFSync(command);
        addJ(command);
        return command;
    }

    boolean useServerDefault() {
        return this._w.equals(1) && this._wtimeout == 0 && !this._fsync && !this._j;
    }

    BasicDBObject asDBObject() {
        BasicDBObject document = new BasicDBObject();
        document.put("w", this._w);
        addWTimeout(document);
        addFSync(document);
        addJ(document);
        return document;
    }

    private void addJ(BasicDBObject document) {
        if (this._j) {
            document.put("j", (Object) true);
        }
    }

    private void addFSync(BasicDBObject document) {
        if (this._fsync) {
            document.put("fsync", (Object) true);
        }
    }

    private void addWTimeout(BasicDBObject document) {
        if (this._wtimeout > 0) {
            document.put("wtimeout", (Object) Integer.valueOf(this._wtimeout));
        }
    }

    @Deprecated
    public void setWObject(Object w) {
        if (!(w instanceof Integer) && !(w instanceof String)) {
            throw new IllegalArgumentException("The w parameter must be an int or a String");
        }
        this._w = w;
    }

    public Object getWObject() {
        return this._w;
    }

    public int getW() {
        return ((Integer) this._w).intValue();
    }

    public String getWString() {
        return this._w.toString();
    }

    public int getWtimeout() {
        return this._wtimeout;
    }

    public boolean getFsync() {
        return this._fsync;
    }

    public boolean fsync() {
        return this._fsync;
    }

    @Deprecated
    public boolean raiseNetworkErrors() {
        boolean z = true;
        if (this._w instanceof Integer) {
            return ((Integer) this._w).intValue() >= 0;
        }
        if (this._w == null) {
            z = false;
        }
        return z;
    }

    public boolean callGetLastError() {
        boolean z = true;
        if (this._w instanceof Integer) {
            return ((Integer) this._w).intValue() > 0;
        }
        if (this._w == null) {
            z = false;
        }
        return z;
    }

    public static WriteConcern valueOf(String name) {
        if (_namedConcerns == null) {
            HashMap<String, WriteConcern> newMap = new HashMap<>(8, 1.0f);
            Field[] arr$ = WriteConcern.class.getFields();
            for (Field f : arr$) {
                if (Modifier.isStatic(f.getModifiers()) && f.getType().equals(WriteConcern.class)) {
                    try {
                        String key = f.getName().toLowerCase();
                        newMap.put(key, (WriteConcern) f.get(null));
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }
            }
            _namedConcerns = newMap;
        }
        return _namedConcerns.get(name.toLowerCase());
    }

    public String toString() {
        return "WriteConcern " + getCommand() + " / (Continue on error? " + getContinueOnErrorForInsert() + ")";
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WriteConcern that = (WriteConcern) o;
        return this._continueOnError == that._continueOnError && this._fsync == that._fsync && this._j == that._j && this._wtimeout == that._wtimeout && this._w.equals(that._w);
    }

    public int hashCode() {
        int i = 1;
        int result = this._w.hashCode();
        int i2 = ((((((result * 31) + this._wtimeout) * 31) + (this._fsync ? 1 : 0)) * 31) + (this._j ? 1 : 0)) * 31;
        if (!this._continueOnError) {
            i = 0;
        }
        int result2 = i2 + i;
        return result2;
    }

    public boolean getJ() {
        return this._j;
    }

    public WriteConcern continueOnError(boolean continueOnError) {
        if (this._w instanceof Integer) {
            return new WriteConcern(((Integer) this._w).intValue(), this._wtimeout, this._fsync, this._j, continueOnError);
        }
        if (this._w instanceof String) {
            return new WriteConcern((String) this._w, this._wtimeout, this._fsync, this._j, continueOnError);
        }
        throw new IllegalStateException("The w parameter must be an int or a String");
    }

    public boolean getContinueOnError() {
        return this._continueOnError;
    }

    @Deprecated
    public WriteConcern continueOnErrorForInsert(boolean continueOnErrorForInsert) {
        return continueOnError(continueOnErrorForInsert);
    }

    @Deprecated
    public boolean getContinueOnErrorForInsert() {
        return getContinueOnError();
    }

    public static Majority majorityWriteConcern(int wtimeout, boolean fsync, boolean j) {
        return new Majority(wtimeout, fsync, j);
    }

    /* loaded from: classes.dex */
    public static class Majority extends WriteConcern {
        private static final long serialVersionUID = -4128295115883875212L;

        public Majority() {
            super("majority", 0, false, false);
        }

        public Majority(int wtimeout, boolean fsync, boolean j) {
            super("majority", wtimeout, fsync, j);
        }

        @Override // com.mongodb.WriteConcern
        public String toString() {
            return "[Majority] WriteConcern " + getCommand();
        }
    }
}
