package org.apache.tools.tar;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/* loaded from: classes.jar:org/apache/tools/tar/TarBuffer.class */
public class TarBuffer {
    public static final int DEFAULT_BLKSIZE = 10240;
    public static final int DEFAULT_RCDSIZE = 512;
    private byte[] blockBuffer;
    private int blockSize;
    private int currBlkIdx;
    private int currRecIdx;
    private boolean debug;
    private InputStream inStream;
    private OutputStream outStream;
    private int recordSize;
    private int recsPerBlock;

    public TarBuffer(InputStream inputStream) {
        this(inputStream, 10240);
    }

    public TarBuffer(InputStream inputStream, int i) {
        this(inputStream, i, 512);
    }

    public TarBuffer(InputStream inputStream, int i, int i2) {
        this.inStream = inputStream;
        this.outStream = null;
        initialize(i, i2);
    }

    public TarBuffer(OutputStream outputStream) {
        this(outputStream, 10240);
    }

    public TarBuffer(OutputStream outputStream, int i) {
        this(outputStream, i, 512);
    }

    public TarBuffer(OutputStream outputStream, int i, int i2) {
        this.inStream = null;
        this.outStream = outputStream;
        initialize(i, i2);
    }

    private void initialize(int i, int i2) {
        this.debug = false;
        this.blockSize = i;
        this.recordSize = i2;
        this.recsPerBlock = this.blockSize / this.recordSize;
        this.blockBuffer = new byte[this.blockSize];
        if (this.inStream != null) {
            this.currBlkIdx = -1;
            this.currRecIdx = this.recsPerBlock;
            return;
        }
        this.currBlkIdx = 0;
        this.currRecIdx = 0;
    }

    private boolean readBlock() throws IOException {
        boolean z = false;
        if (this.debug) {
            System.err.println(new StringBuffer().append("ReadBlock: blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.inStream == null) {
            throw new IOException("reading from an output buffer");
        }
        this.currRecIdx = 0;
        int i = 0;
        int i2 = this.blockSize;
        while (true) {
            if (i2 <= 0) {
                break;
            }
            long read = this.inStream.read(this.blockBuffer, i, i2);
            if (read != -1) {
                int i3 = (int) (i + read);
                int i4 = (int) (i2 - read);
                i2 = i4;
                i = i3;
                if (read != this.blockSize) {
                    i2 = i4;
                    i = i3;
                    if (this.debug) {
                        System.err.println(new StringBuffer().append("ReadBlock: INCOMPLETE READ ").append(read).append(" of ").append(this.blockSize).append(" bytes read.").toString());
                        i2 = i4;
                        i = i3;
                    }
                }
            } else if (i != 0) {
                Arrays.fill(this.blockBuffer, i, i + i2, (byte) 0);
            }
        }
        this.currBlkIdx++;
        z = true;
        return z;
    }

    private void writeBlock() throws IOException {
        if (this.debug) {
            System.err.println(new StringBuffer().append("WriteBlock: blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.outStream == null) {
            throw new IOException("writing to an input buffer");
        }
        this.outStream.write(this.blockBuffer, 0, this.blockSize);
        this.outStream.flush();
        this.currRecIdx = 0;
        this.currBlkIdx++;
        Arrays.fill(this.blockBuffer, (byte) 0);
    }

    public void close() throws IOException {
        if (this.debug) {
            System.err.println("TarBuffer.closeBuffer().");
        }
        if (this.outStream == null) {
            if (this.inStream == null || this.inStream == System.in) {
                return;
            }
            this.inStream.close();
            this.inStream = null;
            return;
        }
        flushBlock();
        if (this.outStream == System.out || this.outStream == System.err) {
            return;
        }
        this.outStream.close();
        this.outStream = null;
    }

    void flushBlock() throws IOException {
        if (this.debug) {
            System.err.println("TarBuffer.flushBlock() called.");
        }
        if (this.outStream == null) {
            throw new IOException("writing to an input buffer");
        }
        if (this.currRecIdx <= 0) {
            return;
        }
        writeBlock();
    }

    public int getBlockSize() {
        return this.blockSize;
    }

    public int getCurrentBlockNum() {
        return this.currBlkIdx;
    }

    public int getCurrentRecordNum() {
        return this.currRecIdx - 1;
    }

    public int getRecordSize() {
        return this.recordSize;
    }

    public boolean isEOFRecord(byte[] bArr) {
        boolean z;
        int i = 0;
        int recordSize = getRecordSize();
        while (true) {
            if (i >= recordSize) {
                z = true;
                break;
            } else if (bArr[i] != 0) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public byte[] readRecord() throws IOException {
        byte[] bArr;
        if (this.debug) {
            System.err.println(new StringBuffer().append("ReadRecord: recIdx = ").append(this.currRecIdx).append(" blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.inStream == null) {
            throw new IOException("reading from an output buffer");
        }
        if (this.currRecIdx < this.recsPerBlock || readBlock()) {
            bArr = new byte[this.recordSize];
            System.arraycopy(this.blockBuffer, this.currRecIdx * this.recordSize, bArr, 0, this.recordSize);
            this.currRecIdx++;
        } else {
            bArr = null;
        }
        return bArr;
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public void skipRecord() throws IOException {
        if (this.debug) {
            System.err.println(new StringBuffer().append("SkipRecord: recIdx = ").append(this.currRecIdx).append(" blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.inStream == null) {
            throw new IOException("reading (via skip) from an output buffer");
        }
        if (this.currRecIdx >= this.recsPerBlock && !readBlock()) {
            return;
        }
        this.currRecIdx++;
    }

    public void writeRecord(byte[] bArr) throws IOException {
        if (this.debug) {
            System.err.println(new StringBuffer().append("WriteRecord: recIdx = ").append(this.currRecIdx).append(" blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.outStream == null) {
            throw new IOException("writing to an input buffer");
        }
        if (bArr.length != this.recordSize) {
            throw new IOException(new StringBuffer().append("record to write has length '").append(bArr.length).append("' which is not the record size of '").append(this.recordSize).append("'").toString());
        }
        if (this.currRecIdx >= this.recsPerBlock) {
            writeBlock();
        }
        System.arraycopy(bArr, 0, this.blockBuffer, this.currRecIdx * this.recordSize, this.recordSize);
        this.currRecIdx++;
    }

    public void writeRecord(byte[] bArr, int i) throws IOException {
        if (this.debug) {
            System.err.println(new StringBuffer().append("WriteRecord: recIdx = ").append(this.currRecIdx).append(" blkIdx = ").append(this.currBlkIdx).toString());
        }
        if (this.outStream == null) {
            throw new IOException("writing to an input buffer");
        }
        if (this.recordSize + i > bArr.length) {
            throw new IOException(new StringBuffer().append("record has length '").append(bArr.length).append("' with offset '").append(i).append("' which is less than the record size of '").append(this.recordSize).append("'").toString());
        }
        if (this.currRecIdx >= this.recsPerBlock) {
            writeBlock();
        }
        System.arraycopy(bArr, i, this.blockBuffer, this.currRecIdx * this.recordSize, this.recordSize);
        this.currRecIdx++;
    }
}
