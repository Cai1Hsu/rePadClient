package org.bson;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import org.bson.io.Bits;
import org.bson.types.ObjectId;

@Deprecated
/* loaded from: classes.jar:org/bson/NewBSONDecoder.class */
public class NewBSONDecoder implements BSONDecoder {
    private static final String DEFAULT_ENCODING = "UTF-8";
    private static final int MAX_STRING = 33554432;
    private BSONCallback _callback;
    private byte[] _data;
    private int _length;
    private int _pos = 0;

    private final void _binary(String str) {
        int readInt = Bits.readInt(this._data, this._pos);
        this._pos += 4;
        byte b = this._data[this._pos];
        this._pos++;
        switch (b) {
            case 0:
                byte[] bArr = new byte[readInt];
                System.arraycopy(this._data, this._pos, bArr, 0, readInt);
                this._pos += readInt;
                this._callback.gotBinary(str, b, bArr);
                return;
            case 1:
            default:
                byte[] bArr2 = new byte[readInt];
                System.arraycopy(this._data, this._pos, bArr2, 0, readInt);
                this._pos += readInt;
                this._callback.gotBinary(str, b, bArr2);
                return;
            case 2:
                int readInt2 = Bits.readInt(this._data, this._pos);
                this._pos += 4;
                if (readInt2 + 4 != readInt) {
                    throw new IllegalArgumentException("bad data size subtype 2 len: " + readInt2 + " totalLen: " + readInt);
                }
                byte[] bArr3 = new byte[readInt2];
                System.arraycopy(this._data, this._pos, bArr3, 0, readInt2);
                this._pos += readInt2;
                this._callback.gotBinary(str, b, bArr3);
                return;
            case 3:
                if (readInt != 16) {
                    throw new IllegalArgumentException("bad data size subtype 3 len: " + readInt + " != 16");
                }
                long readLong = Bits.readLong(this._data, this._pos);
                this._pos += 8;
                long readLong2 = Bits.readLong(this._data, this._pos);
                this._pos += 8;
                this._callback.gotUUID(str, readLong, readLong2);
                return;
        }
    }

    private final void _decode() {
        this._callback.objectStart();
        do {
        } while (decodeElement());
        this._callback.objectDone();
    }

    private final Object _readBasicObject() {
        this._pos += 4;
        BSONCallback bSONCallback = this._callback;
        BSONCallback createBSONCallback = this._callback.createBSONCallback();
        this._callback = createBSONCallback;
        createBSONCallback.reset();
        createBSONCallback.objectStart(false);
        do {
        } while (decodeElement());
        this._callback = bSONCallback;
        return createBSONCallback.get();
    }

