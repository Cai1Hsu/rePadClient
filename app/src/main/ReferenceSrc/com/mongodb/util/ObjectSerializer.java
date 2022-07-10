package com.mongodb.util;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface ObjectSerializer {
    String serialize(Object obj);

    void serialize(Object obj, StringBuilder sb);
}
