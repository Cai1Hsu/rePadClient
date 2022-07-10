package com.mongodb.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class SimplePool<T> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private boolean _closed;
    protected final String _name;
    private final Semaphore _sem;
    protected final int _size;
    protected final List<T> _avail = new ArrayList();
    protected final Set<T> _out = new HashSet();

    protected abstract T createNew();

    static {
        $assertionsDisabled = !SimplePool.class.desiredAssertionStatus();
    }

    public SimplePool(String name, int size) {
        this._name = name;
        this._size = size;
        this._sem = new Semaphore(size);
    }

    public void cleanup(T t) {
    }

    protected int pick(int recommended, boolean couldCreate) {
        return recommended;
    }

    public void done(T t) {
        synchronized (this) {
            if (this._closed) {
                cleanup(t);
                return;
            }
            assertConditions();
            if (!this._out.remove(t)) {
                throw new RuntimeException("trying to put something back in the pool wasn't checked out");
            }
            this._avail.add(t);
            this._sem.release();
        }
    }

    private void assertConditions() {
        if ($assertionsDisabled || getTotal() <= getMaxSize()) {
            return;
        }
        throw new AssertionError();
    }

    public void remove(T t) {
        done(t);
    }

    public T get() throws InterruptedException {
        return get(-1L);
    }

    public T get(long waitTime) throws InterruptedException {
        T t;
        if (!permitAcquired(waitTime)) {
            return null;
        }
        synchronized (this) {
            assertConditions();
            int toTake = pick(this._avail.size() - 1, getTotal() < getMaxSize());
            if (toTake >= 0) {
                t = this._avail.remove(toTake);
            } else {
                t = createNewAndReleasePermitIfFailure();
            }
            this._out.add(t);
        }
        return t;
    }

    private T createNewAndReleasePermitIfFailure() {
        try {
            T newMember = createNew();
            if (newMember == null) {
                throw new IllegalStateException("null pool members are not allowed");
            }
            return newMember;
        } catch (Error e) {
            this._sem.release();
            throw e;
        } catch (RuntimeException e2) {
            this._sem.release();
            throw e2;
        }
    }

    private boolean permitAcquired(long waitTime) throws InterruptedException {
        if (waitTime > 0) {
            return this._sem.tryAcquire(waitTime, TimeUnit.MILLISECONDS);
        }
        if (waitTime < 0) {
            this._sem.acquire();
            return true;
        }
        return this._sem.tryAcquire();
    }

    protected synchronized void close() {
        this._closed = true;
        for (T t : this._avail) {
            cleanup(t);
        }
        this._avail.clear();
        this._out.clear();
    }

    public String getName() {
        return this._name;
    }

    public synchronized int getTotal() {
        return this._avail.size() + this._out.size();
    }

    public synchronized int getInUse() {
        return this._out.size();
    }

    public synchronized int getAvailable() {
        return this._avail.size();
    }

    public int getMaxSize() {
        return this._size;
    }

    public synchronized String toString() {
        StringBuilder buf;
        buf = new StringBuilder();
        buf.append("pool: ").append(this._name).append(" maxToKeep: ").append(this._size).append(" avail ").append(this._avail.size()).append(" out ").append(this._out.size());
        return buf.toString();
    }
}
