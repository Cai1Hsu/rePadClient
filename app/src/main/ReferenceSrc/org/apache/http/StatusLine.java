package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/StatusLine.class */
public interface StatusLine {
    ProtocolVersion getProtocolVersion();

    String getReasonPhrase();

    int getStatusCode();
}
