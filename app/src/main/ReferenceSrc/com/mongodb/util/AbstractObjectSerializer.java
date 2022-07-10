package com.mongodb.util;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class AbstractObjectSerializer implements ObjectSerializer {
    @Override // com.mongodb.util.ObjectSerializer
    public String serialize(Object obj) {
        StringBuilder builder = new StringBuilder();
        serialize(obj, builder);
        return builder.toString();
    }
}
