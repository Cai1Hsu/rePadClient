package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class Remove {
    private final DBObject filter;
    private boolean isMulti = true;

    public Remove(DBObject filter) {
        this.filter = filter;
    }

    public DBObject getFilter() {
        return this.filter;
    }

    public Remove multi(boolean isMulti) {
        this.isMulti = isMulti;
        return this;
    }

    public boolean isMulti() {
        return this.isMulti;
    }
}
