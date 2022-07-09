package org.apache.commons.compress.compressors;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/CompressorException.class */
public class CompressorException extends Exception {
    private static final long serialVersionUID = -2932901310255908814L;

    public CompressorException(String str) {
        super(str);
    }

    public CompressorException(String str, Throwable th) {
        super(str, th);
    }
}
