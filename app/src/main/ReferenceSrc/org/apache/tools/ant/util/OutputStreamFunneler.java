package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/OutputStreamFunneler.class */
public class OutputStreamFunneler {
    public static final long DEFAULT_TIMEOUT_MILLIS = 1000;
    private boolean closed;
    private int count;
    private OutputStream out;
    private long timeoutMillis;

    /* renamed from: org.apache.tools.ant.util.OutputStreamFunneler$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/util/OutputStreamFunneler$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/OutputStreamFunneler$Funnel.class */
    private final class Funnel extends OutputStream {
        private boolean closed;
        private final OutputStreamFunneler this$0;

        private Funnel(OutputStreamFunneler outputStreamFunneler) {
            this.this$0 = outputStreamFunneler;
            this.closed = false;
            synchronized (outputStreamFunneler) {
                OutputStreamFunneler.access$004(outputStreamFunneler);
            }
        }

        Funnel(OutputStreamFunneler outputStreamFunneler, AnonymousClass1 anonymousClass1) {
            this(outputStreamFunneler);
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.this$0.release(this);
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            synchronized (this.this$0) {
                this.this$0.dieIfClosed();
                this.this$0.out.flush();
            }
        }

        @Override // java.io.OutputStream
        public void write(int i) throws IOException {
            synchronized (this.this$0) {
                this.this$0.dieIfClosed();
                this.this$0.out.write(i);
            }
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr) throws IOException {
            synchronized (this.this$0) {
                this.this$0.dieIfClosed();
                this.this$0.out.write(bArr);
            }
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr, int i, int i2) throws IOException {
            synchronized (this.this$0) {
                this.this$0.dieIfClosed();
                this.this$0.out.write(bArr, i, i2);
            }
        }
    }

    public OutputStreamFunneler(OutputStream outputStream) {
        this(outputStream, 1000L);
    }

    public OutputStreamFunneler(OutputStream outputStream, long j) {
        this.count = 0;
        if (outputStream == null) {
            throw new IllegalArgumentException("OutputStreamFunneler.<init>:  out == null");
        }
        this.out = outputStream;
        this.closed = false;
        setTimeout(j);
    }

    static int access$004(OutputStreamFunneler outputStreamFunneler) {
        int i = outputStreamFunneler.count + 1;
        outputStreamFunneler.count = i;
        return i;
    }

    private void close() throws IOException {
        synchronized (this) {
            dieIfClosed();
            this.out.close();
            this.closed = true;
        }
    }

    public void dieIfClosed() throws IOException {
        synchronized (this) {
            if (this.closed) {
                throw new IOException("The funneled OutputStream has been closed.");
            }
        }
    }

    public void release(Funnel funnel) throws IOException {
        synchronized (this) {
            if (!funnel.closed) {
                if (this.timeoutMillis > 0) {
                    try {
                        wait(this.timeoutMillis);
                    } catch (InterruptedException e) {
                    }
                }
                int i = this.count - 1;
                this.count = i;
                if (i == 0) {
                    close();
                }
                funnel.closed = true;
            }
        }
    }

    public OutputStream getFunnelInstance() throws IOException {
        Funnel funnel;
        synchronized (this) {
            dieIfClosed();
            funnel = new Funnel(this, null);
            notifyAll();
        }
        return funnel;
    }

    public void setTimeout(long j) {
        synchronized (this) {
            this.timeoutMillis = j;
        }
    }
}
