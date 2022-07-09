package org.apache.commons.net.telnet;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/net/telnet/TelnetOutputStream.class */
final class TelnetOutputStream extends OutputStream {
    private final TelnetClient __client;
    private boolean __convertCRtoCRLF = true;
    private boolean __lastWasCR = false;

    TelnetOutputStream(TelnetClient telnetClient) {
        this.__client = telnetClient;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.__client._closeOutputStream();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.__client._flushOutputStream();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        synchronized (this.__client) {
            int i2 = i & 255;
            if (this.__client._requestedWont(0)) {
                if (this.__lastWasCR) {
                    if (this.__convertCRtoCRLF) {
                        this.__client._sendByte(10);
                        if (i2 == 10) {
                            this.__lastWasCR = false;
                            return;
                        }
                    } else if (i2 != 10) {
                        this.__client._sendByte(0);
                    }
                }
                this.__lastWasCR = false;
                switch (i2) {
                    case 13:
                        this.__client._sendByte(13);
                        this.__lastWasCR = true;
                        break;
                    case 255:
                        this.__client._sendByte(255);
                        this.__client._sendByte(255);
                        break;
                    default:
                        this.__client._sendByte(i2);
                        break;
                }
            } else if (i2 == 255) {
                this.__client._sendByte(i2);
                this.__client._sendByte(255);
            } else {
                this.__client._sendByte(i2);
            }
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0021 -> B:12:0x0022). Please submit an issue!!! */
    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        synchronized (this.__client) {
            while (i2 > 0) {
                try {
                    write(bArr[i]);
                    i2--;
                    i++;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            }
            try {
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }
}
