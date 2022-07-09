package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HttpRequestFactory.class */
public interface HttpRequestFactory {
    HttpRequest newHttpRequest(String str, String str2) throws MethodNotSupportedException;

    HttpRequest newHttpRequest(RequestLine requestLine) throws MethodNotSupportedException;
}
