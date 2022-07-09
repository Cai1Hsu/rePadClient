package org.bson;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import org.bson.io.Bits;
import org.bson.io.PoolOutputBuffer;
import org.bson.types.ObjectId;

/* loaded from: classes.jar:org/bson/BasicBSONDecoder.class */
public class BasicBSONDecoder implements BSONDecoder {
    private static final String DEFAULT_ENCODING = "UTF-8";
    private static final int MAX_STRING = 33554432;
    static final String[] ONE_BYTE_STRINGS = new String[128];
    @Deprecated
    protected BSONCallback _callback;
    @Deprecated
    protected BSONInput _in;
    @Deprecated
    protected int _len;
    @Deprecated
    protected int _pos;
    private byte[] _random = new byte[1024];
    private byte[] _inputBuffer = new byte[1024];
    private PoolOutputBuffer _stringBuffer = new PoolOutputBuffer();

    @Deprecated
    /* loaded from: classes.jar:org/bson/BasicBSONDecoder$BSONInput.class */
    protected class BSONInput {
        final InputStream _raw;
        int _max = 4;
        int _read = 0;

        public BSONInput(InputStream inputStream) {
            BasicBSONDecoder.this = r4;
            this._raw = inputStream;
            r4._pos = 0;
            r4._len = 0;
        }

        protected boolean _isAscii(byte b) {
            return b >= 0 && b <= Byte.MAX_VALUE;
        }

        protected int _need(int i) throws IOException {
            int i2;
            if (BasicBSONDecoder.this._len - BasicBSONDecoder.this._pos >= i) {
                int i3 = BasicBSONDecoder.this._pos;
                BasicBSONDecoder.this._pos += i;
                this._read += i;
                i2 = i3;
            } else if (i >= BasicBSONDecoder.this._inputBuffer.length) {
                throw new IllegalArgumentException("you can't need that much");
            } else {
                int i4 = BasicBSONDecoder.this._len - BasicBSONDecoder.this._pos;
                if (BasicBSONDecoder.this._pos > 0) {
                    System.arraycopy(BasicBSONDecoder.this._inputBuffer, BasicBSONDecoder.this._pos, BasicBSONDecoder.this._inputBuffer, 0, i4);
                    BasicBSONDecoder.this._pos = 0;
                    BasicBSONDecoder.this._len = i4;
                }
                int min = Math.min((this._max - this._read) - i4, BasicBSONDecoder.this._inputBuffer.length - BasicBSONDecoder.this._len);
                while (min > 0) {
                    int read = this._raw.read(BasicBSONDecoder.this._inputBuffer, BasicBSONDecoder.this._len, min);
                    if (read <= 0) {
                        throw new IOException("unexpected EOF");
                    }
                    min -= read;
                    BasicBSONDecoder.this._len += read;
                }
                int i5 = BasicBSONDecoder.this._pos;
                BasicBSONDecoder.this._pos += i;
                this._read += i;
                i2 = i5;
            }
            return i2;
        }

        public void fill(byte[] bArr) throws IOException {
            fill(bArr, bArr.length);
        }

        public void fill(byte[] bArr, int i) throws IOException {
            int min = Math.min(i, BasicBSONDecoder.this._len - BasicBSONDecoder.this._pos);
            System.arraycopy(BasicBSONDecoder.this._inputBuffer, BasicBSONDecoder.this._pos, bArr, 0, min);
            BasicBSONDecoder.this._pos += min;
            this._read += min;
            int i2 = i;
            int i3 = min;
            while (true) {
                int i4 = i2 - i3;
                if (i4 > 0) {
                    int read = this._raw.read(bArr, min, i4);
                    if (read <= 0) {
                        throw new IOException("unexpected EOF");
                    }
                    this._read += read;
                    min += read;
                    i2 = i4;
                    i3 = read;
                } else {
                    return;
                }
            }
        }

        public int getMax() {
            return this._max;
        }

        public int getPos() {
            return BasicBSONDecoder.this._pos;
        }

        public int numRead() {
            return this._read;
        }

        public byte read() throws IOException {
            byte b;
            if (BasicBSONDecoder.this._pos < BasicBSONDecoder.this._len) {
                this._read++;
                byte[] bArr = BasicBSONDecoder.this._inputBuffer;
                BasicBSONDecoder basicBSONDecoder = BasicBSONDecoder.this;
                int i = basicBSONDecoder._pos;
                basicBSONDecoder._pos = i + 1;
                b = bArr[i];
            } else {
                b = BasicBSONDecoder.this._inputBuffer[_need(1)];
            }
            return b;
        }

