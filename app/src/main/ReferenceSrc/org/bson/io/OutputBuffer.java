package org.bson.io;

import com.mongodb.util.Util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.bson.BSONException;

/* loaded from: classes.jar:org/bson/io/OutputBuffer.class */
public abstract class OutputBuffer extends OutputStream {
    private int writeCString(String str, boolean z) {
        int length = str.length();
        int i = 0;
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 >= length) {
                write(0);
                return i + 1;
            }
            int codePointAt = Character.codePointAt(str, i3);
            if (z && codePointAt == 0) {
                throw new BSONException(String.format("BSON cstring '%s' is not valid because it contains a null character at index %d", str, Integer.valueOf(i3)));
            }
            if (codePointAt < 128) {
                write((byte) codePointAt);
                i++;
            } else if (codePointAt < 2048) {
                write((byte) ((codePointAt >> 6) + 192));
                write((byte) ((codePointAt & 63) + 128));
                i += 2;
            } else if (codePointAt < 65536) {
                write((byte) ((codePointAt >> 12) + 224));
                write((byte) (((codePointAt >> 6) & 63) + 128));
                write((byte) ((codePointAt & 63) + 128));
                i += 3;
            } else {
                write((byte) ((codePointAt >> 18) + 240));
                write((byte) (((codePointAt >> 12) & 63) + 128));
                write((byte) (((codePointAt >> 6) & 63) + 128));
                write((byte) ((codePointAt & 63) + 128));
                i += 4;
            }
            i2 = i3 + Character.charCount(codePointAt);
        }
    }

    @Deprecated
    public String asString() {
        return new String(toByteArray());
    }

    @Deprecated
    public String asString(String str) throws UnsupportedEncodingException {
        return new String(toByteArray(), str);
    }

    public void backpatchSize(int i) {
        writeInt(getPosition() - i, i);
    }

    protected void backpatchSize(int i, int i2) {
        writeInt((getPosition() - i) - i2, i);
    }

    public abstract int getPosition();

    @Deprecated
    public String hex() {
        final StringBuilder sb = new StringBuilder();
        try {
            pipe(new OutputStream() { // from class: org.bson.io.OutputBuffer.1
                @Override // java.io.OutputStream
                public void write(int i) {
                    String hexString = Integer.toHexString(i & 255);
                    if (hexString.length() < 2) {
                        sb.append("0");
                    }
                    sb.append(hexString);
                }
            });
            return sb.toString();
        } catch (IOException e) {
            throw new RuntimeException("impossible");
        }
    }

    @Deprecated
    public String md5() {
        try {
            final MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            try {
                pipe(new OutputStream() { // from class: org.bson.io.OutputBuffer.2
                    @Override // java.io.OutputStream
                    public void write(int i) {
                        messageDigest.update((byte) (i & 255));
                    }

                    @Override // java.io.OutputStream
                    public void write(byte[] bArr, int i, int i2) {
                        messageDigest.update(bArr, i, i2);
                    }
                });
                return Util.toHex(messageDigest.digest());
            } catch (IOException e) {
                throw new RuntimeException("impossible");
            }
        } catch (NoSuchAlgorithmException e2) {
            throw new RuntimeException("Error - this implementation of Java doesn't support MD5.");
        }
    }

    public abstract int pipe(OutputStream outputStream) throws IOException;

    @Deprecated
    public abstract void seekEnd();

    @Deprecated
    public abstract void seekStart();

    @Deprecated
    public abstract void setPosition(int i);

    public abstract int size();

    public byte[] toByteArray() {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(size());
            pipe(byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException("should be impossible", e);
        }
    }

    public String toString() {
        return getClass().getName() + " size: " + size() + " pos: " + getPosition();
    }

    public void truncateToPosition(int i) {
        setPosition(i);
    }

    @Override // java.io.OutputStream
    public abstract void write(int i);

    @Override // java.io.OutputStream
    public abstract void write(byte[] bArr);

    @Override // java.io.OutputStream
    public abstract void write(byte[] bArr, int i, int i2);

    public int writeCString(String str) {
        return writeCString(str, true);
    }

    public void writeDouble(double d) {
        writeLong(Double.doubleToRawLongBits(d));
    }

    public void writeInt(int i) {
        write(i >> 0);
        write(i >> 8);
        write(i >> 16);
        write(i >> 24);
    }

    @Deprecated
    public void writeInt(int i, int i2) {
        int position = getPosition();
        setPosition(i);
        writeInt(i2);
        setPosition(position);
    }

    @Deprecated
    public void writeIntBE(int i) {
        write(i >> 24);
        write(i >> 16);
        write(i >> 8);
        write(i);
    }

    public void writeLong(long j) {
        write((byte) ((j >> 0) & 255));
        write((byte) ((j >> 8) & 255));
        write((byte) ((j >> 16) & 255));
        write((byte) ((j >> 24) & 255));
        write((byte) ((j >> 32) & 255));
        write((byte) ((j >> 40) & 255));
        write((byte) ((j >> 48) & 255));
        write((byte) ((j >> 56) & 255));
    }

    public void writeString(String str) {
        writeInt(0);
        backpatchSize(writeCString(str, false), 4);
    }
}
