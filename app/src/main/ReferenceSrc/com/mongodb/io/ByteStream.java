package com.mongodb.io;

import java.nio.ByteBuffer;

@Deprecated
/* loaded from: classes.dex */
public interface ByteStream {
    boolean hasMore();

    int write(ByteBuffer byteBuffer);
}
