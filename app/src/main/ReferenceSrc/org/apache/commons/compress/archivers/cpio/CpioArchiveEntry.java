package org.apache.commons.compress.archivers.cpio;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.File;
import java.util.Date;
import org.apache.commons.compress.archivers.ArchiveEntry;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/cpio/CpioArchiveEntry.class */
public class CpioArchiveEntry implements CpioConstants, ArchiveEntry {
    private final int alignmentBoundary;
    private long chksum;
    private final short fileFormat;
    private long filesize;
    private long gid;
    private final int headerSize;
    private long inode;
    private long maj;
    private long min;
    private long mode;
    private long mtime;
    private String name;
    private long nlink;
    private long rmaj;
    private long rmin;
    private long uid;

    public CpioArchiveEntry(File file, String str) {
        this((short) 1, file, str);
    }

    public CpioArchiveEntry(String str) {
        this((short) 1, str);
    }

    public CpioArchiveEntry(String str, long j) {
        this(str);
        setSize(j);
    }

    public CpioArchiveEntry(short s) {
        this.chksum = 0L;
        this.filesize = 0L;
        this.gid = 0L;
        this.inode = 0L;
        this.maj = 0L;
        this.min = 0L;
        this.mode = 0L;
        this.mtime = 0L;
        this.nlink = 0L;
        this.rmaj = 0L;
        this.rmin = 0L;
        this.uid = 0L;
        switch (s) {
            case 1:
                this.headerSize = 110;
                this.alignmentBoundary = 4;
                break;
            case 2:
                this.headerSize = 110;
                this.alignmentBoundary = 4;
                break;
            case 3:
            case 5:
            case 6:
            case 7:
            default:
                throw new IllegalArgumentException("Unknown header type");
            case 4:
                this.headerSize = 76;
                this.alignmentBoundary = 0;
                break;
            case 8:
                this.headerSize = 26;
                this.alignmentBoundary = 2;
                break;
        }
        this.fileFormat = s;
    }

    public CpioArchiveEntry(short s, File file, String str) {
        this(s, str, file.isFile() ? file.length() : 0L);
        long j;
        if (file.isDirectory()) {
            j = 0 | PlaybackStateCompat.ACTION_PREPARE;
        } else if (!file.isFile()) {
            throw new IllegalArgumentException("Cannot determine type of file " + file.getName());
        } else {
            j = 0 | PlaybackStateCompat.ACTION_PREPARE_FROM_MEDIA_ID;
        }
        setMode(j);
        setTime(file.lastModified() / 1000);
    }

    public CpioArchiveEntry(short s, String str) {
        this(s);
        this.name = str;
    }

    public CpioArchiveEntry(short s, String str, long j) {
        this(s, str);
        setSize(j);
    }

    private void checkNewFormat() {
        if ((this.fileFormat & 3) == 0) {
            throw new UnsupportedOperationException();
        }
    }

