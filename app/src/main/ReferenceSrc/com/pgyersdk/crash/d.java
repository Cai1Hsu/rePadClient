package com.pgyersdk.crash;

import java.io.File;
import java.io.FilenameFilter;

/* loaded from: classes.jar:com/pgyersdk/crash/d.class */
final class d implements FilenameFilter {
    d() {
    }

    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String str) {
        return str.endsWith(".stacktrace");
    }
}
