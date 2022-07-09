package org.jivesoftware.smack.compression;

import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/jivesoftware/smack/compression/XMPPInputOutputStream.class */
public abstract class XMPPInputOutputStream {
    protected String compressionMethod;

    public String getCompressionMethod() {
        return this.compressionMethod;
    }

    public abstract InputStream getInputStream(InputStream inputStream) throws Exception;

    public abstract OutputStream getOutputStream(OutputStream outputStream) throws Exception;

    public abstract boolean isSupported();
}
