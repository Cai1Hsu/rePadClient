package org.bson.util;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

@Deprecated
/* loaded from: classes.jar:org/bson/util/SimplePool.class */
public abstract class SimplePool<T> {
    final int _max;
    private Queue<T> _stored;

    public SimplePool() {
        this._stored = new ConcurrentLinkedQueue();
        this._max = 1000;
    }

    public SimplePool(int i) {
        this._stored = new ConcurrentLinkedQueue();
        this._max = i;
    }

    protected abstract T createNew();

    public void done(T t) {
        if (ok(t) && this._stored.size() <= this._max) {
            this._stored.add(t);
        }
    }

    public T get() {
        T poll = this._stored.poll();
        if (poll == null) {
            poll = createNew();
        }
        return poll;
    }

    protected boolean ok(T t) {
        return true;
    }
}
