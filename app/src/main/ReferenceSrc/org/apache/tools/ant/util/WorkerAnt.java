package org.apache.tools.ant.util;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/util/WorkerAnt.class */
public class WorkerAnt extends Thread {
    public static final String ERROR_NO_TASK = "No task defined";
    private volatile BuildException buildException;
    private volatile Throwable exception;
    private volatile boolean finished;
    private Object notify;
    private Task task;

    public WorkerAnt(Task task) {
        this(task, null);
    }

    public WorkerAnt(Task task, Object obj) {
        this.finished = false;
        this.task = task;
        this.notify = obj != null ? obj : this;
    }

    private void caught(Throwable th) {
        synchronized (this) {
            this.exception = th;
            this.buildException = th instanceof BuildException ? (BuildException) th : new BuildException(th);
        }
    }

    public BuildException getBuildException() {
        BuildException buildException;
        synchronized (this) {
            buildException = this.buildException;
        }
        return buildException;
    }

    public Throwable getException() {
        Throwable th;
        synchronized (this) {
            th = this.exception;
        }
        return th;
    }

    public Task getTask() {
        return this.task;
    }

    public boolean isFinished() {
        boolean z;
        synchronized (this) {
            z = this.finished;
        }
        return z;
    }

    public void rethrowAnyBuildException() {
        BuildException buildException = getBuildException();
        if (buildException != null) {
            throw buildException;
        }
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    /* JADX DEBUG: Finally have unexpected throw blocks count: 3, expect 1 */
    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            if (this.task != null) {
                this.task.execute();
            }
            synchronized (this.notify) {
                this.finished = true;
                this.notify.notifyAll();
            }
        } catch (Throwable th) {
            try {
                caught(th);
                synchronized (this.notify) {
                    this.finished = true;
                    this.notify.notifyAll();
                }
            } catch (Throwable th2) {
                synchronized (this.notify) {
                    this.finished = true;
                    this.notify.notifyAll();
                    throw th2;
                }
            }
        }
    }

    public void waitUntilFinished(long j) throws InterruptedException {
        synchronized (this.notify) {
            if (!this.finished) {
                this.notify.wait(j);
            }
        }
    }
}
