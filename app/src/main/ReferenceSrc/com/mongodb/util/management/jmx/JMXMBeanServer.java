package com.mongodb.util.management.jmx;

import com.mongodb.util.management.MBeanServer;
import java.lang.management.ManagementFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.InstanceAlreadyExistsException;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;

@Deprecated
/* loaded from: classes.dex */
public class JMXMBeanServer implements MBeanServer {
    private static final Logger LOGGER = Logger.getLogger("com.mongodb.driver.management");
    private final javax.management.MBeanServer server = ManagementFactory.getPlatformMBeanServer();

    @Override // com.mongodb.util.management.MBeanServer
    public boolean isRegistered(String mBeanName) {
        try {
            return this.server.isRegistered(createObjectName(mBeanName));
        } catch (MalformedObjectNameException e) {
            LOGGER.log(Level.WARNING, "Unable to register MBean " + mBeanName, e);
            return false;
        }
    }

    @Override // com.mongodb.util.management.MBeanServer
    public void unregisterMBean(String mBeanName) {
        try {
            this.server.unregisterMBean(createObjectName(mBeanName));
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Unable to register MBean " + mBeanName, (Throwable) e);
        }
    }

    @Override // com.mongodb.util.management.MBeanServer
    public void registerMBean(Object mBean, String mBeanName) {
        try {
            this.server.registerMBean(mBean, createObjectName(mBeanName));
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Unable to register MBean " + mBeanName, (Throwable) e);
        } catch (InstanceAlreadyExistsException e2) {
            LOGGER.log(Level.INFO, String.format("A JMX MBean with the name '%s' already exists", mBeanName));
        }
    }

    private ObjectName createObjectName(String mBeanName) throws MalformedObjectNameException {
        return new ObjectName(mBeanName);
    }
}
