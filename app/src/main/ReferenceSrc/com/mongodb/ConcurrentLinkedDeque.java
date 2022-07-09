package com.mongodb;

import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.atomic.AtomicReference;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.dex */
class ConcurrentLinkedDeque<E> extends AbstractCollection<E> implements Deque<E>, Serializable {
    private static final long serialVersionUID = 876323262645176354L;
    private final Node<E> header;
    private final Node<E> trailer;

    /* loaded from: classes.dex */
    static final class Node<E> extends AtomicReference<Node<E>> {
        private static final long serialVersionUID = 876323262645176354L;
        final E element;
        private volatile Node<E> prev;

        Node(E element, Node<E> next, Node<E> prev) {
            super(next);
            this.prev = prev;
            this.element = element;
        }

        Node(Node<E> next) {
            super(next);
            this.prev = this;
            this.element = null;
        }

        private Node<E> getNext() {
            return get();
        }

        void setNext(Node<E> n) {
            set(n);
        }

        private boolean casNext(Node<E> cmp, Node<E> val) {
            return compareAndSet(cmp, val);
        }

        private Node<E> getPrev() {
            return this.prev;
        }

        void setPrev(Node<E> b) {
            this.prev = b;
        }

        boolean isSpecial() {
            return this.element == null;
        }

        boolean isTrailer() {
            return getNext() == null;
        }

        boolean isHeader() {
            return getPrev() == null;
        }

        boolean isMarker() {
            return getPrev() == this;
        }

        boolean isDeleted() {
            Node<E> f = getNext();
            return f != null && f.isMarker();
        }

        private Node<E> nextNonmarker() {
            Node<E> f = getNext();
            return (f == null || !f.isMarker()) ? f : f.getNext();
        }

        Node<E> successor() {
            Node<E> f = nextNonmarker();
            while (f != null) {
                if (!f.isDeleted()) {
                    if (f.getPrev() != this && !isDeleted()) {
                        f.setPrev(this);
                        return f;
                    }
                    return f;
                }
                Node<E> s = f.nextNonmarker();
                if (f == getNext()) {
                    casNext(f, s);
                }
                f = s;
            }
            return null;
        }

        private Node<E> findPredecessorOf(Node<E> target) {
            Node<E> n = this;
            while (true) {
                Node<E> f = n.successor();
                if (f != target) {
                    if (f == null) {
                        return null;
                    }
                    n = f;
                } else {
                    return n;
                }
            }
        }

        Node<E> predecessor() {
            Node<E> p;
            Node<E> n = this;
            while (true) {
                Node<E> b = n.getPrev();
                if (b == null) {
                    return n.findPredecessorOf(this);
                }
                Node<E> s = b.getNext();
                if (s != this) {
                    if ((s == null || !s.isMarker()) && (p = b.findPredecessorOf(this)) != null) {
                        return p;
                    }
                    n = b;
                } else {
                    return b;
                }
            }
        }

        Node<E> forward() {
            Node<E> f = successor();
            if (f == null || f.isSpecial()) {
                return null;
            }
            return f;
        }

        Node<E> back() {
            Node<E> f = predecessor();
            if (f == null || f.isSpecial()) {
                return null;
            }
            return f;
        }

        Node<E> append(E element) {
            Node<E> f;
            Node<E> x;
            do {
                f = getNext();
                if (f == null || f.isMarker()) {
                    return null;
                }
                x = new Node<>(element, f, this);
            } while (!casNext(f, x));
            f.setPrev(x);
            return x;
        }

        Node<E> prepend(E element) {
            Node<E> b;
            Node<E> x;
            do {
                b = predecessor();
                if (b == null) {
                    return null;
                }
                x = new Node<>(element, this, b);
            } while (!b.casNext(this, x));
            setPrev(x);
            return x;
        }

        boolean delete() {
            Node<E> b = getPrev();
            Node<E> f = getNext();
            if (b == null || f == null || f.isMarker() || !casNext(f, new Node<>(f))) {
                return false;
            }
            if (b.casNext(this, f)) {
                f.setPrev(b);
            }
            return true;
        }

        Node<E> replace(E newElement) {
            Node<E> b;
            Node<E> f;
            Node<E> x;
            do {
                b = getPrev();
                f = getNext();
                if (b == null || f == null || f.isMarker()) {
                    return null;
                }
                x = new Node<>(newElement, f, b);
            } while (!casNext(f, new Node<>(x)));
            b.successor();
            x.successor();
            return x;
        }
    }

    private static boolean usable(Node<?> n) {
        return n != null && !n.isSpecial();
    }

    private static void checkNotNull(Object v) {
        if (v == null) {
            throw new NullPointerException();
        }
    }

    private E screenNullResult(E v) {
        if (v == null) {
            throw new NoSuchElementException();
        }
        return v;
    }

    private ArrayList<E> toArrayList() {
        ArrayList<E> c = new ArrayList<>();
        for (Node<E> n = this.header.forward(); n != null; n = n.forward()) {
            c.add(n.element);
        }
        return c;
    }

    public ConcurrentLinkedDeque() {
        Node<E> h = new Node<>(null, null, null);
        Node<E> t = new Node<>(null, null, h);
        h.setNext(t);
        this.header = h;
        this.trailer = t;
    }

    public ConcurrentLinkedDeque(Collection<? extends E> c) {
        this();
        addAll(c);
    }

