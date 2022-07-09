package org.apache.commons.net.nntp;

import java.util.Iterator;

/* loaded from: classes.jar:org/apache/commons/net/nntp/NewsgroupIterator.class */
class NewsgroupIterator implements Iterator<NewsgroupInfo>, Iterable<NewsgroupInfo> {
    private final Iterator<String> stringIterator;

    public NewsgroupIterator(Iterable<String> iterable) {
        this.stringIterator = iterable.iterator();
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.stringIterator.hasNext();
    }

    @Override // java.lang.Iterable
    public Iterator<NewsgroupInfo> iterator() {
        return this;
    }

    @Override // java.util.Iterator
    public NewsgroupInfo next() {
        return NNTPClient.__parseNewsgroupListEntry(this.stringIterator.next());
    }

    @Override // java.util.Iterator
    public void remove() {
        this.stringIterator.remove();
    }
}
