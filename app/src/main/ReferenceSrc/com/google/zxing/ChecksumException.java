package com.google.zxing;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class ChecksumException extends ReaderException {
    private static final ChecksumException instance = new ChecksumException();

    private ChecksumException() {
    }

    public static ChecksumException getChecksumInstance() {
        return instance;
    }
}
