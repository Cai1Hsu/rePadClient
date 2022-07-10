package com.mongodb;

import com.mongodb.WriteRequest;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class RemoveRequest extends WriteRequest {
    private final boolean multi;
    private final DBObject query;

    public RemoveRequest(DBObject query, boolean multi) {
        this.query = query;
        this.multi = multi;
    }

    public DBObject getQuery() {
        return this.query;
    }

    public boolean isMulti() {
        return this.multi;
    }

    @Override // com.mongodb.WriteRequest
    public WriteRequest.Type getType() {
        return WriteRequest.Type.REMOVE;
    }
}
