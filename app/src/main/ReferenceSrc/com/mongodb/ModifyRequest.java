package com.mongodb;

/* loaded from: classes.dex */
abstract class ModifyRequest extends WriteRequest {
    private final DBObject query;
    private final DBObject updateDocument;
    private final boolean upsert;

    public ModifyRequest(DBObject query, boolean upsert, DBObject updateDocument) {
        this.query = query;
        this.upsert = upsert;
        this.updateDocument = updateDocument;
    }

    public DBObject getQuery() {
        return this.query;
    }

    public boolean isUpsert() {
        return this.upsert;
    }

    public DBObject getUpdateDocument() {
        return this.updateDocument;
    }

    public boolean isMulti() {
        return false;
    }
}
