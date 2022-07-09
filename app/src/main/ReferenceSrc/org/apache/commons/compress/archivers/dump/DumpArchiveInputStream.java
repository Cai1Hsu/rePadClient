package org.apache.commons.compress.archivers.dump;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Stack;
import org.apache.commons.compress.archivers.ArchiveException;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.dump.DumpArchiveConstants;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/DumpArchiveInputStream.class */
public class DumpArchiveInputStream extends ArchiveInputStream {
    private DumpArchiveEntry active;
    private byte[] blockBuffer;
    private long entryOffset;
    private long entrySize;
    private long filepos;
    private boolean isClosed;
    private Queue<DumpArchiveEntry> queue;
    protected TapeInputStream raw;
    private int readIdx;
    private int recordOffset;
    private DumpArchiveSummary summary;
    private byte[] readBuf = new byte[1024];
    private Map<Integer, Dirent> names = new HashMap();
    private Map<Integer, DumpArchiveEntry> pending = new HashMap();
    private boolean hasHitEOF = false;

    public DumpArchiveInputStream(InputStream inputStream) throws ArchiveException {
        this.raw = new TapeInputStream(inputStream);
        try {
            byte[] readRecord = this.raw.readRecord();
            if (!DumpArchiveUtil.verify(readRecord)) {
                throw new UnrecognizedFormatException();
            }
            this.summary = new DumpArchiveSummary(readRecord);
            this.raw.resetBlockSize(this.summary.getNTRec(), this.summary.isCompressed());
            this.blockBuffer = new byte[4096];
            readCLRI();
            readBITS();
            this.names.put(2, new Dirent(2, 2, 4, "."));
            this.queue = new PriorityQueue(10, new Comparator<DumpArchiveEntry>() { // from class: org.apache.commons.compress.archivers.dump.DumpArchiveInputStream.1
                public int compare(DumpArchiveEntry dumpArchiveEntry, DumpArchiveEntry dumpArchiveEntry2) {
                    return (dumpArchiveEntry.getOriginalName() == null || dumpArchiveEntry2.getOriginalName() == null) ? Integer.MAX_VALUE : dumpArchiveEntry.getOriginalName().compareTo(dumpArchiveEntry2.getOriginalName());
                }
            });
        } catch (IOException e) {
            throw new ArchiveException(e.getMessage(), e);
        }
    }

    private String getPath(DumpArchiveEntry dumpArchiveEntry) {
        String sb;
        Stack stack = new Stack();
        int ino = dumpArchiveEntry.getIno();
        while (true) {
            int i = ino;
            if (this.names.containsKey(Integer.valueOf(i))) {
                Dirent dirent = this.names.get(Integer.valueOf(i));
                stack.push(dirent.getName());
                if (dirent.getIno() == dirent.getParentIno()) {
                    break;
                }
                ino = dirent.getParentIno();
            } else {
                stack.clear();
                break;
            }
        }
        if (stack.isEmpty()) {
            this.pending.put(Integer.valueOf(dumpArchiveEntry.getIno()), dumpArchiveEntry);
            sb = null;
        } else {
            StringBuilder sb2 = new StringBuilder((String) stack.pop());
            while (!stack.isEmpty()) {
                sb2.append('/');
                sb2.append((String) stack.pop());
            }
            sb = sb2.toString();
        }
        return sb;
    }

    public static boolean matches(byte[] bArr, int i) {
        boolean z = false;
        if (i >= 32) {
            if (i >= 1024) {
                z = DumpArchiveUtil.verify(bArr);
            } else if (60012 == DumpArchiveUtil.convert32(bArr, 24)) {
                z = true;
            }
        }
        return z;
    }

    private void readBITS() throws IOException {
        byte[] readRecord = this.raw.readRecord();
        if (!DumpArchiveUtil.verify(readRecord)) {
            throw new InvalidFormatException();
        }
        this.active = DumpArchiveEntry.parse(readRecord);
        if (DumpArchiveConstants.SEGMENT_TYPE.BITS != this.active.getHeaderType()) {
            throw new InvalidFormatException();
        }
        if (this.raw.skip(this.active.getHeaderCount() * 1024) == -1) {
            throw new EOFException();
        }
        this.readIdx = this.active.getHeaderCount();
    }

