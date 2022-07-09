package org.apache.tools.ant;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.WeakHashMap;

/* loaded from: classes.jar:org/apache/tools/ant/DemuxOutputStream.class */
public class DemuxOutputStream extends OutputStream {
    private static final int CR = 13;
    private static final int INTIAL_SIZE = 132;
    private static final int LF = 10;
    private static final int MAX_SIZE = 1024;
    private WeakHashMap buffers = new WeakHashMap();
    private boolean isErrorStream;
    private Project project;

    /* renamed from: org.apache.tools.ant.DemuxOutputStream$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/DemuxOutputStream$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/DemuxOutputStream$BufferInfo.class */
    private static class BufferInfo {
        private ByteArrayOutputStream buffer;
        private boolean crSeen;

        private BufferInfo() {
            this.crSeen = false;
        }

        BufferInfo(AnonymousClass1 anonymousClass1) {
            this();
        }
    }

    public DemuxOutputStream(Project project, boolean z) {
        this.project = project;
        this.isErrorStream = z;
    }

    private BufferInfo getBufferInfo() {
        Thread currentThread = Thread.currentThread();
        BufferInfo bufferInfo = (BufferInfo) this.buffers.get(currentThread);
        BufferInfo bufferInfo2 = bufferInfo;
        if (bufferInfo == null) {
            bufferInfo2 = new BufferInfo(null);
            bufferInfo2.buffer = new ByteArrayOutputStream(INTIAL_SIZE);
            bufferInfo2.crSeen = false;
            this.buffers.put(currentThread, bufferInfo2);
        }
        return bufferInfo2;
    }

    private void removeBuffer() {
        this.buffers.remove(Thread.currentThread());
    }

    private void resetBufferInfo() {
        BufferInfo bufferInfo = (BufferInfo) this.buffers.get(Thread.currentThread());
        try {
            bufferInfo.buffer.close();
        } catch (IOException e) {
        }
        bufferInfo.buffer = new ByteArrayOutputStream();
        bufferInfo.crSeen = false;
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        flush();
        removeBuffer();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        BufferInfo bufferInfo = getBufferInfo();
        if (bufferInfo.buffer.size() > 0) {
            processFlush(bufferInfo.buffer);
        }
    }

    protected void processBuffer(ByteArrayOutputStream byteArrayOutputStream) {
        this.project.demuxOutput(byteArrayOutputStream.toString(), this.isErrorStream);
        resetBufferInfo();
    }

    protected void processFlush(ByteArrayOutputStream byteArrayOutputStream) {
        this.project.demuxFlush(byteArrayOutputStream.toString(), this.isErrorStream);
        resetBufferInfo();
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        byte b = (byte) i;
        BufferInfo bufferInfo = getBufferInfo();
        if (b == 10) {
            bufferInfo.buffer.write(i);
            processBuffer(bufferInfo.buffer);
        } else {
            if (bufferInfo.crSeen) {
                processBuffer(bufferInfo.buffer);
            }
            bufferInfo.buffer.write(i);
        }
        bufferInfo.crSeen = b == 13;
        if (bufferInfo.crSeen || bufferInfo.buffer.size() <= 1024) {
            return;
        }
        processBuffer(bufferInfo.buffer);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        int i3 = i;
        BufferInfo bufferInfo = getBufferInfo();
        while (i2 > 0) {
            int i4 = i2;
            int i5 = i;
            while (i4 > 0 && bArr[i5] != 10 && bArr[i5] != 13) {
                i5++;
                i4--;
            }
            int i6 = i5 - i3;
            i = i5;
            i2 = i4;
            if (i6 > 0) {
                bufferInfo.buffer.write(bArr, i3, i6);
                i2 = i4;
                i = i5;
            }
            while (i2 > 0 && (bArr[i] == 10 || bArr[i] == 13)) {
                write(bArr[i]);
                i++;
                i2--;
            }
            i3 = i;
        }
    }
}
