package com.google.zxing;

/* loaded from: classes.jar:com/google/zxing/ChecksumException.class */
public final class ChecksumException extends ReaderException {
    private static final ChecksumException instance = new ChecksumException();

    private ChecksumException() {
    }

    public static ChecksumException getChecksumInstance() {
        return instance;
    }
}
