package org.jivesoftware.smackx.jingle;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/SmackLogger.class */
public class SmackLogger {
    private Log commonsLogger;

    public SmackLogger(Class<?> cls) {
        setupSmackLogger(cls);
    }

    public static SmackLogger getLogger(Class<?> cls) {
        return new SmackLogger(cls);
    }

    private void setupSmackLogger(Class<?> cls) {
        try {
            this.commonsLogger = (Log) SmackLogger.class.getClassLoader().loadClass(LogFactory.FACTORY_PROPERTY).getMethod("getLog", Class.class).invoke(null, cls);
        } catch (ClassNotFoundException e) {
        } catch (IllegalAccessException e2) {
        } catch (IllegalArgumentException e3) {
        } catch (NoSuchMethodException e4) {
        } catch (SecurityException e5) {
        } catch (InvocationTargetException e6) {
        }
    }

    public void debug(String str) {
        if (this.commonsLogger != null) {
            this.commonsLogger.debug(str);
        } else {
            System.out.println(str);
        }
    }

    public void debug(String str, Exception exc) {
        if (this.commonsLogger != null) {
            this.commonsLogger.debug(str, exc);
            return;
        }
        System.out.println(str);
        exc.printStackTrace(System.out);
    }

    public void error(String str) {
        if (this.commonsLogger != null) {
            this.commonsLogger.error(str);
        } else {
            System.err.println(str);
        }
    }

    public void error(String str, Exception exc) {
        if (this.commonsLogger != null) {
            this.commonsLogger.error(str, exc);
            return;
        }
        System.err.println(str);
        exc.printStackTrace(System.err);
    }

    public void info(String str) {
        if (this.commonsLogger != null) {
            this.commonsLogger.info(str);
        } else {
            System.out.println(str);
        }
    }

    public void info(String str, Exception exc) {
        if (this.commonsLogger != null) {
            this.commonsLogger.info(str, exc);
            return;
        }
        System.out.println(str);
        exc.printStackTrace(System.out);
    }

    public void warn(String str) {
        if (this.commonsLogger != null) {
            this.commonsLogger.warn(str);
        } else {
            System.out.println(str);
        }
    }

    public void warn(String str, Exception exc) {
        if (this.commonsLogger != null) {
            this.commonsLogger.warn(str, exc);
            return;
        }
        System.out.println(str);
        exc.printStackTrace(System.out);
    }
}
