package com.mongodb;

import java.util.List;

/* loaded from: classes.dex */
public abstract class BulkWriteResult {
    public abstract int getInsertedCount();

    public abstract int getMatchedCount();

    public abstract int getModifiedCount();

    public abstract int getRemovedCount();

    public abstract List<BulkWriteUpsert> getUpserts();

    public abstract boolean isAcknowledged();

    public abstract boolean isModifiedCountAvailable();
}
