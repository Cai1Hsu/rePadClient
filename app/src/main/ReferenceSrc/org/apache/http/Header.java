package org.apache.http;

@Deprecated
/* loaded from: classes.jar:org/apache/http/Header.class */
public interface Header {
    HeaderElement[] getElements() throws ParseException;

    String getName();

    String getValue();
}
