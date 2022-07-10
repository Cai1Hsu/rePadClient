package com.mongodb;

import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class WriteConcernError {
    private final int code;
    private final DBObject details;
    private final String message;

    public WriteConcernError(int code, String message, DBObject details) {
        this.code = code;
        this.message = (String) Assertions.notNull("message", message);
        this.details = (DBObject) Assertions.notNull("details", details);
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

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WriteConcernError that = (WriteConcernError) o;
        return this.code == that.code && this.details.equals(that.details) && this.message.equals(that.message);
    }

    public int hashCode() {
        int result = this.code;
        return (((result * 31) + this.message.hashCode()) * 31) + this.details.hashCode();
    }

    public String toString() {
        return "BulkWriteConcernError{code=" + this.code + ", message='" + this.message + "', details=" + this.details + '}';
    }
}
