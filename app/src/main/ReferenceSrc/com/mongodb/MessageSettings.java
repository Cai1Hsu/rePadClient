package com.mongodb;

import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: classes.dex */
final class MessageSettings {
    private static final int DEFAULT_MAX_DOCUMENT_SIZE = 16777216;
    private static final int DEFAULT_MAX_MESSAGE_SIZE = 33554432;
    private static final int DEFAULT_MAX_WRITE_BATCH_SIZE = 1000;
    private final int maxDocumentSize;
    private final int maxMessageSize;
    private final int maxWriteBatchSize;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: classes.dex */
    static final class Builder {
        private int maxDocumentSize = 16777216;
        private int maxMessageSize = MessageSettings.DEFAULT_MAX_MESSAGE_SIZE;
        private int maxWriteBatchSize = 1000;

        Builder() {
        }

        public MessageSettings build() {
            return new MessageSettings(this);
        }

        public Builder maxDocumentSize(int maxDocumentSize) {
            this.maxDocumentSize = maxDocumentSize;
            return this;
        }

        public Builder maxMessageSize(int maxMessageSize) {
            this.maxMessageSize = maxMessageSize;
            return this;
        }

        public Builder maxWriteBatchSize(int maxWriteBatchSize) {
            this.maxWriteBatchSize = maxWriteBatchSize;
            return this;
        }
    }

    public int getMaxDocumentSize() {
        return this.maxDocumentSize;
    }

    public int getMaxMessageSize() {
        return this.maxMessageSize;
    }

    public int getMaxWriteBatchSize() {
        return this.maxWriteBatchSize;
    }

    MessageSettings(Builder builder) {
        this.maxDocumentSize = builder.maxDocumentSize;
        this.maxMessageSize = builder.maxMessageSize;
        this.maxWriteBatchSize = builder.maxWriteBatchSize;
    }
}
