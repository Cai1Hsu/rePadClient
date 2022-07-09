package org.apache.commons.compress.compressors.pack200;

import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.jar.JarOutputStream;
import java.util.jar.Pack200;
import org.apache.commons.compress.compressors.CompressorInputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream.class */
public class Pack200CompressorInputStream extends CompressorInputStream {
    private static final byte[] CAFE_DOOD = {-54, -2, -48, 13};
    private static final int SIG_LENGTH = CAFE_DOOD.length;
    private final InputStream originalInput;
    private final StreamBridge streamBridge;

    public Pack200CompressorInputStream(File file) throws IOException {
        this(file, Pack200Strategy.IN_MEMORY);
    }

    public Pack200CompressorInputStream(File file, Map<String, String> map) throws IOException {
        this(file, Pack200Strategy.IN_MEMORY, map);
    }

    public Pack200CompressorInputStream(File file, Pack200Strategy pack200Strategy) throws IOException {
        this(null, file, pack200Strategy, null);
    }

    public Pack200CompressorInputStream(File file, Pack200Strategy pack200Strategy, Map<String, String> map) throws IOException {
        this(null, file, pack200Strategy, map);
    }

    public Pack200CompressorInputStream(InputStream inputStream) throws IOException {
        this(inputStream, Pack200Strategy.IN_MEMORY);
    }

    private Pack200CompressorInputStream(InputStream inputStream, File file, Pack200Strategy pack200Strategy, Map<String, String> map) throws IOException {
        this.originalInput = inputStream;
        this.streamBridge = pack200Strategy.newStreamBridge();
        JarOutputStream jarOutputStream = new JarOutputStream(this.streamBridge);
        Pack200.Unpacker newUnpacker = Pack200.newUnpacker();
        if (map != null) {
            newUnpacker.properties().putAll(map);
        }
        if (file == null) {
            newUnpacker.unpack(new FilterInputStream(inputStream) { // from class: org.apache.commons.compress.compressors.pack200.Pack200CompressorInputStream.1
                @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
                public void close() {
                }
            }, jarOutputStream);
        } else {
            newUnpacker.unpack(file, jarOutputStream);
        }
        jarOutputStream.close();
    }

    public Pack200CompressorInputStream(InputStream inputStream, Map<String, String> map) throws IOException {
        this(inputStream, Pack200Strategy.IN_MEMORY, map);
    }

    public Pack200CompressorInputStream(InputStream inputStream, Pack200Strategy pack200Strategy) throws IOException {
        this(inputStream, null, pack200Strategy, null);
    }

    public Pack200CompressorInputStream(InputStream inputStream, Pack200Strategy pack200Strategy, Map<String, String> map) throws IOException {
        this(inputStream, null, pack200Strategy, map);
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z;
        if (i >= SIG_LENGTH) {
            int i2 = 0;
            while (true) {
                if (i2 >= SIG_LENGTH) {
                    z = true;
                    break;
                }
                z = false;
                if (bArr[i2] != CAFE_DOOD[i2]) {
                    break;
                }
                i2++;
            }
        } else {
            z = false;
        }
        return z;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.streamBridge.getInput().available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            this.streamBridge.stop();
        } finally {
            if (this.originalInput != null) {
                this.originalInput.close();
            }
        }
    }

    @Override // java.io.InputStream
    public void mark(int i) {
        try {
            this.streamBridge.getInput().mark(i);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        boolean z;
        try {
            z = this.streamBridge.getInput().markSupported();
        } catch (IOException e) {
            z = false;
        }
        return z;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        return this.streamBridge.getInput().read();
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return this.streamBridge.getInput().read(bArr);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        return this.streamBridge.getInput().read(bArr, i, i2);
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        this.streamBridge.getInput().reset();
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        return this.streamBridge.getInput().skip(j);
    }
}
