package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/HeaderElement.class */
public interface HeaderElement {
    String getName();

    NameValuePair getParameter(int i);

    NameValuePair getParameterByName(String str);

    int getParameterCount();

    NameValuePair[] getParameters();

    String getValue();
}
