package com.mongodb.io;

import java.nio.ByteBuffer;

@Deprecated
/* loaded from: classes.dex */
public interface ByteBufferFactory {
    ByteBuffer get();

    @Deprecated
    /* loaded from: classes.dex */
    public static class SimpleHeapByteBufferFactory implements ByteBufferFactory {
        final int _size;

        public SimpleHeapByteBufferFactory(int size) {
            this._size = size;
        }

        @Override // com.mongodb.io.ByteBufferFactory
        public ByteBuffer get() {
            return ByteBuffer.wrap(new byte[this._size]);
        }
    }
}
