package org.apache.commons.compress.compressors.pack200;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.jar.JarInputStream;
import java.util.jar.Pack200;
import org.apache.commons.compress.compressors.CompressorOutputStream;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream.class */
public class Pack200CompressorOutputStream extends CompressorOutputStream {
    private boolean finished;
    private final OutputStream originalOutput;
    private final Map<String, String> properties;
    private final StreamBridge streamBridge;

    public Pack200CompressorOutputStream(OutputStream outputStream) throws IOException {
        this(outputStream, Pack200Strategy.IN_MEMORY);
    }

    public Pack200CompressorOutputStream(OutputStream outputStream, Map<String, String> map) throws IOException {
        this(outputStream, Pack200Strategy.IN_MEMORY, map);
    }

    public Pack200CompressorOutputStream(OutputStream outputStream, Pack200Strategy pack200Strategy) throws IOException {
        this(outputStream, pack200Strategy, null);
    }

    public Pack200CompressorOutputStream(OutputStream outputStream, Pack200Strategy pack200Strategy, Map<String, String> map) throws IOException {
        this.finished = false;
        this.originalOutput = outputStream;
        this.streamBridge = pack200Strategy.newStreamBridge();
        this.properties = map;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        finish();
        try {
            this.streamBridge.stop();
        } finally {
            this.originalOutput.close();
        }
    }

    public void finish() throws IOException {
        Throwable th;
        if (!this.finished) {
            this.finished = true;
            Pack200.Packer newPacker = Pack200.newPacker();
            if (this.properties != null) {
                newPacker.properties().putAll(this.properties);
            }
            JarInputStream jarInputStream = null;
            try {
                JarInputStream jarInputStream2 = new JarInputStream(this.streamBridge.getInput());
                try {
                    newPacker.pack(jarInputStream2, this.originalOutput);
                    if (1 != 0 || jarInputStream2 == null) {
                        return;
                    }
                    try {
                        jarInputStream2.close();
                    } catch (IOException e) {
                    }
                } catch (Throwable th2) {
                    th = th2;
                    jarInputStream = jarInputStream2;
                    if (0 == 0 && jarInputStream != null) {
                        try {
                            jarInputStream.close();
                        } catch (IOException e2) {
                        }
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.streamBridge.write(i);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr) throws IOException {
        this.streamBridge.write(bArr);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.streamBridge.write(bArr, i, i2);
    }
}
