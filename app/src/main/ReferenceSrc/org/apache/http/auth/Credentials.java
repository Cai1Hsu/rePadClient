package org.apache.http.auth;

import java.security.Principal;

@Deprecated
/* loaded from: classes.jar:org/apache/http/auth/Credentials.class */
public interface Credentials {
    String getPassword();

    Principal getUserPrincipal();
}
