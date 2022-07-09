package com.mongodb;

import java.util.ArrayList;
import java.util.List;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
public class BulkWriteOperation {
    private boolean closed;
    private final DBCollection collection;
    private final boolean ordered;
    private final List<WriteRequest> requests = new ArrayList();

    BulkWriteOperation(boolean ordered, DBCollection collection) {
        this.ordered = ordered;
        this.collection = collection;
    }

    public boolean isOrdered() {
        return this.ordered;
    }

    public void insert(DBObject document) {
        Assertions.isTrue("already executed", !this.closed);
        addRequest(new InsertRequest(document));
    }

    public BulkWriteRequestBuilder find(DBObject query) {
        Assertions.isTrue("already executed", !this.closed);
        return new BulkWriteRequestBuilder(this, query);
    }

    public BulkWriteResult execute() {
        Assertions.isTrue("already executed", !this.closed);
        this.closed = true;
        return this.collection.executeBulkWriteOperation(this.ordered, this.requests);
    }

    public BulkWriteResult execute(WriteConcern writeConcern) {
        Assertions.isTrue("already executed", !this.closed);
        this.closed = true;
        return this.collection.executeBulkWriteOperation(this.ordered, this.requests, writeConcern);
    }

    void addRequest(WriteRequest request) {
        Assertions.isTrue("already executed", !this.closed);
        this.requests.add(request);
    }
}
