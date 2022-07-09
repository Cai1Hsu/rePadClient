package org.apache.http.conn.params;

import org.apache.http.conn.routing.HttpRoute;

@Deprecated
/* loaded from: classes.jar:org/apache/http/conn/params/ConnPerRoute.class */
public interface ConnPerRoute {
    int getMaxForRoute(HttpRoute httpRoute);
}
