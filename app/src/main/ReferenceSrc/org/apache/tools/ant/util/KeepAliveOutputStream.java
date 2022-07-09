package org.apache.tools.ant.util;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/KeepAliveOutputStream.class */
public class KeepAliveOutputStream extends FilterOutputStream {
    public KeepAliveOutputStream(OutputStream outputStream) {
        super(outputStream);
    }

    private static PrintStream wrap(PrintStream printStream) {
        return new PrintStream(new KeepAliveOutputStream(printStream));
    }

    public static PrintStream wrapSystemErr() {
        return wrap(System.err);
    }

    public static PrintStream wrapSystemOut() {
        return wrap(System.out);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
