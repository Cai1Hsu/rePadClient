package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class Update {
    private final DBObject filter;
    private final DBObject updateOperations;
    private boolean isUpsert = false;
    private boolean isMulti = false;

    public Update(DBObject filter, DBObject updateOperations) {
        this.filter = filter;
        this.updateOperations = updateOperations;
    }

    DBObject getFilter() {
        return this.filter;
    }

    public DBObject getUpdateOperations() {
        return this.updateOperations;
    }

    public boolean isMulti() {
        return this.isMulti;
    }

    boolean isUpsert() {
        return this.isUpsert;
    }

    public Update multi(boolean isMulti) {
        this.isMulti = isMulti;
        return this;
    }

    public Update upsert(boolean isUpsert) {
        this.isUpsert = isUpsert;
        return this;
    }
}
