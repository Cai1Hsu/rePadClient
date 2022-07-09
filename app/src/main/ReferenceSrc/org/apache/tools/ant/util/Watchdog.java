package org.apache.tools.ant.util;

import java.util.Enumeration;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/util/Watchdog.class */
public class Watchdog implements Runnable {
    public static final String ERROR_INVALID_TIMEOUT = "timeout less than 1.";
    private Vector observers = new Vector(1);
    private volatile boolean stopped = false;
    private long timeout;

    public Watchdog(long j) {
        this.timeout = -1L;
        if (j < 1) {
            throw new IllegalArgumentException(ERROR_INVALID_TIMEOUT);
        }
        this.timeout = j;
    }

    public void addTimeoutObserver(TimeoutObserver timeoutObserver) {
        this.observers.addElement(timeoutObserver);
    }

    protected final void fireTimeoutOccured() {
        Enumeration elements = this.observers.elements();
        while (elements.hasMoreElements()) {
            ((TimeoutObserver) elements.nextElement()).timeoutOccured(this);
        }
    }

    public void removeTimeoutObserver(TimeoutObserver timeoutObserver) {
        this.observers.removeElement(timeoutObserver);
    }

    @Override // java.lang.Runnable
    public void run() {
        synchronized (this) {
            long currentTimeMillis = System.currentTimeMillis();
            long j = currentTimeMillis + this.timeout;
            while (!this.stopped && j > currentTimeMillis) {
                try {
                    wait(j - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                } catch (InterruptedException e) {
                }
            }
            if (!this.stopped) {
                fireTimeoutOccured();
            }
        }
    }

    public void start() {
        synchronized (this) {
            this.stopped = false;
            Thread thread = new Thread(this, "WATCHDOG");
            thread.setDaemon(true);
            thread.start();
        }
    }

    public void stop() {
        synchronized (this) {
            this.stopped = true;
            notifyAll();
        }
    }
}
