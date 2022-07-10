package com.mongodb;

import org.bson.util.annotations.Immutable;
@Immutable
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static final class Builder {
        private int maxDocumentSize = 16777216;
        private int maxMessageSize = MessageSettings.DEFAULT_MAX_MESSAGE_SIZE;
        private int maxWriteBatchSize = 1000;

        Builder() {
        }

        static /* synthetic */ int access$000(Builder x0) {
            return x0.maxDocumentSize;
        }

        static /* synthetic */ int access$100(Builder x0) {
            return x0.maxMessageSize;
        }

        static /* synthetic */ int access$200(Builder x0) {
            return x0.maxWriteBatchSize;
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
        this.maxDocumentSize = Builder.access$000(builder);
        this.maxMessageSize = Builder.access$100(builder);
        this.maxWriteBatchSize = Builder.access$200(builder);
    }
}
