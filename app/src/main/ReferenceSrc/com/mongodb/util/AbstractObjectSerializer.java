package com.mongodb.util;

/* loaded from: classes.dex */
abstract class AbstractObjectSerializer implements ObjectSerializer {
    AbstractObjectSerializer() {
    }

    @Override // com.mongodb.util.ObjectSerializer
    public String serialize(Object obj) {
        StringBuilder builder = new StringBuilder();
        serialize(obj, builder);
        return builder.toString();
    }
}
