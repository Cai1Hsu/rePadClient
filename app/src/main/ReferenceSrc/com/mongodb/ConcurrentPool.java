package com.mongodb;

import java.util.Iterator;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
class ConcurrentPool<T> {
    private final Deque<T> available = new ConcurrentLinkedDeque();
    private volatile boolean closed;
    private final ItemFactory<T> itemFactory;
    private final int maxSize;
    private final Semaphore permits;

    /* loaded from: classes.dex */
    interface ItemFactory<T> {
        void close(T t);

        T create();

        boolean shouldPrune(T t);
    }

    public ConcurrentPool(int maxSize, ItemFactory<T> itemFactory) {
        this.maxSize = maxSize;
        this.itemFactory = itemFactory;
        this.permits = new Semaphore(maxSize, true);
    }

    public void release(T t) {
        release(t, false);
    }

    public void release(T t, boolean prune) {
        if (t == null) {
            throw new IllegalArgumentException("Can not return a null item to the pool");
        }
        if (this.closed) {
            close(t);
            return;
        }
        if (prune) {
            close(t);
        } else {
            this.available.addLast(t);
        }
        releasePermit();
    }

    public T get() {
        return get(-1L, TimeUnit.MILLISECONDS);
    }

    public T get(long timeout, TimeUnit timeUnit) {
        if (this.closed) {
            throw new IllegalStateException("The pool is closed");
        }
        if (!acquirePermit(timeout, timeUnit)) {
            throw new MongoTimeoutException(String.format("Timeout waiting for a pooled item after %d %s", Long.valueOf(timeout), timeUnit));
        }
        T t = this.available.pollLast();
        if (t == null) {
            return createNewAndReleasePermitIfFailure();
        }
        return t;
    }

    public void prune() {
        int currentAvailableCount = getAvailableCount();
        for (int numAttempts = 0; numAttempts < currentAvailableCount && acquirePermit(10L, TimeUnit.MILLISECONDS); numAttempts++) {
            T cur = this.available.pollFirst();
            if (cur == null) {
                releasePermit();
                return;
            }
            release(cur, this.itemFactory.shouldPrune(cur));
        }
    }

    public void ensureMinSize(int minSize) {
        while (getCount() < minSize && acquirePermit(10L, TimeUnit.MILLISECONDS)) {
            release(createNewAndReleasePermitIfFailure());
        }
    }

    private T createNewAndReleasePermitIfFailure() {
        try {
            T newMember = this.itemFactory.create();
            if (newMember == null) {
                throw new MongoInternalException("The factory for the pool created a null item");
            }
            return newMember;
        } catch (RuntimeException e) {
            this.permits.release();
            throw e;
        }
    }

    protected boolean acquirePermit(long timeout, TimeUnit timeUnit) {
        try {
            if (this.closed) {
                return false;
            }
            if (timeout >= 0) {
                return this.permits.tryAcquire(timeout, timeUnit);
            }
            this.permits.acquire();
            return true;
        } catch (InterruptedException e) {
            throw new MongoInterruptedException("Interrupted acquiring a permit to retrieve an item from the pool ", e);
        }
    }

    protected void releasePermit() {
        this.permits.release();
    }

    public void close() {
        this.closed = true;
        Iterator<T> iter = this.available.iterator();
        while (iter.hasNext()) {
            T t = iter.next();
            close(t);
            iter.remove();
        }
    }

    public int getMaxSize() {
        return this.maxSize;
    }

    public int getInUseCount() {
        return this.maxSize - this.permits.availablePermits();
    }

    public int getAvailableCount() {
        return this.available.size();
    }

    public int getCount() {
        return getInUseCount() + getAvailableCount();
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("pool: ").append(" maxSize: ").append(this.maxSize).append(" availableCount ").append(getAvailableCount()).append(" inUseCount ").append(getInUseCount());
        return buf.toString();
    }

    private void close(T t) {
        try {
            this.itemFactory.close(t);
        } catch (RuntimeException e) {
        }
    }
}
