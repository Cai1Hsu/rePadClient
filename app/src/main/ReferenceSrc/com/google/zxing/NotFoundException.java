package com.google.zxing;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class NotFoundException extends ReaderException {
    private static final NotFoundException instance = new NotFoundException();

    private NotFoundException() {
    }

    public static NotFoundException getNotFoundInstance() {
        return instance;
    }
}
