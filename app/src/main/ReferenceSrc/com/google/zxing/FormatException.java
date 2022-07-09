package com.google.zxing;

/* loaded from: classes.jar:com/google/zxing/FormatException.class */
public final class FormatException extends ReaderException {
    private static final FormatException instance = new FormatException();

    private FormatException() {
    }

    public static FormatException getFormatInstance() {
        return instance;
    }
}
