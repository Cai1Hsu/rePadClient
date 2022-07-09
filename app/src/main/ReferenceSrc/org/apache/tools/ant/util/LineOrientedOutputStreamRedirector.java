package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/LineOrientedOutputStreamRedirector.class */
public class LineOrientedOutputStreamRedirector extends LineOrientedOutputStream {
    private static final byte[] EOL = System.getProperty("line.separator").getBytes();
    private OutputStream stream;

    public LineOrientedOutputStreamRedirector(OutputStream outputStream) {
        this.stream = outputStream;
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        this.stream.close();
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        super.flush();
        this.stream.flush();
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream
    protected void processLine(String str) throws IOException {
        this.stream.write(new StringBuffer().append(str).append(System.getProperty("line.separator")).toString().getBytes());
    }

    @Override // org.apache.tools.ant.util.LineOrientedOutputStream
    protected void processLine(byte[] bArr) throws IOException {
        this.stream.write(bArr);
        this.stream.write(EOL);
    }
}
