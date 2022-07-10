package com.mongodb;

import org.bson.BSONObject;
import org.bson.io.OutputBuffer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface DBEncoder {
    int writeObject(OutputBuffer outputBuffer, BSONObject bSONObject);
}
