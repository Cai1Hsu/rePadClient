package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PumpStreamHandler.class */
public class PumpStreamHandler implements ExecuteStreamHandler {
    private static final long JOIN_TIMEOUT = 200;
    private OutputStream err;
    private Thread errorThread;
    private InputStream input;
    private Thread inputThread;
    private final boolean nonBlockingRead;
    private OutputStream out;
    private Thread outputThread;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PumpStreamHandler$ThreadWithPumper.class */
    protected static class ThreadWithPumper extends Thread {
        private final StreamPumper pumper;

        public ThreadWithPumper(StreamPumper streamPumper) {
            super(streamPumper);
            this.pumper = streamPumper;
        }

        protected StreamPumper getPumper() {
            return this.pumper;
        }
    }

    public PumpStreamHandler() {
        this(System.out, System.err);
    }

    public PumpStreamHandler(OutputStream outputStream) {
        this(outputStream, outputStream);
    }

    public PumpStreamHandler(OutputStream outputStream, OutputStream outputStream2) {
        this(outputStream, outputStream2, null);
    }

    public PumpStreamHandler(OutputStream outputStream, OutputStream outputStream2, InputStream inputStream) {
        this(outputStream, outputStream2, inputStream, false);
    }

    public PumpStreamHandler(OutputStream outputStream, OutputStream outputStream2, InputStream inputStream, boolean z) {
        this.out = outputStream;
        this.err = outputStream2;
        this.input = inputStream;
        this.nonBlockingRead = z;
    }

    protected void createProcessErrorPump(InputStream inputStream, OutputStream outputStream) {
        this.errorThread = createPump(inputStream, outputStream);
    }

    protected void createProcessOutputPump(InputStream inputStream, OutputStream outputStream) {
        this.outputThread = createPump(inputStream, outputStream);
    }

    protected Thread createPump(InputStream inputStream, OutputStream outputStream) {
        return createPump(inputStream, outputStream, false);
    }

    protected Thread createPump(InputStream inputStream, OutputStream outputStream, boolean z) {
        return createPump(inputStream, outputStream, z, true);
    }

    protected Thread createPump(InputStream inputStream, OutputStream outputStream, boolean z, boolean z2) {
        StreamPumper streamPumper = new StreamPumper(inputStream, outputStream, z, z2);
        streamPumper.setAutoflush(true);
        ThreadWithPumper threadWithPumper = new ThreadWithPumper(streamPumper);
        threadWithPumper.setDaemon(true);
        return threadWithPumper;
    }

    protected final void finish(Thread thread) {
        if (thread == null) {
            return;
        }
        StreamPumper streamPumper = null;
        try {
            if (thread instanceof ThreadWithPumper) {
                streamPumper = ((ThreadWithPumper) thread).getPumper();
            }
            if ((streamPumper != null && streamPumper.isFinished()) || !thread.isAlive()) {
                return;
            }
            thread.join(JOIN_TIMEOUT);
            if (streamPumper != null && !streamPumper.isFinished()) {
                streamPumper.stop();
            }
            while (true) {
                if (streamPumper != null) {
                    if (streamPumper.isFinished()) {
                        return;
                    }
                }
                if (!thread.isAlive()) {
                    return;
                }
                thread.interrupt();
                thread.join(JOIN_TIMEOUT);
            }
        } catch (InterruptedException e) {
        }
    }

    protected OutputStream getErr() {
        return this.err;
    }

    protected OutputStream getOut() {
        return this.out;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessErrorStream(InputStream inputStream) {
        if (this.err != null) {
            createProcessErrorPump(inputStream, this.err);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessInputStream(OutputStream outputStream) {
        if (this.input != null) {
            this.inputThread = createPump(this.input, outputStream, true, this.nonBlockingRead);
            return;
        }
        try {
            outputStream.close();
        } catch (IOException e) {
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessOutputStream(InputStream inputStream) {
        createProcessOutputPump(inputStream, this.out);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void start() {
        this.outputThread.start();
        this.errorThread.start();
        if (this.inputThread != null) {
            this.inputThread.start();
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void stop() {
        finish(this.inputThread);
        try {
            this.err.flush();
        } catch (IOException e) {
        }
        try {
            this.out.flush();
        } catch (IOException e2) {
        }
        finish(this.outputThread);
        finish(this.errorThread);
    }
}
