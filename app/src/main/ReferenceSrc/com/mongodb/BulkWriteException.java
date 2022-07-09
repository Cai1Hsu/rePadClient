package com.mongodb;

import java.util.List;

/* loaded from: classes.dex */
public class BulkWriteException extends MongoException {
    private static final long serialVersionUID = -1505950263354313025L;
    private final ServerAddress serverAddress;
    private final WriteConcernError writeConcernError;
    private final List<BulkWriteError> writeErrors;
    private final BulkWriteResult writeResult;

    BulkWriteException(BulkWriteResult writeResult, List<BulkWriteError> writeErrors, WriteConcernError writeConcernError, ServerAddress serverAddress) {
        super("Bulk write operation error on server " + serverAddress + ". " + (writeErrors.isEmpty() ? "" : "Write errors: " + writeErrors + ". ") + (writeConcernError == null ? "" : "Write concern error: " + writeConcernError + ". "));
        this.writeResult = writeResult;
        this.writeErrors = writeErrors;
        this.writeConcernError = writeConcernError;
        this.serverAddress = serverAddress;
    }

    public BulkWriteResult getWriteResult() {
        return this.writeResult;
    }

    public List<BulkWriteError> getWriteErrors() {
        return this.writeErrors;
    }

    public WriteConcernError getWriteConcernError() {
        return this.writeConcernError;
    }

    public ServerAddress getServerAddress() {
        return this.serverAddress;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        BulkWriteException that = (BulkWriteException) o;
        if (this.writeErrors.equals(that.writeErrors) && this.serverAddress.equals(that.serverAddress)) {
            if (this.writeConcernError == null ? that.writeConcernError != null : !this.writeConcernError.equals(that.writeConcernError)) {
                return false;
            }
            return this.writeResult.equals(that.writeResult);
        }
        return false;
    }

    public int hashCode() {
        int result = this.writeResult.hashCode();
        return (((((result * 31) + this.writeErrors.hashCode()) * 31) + this.serverAddress.hashCode()) * 31) + (this.writeConcernError != null ? this.writeConcernError.hashCode() : 0);
    }
}
