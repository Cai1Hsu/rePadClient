package com.mongodb.util.management;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface MBeanServer {
    boolean isRegistered(String str);

    void registerMBean(Object obj, String str);

    void unregisterMBean(String str);
}