        public String readCStr() throws IOException {
            boolean z;
            String asString;
            BasicBSONDecoder.this._random[0] = read();
            if (BasicBSONDecoder.this._random[0] == 0) {
                asString = "";
            } else {
                BasicBSONDecoder.this._random[1] = read();
                if (BasicBSONDecoder.this._random[1] == 0) {
                    String str = BasicBSONDecoder.ONE_BYTE_STRINGS[BasicBSONDecoder.this._random[0]];
                    asString = str;
                    if (str == null) {
                        asString = new String(BasicBSONDecoder.this._random, 0, 1, "UTF-8");
                    }
                } else {
                    BasicBSONDecoder.this._stringBuffer.reset();
                    BasicBSONDecoder.this._stringBuffer.write(BasicBSONDecoder.this._random, 0, 2);
                    boolean z2 = _isAscii(BasicBSONDecoder.this._random[0]) && _isAscii(BasicBSONDecoder.this._random[1]);
                    while (true) {
                        z = z2;
                        byte read = read();
                        if (read == 0) {
                            break;
                        }
                        BasicBSONDecoder.this._stringBuffer.write(read);
                        z2 = z && _isAscii(read);
                    }
                    if (z) {
                        asString = BasicBSONDecoder.this._stringBuffer.asAscii();
                    } else {
                        try {
                            asString = BasicBSONDecoder.this._stringBuffer.asString("UTF-8");
                        } catch (UnsupportedOperationException e) {
                            throw new BSONException("impossible", e);
                        }
                    }
                    BasicBSONDecoder.this._stringBuffer.reset();
                }
            }
            return asString;
        }

        public double readDouble() throws IOException {
            return Double.longBitsToDouble(readLong());
        }

        public int readInt() throws IOException {
            return Bits.readInt(BasicBSONDecoder.this._inputBuffer, _need(4));
        }

        public int readIntBE() throws IOException {
            return Bits.readIntBE(BasicBSONDecoder.this._inputBuffer, _need(4));
        }

        public long readLong() throws IOException {
            return Bits.readLong(BasicBSONDecoder.this._inputBuffer, _need(8));
        }

        public String readUTF8String() throws IOException {
            String str;
            int readInt = readInt();
            if (readInt <= 0 || readInt > BasicBSONDecoder.MAX_STRING) {
                throw new BSONException("bad string size: " + readInt);
            }
            if (readInt >= BasicBSONDecoder.this._inputBuffer.length / 2) {
                byte[] bArr = readInt < BasicBSONDecoder.this._random.length ? BasicBSONDecoder.this._random : new byte[readInt];
                fill(bArr, readInt);
                try {
                    str = new String(bArr, 0, readInt - 1, "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    throw new BSONException("impossible", e);
                }
            } else if (readInt == 1) {
                read();
                str = "";
            } else {
                str = new String(BasicBSONDecoder.this._inputBuffer, _need(readInt), readInt - 1, "UTF-8");
            }
            return str;
        }

        public void setMax(int i) {
            this._max = i;
        }
    }

    static {
        _fillRange((byte) 48, (byte) 57);
        _fillRange((byte) 97, (byte) 122);
        _fillRange((byte) 65, (byte) 90);
    }

    private int _decode(BSONInput bSONInput, BSONCallback bSONCallback) throws IOException {
        if (this._in == null && this._callback == null) {
            this._in = bSONInput;
            this._callback = bSONCallback;
            if (bSONInput.numRead() != 0) {
                throw new IllegalArgumentException("i'm confused");
            }
            try {
                int readInt = this._in.readInt();
                this._in.setMax(readInt);
                this._callback.objectStart();
                do {
                } while (decodeElement());
                this._callback.objectDone();
                if (this._in.numRead() == readInt) {
                    return readInt;
                }
                throw new IllegalArgumentException("bad data.  lengths don't match read:" + this._in.numRead() + " != len:" + readInt);
            } finally {
                this._in = null;
                this._callback = null;
            }
        }
        throw new IllegalStateException("not ready");
    }

    static void _fillRange(byte b, byte b2) {
        while (b < b2) {
            ONE_BYTE_STRINGS[b] = "" + ((char) b);
            b = (byte) (b + 1);
        }
    }

    private static final boolean _isAscii(byte b) {
        return b >= 0 && b <= Byte.MAX_VALUE;
    }

