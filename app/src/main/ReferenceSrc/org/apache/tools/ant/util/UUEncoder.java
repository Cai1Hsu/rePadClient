package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;

/* loaded from: classes.jar:org/apache/tools/ant/util/UUEncoder.class */
public class UUEncoder {
    protected static final int DEFAULT_MODE = 644;
    private static final int INPUT_BUFFER_SIZE = 4500;
    private static final int MAX_CHARS_PER_LINE = 45;
    private String name;
    private OutputStream out;

    public UUEncoder(String str) {
        this.name = str;
    }

    private void encodeBegin() throws IOException {
        encodeString(new StringBuffer().append("begin 644 ").append(this.name).append("\n").toString());
    }

    private void encodeEnd() throws IOException {
        encodeString(" \nend\n");
    }

    private void encodeLine(byte[] bArr, int i, int i2, OutputStream outputStream) throws IOException {
        outputStream.write((byte) ((i2 & 63) + 32));
        int i3 = 0;
        while (i3 < i2) {
            byte b = 1;
            int i4 = i3 + 1;
            byte b2 = bArr[i + i3];
            byte b3 = 1;
            i3 = i4;
            if (i4 < i2) {
                i3 = i4 + 1;
                b = bArr[i + i4];
                if (i3 < i2) {
                    i3++;
                    b3 = bArr[i + i3];
                } else {
                    b3 = 1;
                }
            }
            byte b4 = (byte) (((b2 >>> 2) & 63) + 32);
            outputStream.write(b4);
            outputStream.write((byte) ((((b2 << 4) & 48) | ((b >>> 4) & 15)) + 32));
            outputStream.write((byte) ((((b << 2) & 60) | ((b3 >>> 6) & 3)) + 32));
            outputStream.write((byte) ((b3 & 63) + 32));
        }
        outputStream.write(10);
    }

    private void encodeString(String str) throws IOException {
        PrintStream printStream = new PrintStream(this.out);
        printStream.print(str);
        printStream.flush();
    }

    public void encode(InputStream inputStream, OutputStream outputStream) throws IOException {
        this.out = outputStream;
        encodeBegin();
        byte[] bArr = new byte[INPUT_BUFFER_SIZE];
        while (true) {
            int read = inputStream.read(bArr, 0, bArr.length);
            if (read == -1) {
                outputStream.flush();
                encodeEnd();
                return;
            }
            int i = 0;
            while (read > 0) {
                int i2 = read > 45 ? 45 : read;
                encodeLine(bArr, i, i2, outputStream);
                i += i2;
                read -= i2;
            }
        }
    }
}
