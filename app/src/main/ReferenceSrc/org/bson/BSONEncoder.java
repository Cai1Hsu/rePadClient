package org.bson;

import org.bson.io.OutputBuffer;

/* loaded from: classes.jar:org/bson/BSONEncoder.class */
public interface BSONEncoder {
    void done();

    byte[] encode(BSONObject bSONObject);

    int putObject(BSONObject bSONObject);

    void set(OutputBuffer outputBuffer);
}
