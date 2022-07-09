package org.apache.http;

import java.util.Iterator;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HeaderElementIterator.class */
public interface HeaderElementIterator extends Iterator {
    @Override // java.util.Iterator
    boolean hasNext();

    HeaderElement nextElement();
}
