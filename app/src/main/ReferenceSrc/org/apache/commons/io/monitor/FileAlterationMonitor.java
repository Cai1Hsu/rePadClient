package org.apache.commons.io.monitor;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ThreadFactory;

/* loaded from: classes.jar:org/apache/commons/io/monitor/FileAlterationMonitor.class */
public final class FileAlterationMonitor implements Runnable {
    private final long interval;
    private final List<FileAlterationObserver> observers;
    private volatile boolean running;
    private Thread thread;
    private ThreadFactory threadFactory;

    public FileAlterationMonitor() {
        this(10000L);
    }

    public FileAlterationMonitor(long j) {
        this.observers = new CopyOnWriteArrayList();
        this.thread = null;
        this.running = false;
        this.interval = j;
    }

    public FileAlterationMonitor(long j, FileAlterationObserver... fileAlterationObserverArr) {
        this(j);
        if (fileAlterationObserverArr != null) {
            for (FileAlterationObserver fileAlterationObserver : fileAlterationObserverArr) {
                addObserver(fileAlterationObserver);
            }
        }
    }

    public void addObserver(FileAlterationObserver fileAlterationObserver) {
        if (fileAlterationObserver != null) {
            this.observers.add(fileAlterationObserver);
        }
    }

    public long getInterval() {
        return this.interval;
    }

    public Iterable<FileAlterationObserver> getObservers() {
        return this.observers;
    }

    public void removeObserver(FileAlterationObserver fileAlterationObserver) {
        if (fileAlterationObserver != null) {
            do {
            } while (this.observers.remove(fileAlterationObserver));
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        while (this.running) {
            for (FileAlterationObserver fileAlterationObserver : this.observers) {
                fileAlterationObserver.checkAndNotify();
            }
            if (!this.running) {
                return;
            }
            try {
                Thread.sleep(this.interval);
            } catch (InterruptedException e) {
            }
        }
    }

    public void setThreadFactory(ThreadFactory threadFactory) {
        synchronized (this) {
            this.threadFactory = threadFactory;
        }
    }

    public void start() throws Exception {
        synchronized (this) {
            if (this.running) {
                throw new IllegalStateException("Monitor is already running");
            }
            for (FileAlterationObserver fileAlterationObserver : this.observers) {
                fileAlterationObserver.initialize();
            }
            this.running = true;
            if (this.threadFactory != null) {
                this.thread = this.threadFactory.newThread(this);
            } else {
                this.thread = new Thread(this);
            }
            this.thread.start();
        }
    }

    public void stop() throws Exception {
        synchronized (this) {
            stop(this.interval);
        }
    }

    public void stop(long j) throws Exception {
        synchronized (this) {
            if (!this.running) {
                throw new IllegalStateException("Monitor is not running");
            }
            this.running = false;
            try {
                this.thread.join(j);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            for (FileAlterationObserver fileAlterationObserver : this.observers) {
                fileAlterationObserver.destroy();
            }
        }
    }
}
