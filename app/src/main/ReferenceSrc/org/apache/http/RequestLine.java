package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/RequestLine.class */
public interface RequestLine {
    String getMethod();

    ProtocolVersion getProtocolVersion();

    String getUri();
}
