package org.apache.http.cookie;

@Deprecated
/* loaded from: classes.jar:org/apache/http/cookie/CookieAttributeHandler.class */
public interface CookieAttributeHandler {
    boolean match(Cookie cookie, CookieOrigin cookieOrigin);

    void parse(SetCookie setCookie, String str) throws MalformedCookieException;

    void validate(Cookie cookie, CookieOrigin cookieOrigin) throws MalformedCookieException;
}
