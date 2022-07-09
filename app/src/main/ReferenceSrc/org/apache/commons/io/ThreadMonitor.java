package org.apache.commons.io;

/* loaded from: classes.jar:org/apache/commons/io/ThreadMonitor.class */
class ThreadMonitor implements Runnable {
    private final Thread thread;
    private final long timeout;

    private ThreadMonitor(Thread thread, long j) {
        this.thread = thread;
        this.timeout = j;
    }

    public static Thread start(long j) {
        return start(Thread.currentThread(), j);
    }

    public static Thread start(Thread thread, long j) {
        Thread thread2 = null;
        if (j > 0) {
            thread2 = new Thread(new ThreadMonitor(thread, j), ThreadMonitor.class.getSimpleName());
            thread2.setDaemon(true);
            thread2.start();
        }
        return thread2;
    }

    public static void stop(Thread thread) {
        if (thread != null) {
            thread.interrupt();
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            Thread.sleep(this.timeout);
            this.thread.interrupt();
        } catch (InterruptedException e) {
        }
    }
}
