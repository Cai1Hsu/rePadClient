package com.mongodb.io;

import java.nio.ByteBuffer;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface ByteStream {
    boolean hasMore();

    int write(ByteBuffer byteBuffer);
}
