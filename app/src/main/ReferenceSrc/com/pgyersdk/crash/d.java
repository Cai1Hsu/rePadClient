package com.pgyersdk.crash;

import java.io.File;
import java.io.FilenameFilter;

/* loaded from: classes.dex */
final class d implements FilenameFilter {
    d() {
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String name) {
        return name.endsWith(".stacktrace");
    }
}
