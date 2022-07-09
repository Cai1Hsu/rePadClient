package org.apache.commons.compress.archivers.dump;

import java.io.IOException;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/DumpArchiveException.class */
public class DumpArchiveException extends IOException {
    private static final long serialVersionUID = 1;

    public DumpArchiveException() {
    }

    public DumpArchiveException(String str) {
        super(str);
    }

    public DumpArchiveException(String str, Throwable th) {
        super(str);
        initCause(th);
    }

    public DumpArchiveException(Throwable th) {
        initCause(th);
    }
}
