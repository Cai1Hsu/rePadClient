package org.bson.io;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import org.bson.util.SimplePool;

@Deprecated
/* loaded from: classes.jar:org/bson/io/PoolOutputBuffer.class */
public class PoolOutputBuffer extends OutputBuffer {
    public static final int BUF_SIZE = 16384;
    private static final String DEFAULT_ENCODING_1 = "UTF-8";
    private static final String DEFAULT_ENCODING_2 = "UTF8";
    private static SimplePool<byte[]> _extra = new SimplePool<byte[]>(640) { // from class: org.bson.io.PoolOutputBuffer.1
        @Override // org.bson.util.SimplePool
        public byte[] createNew() {
            return new byte[16384];
        }
    };
    final byte[] _mine = new byte[16384];
    final char[] _chars = new char[16384];
    final List<byte[]> _fromPool = new ArrayList();
    final UTF8Encoding _encoding = new UTF8Encoding();
    private final Position _cur = new Position();
    private final Position _end = new Position();

    /* loaded from: classes.jar:org/bson/io/PoolOutputBuffer$Position.class */
    static class Position {
        int x;
        int y;

        Position() {
            reset();
        }

        int getAndInc() {
            int i = this.y;
            this.y = i + 1;
            return i;
        }

        void inc(int i) {
            this.y += i;
            if (this.y > 16384) {
                throw new IllegalArgumentException("something is wrong");
            }
        }

        int len(int i) {
            return i < this.x ? 16384 : i == this.x ? this.y : 0;
        }

        void nextBuffer() {
            if (this.y != 16384) {
                throw new IllegalArgumentException("broken");
            }
            this.x++;
            this.y = 0;
        }

        int pos() {
            return ((this.x + 1) * 16384) + this.y;
        }

        void reset() {
            this.x = -1;
            this.y = 0;
        }

        void reset(int i) {
            this.x = (i / 16384) - 1;
            this.y = i % 16384;
        }

        void reset(Position position) {
            this.x = position.x;
            this.y = position.y;
        }

        public String toString() {
            return this.x + "," + this.y;
        }
    }

    public PoolOutputBuffer() {
        reset();
    }

    void _afterWrite() {
        if (this._cur.pos() < this._end.pos()) {
            if (this._cur.y != 16384) {
                return;
            }
            this._cur.nextBuffer();
            return;
        }
        this._end.reset(this._cur);
        if (this._end.y < 16384) {
            return;
        }
        this._fromPool.add(_extra.get());
        this._end.nextBuffer();
        this._cur.reset(this._end);
    }

    byte[] _cur() {
        return _get(this._cur.x);
    }

    byte[] _get(int i) {
        return i < 0 ? this._mine : this._fromPool.get(i);
    }

    public String asAscii() {
        String str;
        if (this._fromPool.size() > 0) {
            str = super.asString();
        } else {
            int size = size();
            char[] cArr = size < this._chars.length ? this._chars : new char[size];
            for (int i = 0; i < size; i++) {
                cArr[i] = (char) this._mine[i];
            }
            str = new String(cArr, 0, size);
        }
        return str;
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public String asString(String str) throws UnsupportedEncodingException {
        String decode;
        if (this._fromPool.size() > 0) {
            decode = super.asString(str);
        } else {
            if (str.equals("UTF-8") || str.equals(DEFAULT_ENCODING_2)) {
                try {
                    decode = this._encoding.decode(this._mine, 0, size());
                } catch (IOException e) {
                }
            }
            decode = new String(this._mine, 0, size(), str);
        }
        return decode;
    }

    @Override // org.bson.io.OutputBuffer
    public int getPosition() {
        return this._cur.pos();
    }

    @Override // org.bson.io.OutputBuffer
    public int pipe(OutputStream outputStream) throws IOException {
        if (outputStream == null) {
            throw new NullPointerException("out is null");
        }
        int i = 0;
        for (int i2 = -1; i2 < this._fromPool.size(); i2++) {
            byte[] _get = _get(i2);
            int len = this._end.len(i2);
            if (len == 0) {
                break;
            }
            outputStream.write(_get, 0, len);
            i += len;
        }
        return i;
    }

    public void reset() {
        this._cur.reset();
        this._end.reset();
        for (int i = 0; i < this._fromPool.size(); i++) {
            _extra.done(this._fromPool.get(i));
        }
        this._fromPool.clear();
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekEnd() {
        this._cur.reset(this._end);
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void seekStart() {
        this._cur.reset();
    }

    @Override // org.bson.io.OutputBuffer
    @Deprecated
    public void setPosition(int i) {
        this._cur.reset(i);
    }

    @Override // org.bson.io.OutputBuffer
    public int size() {
        return this._end.pos();
    }

    @Override // org.bson.io.OutputBuffer
    public void truncateToPosition(int i) {
        setPosition(i);
        this._end.reset(this._cur);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(int i) {
        _cur()[this._cur.getAndInc()] = (byte) (i & 255);
        _afterWrite();
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] bArr) {
        write(bArr, 0, bArr.length);
    }

    @Override // org.bson.io.OutputBuffer, java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) {
        while (i2 > 0) {
            byte[] _cur = _cur();
            int min = Math.min(_cur.length - this._cur.y, i2);
            System.arraycopy(bArr, i, _cur, this._cur.y, min);
            this._cur.inc(min);
            i2 -= min;
            i += min;
            _afterWrite();
        }
    }
}