    private void checkOldFormat() {
        if ((this.fileFormat & 12) == 0) {
            throw new UnsupportedOperationException();
        }
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null || getClass() != obj.getClass()) {
                z = false;
            } else {
                CpioArchiveEntry cpioArchiveEntry = (CpioArchiveEntry) obj;
                if (this.name == null) {
                    if (cpioArchiveEntry.name != null) {
                        z = false;
                    }
                } else if (!this.name.equals(cpioArchiveEntry.name)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public int getAlignmentBoundary() {
        return this.alignmentBoundary;
    }

    public long getChksum() {
        checkNewFormat();
        return this.chksum;
    }

    public int getDataPadCount() {
        int i;
        int i2 = 0;
        if (this.alignmentBoundary != 0 && (i = (int) (this.filesize % this.alignmentBoundary)) > 0) {
            i2 = this.alignmentBoundary - i;
        }
        return i2;
    }

    public long getDevice() {
        checkOldFormat();
        return this.min;
    }

    public long getDeviceMaj() {
        checkNewFormat();
        return this.maj;
    }

    public long getDeviceMin() {
        checkNewFormat();
        return this.min;
    }

    public short getFormat() {
        return this.fileFormat;
    }

    public long getGID() {
        return this.gid;
    }

    public int getHeaderPadCount() {
        int length;
        int i = 0;
        if (this.alignmentBoundary != 0 && (length = ((this.headerSize + this.name.length()) + 1) % this.alignmentBoundary) > 0) {
            i = this.alignmentBoundary - length;
        }
        return i;
    }

    public int getHeaderSize() {
        return this.headerSize;
    }

    public long getInode() {
        return this.inode;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public Date getLastModifiedDate() {
        return new Date(1000 * getTime());
    }

    public long getMode() {
        return (this.mode != 0 || CpioConstants.CPIO_TRAILER.equals(this.name)) ? this.mode : 32768L;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public String getName() {
        return this.name;
    }

    public long getNumberOfLinks() {
        long j;
        if (this.nlink == 0) {
            j = isDirectory() ? 2 : 1;
        } else {
            j = this.nlink;
        }
        return j;
    }

    public long getRemoteDevice() {
        checkOldFormat();
        return this.rmin;
    }

    public long getRemoteDeviceMaj() {
        checkNewFormat();
        return this.rmaj;
    }

    public long getRemoteDeviceMin() {
        checkNewFormat();
        return this.rmin;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public long getSize() {
        return this.filesize;
    }

    public long getTime() {
        return this.mtime;
    }

    public long getUID() {
        return this.uid;
    }

    public int hashCode() {
        return (this.name == null ? 0 : this.name.hashCode()) + 31;
    }

    public boolean isBlockDevice() {
        return (this.mode & 61440) == 24576;
    }

    public boolean isCharacterDevice() {
        return (this.mode & 61440) == PlaybackStateCompat.ACTION_PLAY_FROM_URI;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public boolean isDirectory() {
        return (this.mode & 61440) == PlaybackStateCompat.ACTION_PREPARE;
    }

    public boolean isNetwork() {
        return (this.mode & 61440) == 36864;
    }

    public boolean isPipe() {
        return (this.mode & 61440) == PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM;
    }

    public boolean isRegularFile() {
        return (this.mode & 61440) == PlaybackStateCompat.ACTION_PREPARE_FROM_MEDIA_ID;
    }

    public boolean isSocket() {
        return (this.mode & 61440) == 49152;
    }

    public boolean isSymbolicLink() {
        return (this.mode & 61440) == 40960;
    }

    public void setChksum(long j) {
        checkNewFormat();
        this.chksum = j;
    }

    public void setDevice(long j) {
        checkOldFormat();
        this.min = j;
    }

    public void setDeviceMaj(long j) {
        checkNewFormat();
        this.maj = j;
    }

    public void setDeviceMin(long j) {
        checkNewFormat();
        this.min = j;
    }

    public void setGID(long j) {
        this.gid = j;
    }

    public void setInode(long j) {
        this.inode = j;
    }

    public void setMode(long j) {
        long j2 = j & 61440;
        switch ((int) j2) {
            case 4096:
            case 8192:
            case 16384:
            case CpioConstants.C_ISBLK /* 24576 */:
            case 32768:
            case CpioConstants.C_ISNWK /* 36864 */:
            case 40960:
            case CpioConstants.C_ISSOCK /* 49152 */:
                this.mode = j;
                return;
            default:
                throw new IllegalArgumentException("Unknown mode. Full: " + Long.toHexString(j) + " Masked: " + Long.toHexString(j2));
        }
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setNumberOfLinks(long j) {
        this.nlink = j;
    }

    public void setRemoteDevice(long j) {
        checkOldFormat();
        this.rmin = j;
    }

    public void setRemoteDeviceMaj(long j) {
        checkNewFormat();
        this.rmaj = j;
    }

    public void setRemoteDeviceMin(long j) {
        checkNewFormat();
        this.rmin = j;
    }

    public void setSize(long j) {
        if (j < 0 || j > 4294967295L) {
            throw new IllegalArgumentException("invalid entry size <" + j + ">");
        }
        this.filesize = j;
    }

    public void setTime(long j) {
        this.mtime = j;
    }

    public void setUID(long j) {
        this.uid = j;
    }
}
