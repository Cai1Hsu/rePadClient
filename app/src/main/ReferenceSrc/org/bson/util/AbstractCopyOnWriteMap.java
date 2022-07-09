package org.bson.util;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.tools.ant.taskdefs.optional.clearcase.ClearCase;
import org.bson.util.annotations.GuardedBy;
import org.bson.util.annotations.ThreadSafe;

@ThreadSafe
/* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap.class */
abstract class AbstractCopyOnWriteMap<K, V, M extends Map<K, V>> implements ConcurrentMap<K, V>, Serializable {
    private static final long serialVersionUID = 4508989182041753878L;
    @GuardedBy(ClearCase.COMMAND_LOCK)
    private volatile M delegate;
    private final transient Lock lock = new ReentrantLock();
    private final View<K, V> view;

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$CollectionView.class */
    protected static abstract class CollectionView<E> implements Collection<E> {
        protected CollectionView() {
        }

        @Override // java.util.Collection
        public final boolean add(E e) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public final boolean addAll(Collection<? extends E> collection) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public final boolean contains(Object obj) {
            return getDelegate().contains(obj);
        }

        @Override // java.util.Collection
        public final boolean containsAll(Collection<?> collection) {
            return getDelegate().containsAll(collection);
        }

        @Override // java.util.Collection
        public boolean equals(Object obj) {
            return getDelegate().equals(obj);
        }

        abstract Collection<E> getDelegate();

        @Override // java.util.Collection
        public int hashCode() {
            return getDelegate().hashCode();
        }

        @Override // java.util.Collection
        public final boolean isEmpty() {
            return getDelegate().isEmpty();
        }

        @Override // java.util.Collection, java.lang.Iterable
        public final Iterator<E> iterator() {
            return new UnmodifiableIterator(getDelegate().iterator());
        }

        @Override // java.util.Collection
        public final int size() {
            return getDelegate().size();
        }

        @Override // java.util.Collection
        public final Object[] toArray() {
            return getDelegate().toArray();
        }

        @Override // java.util.Collection
        public final <T> T[] toArray(T[] tArr) {
            return (T[]) getDelegate().toArray(tArr);
        }

