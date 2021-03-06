package com.mongodb.util.management;

import com.mongodb.util.management.jmx.JMXMBeanServer;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MBeanServerFactory {
    private static final MBeanServer mBeanServer;

    static {
        MBeanServer tmp;
        try {
            tmp = new JMXMBeanServer();
        } catch (Throwable th) {
            tmp = new NullMBeanServer();
        }
        mBeanServer = tmp;
    }

    public static MBeanServer getMBeanServer() {
        return mBeanServer;
    }
}
