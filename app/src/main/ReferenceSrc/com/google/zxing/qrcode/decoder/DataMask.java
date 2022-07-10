package com.google.zxing.qrcode.decoder;

import com.google.zxing.common.BitMatrix;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class DataMask {
    private static final DataMask[] DATA_MASKS = {new DataMask000(null), new DataMask001(null), new DataMask010(null), new DataMask011(null), new DataMask100(null), new DataMask101(null), new DataMask110(null), new DataMask111(null)};

    abstract boolean isMasked(int i, int i2);

    /* synthetic */ DataMask(AnonymousClass1 x0) {
        this();
    }

    private DataMask() {
    }

    public final void unmaskBitMatrix(BitMatrix bits, int dimension) {
        for (int i = 0; i < dimension; i++) {
            for (int j = 0; j < dimension; j++) {
                if (isMasked(i, j)) {
                    bits.flip(j, i);
                }
            }
        }
    }

    public static DataMask forReference(int reference) {
        if (reference < 0 || reference > 7) {
            throw new IllegalArgumentException();
        }
        return DATA_MASKS[reference];
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask000 extends DataMask {
        private DataMask000() {
            super(null);
        }

        /* synthetic */ DataMask000(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return ((i + j) & 1) == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask001 extends DataMask {
        private DataMask001() {
            super(null);
        }

        /* synthetic */ DataMask001(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (i & 1) == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask010 extends DataMask {
        private DataMask010() {
            super(null);
        }

        /* synthetic */ DataMask010(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return j % 3 == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask011 extends DataMask {
        private DataMask011() {
            super(null);
        }

        /* synthetic */ DataMask011(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (i + j) % 3 == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask100 extends DataMask {
        private DataMask100() {
            super(null);
        }

        /* synthetic */ DataMask100(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return (((i >>> 1) + (j / 3)) & 1) == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask101 extends DataMask {
        private DataMask101() {
            super(null);
        }

        /* synthetic */ DataMask101(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (temp & 1) + (temp % 3) == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask110 extends DataMask {
        private DataMask110() {
            super(null);
        }

        /* synthetic */ DataMask110(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            int temp = i * j;
            return (((temp & 1) + (temp % 3)) & 1) == 0;
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static class DataMask111 extends DataMask {
        private DataMask111() {
            super(null);
        }

        /* synthetic */ DataMask111(AnonymousClass1 x0) {
            this();
        }

        @Override // com.google.zxing.qrcode.decoder.DataMask
        boolean isMasked(int i, int j) {
            return ((((i + j) & 1) + ((i * j) % 3)) & 1) == 0;
        }
    }
}