        public String toString() {
            return getDelegate().toString();
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$EntrySet.class */
    private class EntrySet extends CollectionView<Map.Entry<K, V>> implements Set<Map.Entry<K, V>> {
        private EntrySet() {
            AbstractCopyOnWriteMap.this = r4;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v13, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public void clear() {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                copy.entrySet().clear();
                AbstractCopyOnWriteMap.this.set(copy);
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.CollectionView
        Collection<Map.Entry<K, V>> getDelegate() {
            return AbstractCopyOnWriteMap.this.delegate.entrySet();
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v17, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean remove(Object obj) {
            boolean remove;
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                if (!contains(obj)) {
                    remove = false;
                } else {
                    Map copy = AbstractCopyOnWriteMap.this.copy();
                    remove = copy.entrySet().remove(obj);
                    AbstractCopyOnWriteMap.this.set(copy);
                    AbstractCopyOnWriteMap.this.lock.unlock();
                }
                return remove;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean removeAll = copy.entrySet().removeAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return removeAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean retainAll = copy.entrySet().retainAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return retainAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$Immutable.class */
    final class Immutable extends View<K, V> implements Serializable {
        private static final long serialVersionUID = -4158727180429303818L;

        Immutable() {
            AbstractCopyOnWriteMap.this = r4;
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Set<Map.Entry<K, V>> entrySet() {
            return Collections.unmodifiableSet(AbstractCopyOnWriteMap.this.delegate.entrySet());
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Set<K> keySet() {
            return Collections.unmodifiableSet(AbstractCopyOnWriteMap.this.delegate.keySet());
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Collection<V> values() {
            return Collections.unmodifiableCollection(AbstractCopyOnWriteMap.this.delegate.values());
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$KeySet.class */
    private class KeySet extends CollectionView<K> implements Set<K> {
        private KeySet() {
            AbstractCopyOnWriteMap.this = r4;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v13, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public void clear() {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                copy.keySet().clear();
                AbstractCopyOnWriteMap.this.set(copy);
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.CollectionView
        Collection<K> getDelegate() {
            return AbstractCopyOnWriteMap.this.delegate.keySet();
        }

        @Override // java.util.Collection, java.util.Set
        public boolean remove(Object obj) {
            return AbstractCopyOnWriteMap.this.remove(obj) != null;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean removeAll = copy.keySet().removeAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return removeAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean retainAll = copy.keySet().retainAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return retainAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$Mutable.class */
    final class Mutable extends View<K, V> implements Serializable {
        private static final long serialVersionUID = 1624520291194797634L;
        private final transient AbstractCopyOnWriteMap<K, V, M>.EntrySet entrySet;
        private final transient AbstractCopyOnWriteMap<K, V, M>.KeySet keySet;
        private final transient AbstractCopyOnWriteMap<K, V, M>.Values values;

        Mutable() {
            AbstractCopyOnWriteMap.this = r7;
            this.keySet = new KeySet();
            this.entrySet = new EntrySet();
            this.values = new Values();
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Set<Map.Entry<K, V>> entrySet() {
            return this.entrySet;
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Set<K> keySet() {
            return this.keySet;
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.View
        public Collection<V> values() {
            return this.values;
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$UnmodifiableIterator.class */
    private static class UnmodifiableIterator<T> implements Iterator<T> {
        private final Iterator<T> delegate;

        public UnmodifiableIterator(Iterator<T> it) {
            this.delegate = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.delegate.hasNext();
        }

        @Override // java.util.Iterator
        public T next() {
            return this.delegate.next();
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$Values.class */
    private final class Values extends CollectionView<V> {
        private Values() {
            AbstractCopyOnWriteMap.this = r4;
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v13, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public void clear() {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                copy.values().clear();
                AbstractCopyOnWriteMap.this.set(copy);
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        @Override // org.bson.util.AbstractCopyOnWriteMap.CollectionView
        Collection<V> getDelegate() {
            return AbstractCopyOnWriteMap.this.delegate.values();
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v17, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean remove(Object obj) {
            boolean remove;
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                if (!contains(obj)) {
                    remove = false;
                } else {
                    Map copy = AbstractCopyOnWriteMap.this.copy();
                    remove = copy.values().remove(obj);
                    AbstractCopyOnWriteMap.this.set(copy);
                    AbstractCopyOnWriteMap.this.lock.unlock();
                }
                return remove;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean removeAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean removeAll = copy.values().removeAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return removeAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }

        /* JADX DEBUG: Multi-variable search result rejected for r0v14, resolved type: org.bson.util.AbstractCopyOnWriteMap */
        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean retainAll(Collection<?> collection) {
            AbstractCopyOnWriteMap.this.lock.lock();
            try {
                Map copy = AbstractCopyOnWriteMap.this.copy();
                boolean retainAll = copy.values().retainAll(collection);
                AbstractCopyOnWriteMap.this.set(copy);
                return retainAll;
            } finally {
                AbstractCopyOnWriteMap.this.lock.unlock();
            }
        }
    }

    /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$View.class */
    public static abstract class View<K, V> {

        /* loaded from: classes.jar:org/bson/util/AbstractCopyOnWriteMap$View$Type.class */
        public enum Type {
            STABLE { // from class: org.bson.util.AbstractCopyOnWriteMap.View.Type.1
                @Override // org.bson.util.AbstractCopyOnWriteMap.View.Type
                <K, V, M extends Map<K, V>> View<K, V> get(AbstractCopyOnWriteMap<K, V, M> abstractCopyOnWriteMap) {
                    abstractCopyOnWriteMap.getClass();
                    return new Immutable();
                }
            },
            LIVE { // from class: org.bson.util.AbstractCopyOnWriteMap.View.Type.2
                @Override // org.bson.util.AbstractCopyOnWriteMap.View.Type
                <K, V, M extends Map<K, V>> View<K, V> get(AbstractCopyOnWriteMap<K, V, M> abstractCopyOnWriteMap) {
                    abstractCopyOnWriteMap.getClass();
                    return new Mutable();
                }
            };

            abstract <K, V, M extends Map<K, V>> View<K, V> get(AbstractCopyOnWriteMap<K, V, M> abstractCopyOnWriteMap);
        }

        View() {
        }

        abstract Set<Map.Entry<K, V>> entrySet();

        abstract Set<K> keySet();

        abstract Collection<V> values();
    }

    protected <N extends Map<? extends K, ? extends V>> AbstractCopyOnWriteMap(N n, View.Type type) {
        this.delegate = (M) Assertions.notNull("delegate", copy((Map) Assertions.notNull("map", n)));
        this.view = ((View.Type) Assertions.notNull("viewType", type)).get(this);
    }

    private boolean equals(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    @Override // java.util.Map
    public final void clear() {
        this.lock.lock();
        try {
            set(copy(Collections.emptyMap()));
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return this.delegate.containsKey(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return this.delegate.containsValue(obj);
    }

    protected M copy() {
        this.lock.lock();
        try {
            return copy(this.delegate);
        } finally {
            this.lock.unlock();
        }
    }

    @GuardedBy(ClearCase.COMMAND_LOCK)
    abstract <N extends Map<? extends K, ? extends V>> M copy(N n);

    @Override // java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        return this.view.entrySet();
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        return this.delegate.equals(obj);
    }

    @Override // java.util.Map
    public final V get(Object obj) {
        return (V) this.delegate.get(obj);
    }

    protected final M getDelegate() {
        return this.delegate;
    }

    @Override // java.util.Map
    public final int hashCode() {
        return this.delegate.hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.delegate.isEmpty();
    }

    @Override // java.util.Map
    public final Set<K> keySet() {
        return this.view.keySet();
    }

    @Override // java.util.Map
    public final V put(K k, V v) {
        this.lock.lock();
        try {
            M copy = copy();
            V v2 = (V) copy.put(k, v);
            set(copy);
            return v2;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Map
    public final void putAll(Map<? extends K, ? extends V> map) {
        this.lock.lock();
        try {
            M copy = copy();
            copy.putAll(map);
            set(copy);
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public V putIfAbsent(K k, V v) {
        Object obj;
        this.lock.lock();
        try {
            if (!this.delegate.containsKey(k)) {
                M copy = copy();
                obj = copy.put(k, v);
                set(copy);
            } else {
                obj = this.delegate.get(k);
                this.lock.unlock();
            }
            return (V) obj;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.Map
    public final V remove(Object obj) {
        Object remove;
        this.lock.lock();
        try {
            if (!this.delegate.containsKey(obj)) {
                remove = null;
            } else {
                M copy = copy();
                remove = copy.remove(obj);
                set(copy);
                this.lock.unlock();
            }
            return (V) remove;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public boolean remove(Object obj, Object obj2) {
        boolean z;
        this.lock.lock();
        try {
            if (!this.delegate.containsKey(obj) || !equals(obj2, this.delegate.get(obj))) {
                z = false;
                this.lock.unlock();
            } else {
                M copy = copy();
                copy.remove(obj);
                set(copy);
                z = true;
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public V replace(K k, V v) {
        Object put;
        this.lock.lock();
        try {
            if (!this.delegate.containsKey(k)) {
                put = null;
            } else {
                M copy = copy();
                put = copy.put(k, v);
                set(copy);
                this.lock.unlock();
            }
            return (V) put;
        } finally {
            this.lock.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public boolean replace(K k, V v, V v2) {
        boolean z;
        this.lock.lock();
        try {
            if (!this.delegate.containsKey(k) || !equals(v, this.delegate.get(k))) {
                z = false;
            } else {
                M copy = copy();
                copy.put(k, v2);
                set(copy);
                z = true;
                this.lock.unlock();
            }
            return z;
        } finally {
            this.lock.unlock();
        }
    }

    @GuardedBy(ClearCase.COMMAND_LOCK)
    protected void set(M m) {
        this.delegate = m;
    }

    @Override // java.util.Map
    public final int size() {
        return this.delegate.size();
    }

    public String toString() {
        return this.delegate.toString();
    }

    @Override // java.util.Map
    public final Collection<V> values() {
        return this.view.values();
    }
}
