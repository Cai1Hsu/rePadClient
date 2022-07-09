package com.mongodb;

/* loaded from: classes.dex */
public class BulkWriteUpsert {
    private final Object id;
    private final int index;

    public BulkWriteUpsert(int index, Object id) {
        this.index = index;
        this.id = id;
    }

    public int getIndex() {
        return this.index;
    }

    public Object getId() {
        return this.id;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BulkWriteUpsert that = (BulkWriteUpsert) o;
        return this.index == that.index && this.id.equals(that.id);
    }

    public int hashCode() {
        int result = this.index;
        return (result * 31) + this.id.hashCode();
    }

    public String toString() {
        return "BulkWriteUpsert{index=" + this.index + ", id=" + this.id + '}';
    }
}
