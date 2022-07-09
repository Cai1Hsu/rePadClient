package org.jivesoftware.smack.compression;

import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes.jar:org/jivesoftware/smack/compression/JzlibInputOutputStream.class */
public class JzlibInputOutputStream extends XMPPInputOutputStream {
    private static Class<?> ziClass;
    private static Class<?> zoClass;

    static {
        zoClass = null;
        ziClass = null;
        try {
            zoClass = Class.forName("com.jcraft.jzlib.ZOutputStream");
            ziClass = Class.forName("com.jcraft.jzlib.ZInputStream");
        } catch (ClassNotFoundException e) {
        }
    }

    public JzlibInputOutputStream() {
        this.compressionMethod = "zlib";
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public InputStream getInputStream(InputStream inputStream) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object newInstance = ziClass.getConstructor(InputStream.class).newInstance(inputStream);
        ziClass.getMethod("setFlushMode", Integer.TYPE).invoke(newInstance, 2);
        return (InputStream) newInstance;
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public OutputStream getOutputStream(OutputStream outputStream) throws SecurityException, NoSuchMethodException, IllegalArgumentException, InstantiationException, IllegalAccessException, InvocationTargetException {
        Object newInstance = zoClass.getConstructor(OutputStream.class, Integer.TYPE).newInstance(outputStream, 9);
        zoClass.getMethod("setFlushMode", Integer.TYPE).invoke(newInstance, 2);
        return (OutputStream) newInstance;
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public boolean isSupported() {
        return (zoClass == null || ziClass == null) ? false : true;
    }
}
