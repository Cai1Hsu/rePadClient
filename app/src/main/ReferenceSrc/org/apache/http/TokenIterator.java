package org.apache.http;

import java.util.Iterator;

@Deprecated
/* loaded from: classes.jar:org/apache/http/TokenIterator.class */
public interface TokenIterator extends Iterator {
    @Override // java.util.Iterator
    boolean hasNext();

    String nextToken();
}
