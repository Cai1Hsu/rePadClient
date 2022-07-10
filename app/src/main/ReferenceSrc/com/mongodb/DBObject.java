package com.mongodb;

import org.bson.BSONObject;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface DBObject extends BSONObject {
    boolean isPartialObject();

    void markAsPartialObject();
}
