package com.android.internal.http.multipart;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:com/android/internal/http/multipart/PartSource.class */
public interface PartSource {
    InputStream createInputStream() throws IOException;

    String getFileName();

    long getLength();
}
