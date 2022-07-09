package org.jivesoftware.smack.compression;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

/* loaded from: classes.jar:org/jivesoftware/smack/compression/Java7ZlibInputOutputStream.class */
public class Java7ZlibInputOutputStream extends XMPPInputOutputStream {
    private static final int compressionLevel = 0;
    private static final Method method;
    private static final boolean supported;

    static {
        boolean z = true;
        Method method2 = null;
        try {
            method2 = Deflater.class.getMethod("deflate", byte[].class, Integer.TYPE, Integer.TYPE, Integer.TYPE);
        } catch (NoSuchMethodException e) {
        } catch (SecurityException e2) {
        }
        method = method2;
        if (method == null) {
            z = false;
        }
        supported = z;
    }

    public Java7ZlibInputOutputStream() {
        this.compressionMethod = "zlib";
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public InputStream getInputStream(InputStream inputStream) {
        return new InflaterInputStream(inputStream, new Inflater(), 512) { // from class: org.jivesoftware.smack.compression.Java7ZlibInputOutputStream.1
            @Override // java.util.zip.InflaterInputStream, java.io.FilterInputStream, java.io.InputStream
            public int available() throws IOException {
                return this.inf.needsInput() ? 0 : super.available();
            }
        };
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public OutputStream getOutputStream(OutputStream outputStream) {
        return new DeflaterOutputStream(outputStream, new Deflater(0)) { // from class: org.jivesoftware.smack.compression.Java7ZlibInputOutputStream.2
            @Override // java.util.zip.DeflaterOutputStream, java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
            public void flush() throws IOException {
                int intValue;
                int deflate;
                if (!Java7ZlibInputOutputStream.supported) {
                    super.flush();
                    return;
                }
                if (!this.def.needsInput()) {
                    do {
                        deflate = this.def.deflate(this.buf, 0, this.buf.length);
                        this.out.write(this.buf, 0, deflate);
                    } while (deflate > 0);
                    this.out.flush();
                }
                do {
                    try {
                        intValue = ((Integer) Java7ZlibInputOutputStream.method.invoke(this.def, this.buf, 0, Integer.valueOf(this.buf.length), 2)).intValue();
                        this.out.write(this.buf, 0, intValue);
                    } catch (IllegalAccessException e) {
                        throw new IOException("Can't flush");
                    } catch (IllegalArgumentException e2) {
                        throw new IOException("Can't flush");
                    } catch (InvocationTargetException e3) {
                        throw new IOException("Can't flush");
                    }
                } while (intValue > 0);
                super.flush();
            }
        };
    }

    @Override // org.jivesoftware.smack.compression.XMPPInputOutputStream
    public boolean isSupported() {
        return supported;
    }
}
