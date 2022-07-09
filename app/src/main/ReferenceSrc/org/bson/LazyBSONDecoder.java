package org.bson;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Logger;
import org.bson.io.Bits;

/* loaded from: classes.jar:org/bson/LazyBSONDecoder.class */
public class LazyBSONDecoder implements BSONDecoder {
    static final Logger LOG = Logger.getLogger(LazyBSONDecoder.class.getName());
    private static int BYTES_IN_INTEGER = 4;

    @Override // org.bson.BSONDecoder
    public int decode(InputStream inputStream, BSONCallback bSONCallback) throws IOException {
        byte[] bArr = new byte[BYTES_IN_INTEGER];
        Bits.readFully(inputStream, bArr, 0, BYTES_IN_INTEGER);
        int readInt = Bits.readInt(bArr);
        byte[] bArr2 = new byte[readInt];
        System.arraycopy(bArr, 0, bArr2, 0, BYTES_IN_INTEGER);
        Bits.readFully(inputStream, bArr2, BYTES_IN_INTEGER, readInt - BYTES_IN_INTEGER);
        bSONCallback.gotBinary(null, (byte) 0, bArr2);
        return readInt;
    }

    @Override // org.bson.BSONDecoder
    public int decode(byte[] bArr, BSONCallback bSONCallback) {
        try {
            return decode(new ByteArrayInputStream(bArr), bSONCallback);
        } catch (IOException e) {
            throw new BSONException("should be impossible", e);
        }
    }

    @Override // org.bson.BSONDecoder
    public BSONObject readObject(InputStream inputStream) throws IOException {
        LazyBSONCallback lazyBSONCallback = new LazyBSONCallback();
        decode(inputStream, lazyBSONCallback);
        return (BSONObject) lazyBSONCallback.get();
    }

    @Override // org.bson.BSONDecoder
    public BSONObject readObject(byte[] bArr) {
        try {
            return readObject(new ByteArrayInputStream(bArr));
        } catch (IOException e) {
            throw new BSONException("should be impossible", e);
        }
    }
}