    private final boolean decodeElement() {
        boolean z;
        boolean z2 = false;
        byte b = this._data[this._pos];
        this._pos++;
        if (b == 0) {
            z = false;
        } else {
            String readCstr = readCstr();
            switch (b) {
                case -1:
                    this._callback.gotMinKey(readCstr);
                    z = true;
                    break;
                case 1:
                    this._callback.gotDouble(readCstr, Double.longBitsToDouble(Bits.readLong(this._data, this._pos)));
                    this._pos += 8;
                    z = true;
                    break;
                case 2:
                    this._callback.gotString(readCstr, readUtf8Str());
                    z = true;
                    break;
                case 3:
                    this._pos += 4;
                    this._callback.objectStart(readCstr);
                    do {
                    } while (decodeElement());
                    this._callback.objectDone();
                    z = true;
                    break;
                case 4:
                    this._pos += 4;
                    this._callback.arrayStart(readCstr);
                    do {
                    } while (decodeElement());
                    this._callback.arrayDone();
                    z = true;
                    break;
                case 5:
                    _binary(readCstr);
                    z = true;
                    break;
                case 6:
                    this._callback.gotUndefined(readCstr);
                    z = true;
                    break;
                case 7:
                    int readIntBE = Bits.readIntBE(this._data, this._pos);
                    this._pos += 4;
                    int readIntBE2 = Bits.readIntBE(this._data, this._pos);
                    this._pos += 4;
                    int readIntBE3 = Bits.readIntBE(this._data, this._pos);
                    this._pos += 4;
                    this._callback.gotObjectId(readCstr, new ObjectId(readIntBE, readIntBE2, readIntBE3));
                    z = true;
                    break;
                case 8:
                    BSONCallback bSONCallback = this._callback;
                    if (this._data[this._pos] > 0) {
                        z2 = true;
                    }
                    bSONCallback.gotBoolean(readCstr, z2);
                    this._pos++;
                    z = true;
                    break;
                case 9:
                    this._callback.gotDate(readCstr, Bits.readLong(this._data, this._pos));
                    this._pos += 8;
                    z = true;
                    break;
                case 10:
                    this._callback.gotNull(readCstr);
                    z = true;
                    break;
                case 11:
                    this._callback.gotRegex(readCstr, readCstr(), readCstr());
                    z = true;
                    break;
                case 12:
                    this._pos += 4;
                    String readCstr2 = readCstr();
                    int readInt = Bits.readInt(this._data, this._pos);
                    this._pos += 4;
                    int readInt2 = Bits.readInt(this._data, this._pos);
                    this._pos += 4;
                    int readInt3 = Bits.readInt(this._data, this._pos);
                    this._pos += 4;
                    this._callback.gotDBRef(readCstr, readCstr2, new ObjectId(readInt, readInt2, readInt3));
                    z = true;
                    break;
                case 13:
                    this._callback.gotCode(readCstr, readUtf8Str());
                    z = true;
                    break;
                case 14:
                    this._callback.gotSymbol(readCstr, readUtf8Str());
                    z = true;
                    break;
                case 15:
                    this._pos += 4;
                    this._callback.gotCodeWScope(readCstr, readUtf8Str(), _readBasicObject());
                    z = true;
                    break;
                case 16:
                    this._callback.gotInt(readCstr, Bits.readInt(this._data, this._pos));
                    this._pos += 4;
                    z = true;
                    break;
                case 17:
                    int readInt4 = Bits.readInt(this._data, this._pos);
                    this._pos += 4;
                    int readInt5 = Bits.readInt(this._data, this._pos);
                    this._pos += 4;
                    this._callback.gotTimestamp(readCstr, readInt5, readInt4);
                    z = true;
                    break;
                case 18:
                    this._callback.gotLong(readCstr, Bits.readLong(this._data, this._pos));
                    this._pos += 8;
                    z = true;
                    break;
                case Byte.MAX_VALUE:
                    this._callback.gotMaxKey(readCstr);
                    z = true;
                    break;
                default:
                    throw new UnsupportedOperationException("BSONDecoder doesn't understand type : " + ((int) b) + " name: " + readCstr);
            }
        }
        return z;
    }

    private final String readCstr() {
        String str;
        int i = 0;
        int i2 = this._pos;
        while (true) {
            byte[] bArr = this._data;
            int i3 = this._pos;
            this._pos = i3 + 1;
            if (bArr[i3] != 0) {
                i++;
            } else {
                try {
                    break;
                } catch (UnsupportedEncodingException e) {
                    str = new String(this._data, i2, i);
                }
            }
        }
        str = new String(this._data, i2, i, "UTF-8");
        return str;
    }

    private final String readUtf8Str() {
        int readInt = Bits.readInt(this._data, this._pos);
        this._pos += 4;
        if (readInt <= 0 || readInt > MAX_STRING) {
            throw new BSONException("String invalid - corruption");
        }
        try {
            String str = new String(this._data, this._pos, readInt - 1, "UTF-8");
            this._pos += readInt;
            return str;
        } catch (UnsupportedEncodingException e) {
            throw new BSONException("What is in the db", e);
        }
    }

    @Override // org.bson.BSONDecoder
    public int decode(InputStream inputStream, BSONCallback bSONCallback) throws IOException {
        this._length = Bits.readInt(inputStream);
        if (this._data == null || this._data.length < this._length) {
            this._data = new byte[this._length];
        }
        new DataInputStream(inputStream).readFully(this._data, 4, this._length - 4);
        return decode(this._data, bSONCallback);
    }

    @Override // org.bson.BSONDecoder
    public int decode(byte[] bArr, BSONCallback bSONCallback) {
        this._data = bArr;
        this._pos = 4;
        this._callback = bSONCallback;
        _decode();
        return this._length;
    }

    @Override // org.bson.BSONDecoder
    public BSONObject readObject(InputStream inputStream) throws IOException {
        this._length = Bits.readInt(inputStream);
        if (this._data == null || this._data.length < this._length) {
            this._data = new byte[this._length];
        }
        new DataInputStream(inputStream).readFully(this._data, 4, this._length - 4);
        return readObject(this._data);
    }

    @Override // org.bson.BSONDecoder
    public BSONObject readObject(byte[] bArr) {
        this._length = bArr.length;
        BasicBSONCallback basicBSONCallback = new BasicBSONCallback();
        decode(bArr, basicBSONCallback);
        return (BSONObject) basicBSONCallback.get();
    }
}
