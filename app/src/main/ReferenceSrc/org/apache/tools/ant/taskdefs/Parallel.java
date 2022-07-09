package org.apache.tools.ant.taskdefs;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.property.LocalProperties;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Parallel.class */
public class Parallel extends Task implements TaskContainer {
    private static final int NUMBER_TRIES = 100;
    private TaskList daemonTasks;
    private StringBuffer exceptionMessage;
    private boolean failOnAny;
    private Throwable firstException;
    private Location firstLocation;
    private volatile boolean stillRunning;
    private boolean timedOut;
    private long timeout;
    private Vector nestedTasks = new Vector();
    private final Object semaphore = new Object();
    private int numThreads = 0;
    private int numThreadsPerProcessor = 0;
    private int numExceptions = 0;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Parallel$TaskList.class */
    public static class TaskList implements TaskContainer {
        private List tasks = new ArrayList();

        @Override // org.apache.tools.ant.TaskContainer
        public void addTask(Task task) {
            this.tasks.add(task);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Parallel$TaskRunnable.class */
    private class TaskRunnable implements Runnable {
        private Throwable exception;
        private boolean finished;
        private Task task;
        private final Parallel this$0;
        private volatile Thread thread;

        TaskRunnable(Parallel parallel, Task task) {
            this.this$0 = parallel;
            this.task = task;
        }

        public Throwable getException() {
            return this.exception;
        }

        void interrupt() {
            this.thread.interrupt();
        }

        boolean isFinished() {
            return this.finished;
        }

        /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
        /* JADX DEBUG: Finally have unexpected throw blocks count: 3, expect 1 */
        @Override // java.lang.Runnable
        public void run() {
            try {
                LocalProperties.get(this.this$0.getProject()).copy();
                this.thread = Thread.currentThread();
                this.task.perform();
                synchronized (this.this$0.semaphore) {
                    this.finished = true;
                    this.this$0.semaphore.notifyAll();
                }
            } catch (Throwable th) {
                try {
                    this.exception = th;
                    if (this.this$0.failOnAny) {
                        this.this$0.stillRunning = false;
                    }
                    synchronized (this.this$0.semaphore) {
                        this.finished = true;
                        this.this$0.semaphore.notifyAll();
                    }
                } catch (Throwable th2) {
                    synchronized (this.this$0.semaphore) {
                        this.finished = true;
                        this.this$0.semaphore.notifyAll();
                        throw th2;
                    }
                }
            }
        }
    }

    private void killAll(TaskRunnable[] taskRunnableArr) {
        int i;
        int i2 = 0;
        do {
            boolean z = false;
            int i3 = 0;
            while (i3 < taskRunnableArr.length) {
                boolean z2 = z;
                if (taskRunnableArr[i3] != null) {
                    z2 = z;
                    if (!taskRunnableArr[i3].isFinished()) {
                        taskRunnableArr[i3].interrupt();
                        Thread.yield();
                        z2 = true;
                    }
                }
                i3++;
                z = z2;
            }
            i = i2;
            if (z) {
                i = i2 + 1;
                Thread.yield();
            }
            if (!z) {
                return;
            }
            i2 = i;
        } while (i < 100);
    }

    private void processExceptions(TaskRunnable[] taskRunnableArr) {
        if (taskRunnableArr == null) {
            return;
        }
        for (TaskRunnable taskRunnable : taskRunnableArr) {
            Throwable exception = taskRunnable.getException();
            if (exception != null) {
                this.numExceptions++;
                if (this.firstException == null) {
                    this.firstException = exception;
                }
                if ((exception instanceof BuildException) && this.firstLocation == Location.UNKNOWN_LOCATION) {
                    this.firstLocation = ((BuildException) exception).getLocation();
                }
                this.exceptionMessage.append(StringUtils.LINE_SEP);
                this.exceptionMessage.append(exception.getMessage());
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0203  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void spinThreads() throws BuildException {
        int i;
        int i2;
        boolean z;
        int size = this.nestedTasks.size();
        TaskRunnable[] taskRunnableArr = new TaskRunnable[size];
        this.stillRunning = true;
        this.timedOut = false;
        int i3 = 0;
        Enumeration elements = this.nestedTasks.elements();
        while (elements.hasMoreElements()) {
            taskRunnableArr[i3] = new TaskRunnable(this, (Task) elements.nextElement());
            i3++;
        }
        int i4 = size < this.numThreads ? size : this.numThreads;
        TaskRunnable[] taskRunnableArr2 = new TaskRunnable[i4];
        ThreadGroup threadGroup = new ThreadGroup("parallel");
        TaskRunnable[] taskRunnableArr3 = null;
        if (this.daemonTasks != null) {
            taskRunnableArr3 = null;
            if (this.daemonTasks.tasks.size() != 0) {
                taskRunnableArr3 = new TaskRunnable[this.daemonTasks.tasks.size()];
            }
        }
        synchronized (this.semaphore) {
        }
        synchronized (this.semaphore) {
            try {
                if (taskRunnableArr3 != null) {
                    for (int i5 = 0; i5 < taskRunnableArr3.length; i5++) {
                        taskRunnableArr3[i5] = new TaskRunnable(this, (Task) this.daemonTasks.tasks.get(i5));
                        Thread thread = new Thread(threadGroup, taskRunnableArr3[i5]);
                        thread.setDaemon(true);
                        thread.start();
                    }
                }
                int i6 = 0;
                i = 0;
                while (i6 < i4) {
                    taskRunnableArr2[i6] = taskRunnableArr[i];
                    new Thread(threadGroup, taskRunnableArr2[i6]).start();
                    i6++;
                    i++;
                }
                i2 = i;
            } catch (Throwable th) {
                th = th;
            }
            try {
                if (this.timeout != 0) {
                    int i7 = i;
                    int i8 = i;
                    int i9 = i;
                    new Thread(this) { // from class: org.apache.tools.ant.taskdefs.Parallel.1
                        private final Parallel this$0;

                        {
                            this.this$0 = this;
                        }

                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            synchronized (this) {
                                try {
                                    wait(this.this$0.timeout);
                                    synchronized (this.this$0.semaphore) {
                                        this.this$0.stillRunning = false;
                                        this.this$0.timedOut = true;
                                        this.this$0.semaphore.notifyAll();
                                    }
                                } catch (InterruptedException e) {
                                }
                            }
                        }
                    }.start();
                    i2 = i;
                }
                while (i2 < size) {
                    try {
                        if (!this.stillRunning) {
                            break;
                        }
                        for (int i10 = 0; i10 < i4; i10++) {
                            if (taskRunnableArr2[i10] == null || taskRunnableArr2[i10].isFinished()) {
                                taskRunnableArr2[i10] = taskRunnableArr[i2];
                                try {
                                    new Thread(threadGroup, taskRunnableArr2[i10]).start();
                                    i2++;
                                    break;
                                } catch (InterruptedException e) {
                                    z = true;
                                    if (!this.timedOut) {
                                        killAll(taskRunnableArr2);
                                    }
                                    if (!z) {
                                    }
                                }
                            }
                        }
                        this.semaphore.wait();
                    } catch (InterruptedException e2) {
                    }
                }
                while (this.stillRunning) {
                    int i11 = 0;
                    while (true) {
                        if (i11 >= i4) {
                            this.stillRunning = false;
                            break;
                        } else if (taskRunnableArr2[i11] != null && !taskRunnableArr2[i11].isFinished()) {
                            int i12 = i2;
                            this.semaphore.wait();
                            break;
                        } else {
                            i11++;
                        }
                    }
                }
                z = false;
                if (!this.timedOut && !this.failOnAny) {
                    killAll(taskRunnableArr2);
                }
                if (!z) {
                    throw new BuildException("Parallel execution interrupted.");
                }
                if (this.timedOut) {
                    throw new BuildException("Parallel execution timed out");
                }
                this.exceptionMessage = new StringBuffer();
                this.numExceptions = 0;
                this.firstException = null;
                this.firstLocation = Location.UNKNOWN_LOCATION;
                processExceptions(taskRunnableArr3);
                processExceptions(taskRunnableArr);
                if (this.numExceptions == 1) {
                    if (!(this.firstException instanceof BuildException)) {
                        throw new BuildException(this.firstException);
                    }
                    throw ((BuildException) this.firstException);
                } else if (this.numExceptions > 1) {
                    throw new BuildException(this.exceptionMessage.toString(), this.firstLocation);
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }

    private void updateThreadCounts() {
        if (this.numThreadsPerProcessor != 0) {
            this.numThreads = Runtime.getRuntime().availableProcessors() * this.numThreadsPerProcessor;
        }
    }

    public void addDaemons(TaskList taskList) {
        if (this.daemonTasks != null) {
            throw new BuildException("Only one daemon group is supported");
        }
        this.daemonTasks = taskList;
    }

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        this.nestedTasks.addElement(task);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        updateThreadCounts();
        if (this.numThreads == 0) {
            this.numThreads = this.nestedTasks.size();
        }
        spinThreads();
    }

    public void setFailOnAny(boolean z) {
        this.failOnAny = z;
    }

    public void setPollInterval(int i) {
    }

    public void setThreadCount(int i) {
        this.numThreads = i;
    }

    public void setThreadsPerProcessor(int i) {
        this.numThreadsPerProcessor = i;
    }

    public void setTimeout(long j) {
        this.timeout = j;
    }
}
