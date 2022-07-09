package org.apache.commons.compress.archivers.dump;

import java.util.Date;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/dump/DumpArchiveSummary.class */
public class DumpArchiveSummary {
    private String devname;
    private long dumpDate;
    private String filesys;
    private int firstrec;
    private int flags;
    private String hostname;
    private String label;
    private int level;
    private int ntrec;
    private long previousDumpDate;
    private int volume;

    DumpArchiveSummary(byte[] bArr) {
        this.dumpDate = DumpArchiveUtil.convert32(bArr, 4) * 1000;
        this.previousDumpDate = DumpArchiveUtil.convert32(bArr, 8) * 1000;
        this.volume = DumpArchiveUtil.convert32(bArr, 12);
        this.label = new String(bArr, 676, 16).trim();
        this.level = DumpArchiveUtil.convert32(bArr, 692);
        this.filesys = new String(bArr, 696, 64).trim();
        this.devname = new String(bArr, 760, 64).trim();
        this.hostname = new String(bArr, 824, 64).trim();
        this.flags = DumpArchiveUtil.convert32(bArr, 888);
        this.firstrec = DumpArchiveUtil.convert32(bArr, 892);
        this.ntrec = DumpArchiveUtil.convert32(bArr, 896);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null || !obj.getClass().equals(getClass())) {
                z = false;
            } else {
                DumpArchiveSummary dumpArchiveSummary = (DumpArchiveSummary) obj;
                if (this.dumpDate != dumpArchiveSummary.dumpDate) {
                    z = false;
                } else if (getHostname() == null || !getHostname().equals(dumpArchiveSummary.getHostname())) {
                    z = false;
                } else if (getDevname() == null || !getDevname().equals(dumpArchiveSummary.getDevname())) {
                    z = false;
                }
            }
        }
        return z;
    }

    public String getDevname() {
        return this.devname;
    }

    public Date getDumpDate() {
        return new Date(this.dumpDate);
    }

    public String getFilesystem() {
        return this.filesys;
    }

    public int getFirstRecord() {
        return this.firstrec;
    }

    public int getFlags() {
        return this.flags;
    }

    public String getHostname() {
        return this.hostname;
    }

    public String getLabel() {
        return this.label;
    }

    public int getLevel() {
        return this.level;
    }

    public int getNTRec() {
        return this.ntrec;
    }

    public Date getPreviousDumpDate() {
        return new Date(this.previousDumpDate);
    }

    public int getVolume() {
        return this.volume;
    }

    public int hashCode() {
        int i = 17;
        if (this.label != null) {
            i = this.label.hashCode();
        }
        int i2 = (int) (i + (31 * this.dumpDate));
        if (this.hostname != null) {
            i2 = (this.hostname.hashCode() * 31) + 17;
        }
        if (this.devname != null) {
            i2 = (this.devname.hashCode() * 31) + 17;
        }
        return i2;
    }

    public boolean isCompressed() {
        return (this.flags & 128) == 128;
    }

    public boolean isExtendedAttributes() {
        return (this.flags & 32768) == 32768;
    }

    public boolean isMetaDataOnly() {
        return (this.flags & 256) == 256;
    }

    public boolean isNewHeader() {
        boolean z = true;
        if ((this.flags & 1) != 1) {
            z = false;
        }
        return z;
    }

    public boolean isNewInode() {
        return (this.flags & 2) == 2;
    }

    public void setDevname(String str) {
        this.devname = str;
    }

    public void setDumpDate(Date date) {
        this.dumpDate = date.getTime();
    }

    public void setFilesystem(String str) {
        this.filesys = str;
    }

    public void setFirstRecord(int i) {
        this.firstrec = i;
    }

    public void setFlags(int i) {
        this.flags = i;
    }

    public void setHostname(String str) {
        this.hostname = str;
    }

    public void setLabel(String str) {
        this.label = str;
    }

    public void setLevel(int i) {
        this.level = i;
    }

    public void setNTRec(int i) {
        this.ntrec = i;
    }

    public void setPreviousDumpDate(Date date) {
        this.previousDumpDate = date.getTime();
    }

    public void setVolume(int i) {
        this.volume = i;
    }
}