    @Deprecated
    protected void _binary(String str) throws IOException {
        int readInt = this._in.readInt();
        byte read = this._in.read();
        switch (read) {
            case 0:
                byte[] bArr = new byte[readInt];
                this._in.fill(bArr);
                this._callback.gotBinary(str, read, bArr);
                return;
            case 1:
            default:
                byte[] bArr2 = new byte[readInt];
                this._in.fill(bArr2);
                this._callback.gotBinary(str, read, bArr2);
                return;
            case 2:
                int readInt2 = this._in.readInt();
                if (readInt2 + 4 != readInt) {
                    throw new IllegalArgumentException("bad data size subtype 2 len: " + readInt2 + " totalLen: " + readInt);
                }
                byte[] bArr3 = new byte[readInt2];
                this._in.fill(bArr3);
                this._callback.gotBinary(str, read, bArr3);
                return;
            case 3:
                if (readInt != 16) {
                    throw new IllegalArgumentException("bad data size subtype 3 len: " + readInt + " != 16");
                }
                this._callback.gotUUID(str, this._in.readLong(), this._in.readLong());
                return;
        }
    }

    Object _readBasicObject() throws IOException {
        this._in.readInt();
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

    @Override // org.bson.BSONDecoder
    public int decode(InputStream inputStream, BSONCallback bSONCallback) throws IOException {
        return _decode(new BSONInput(inputStream), bSONCallback);
    }

    int decode(boolean z) throws IOException {
        int numRead = this._in.numRead();
        int readInt = this._in.readInt();
        if (z) {
            this._in.setMax(readInt);
        }
        this._callback.objectStart();
        do {
        } while (decodeElement());
        this._callback.objectDone();
        if (this._in.numRead() - numRead != readInt) {
        }
        return readInt;
    }

    @Override // org.bson.BSONDecoder
    public int decode(byte[] bArr, BSONCallback bSONCallback) {
        try {
            return _decode(new BSONInput(new ByteArrayInputStream(bArr)), bSONCallback);
        } catch (IOException e) {
            throw new BSONException("should be impossible", e);
        }
    }

    boolean decodeElement() throws IOException {
        boolean z = false;
        byte read = this._in.read();
        if (read != 0) {
            String readCStr = this._in.readCStr();
            switch (read) {
                case -1:
                    this._callback.gotMinKey(readCStr);
                    break;
                case 1:
                    this._callback.gotDouble(readCStr, this._in.readDouble());
                    break;
                case 2:
                    this._callback.gotString(readCStr, this._in.readUTF8String());
                    break;
                case 3:
                    this._in.readInt();
                    this._callback.objectStart(readCStr);
                    do {
                    } while (decodeElement());
                    this._callback.objectDone();
                    break;
                case 4:
                    this._in.readInt();
                    this._callback.arrayStart(readCStr);
                    do {
                    } while (decodeElement());
                    this._callback.arrayDone();
                    break;
                case 5:
                    _binary(readCStr);
                    break;
                case 6:
                    this._callback.gotUndefined(readCStr);
                    break;
                case 7:
                    this._callback.gotObjectId(readCStr, new ObjectId(this._in.readIntBE(), this._in.readIntBE(), this._in.readIntBE()));
                    break;
                case 8:
                    BSONCallback bSONCallback = this._callback;
                    boolean z2 = false;
                    if (this._in.read() > 0) {
                        z2 = true;
                    }
                    bSONCallback.gotBoolean(readCStr, z2);
                    break;
                case 9:
                    this._callback.gotDate(readCStr, this._in.readLong());
                    break;
                case 10:
                    this._callback.gotNull(readCStr);
                    break;
                case 11:
                    this._callback.gotRegex(readCStr, this._in.readCStr(), this._in.readCStr());
                    break;
                case 12:
                    this._in.readInt();
                    this._callback.gotDBRef(readCStr, this._in.readCStr(), new ObjectId(this._in.readInt(), this._in.readInt(), this._in.readInt()));
                    break;
                case 13:
                    this._callback.gotCode(readCStr, this._in.readUTF8String());
                    break;
                case 14:
                    this._callback.gotSymbol(readCStr, this._in.readUTF8String());
                    break;
                case 15:
                    this._in.readInt();
                    this._callback.gotCodeWScope(readCStr, this._in.readUTF8String(), _readBasicObject());
                    break;
                case 16:
                    this._callback.gotInt(readCStr, this._in.readInt());
                    break;
                case 17:
                    this._callback.gotTimestamp(readCStr, this._in.readInt(), this._in.readInt());
                    break;
                case 18:
                    this._callback.gotLong(readCStr, this._in.readLong());
                    break;
                case Byte.MAX_VALUE:
                    this._callback.gotMaxKey(readCStr);
                    break;
                default:
                    throw new UnsupportedOperationException("BSONDecoder doesn't understand type : " + ((int) read) + " name: " + readCStr);
            }
            z = true;
        }
        return z;
    }

    @Override // org.bson.BSONDecoder
    public BSONObject readObject(InputStream inputStream) throws IOException {
        BasicBSONCallback basicBSONCallback = new BasicBSONCallback();
        decode(inputStream, basicBSONCallback);
        return (BSONObject) basicBSONCallback.get();
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
