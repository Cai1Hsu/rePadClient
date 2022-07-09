package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/StreamPumper.class */
public class StreamPumper implements Runnable {
    private static final long POLL_INTERVAL = 100;
    private static final int SMALL_BUFFER_SIZE = 128;
    private boolean autoflush;
    private int bufferSize;
    private final boolean closeWhenExhausted;
    private Exception exception;
    private volatile boolean finish;
    private volatile boolean finished;
    private final InputStream is;
    private final OutputStream os;
    private boolean started;
    private final boolean useAvailable;

    public StreamPumper(InputStream inputStream, OutputStream outputStream) {
        this(inputStream, outputStream, false);
    }

    public StreamPumper(InputStream inputStream, OutputStream outputStream, boolean z) {
        this(inputStream, outputStream, z, false);
    }

    public StreamPumper(InputStream inputStream, OutputStream outputStream, boolean z, boolean z2) {
        this.autoflush = false;
        this.exception = null;
        this.bufferSize = 128;
        this.started = false;
        this.is = inputStream;
        this.os = outputStream;
        this.closeWhenExhausted = z;
        this.useAvailable = z2;
    }

    private void waitForInput(InputStream inputStream) throws IOException, InterruptedException {
        if (this.useAvailable) {
            while (!this.finish && inputStream.available() == 0) {
                if (Thread.interrupted()) {
                    throw new InterruptedException();
                }
                synchronized (this) {
                    wait(POLL_INTERVAL);
                }
            }
        }
    }

    public int getBufferSize() {
        int i;
        synchronized (this) {
            i = this.bufferSize;
        }
        return i;
    }

    public Exception getException() {
        Exception exc;
        synchronized (this) {
            exc = this.exception;
        }
        return exc;
    }

    public boolean isFinished() {
        return this.finished;
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // java.lang.Runnable
    public void run() {
        int read;
        synchronized (this) {
            this.started = true;
        }
        this.finished = false;
        this.finish = false;
        byte[] bArr = new byte[this.bufferSize];
        while (true) {
            try {
                try {
                    waitForInput(this.is);
                    if (this.finish || Thread.interrupted() || (read = this.is.read(bArr)) <= 0 || this.finish || Thread.interrupted()) {
                        break;
                    }
                    this.os.write(bArr, 0, read);
                    if (this.autoflush) {
                        this.os.flush();
                    }
                } catch (InterruptedException e) {
                    if (this.closeWhenExhausted) {
                        FileUtils.close(this.os);
                    }
                    this.finished = true;
                    synchronized (this) {
                        notifyAll();
                        return;
                    }
                } catch (Exception e2) {
                    synchronized (this) {
                        this.exception = e2;
                        if (this.closeWhenExhausted) {
                            FileUtils.close(this.os);
                        }
                        this.finished = true;
                        synchronized (this) {
                            notifyAll();
                            return;
                        }
                    }
                }
            } catch (Throwable th) {
                if (this.closeWhenExhausted) {
                    FileUtils.close(this.os);
                }
                this.finished = true;
                synchronized (this) {
                    notifyAll();
                    throw th;
                }
            }
        }
        this.os.flush();
        if (this.closeWhenExhausted) {
            FileUtils.close(this.os);
        }
        this.finished = true;
        synchronized (this) {
            notifyAll();
        }
    }

    void setAutoflush(boolean z) {
        this.autoflush = z;
    }

    public void setBufferSize(int i) {
        synchronized (this) {
            if (this.started) {
                throw new IllegalStateException("Cannot set buffer size on a running StreamPumper");
            }
            this.bufferSize = i;
        }
    }

    void stop() {
        synchronized (this) {
            this.finish = true;
            notifyAll();
        }
    }

    public void waitFor() throws InterruptedException {
        synchronized (this) {
            while (!isFinished()) {
                wait();
            }
        }
    }
}
