package com.mongodb;

/* loaded from: classes.dex */
class QueryOpBuilder {
    static final String READ_PREFERENCE_META_OPERATOR = "$readPreference";
    private boolean explain;
    private DBObject hintObj;
    private String hintStr;
    private long maxTimeMS;
    private DBObject orderBy;
    private DBObject query;
    private ReadPreference readPref;
    private boolean snapshot;
    private DBObject specialFields;

    public QueryOpBuilder addQuery(DBObject query) {
        this.query = query;
        return this;
    }

    public QueryOpBuilder addOrderBy(DBObject orderBy) {
        this.orderBy = orderBy;
        return this;
    }

    public QueryOpBuilder addHint(String hint) {
        this.hintStr = hint;
        return this;
    }

    public QueryOpBuilder addHint(DBObject hint) {
        this.hintObj = hint;
        return this;
    }

    public QueryOpBuilder addSpecialFields(DBObject specialFields) {
        this.specialFields = specialFields;
        return this;
    }

    public QueryOpBuilder addExplain(boolean explain) {
        this.explain = explain;
        return this;
    }

    public QueryOpBuilder addSnapshot(boolean snapshot) {
        this.snapshot = snapshot;
        return this;
    }

    public QueryOpBuilder addReadPreference(ReadPreference readPref) {
        this.readPref = readPref;
        return this;
    }

    public QueryOpBuilder addMaxTimeMS(long maxTimeMS) {
        this.maxTimeMS = maxTimeMS;
        return this;
    }

    public DBObject get() {
        DBObject lclQuery = this.query;
        if (lclQuery == null) {
            lclQuery = new BasicDBObject();
        }
        if (!hasSpecialQueryFields()) {
            return lclQuery;
        }
        DBObject queryop = this.specialFields == null ? new BasicDBObject() : this.specialFields;
        addToQueryObject(queryop, "$query", lclQuery, true);
        addToQueryObject(queryop, QueryOperators.ORDER_BY, this.orderBy, false);
        if (this.hintStr != null) {
            addToQueryObject(queryop, QueryOperators.HINT, this.hintStr);
        }
        if (this.hintObj != null) {
            addToQueryObject(queryop, QueryOperators.HINT, this.hintObj);
        }
        if (this.explain) {
            queryop.put(QueryOperators.EXPLAIN, true);
        }
        if (this.snapshot) {
            queryop.put(QueryOperators.SNAPSHOT, true);
        }
        if (this.readPref != null && this.readPref != ReadPreference.primary()) {
            queryop.put(READ_PREFERENCE_META_OPERATOR, this.readPref.toDBObject());
        }
        if (this.maxTimeMS > 0) {
            queryop.put("$maxTimeMS", Long.valueOf(this.maxTimeMS));
            return queryop;
        }
        return queryop;
    }

    private boolean hasSpecialQueryFields() {
        if (this.readPref == null && this.specialFields == null) {
            return (this.orderBy != null && this.orderBy.keySet().size() > 0) || this.hintStr != null || this.hintObj != null || this.snapshot || this.explain || this.maxTimeMS > 0;
        }
        return true;
    }

    private void addToQueryObject(DBObject dbobj, String field, DBObject obj, boolean sendEmpty) {
        if (obj != null) {
            if (sendEmpty || obj.keySet().size() != 0) {
                addToQueryObject(dbobj, field, obj);
            }
        }
    }

    private void addToQueryObject(DBObject dbobj, String field, Object obj) {
        if (obj != null) {
            dbobj.put(field, obj);
        }
    }
}
