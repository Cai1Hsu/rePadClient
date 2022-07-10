package com.mongodb;

import android.support.v4.media.TransportMediator;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
enum BSONType {
    END_OF_DOCUMENT(0),
    DOUBLE(1),
    STRING(2),
    DOCUMENT(3),
    ARRAY(4),
    BINARY(5),
    UNDEFINED(6),
    OBJECT_ID(7),
    BOOLEAN(8),
    DATE_TIME(9),
    NULL(10),
    REGULAR_EXPRESSION(11),
    DB_POINTER(12),
    JAVASCRIPT(13),
    SYMBOL(14),
    JAVASCRIPT_WITH_SCOPE(15),
    INT32(16),
    TIMESTAMP(17),
    INT64(18),
    MIN_KEY(255),
    MAX_KEY(TransportMediator.KEYCODE_MEDIA_PAUSE);
    
    private final int value;
    private static final BSONType[] LOOKUP_TABLE = new BSONType[MIN_KEY.getValue() + 1];

    static {
        BSONType[] arr$ = values();
        for (BSONType cur : arr$) {
            LOOKUP_TABLE[cur.getValue()] = cur;
        }
    }

    BSONType(int value) {
        this.value = value;
    }

    public int getValue() {
        return this.value;
    }

    public static BSONType findByValue(int value) {
        return LOOKUP_TABLE[value & 255];
    }

    public boolean isContainer() {
        return this == DOCUMENT || this == ARRAY;
    }
}
