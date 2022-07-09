package com.mongodb.util.management;

@Deprecated
/* loaded from: classes.dex */
public interface MBeanServer {
    boolean isRegistered(String str);

    void registerMBean(Object obj, String str);

    void unregisterMBean(String str);
}
