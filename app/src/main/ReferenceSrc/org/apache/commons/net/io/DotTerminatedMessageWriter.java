package org.apache.commons.net.io;

import java.io.IOException;
import java.io.Writer;

/* loaded from: classes.jar:org/apache/commons/net/io/DotTerminatedMessageWriter.class */
public final class DotTerminatedMessageWriter extends Writer {
    private static final int __LAST_WAS_CR_STATE = 1;
    private static final int __LAST_WAS_NL_STATE = 2;
    private static final int __NOTHING_SPECIAL_STATE = 0;
    private Writer __output;
    private int __state = 0;

    public DotTerminatedMessageWriter(Writer writer) {
        super(writer);
        this.__output = writer;
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this.lock) {
            if (this.__output == null) {
                return;
            }
            if (this.__state == 1) {
                this.__output.write(10);
            } else if (this.__state != 2) {
                this.__output.write("\r\n");
            }
            this.__output.write(".\r\n");
            this.__output.flush();
            this.__output = null;
        }
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        synchronized (this.lock) {
            this.__output.flush();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // java.io.Writer
    public void write(int i) throws IOException {
        synchronized (this.lock) {
            switch (i) {
                case 10:
                    if (this.__state != 1) {
                        this.__output.write(13);
                    }
                    this.__output.write(10);
                    this.__state = 2;
                    return;
                case 13:
                    this.__state = 1;
                    this.__output.write(13);
                    return;
                case 46:
                    if (this.__state == 2) {
                        this.__output.write(46);
                        break;
                    }
                    break;
            }
            this.__state = 0;
            this.__output.write(i);
        }
    }

    @Override // java.io.Writer
    public void write(String str) throws IOException {
        write(str.toCharArray());
    }

    @Override // java.io.Writer
    public void write(String str, int i, int i2) throws IOException {
        write(str.toCharArray(), i, i2);
    }

    @Override // java.io.Writer
    public void write(char[] cArr) throws IOException {
        write(cArr, 0, cArr.length);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0021 -> B:12:0x0022). Please submit an issue!!! */
    @Override // java.io.Writer
    public void write(char[] cArr, int i, int i2) throws IOException {
        synchronized (this.lock) {
            while (i2 > 0) {
                try {
                    write(cArr[i]);
                    i2--;
                    i++;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            }
            try {
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }
}
