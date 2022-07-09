package org.apache.commons.io;

import java.io.Serializable;
import org.apache.commons.compress.utils.CharsetNames;
import org.apache.commons.net.telnet.TelnetCommand;

/* loaded from: classes.jar:org/apache/commons/io/ByteOrderMark.class */
public class ByteOrderMark implements Serializable {
    private static final long serialVersionUID = 1;
    private final int[] bytes;
    private final String charsetName;
    public static final ByteOrderMark UTF_8 = new ByteOrderMark("UTF-8", TelnetCommand.EOR, 187, 191);
    public static final ByteOrderMark UTF_16BE = new ByteOrderMark(CharsetNames.UTF_16BE, TelnetCommand.DONT, 255);
    public static final ByteOrderMark UTF_16LE = new ByteOrderMark(CharsetNames.UTF_16LE, 255, TelnetCommand.DONT);
    public static final ByteOrderMark UTF_32BE = new ByteOrderMark("UTF-32BE", 0, 0, TelnetCommand.DONT, 255);
    public static final ByteOrderMark UTF_32LE = new ByteOrderMark("UTF-32LE", 255, TelnetCommand.DONT, 0, 0);

    public ByteOrderMark(String str, int... iArr) {
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("No charsetName specified");
        }
        if (iArr == null || iArr.length == 0) {
            throw new IllegalArgumentException("No bytes specified");
        }
        this.charsetName = str;
        this.bytes = new int[iArr.length];
        System.arraycopy(iArr, 0, this.bytes, 0, iArr.length);
    }

    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof ByteOrderMark)) {
            z = false;
        } else {
            ByteOrderMark byteOrderMark = (ByteOrderMark) obj;
            z = false;
            if (this.bytes.length == byteOrderMark.length()) {
                int i = 0;
                while (true) {
                    if (i >= this.bytes.length) {
                        z = true;
                        break;
                    }
                    z = false;
                    if (this.bytes[i] != byteOrderMark.get(i)) {
                        break;
                    }
                    i++;
                }
            }
        }
        return z;
    }

    public int get(int i) {
        return this.bytes[i];
    }

    public byte[] getBytes() {
        byte[] bArr = new byte[this.bytes.length];
        for (int i = 0; i < this.bytes.length; i++) {
            bArr[i] = (byte) this.bytes[i];
        }
        return bArr;
    }

    public String getCharsetName() {
        return this.charsetName;
    }

    public int hashCode() {
        int hashCode = getClass().hashCode();
        for (int i : this.bytes) {
            hashCode += i;
        }
        return hashCode;
    }

    public int length() {
        return this.bytes.length;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append('[');
        sb.append(this.charsetName);
        sb.append(": ");
        for (int i = 0; i < this.bytes.length; i++) {
            if (i > 0) {
                sb.append(",");
            }
            sb.append("0x");
            sb.append(Integer.toHexString(this.bytes[i] & 255).toUpperCase());
        }
        sb.append(']');
        return sb.toString();
    }
}
