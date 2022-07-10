package com.google.zxing;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class FormatException extends ReaderException {
    private static final FormatException instance = new FormatException();

    private FormatException() {
    }

    public static FormatException getFormatInstance() {
        return instance;
    }
}
