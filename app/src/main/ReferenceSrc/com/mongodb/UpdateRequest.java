package com.mongodb;

import com.mongodb.WriteRequest;

/* loaded from: classes.dex */
class UpdateRequest extends ModifyRequest {
    private final boolean multi;

    public UpdateRequest(DBObject query, boolean upsert, DBObject update, boolean multi) {
        super(query, upsert, update);
        this.multi = multi;
    }

    public DBObject getUpdate() {
        return getUpdateDocument();
    }

    @Override // com.mongodb.ModifyRequest
    public boolean isMulti() {
        return this.multi;
    }

    @Override // com.mongodb.WriteRequest
    public WriteRequest.Type getType() {
        return WriteRequest.Type.UPDATE;
    }
}
