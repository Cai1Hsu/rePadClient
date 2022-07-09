package org.apache.http.entity;

import java.io.IOException;
import java.io.OutputStream;

@Deprecated
/* loaded from: classes.jar:org/apache/http/entity/ContentProducer.class */
public interface ContentProducer {
    void writeTo(OutputStream outputStream) throws IOException;
}