    @Override // com.mongodb.Deque
    public void addFirst(E e) {
        checkNotNull(e);
        do {
        } while (this.header.append(e) == null);
    }

    @Override // com.mongodb.Deque
    public void addLast(E e) {
        checkNotNull(e);
        do {
        } while (this.trailer.prepend(e) == null);
    }

    @Override // com.mongodb.Deque
    public boolean offerFirst(E e) {
        addFirst(e);
        return true;
    }

    @Override // com.mongodb.Deque
    public boolean offerLast(E e) {
        addLast(e);
        return true;
    }

    @Override // com.mongodb.Deque
    public E peekFirst() {
        Node<E> n = this.header.successor();
        if (n == null) {
            return null;
        }
        return n.element;
    }

    @Override // com.mongodb.Deque
    public E peekLast() {
        Node<E> n = this.trailer.predecessor();
        if (n == null) {
            return null;
        }
        return n.element;
    }

    @Override // com.mongodb.Deque
    public E getFirst() {
        return screenNullResult(peekFirst());
    }

    @Override // com.mongodb.Deque
    public E getLast() {
        return screenNullResult(peekLast());
    }

    @Override // com.mongodb.Deque
    public E pollFirst() {
        Node<E> n;
        do {
            n = this.header.successor();
            if (!usable(n)) {
                return null;
            }
        } while (!n.delete());
        return n.element;
    }

    @Override // com.mongodb.Deque
    public E pollLast() {
        Node<E> n;
        do {
            n = this.trailer.predecessor();
            if (!usable(n)) {
                return null;
            }
        } while (!n.delete());
        return n.element;
    }

    @Override // com.mongodb.Deque
    public E removeFirst() {
        return screenNullResult(pollFirst());
    }

    @Override // com.mongodb.Deque
    public E removeLast() {
        return screenNullResult(pollLast());
    }

    @Override // com.mongodb.Deque, java.util.Queue
    public boolean offer(E e) {
        return offerLast(e);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, com.mongodb.Deque, java.util.Queue
    public boolean add(E e) {
        return offerLast(e);
    }

    @Override // com.mongodb.Deque, java.util.Queue
    public E poll() {
        return pollFirst();
    }

    @Override // com.mongodb.Deque, java.util.Queue
    public E remove() {
        return removeFirst();
    }

    @Override // com.mongodb.Deque, java.util.Queue
    public E peek() {
        return peekFirst();
    }

    @Override // com.mongodb.Deque, java.util.Queue
    public E element() {
        return getFirst();
    }

    @Override // com.mongodb.Deque
    public void push(E e) {
        addFirst(e);
    }

    @Override // com.mongodb.Deque
    public E pop() {
        return removeFirst();
    }

    @Override // com.mongodb.Deque
    public boolean removeFirstOccurrence(Object o) {
        Node<E> n;
        checkNotNull(o);
        do {
            n = this.header.forward();
            while (n != null) {
                if (o.equals(n.element)) {
                    break;
                }
                n = n.forward();
            }
            return false;
        } while (!n.delete());
        return true;
    }

    @Override // com.mongodb.Deque
    public boolean removeLastOccurrence(Object o) {
        checkNotNull(o);
        while (true) {
            Node<E> s = this.trailer;
            while (true) {
                Node<E> n = s.back();
                if (!s.isDeleted() && (n == null || n.successor() == s)) {
                    if (n == null) {
                        return false;
                    }
                    if (o.equals(n.element)) {
                        if (n.delete()) {
                            return true;
                        }
                    } else {
                        s = n;
                    }
                }
            }
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean contains(Object o) {
        if (o == null) {
            return false;
        }
        for (Node<E> n = this.header.forward(); n != null; n = n.forward()) {
            if (o.equals(n.element)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean isEmpty() {
        return !usable(this.header.successor());
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public int size() {
        long count = 0;
        for (Node<E> n = this.header.forward(); n != null; n = n.forward()) {
            count++;
        }
        return count >= 2147483647L ? Execute.INVALID : (int) count;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean remove(Object o) {
        return removeFirstOccurrence(o);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean addAll(Collection<? extends E> c) {
        Iterator<? extends E> it = c.iterator();
        if (!it.hasNext()) {
            return false;
        }
        do {
            addLast(it.next());
        } while (it.hasNext());
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public void clear() {
        do {
        } while (pollFirst() != null);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public Object[] toArray() {
        return toArrayList().toArray();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public <T> T[] toArray(T[] a) {
        return (T[]) toArrayList().toArray(a);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, com.mongodb.Deque
    public Iterator<E> iterator() {
        return new CLDIterator();
    }

    /* loaded from: classes.dex */
    final class CLDIterator implements Iterator<E> {
        Node<E> last;
        Node<E> next;

        CLDIterator() {
            ConcurrentLinkedDeque.this = r2;
            this.next = ConcurrentLinkedDeque.this.header.forward();
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.next != null;
        }

        @Override // java.util.Iterator
        public E next() {
            Node<E> l = this.next;
            this.last = l;
            if (l == null) {
                throw new NoSuchElementException();
            }
            this.next = this.next.forward();
            return l.element;
        }

        @Override // java.util.Iterator
        public void remove() {
            Node<E> l = this.last;
            if (l == null) {
                throw new IllegalStateException();
            }
            while (!l.delete() && !l.isDeleted()) {
            }
        }
    }

    public Iterator<E> descendingIterator() {
        throw new UnsupportedOperationException();
    }
}
