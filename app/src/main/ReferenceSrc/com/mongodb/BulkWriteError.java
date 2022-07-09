package com.mongodb;

import org.bson.util.Assertions;

/* loaded from: classes.dex */
public class BulkWriteError {
    private final int code;
    private final DBObject details;
    private final int index;
    private final String message;

    public BulkWriteError(int code, String message, DBObject details, int index) {
        this.code = code;
        this.message = (String) Assertions.notNull("message", message);
        this.details = (DBObject) Assertions.notNull("details", details);
        this.index = index;
    }

    public int getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }

    public DBObject getDetails() {
        return this.details;
    }

    public int getIndex() {
        return this.index;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BulkWriteError that = (BulkWriteError) o;
        return this.code == that.code && this.index == that.index && this.details.equals(that.details) && this.message.equals(that.message);
    }

    public int hashCode() {
        int result = this.index;
        return (((((result * 31) + this.code) * 31) + this.message.hashCode()) * 31) + this.details.hashCode();
    }

    public String toString() {
        return "BulkWriteError{index=" + this.index + ", code=" + this.code + ", message='" + this.message + "', details=" + this.details + '}';
    }
}
