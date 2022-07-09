package org.apache.http.io;

@Deprecated
/* loaded from: classes.jar:org/apache/http/io/HttpTransportMetrics.class */
public interface HttpTransportMetrics {
    long getBytesTransferred();

    void reset();
}
