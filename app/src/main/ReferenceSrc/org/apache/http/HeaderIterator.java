package org.apache.http;

import java.util.Iterator;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HeaderIterator.class */
public interface HeaderIterator extends Iterator {
    @Override // java.util.Iterator
    boolean hasNext();

    Header nextHeader();
}
