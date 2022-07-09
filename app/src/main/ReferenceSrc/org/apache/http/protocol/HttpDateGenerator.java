package org.apache.http.protocol;

import java.util.TimeZone;

@Deprecated
/* loaded from: classes.jar:org/apache/http/protocol/HttpDateGenerator.class */
public class HttpDateGenerator {
    public static final TimeZone GMT = null;
    public static final String PATTERN_RFC1123 = "EEE, dd MMM yyyy HH:mm:ss zzz";

    public HttpDateGenerator() {
        throw new RuntimeException("Stub!");
    }

    public String getCurrentDate() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}
