package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/filters/ClassConstants.class */
public final class ClassConstants extends BaseFilterReader implements ChainableReader {
    private static final String JAVA_CLASS_HELPER = "org.apache.tools.ant.filters.util.JavaClassHelper";
    static Class array$B;
    private String queuedData = null;

    public ClassConstants() {
    }

    public ClassConstants(Reader reader) {
        super(reader);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        return new ClassConstants(reader);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c;
        Class<?> cls;
        if (this.queuedData != null && this.queuedData.length() == 0) {
            this.queuedData = null;
        }
        if (this.queuedData != null) {
            char charAt = this.queuedData.charAt(0);
            this.queuedData = this.queuedData.substring(1);
            c = charAt;
            if (this.queuedData.length() == 0) {
                this.queuedData = null;
                c = charAt;
            }
        } else {
            String readFully = readFully();
            if (readFully == null || readFully.length() == 0) {
                c = 65535;
            } else {
                byte[] bytes = readFully.getBytes("ISO-8859-1");
                try {
                    Class<?> cls2 = Class.forName(JAVA_CLASS_HELPER);
                    c = 65535;
                    if (cls2 != null) {
                        if (array$B == null) {
                            cls = class$("[B");
                            array$B = cls;
                        } else {
                            cls = array$B;
                        }
                        StringBuffer stringBuffer = (StringBuffer) cls2.getMethod("getConstants", cls).invoke(null, bytes);
                        c = 65535;
                        if (stringBuffer.length() > 0) {
                            this.queuedData = stringBuffer.toString();
                            c = read();
                        }
                    }
                } catch (NoClassDefFoundError e) {
                    throw e;
                } catch (RuntimeException e2) {
                    throw e2;
                } catch (InvocationTargetException e3) {
                    Throwable targetException = e3.getTargetException();
                    if (targetException instanceof NoClassDefFoundError) {
                        throw ((NoClassDefFoundError) targetException);
                    }
                    if (!(targetException instanceof RuntimeException)) {
                        throw new BuildException(targetException);
                    }
                    throw ((RuntimeException) targetException);
                } catch (Exception e4) {
                    throw new BuildException(e4);
                }
            }
        }
        return c;
    }
}
