package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HttpConnectionMetrics.class */
public interface HttpConnectionMetrics {
    Object getMetric(String str);

    long getReceivedBytesCount();

    long getRequestCount();

    long getResponseCount();

    long getSentBytesCount();

    void reset();
}
