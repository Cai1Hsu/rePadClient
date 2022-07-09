package com.mongodb;

/* loaded from: classes.dex */
public class BulkUpdateRequestBuilder {
    private final BulkWriteOperation bulkWriteOperation;
    private final DBObject query;
    private final boolean upsert;

    BulkUpdateRequestBuilder(BulkWriteOperation bulkWriteOperation, DBObject query, boolean upsert) {
        this.bulkWriteOperation = bulkWriteOperation;
        this.query = query;
        this.upsert = upsert;
    }

    public void replaceOne(DBObject document) {
        this.bulkWriteOperation.addRequest(new ReplaceRequest(this.query, this.upsert, document));
    }

    public void update(DBObject update) {
        this.bulkWriteOperation.addRequest(new UpdateRequest(this.query, this.upsert, update, true));
    }

    public void updateOne(DBObject update) {
        this.bulkWriteOperation.addRequest(new UpdateRequest(this.query, this.upsert, update, false));
    }
}
