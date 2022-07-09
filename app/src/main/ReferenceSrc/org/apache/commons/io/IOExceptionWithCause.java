package org.apache.commons.io;

import java.io.IOException;

/* loaded from: classes.jar:org/apache/commons/io/IOExceptionWithCause.class */
public class IOExceptionWithCause extends IOException {
    private static final long serialVersionUID = 1;

    public IOExceptionWithCause(String str, Throwable th) {
        super(str);
        initCause(th);
    }

    public IOExceptionWithCause(Throwable th) {
        super(th == null ? null : th.toString());
        initCause(th);
    }
}
