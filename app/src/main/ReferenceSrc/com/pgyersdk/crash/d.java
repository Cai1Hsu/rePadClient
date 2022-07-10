package com.pgyersdk.crash;

import java.io.File;
import java.io.FilenameFilter;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class d implements FilenameFilter {
    @Override // java.io.FilenameFilter
    public final boolean accept(File file, String name) {
        return name.endsWith(".stacktrace");
    }
}
