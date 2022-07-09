package android.support.v4.util;

/* loaded from: classes.jar:android/support/v4/util/Pools.class */
public final class Pools {

    /* loaded from: classes.jar:android/support/v4/util/Pools$Pool.class */
    public interface Pool<T> {
        T acquire();

        boolean release(T t);
    }

    /* loaded from: classes.jar:android/support/v4/util/Pools$SimplePool.class */
    public static class SimplePool<T> implements Pool<T> {
        private final Object[] mPool;
        private int mPoolSize;

        public SimplePool(int i) {
            if (i <= 0) {
                throw new IllegalArgumentException("The max pool size must be > 0");
            }
            this.mPool = new Object[i];
        }

        private boolean isInPool(T t) {
            boolean z;
            int i = 0;
            while (true) {
                if (i >= this.mPoolSize) {
                    z = false;
                    break;
                } else if (this.mPool[i] == t) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
            return z;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r0v8, types: [java.lang.Object[]] */
        /* JADX WARN: Type inference failed for: r0v9 */
        @Override // android.support.v4.util.Pools.Pool
        public T acquire() {
            T t;
            if (this.mPoolSize > 0) {
                int i = this.mPoolSize - 1;
                t = this.mPool[i];
                this.mPool[i] = null;
                this.mPoolSize--;
            } else {
                t = null;
            }
            return t;
        }

        @Override // android.support.v4.util.Pools.Pool
        public boolean release(T t) {
            boolean z;
            if (isInPool(t)) {
                throw new IllegalStateException("Already in the pool!");
            }
            if (this.mPoolSize < this.mPool.length) {
                this.mPool[this.mPoolSize] = t;
                this.mPoolSize++;
                z = true;
            } else {
                z = false;
            }
            return z;
        }
    }

    /* loaded from: classes.jar:android/support/v4/util/Pools$SynchronizedPool.class */
    public static class SynchronizedPool<T> extends SimplePool<T> {
        private final Object mLock = new Object();

        public SynchronizedPool(int i) {
            super(i);
        }

        @Override // android.support.v4.util.Pools.SimplePool, android.support.v4.util.Pools.Pool
        public T acquire() {
            T t;
            synchronized (this.mLock) {
                t = (T) super.acquire();
            }
            return t;
        }

        @Override // android.support.v4.util.Pools.SimplePool, android.support.v4.util.Pools.Pool
        public boolean release(T t) {
            boolean release;
            synchronized (this.mLock) {
                release = super.release(t);
            }
            return release;
        }
    }

    private Pools() {
    }
}
