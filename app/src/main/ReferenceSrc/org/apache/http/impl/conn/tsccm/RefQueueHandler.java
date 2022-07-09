package org.apache.http.impl.conn.tsccm;

import java.lang.ref.Reference;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/conn/tsccm/RefQueueHandler.class */
public interface RefQueueHandler {
    void handleReference(Reference<?> reference);
}