    private void readCLRI() throws IOException {
        byte[] readRecord = this.raw.readRecord();
        if (!DumpArchiveUtil.verify(readRecord)) {
            throw new InvalidFormatException();
        }
        this.active = DumpArchiveEntry.parse(readRecord);
        if (DumpArchiveConstants.SEGMENT_TYPE.CLRI != this.active.getHeaderType()) {
            throw new InvalidFormatException();
        }
        if (this.raw.skip(this.active.getHeaderCount() * 1024) == -1) {
            throw new EOFException();
        }
        this.readIdx = this.active.getHeaderCount();
    }

    private void readDirectoryEntry(DumpArchiveEntry dumpArchiveEntry) throws IOException {
        long entrySize = dumpArchiveEntry.getEntrySize();
        boolean z = true;
        while (true) {
            if (z || DumpArchiveConstants.SEGMENT_TYPE.ADDR == dumpArchiveEntry.getHeaderType()) {
                if (!z) {
                    this.raw.readRecord();
                }
                if (!this.names.containsKey(Integer.valueOf(dumpArchiveEntry.getIno())) && DumpArchiveConstants.SEGMENT_TYPE.INODE == dumpArchiveEntry.getHeaderType()) {
                    this.pending.put(Integer.valueOf(dumpArchiveEntry.getIno()), dumpArchiveEntry);
                }
                int headerCount = dumpArchiveEntry.getHeaderCount() * 1024;
                if (this.blockBuffer.length < headerCount) {
                    this.blockBuffer = new byte[headerCount];
                }
                if (this.raw.read(this.blockBuffer, 0, headerCount) != headerCount) {
                    throw new EOFException();
                }
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= headerCount - 8 || i2 >= entrySize - 8) {
                        break;
                    }
                    int convert32 = DumpArchiveUtil.convert32(this.blockBuffer, i2);
                    int convert16 = DumpArchiveUtil.convert16(this.blockBuffer, i2 + 4);
                    byte b = this.blockBuffer[i2 + 6];
                    String str = new String(this.blockBuffer, i2 + 8, (int) this.blockBuffer[i2 + 7]);
                    if (!".".equals(str) && !"..".equals(str)) {
                        this.names.put(Integer.valueOf(convert32), new Dirent(convert32, dumpArchiveEntry.getIno(), b, str));
                        for (Map.Entry<Integer, DumpArchiveEntry> entry : this.pending.entrySet()) {
                            String path = getPath(entry.getValue());
                            if (path != null) {
                                entry.getValue().setName(path);
                                entry.getValue().setSimpleName(this.names.get(entry.getKey()).getName());
                                this.queue.add(entry.getValue());
                            }
                        }
                        for (DumpArchiveEntry dumpArchiveEntry2 : this.queue) {
                            this.pending.remove(Integer.valueOf(dumpArchiveEntry2.getIno()));
                        }
                    }
                    i = i2 + convert16;
                }
                byte[] peek = this.raw.peek();
                if (!DumpArchiveUtil.verify(peek)) {
                    throw new InvalidFormatException();
                }
                dumpArchiveEntry = DumpArchiveEntry.parse(peek);
                z = false;
                entrySize -= 1024;
            } else {
                return;
            }
        }
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.isClosed) {
            this.isClosed = true;
            this.raw.close();
        }
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public long getBytesRead() {
        return this.raw.getBytesRead();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    @Deprecated
    public int getCount() {
        return (int) getBytesRead();
    }

    public DumpArchiveEntry getNextDumpEntry() throws IOException {
        return getNextEntry();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveInputStream
    public DumpArchiveEntry getNextEntry() throws IOException {
        DumpArchiveEntry dumpArchiveEntry = null;
        String str = null;
        if (this.queue.isEmpty()) {
            while (true) {
                if (dumpArchiveEntry != null) {
                    dumpArchiveEntry.setName(str);
                    dumpArchiveEntry.setSimpleName(this.names.get(Integer.valueOf(dumpArchiveEntry.getIno())).getName());
                    dumpArchiveEntry.setOffset(this.filepos);
                    break;
                }
                dumpArchiveEntry = null;
                if (this.hasHitEOF) {
                    break;
                }
                while (this.readIdx < this.active.getHeaderCount()) {
                    DumpArchiveEntry dumpArchiveEntry2 = this.active;
                    int i = this.readIdx;
                    this.readIdx = i + 1;
                    if (!dumpArchiveEntry2.isSparseRecord(i) && this.raw.skip(1024L) == -1) {
                        throw new EOFException();
                    }
                }
                this.readIdx = 0;
                this.filepos = this.raw.getBytesRead();
                byte[] readRecord = this.raw.readRecord();
                if (!DumpArchiveUtil.verify(readRecord)) {
                    throw new InvalidFormatException();
                }
                this.active = DumpArchiveEntry.parse(readRecord);
                while (DumpArchiveConstants.SEGMENT_TYPE.ADDR == this.active.getHeaderType()) {
                    if (this.raw.skip((this.active.getHeaderCount() - this.active.getHeaderHoles()) * 1024) == -1) {
                        throw new EOFException();
                    }
                    this.filepos = this.raw.getBytesRead();
                    byte[] readRecord2 = this.raw.readRecord();
                    if (!DumpArchiveUtil.verify(readRecord2)) {
                        throw new InvalidFormatException();
                    }
                    this.active = DumpArchiveEntry.parse(readRecord2);
                }
                if (DumpArchiveConstants.SEGMENT_TYPE.END == this.active.getHeaderType()) {
                    this.hasHitEOF = true;
                    this.isClosed = true;
                    this.raw.close();
                    dumpArchiveEntry = null;
                    break;
                }
                dumpArchiveEntry = this.active;
                if (dumpArchiveEntry.isDirectory()) {
                    readDirectoryEntry(this.active);
                    this.entryOffset = 0L;
                    this.entrySize = 0L;
                    this.readIdx = this.active.getHeaderCount();
                } else {
                    this.entryOffset = 0L;
                    this.entrySize = this.active.getEntrySize();
                    this.readIdx = 0;
                }
                this.recordOffset = this.readBuf.length;
                String path = getPath(dumpArchiveEntry);
                str = path;
                if (path == null) {
                    dumpArchiveEntry = null;
                    str = path;
                }
            }
        } else {
            dumpArchiveEntry = this.queue.remove();
        }
        return dumpArchiveEntry;
    }

    public DumpArchiveSummary getSummary() {
        return this.summary;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        if (this.isClosed || this.entryOffset >= this.entrySize) {
            i3 = -1;
        } else {
            i3 = 0;
            int i4 = i;
            int i5 = i2;
            if (i2 + this.entryOffset > this.entrySize) {
                i5 = (int) (this.entrySize - this.entryOffset);
                i4 = i;
                i3 = 0;
            }
            while (i5 > 0) {
                int length = i5 > this.readBuf.length - this.recordOffset ? this.readBuf.length - this.recordOffset : i5;
                int i6 = i3;
                int i7 = i4;
                int i8 = i5;
                if (this.recordOffset + length <= this.readBuf.length) {
                    System.arraycopy(this.readBuf, this.recordOffset, bArr, i4, length);
                    i6 = i3 + length;
                    this.recordOffset += length;
                    i8 = i5 - length;
                    i7 = i4 + length;
                }
                i3 = i6;
                i4 = i7;
                i5 = i8;
                if (i8 > 0) {
                    if (this.readIdx >= 512) {
                        byte[] readRecord = this.raw.readRecord();
                        if (!DumpArchiveUtil.verify(readRecord)) {
                            throw new InvalidFormatException();
                        }
                        this.active = DumpArchiveEntry.parse(readRecord);
                        this.readIdx = 0;
                    }
                    DumpArchiveEntry dumpArchiveEntry = this.active;
                    int i9 = this.readIdx;
                    this.readIdx = i9 + 1;
                    if (dumpArchiveEntry.isSparseRecord(i9)) {
                        Arrays.fill(this.readBuf, (byte) 0);
                    } else if (this.raw.read(this.readBuf, 0, this.readBuf.length) != this.readBuf.length) {
                        throw new EOFException();
                    }
                    this.recordOffset = 0;
                    i3 = i6;
                    i4 = i7;
                    i5 = i8;
                }
            }
            this.entryOffset += i3;
        }
        return i3;
    }
}
