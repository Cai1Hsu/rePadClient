package com.mongodb;

import com.mongodb.WriteRequest;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ReplaceRequest extends ModifyRequest {
    public ReplaceRequest(DBObject query, boolean upsert, DBObject document) {
        super(query, upsert, document);
    }

    public DBObject getDocument() {
        return getUpdateDocument();
    }

    @Override // com.mongodb.WriteRequest
    public WriteRequest.Type getType() {
        return WriteRequest.Type.REPLACE;
    }
}
