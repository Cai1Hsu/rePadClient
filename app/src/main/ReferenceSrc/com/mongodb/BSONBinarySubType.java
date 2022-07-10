package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
enum BSONBinarySubType {
    Binary((byte) 0),
    Function((byte) 1),
    OldBinary((byte) 2),
    UuidLegacy((byte) 3),
    UuidStandard((byte) 4),
    MD5((byte) 5),
    UserDefined(Byte.MIN_VALUE);
    
    private final byte value;

    BSONBinarySubType(byte value) {
        this.value = value;
    }

    public byte getValue() {
        return this.value;
    }
}
