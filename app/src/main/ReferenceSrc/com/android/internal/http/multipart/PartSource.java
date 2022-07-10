package com.android.internal.http.multipart;

import java.io.IOException;
import java.io.InputStream;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface PartSource {
    InputStream createInputStream() throws IOException;

    String getFileName();

    long getLength();
}
