package com.mongodb;

import java.io.Closeable;
import java.util.Iterator;

/* loaded from: classes.dex */
public interface Cursor extends Iterator<DBObject>, Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();

    long getCursorId();

    ServerAddress getServerAddress();
}
