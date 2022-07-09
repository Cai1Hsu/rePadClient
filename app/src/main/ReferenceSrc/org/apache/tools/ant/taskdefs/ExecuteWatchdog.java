package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.TimeoutObserver;
import org.apache.tools.ant.util.Watchdog;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ExecuteWatchdog.class */
public class ExecuteWatchdog implements TimeoutObserver {
    private Exception caught;
    private volatile boolean killedProcess;
    private Process process;
    private volatile boolean watch;
    private Watchdog watchdog;

    public ExecuteWatchdog(int i) {
        this(i);
    }

    public ExecuteWatchdog(long j) {
        this.watch = false;
        this.caught = null;
        this.killedProcess = false;
        this.watchdog = new Watchdog(j);
        this.watchdog.addTimeoutObserver(this);
    }

    public void checkException() throws BuildException {
        synchronized (this) {
            if (this.caught != null) {
                throw new BuildException(new StringBuffer().append("Exception in ExecuteWatchdog.run: ").append(this.caught.getMessage()).toString(), this.caught);
            }
        }
    }

    protected void cleanUp() {
        synchronized (this) {
            this.watch = false;
            this.process = null;
        }
    }

    public boolean isWatching() {
        return this.watch;
    }

    public boolean killedProcess() {
        return this.killedProcess;
    }

    public void start(Process process) {
        synchronized (this) {
            if (process == null) {
                throw new NullPointerException("process is null.");
            }
            if (this.process != null) {
                throw new IllegalStateException("Already running.");
            }
            this.caught = null;
            this.killedProcess = false;
            this.watch = true;
            this.process = process;
            this.watchdog.start();
        }
    }

    public void stop() {
        synchronized (this) {
            this.watchdog.stop();
            cleanUp();
        }
    }

    @Override // org.apache.tools.ant.util.TimeoutObserver
    public void timeoutOccured(Watchdog watchdog) {
        synchronized (this) {
            try {
                try {
                    this.process.exitValue();
                } catch (Exception e) {
                    this.caught = e;
                    cleanUp();
                }
            } catch (IllegalThreadStateException e2) {
                if (this.watch) {
                    this.killedProcess = true;
                    this.process.destroy();
                }
            }
            cleanUp();
        }
    }
}
