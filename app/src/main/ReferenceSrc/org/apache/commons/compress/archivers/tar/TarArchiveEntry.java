package org.apache.commons.compress.archivers.tar;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipEncoding;
import org.apache.commons.compress.utils.ArchiveUtils;
import org.apache.tools.ant.taskdefs.condition.Os;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/tar/TarArchiveEntry.class */
public class TarArchiveEntry implements TarConstants, ArchiveEntry {
    public static final int DEFAULT_DIR_MODE = 16877;
    public static final int DEFAULT_FILE_MODE = 33188;
    public static final int MAX_NAMELEN = 31;
    public static final int MILLIS_PER_SECOND = 1000;
    private int devMajor;
    private int devMinor;
    private File file;
    private int groupId;
    private String groupName;
    private boolean isExtended;
    private byte linkFlag;
    private String linkName;
    private String magic;
    private long modTime;
    private int mode;
    private String name;
    private long realSize;
    private long size;
    private int userId;
    private String userName;
    private String version;

    private TarArchiveEntry() {
        this.magic = "ustar��";
        this.version = TarConstants.VERSION_POSIX;
        this.name = "";
        this.linkName = "";
        String property = System.getProperty("user.name", "");
        String substring = property.length() > 31 ? property.substring(0, 31) : property;
        this.userId = 0;
        this.groupId = 0;
        this.userName = substring;
        this.groupName = "";
        this.file = null;
    }

    public TarArchiveEntry(File file) {
        this(file, normalizeFileName(file.getPath(), false));
    }

    public TarArchiveEntry(File file, String str) {
        this();
        this.file = file;
        this.linkName = "";
        if (file.isDirectory()) {
            this.mode = 16877;
            this.linkFlag = (byte) 53;
            int length = str.length();
            if (length == 0 || str.charAt(length - 1) != '/') {
                this.name = str + "/";
            } else {
                this.name = str;
            }
            this.size = 0L;
        } else {
            this.mode = 33188;
            this.linkFlag = (byte) 48;
            this.size = file.length();
            this.name = str;
        }
        this.modTime = file.lastModified() / 1000;
        this.devMajor = 0;
        this.devMinor = 0;
    }

    public TarArchiveEntry(String str) {
        this(str, false);
    }

    public TarArchiveEntry(String str, byte b) {
        this(str);
        this.linkFlag = b;
        if (b == 76) {
            this.magic = TarConstants.MAGIC_GNU;
            this.version = TarConstants.VERSION_GNU_SPACE;
        }
    }

    public TarArchiveEntry(String str, boolean z) {
        this();
        String normalizeFileName = normalizeFileName(str, z);
        boolean endsWith = normalizeFileName.endsWith("/");
        this.devMajor = 0;
        this.devMinor = 0;
        this.name = normalizeFileName;
        this.mode = endsWith ? 16877 : 33188;
        this.linkFlag = (byte) (endsWith ? 53 : 48);
        this.userId = 0;
        this.groupId = 0;
        this.size = 0L;
        this.modTime = new Date().getTime() / 1000;
        this.linkName = "";
        this.userName = "";
        this.groupName = "";
    }

    public TarArchiveEntry(byte[] bArr) {
        this();
        parseTarHeader(bArr);
    }

    public TarArchiveEntry(byte[] bArr, ZipEncoding zipEncoding) throws IOException {
        this();
        parseTarHeader(bArr, zipEncoding);
    }

    private int evaluateType(byte[] bArr) {
        return ArchiveUtils.matchAsciiBuffer(TarConstants.MAGIC_GNU, bArr, 257, 6) ? 2 : ArchiveUtils.matchAsciiBuffer("ustar��", bArr, 257, 6) ? 3 : 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0055, code lost:
        if (r0 <= 'Z') goto L18;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String normalizeFileName(String str, boolean z) {
        String str2;
        String lowerCase = System.getProperty("os.name").toLowerCase(Locale.ENGLISH);
        String str3 = str;
        if (lowerCase != null) {
            if (lowerCase.startsWith(Os.FAMILY_WINDOWS)) {
                str3 = str;
                if (str.length() > 2) {
                    char charAt = str.charAt(0);
                    str3 = str;
                    if (str.charAt(1) == ':') {
                        if (charAt < 'a' || charAt > 'z') {
                            str3 = str;
                            if (charAt >= 'A') {
                                str3 = str;
                            }
                        }
                        str3 = str.substring(2);
                    }
                }
            } else {
                str3 = str;
                if (lowerCase.indexOf(Os.FAMILY_NETWARE) > -1) {
                    int indexOf = str.indexOf(58);
                    str3 = str;
                    if (indexOf != -1) {
                        str3 = str.substring(indexOf + 1);
                    }
                }
            }
        }
        String replace = str3.replace(File.separatorChar, '/');
        while (true) {
            str2 = replace;
            if (z || !str2.startsWith("/")) {
                break;
            }
            replace = str2.substring(1);
        }
        return str2;
    }

    private void parseTarHeader(byte[] bArr, ZipEncoding zipEncoding, boolean z) throws IOException {
        int i;
        this.name = z ? TarUtils.parseName(bArr, 0, 100) : TarUtils.parseName(bArr, 0, 100, zipEncoding);
        int i2 = 0 + 100;
        this.mode = (int) TarUtils.parseOctalOrBinary(bArr, i2, 8);
        int i3 = i2 + 8;
        this.userId = (int) TarUtils.parseOctalOrBinary(bArr, i3, 8);
        int i4 = i3 + 8;
        this.groupId = (int) TarUtils.parseOctalOrBinary(bArr, i4, 8);
        int i5 = i4 + 8;
        this.size = TarUtils.parseOctalOrBinary(bArr, i5, 12);
        int i6 = i5 + 12;
        this.modTime = TarUtils.parseOctalOrBinary(bArr, i6, 12);
        int i7 = i6 + 12 + 8 + 1;
        this.linkFlag = bArr[i];
        this.linkName = z ? TarUtils.parseName(bArr, i7, 100) : TarUtils.parseName(bArr, i7, 100, zipEncoding);
        int i8 = i7 + 100;
        this.magic = TarUtils.parseName(bArr, i8, 6);
        int i9 = i8 + 6;
        this.version = TarUtils.parseName(bArr, i9, 2);
        int i10 = i9 + 2;
        this.userName = z ? TarUtils.parseName(bArr, i10, 32) : TarUtils.parseName(bArr, i10, 32, zipEncoding);
        int i11 = i10 + 32;
        this.groupName = z ? TarUtils.parseName(bArr, i11, 32) : TarUtils.parseName(bArr, i11, 32, zipEncoding);
        int i12 = i11 + 32;
        this.devMajor = (int) TarUtils.parseOctalOrBinary(bArr, i12, 8);
        int i13 = i12 + 8;
        this.devMinor = (int) TarUtils.parseOctalOrBinary(bArr, i13, 8);
        int i14 = i13 + 8;
        switch (evaluateType(bArr)) {
            case 2:
                int i15 = i14 + 12 + 12 + 12 + 4 + 1 + 96;
                this.isExtended = TarUtils.parseBoolean(bArr, i15);
                this.realSize = TarUtils.parseOctal(bArr, i15 + 1, 12);
                return;
            default:
                String parseName = z ? TarUtils.parseName(bArr, i14, TarConstants.PREFIXLEN) : TarUtils.parseName(bArr, i14, TarConstants.PREFIXLEN, zipEncoding);
                if (isDirectory() && !this.name.endsWith("/")) {
                    this.name += "/";
                }
                if (parseName.length() <= 0) {
                    return;
                }
                this.name = parseName + "/" + this.name;
                return;
        }
    }

    private int writeEntryHeaderField(long j, byte[] bArr, int i, int i2, boolean z) {
        return (z || (j >= 0 && j < (1 << ((i2 - 1) * 3)))) ? TarUtils.formatLongOctalOrBinaryBytes(j, bArr, i, i2) : TarUtils.formatLongOctalBytes(0L, bArr, i, i2);
    }

    public boolean equals(Object obj) {
        return (obj == null || getClass() != obj.getClass()) ? false : equals((TarArchiveEntry) obj);
    }

    public boolean equals(TarArchiveEntry tarArchiveEntry) {
        return getName().equals(tarArchiveEntry.getName());
    }

    public int getDevMajor() {
        return this.devMajor;
    }

    public int getDevMinor() {
        return this.devMinor;
    }

    public TarArchiveEntry[] getDirectoryEntries() {
        TarArchiveEntry[] tarArchiveEntryArr;
        if (this.file != null && this.file.isDirectory()) {
            String[] list = this.file.list();
            TarArchiveEntry[] tarArchiveEntryArr2 = new TarArchiveEntry[list.length];
            int i = 0;
            while (true) {
                tarArchiveEntryArr = tarArchiveEntryArr2;
                if (i >= list.length) {
                    break;
                }
                tarArchiveEntryArr2[i] = new TarArchiveEntry(new File(this.file, list[i]));
                i++;
            }
        } else {
            tarArchiveEntryArr = new TarArchiveEntry[0];
        }
        return tarArchiveEntryArr;
    }

    public File getFile() {
        return this.file;
    }

    public int getGroupId() {
        return this.groupId;
    }

    public String getGroupName() {
        return this.groupName.toString();
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public Date getLastModifiedDate() {
        return getModTime();
    }

    public String getLinkName() {
        return this.linkName.toString();
    }

    public Date getModTime() {
        return new Date(this.modTime * 1000);
    }

    public int getMode() {
        return this.mode;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public String getName() {
        return this.name.toString();
    }

    public long getRealSize() {
        return this.realSize;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public long getSize() {
        return this.size;
    }

    public int getUserId() {
        return this.userId;
    }

    public String getUserName() {
        return this.userName.toString();
    }

    public int hashCode() {
        return getName().hashCode();
    }

    public boolean isBlockDevice() {
        return this.linkFlag == 52;
    }

    public boolean isCharacterDevice() {
        return this.linkFlag == 51;
    }

    public boolean isDescendent(TarArchiveEntry tarArchiveEntry) {
        return tarArchiveEntry.getName().startsWith(getName());
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public boolean isDirectory() {
        boolean z;
        if (this.file != null) {
            z = this.file.isDirectory();
        } else {
            z = true;
            if (this.linkFlag != 53) {
                z = true;
                if (!getName().endsWith("/")) {
                    z = false;
                }
            }
        }
        return z;
    }

    public boolean isExtended() {
        return this.isExtended;
    }

    public boolean isFIFO() {
        return this.linkFlag == 54;
    }

    public boolean isFile() {
        boolean z;
        if (this.file != null) {
            z = this.file.isFile();
        } else {
            z = true;
            if (this.linkFlag != 0) {
                z = true;
                if (this.linkFlag != 48) {
                    z = true;
                    if (getName().endsWith("/")) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    public boolean isGNULongNameEntry() {
        return this.linkFlag == 76 && this.name.toString().equals("././@LongLink");
    }

    public boolean isGNUSparse() {
        return this.linkFlag == 83;
    }

    public boolean isGlobalPaxHeader() {
        return this.linkFlag == 103;
    }

    public boolean isLink() {
        return this.linkFlag == 49;
    }

    public boolean isPaxHeader() {
        return this.linkFlag == 120 || this.linkFlag == 88;
    }

    public boolean isSymbolicLink() {
        return this.linkFlag == 50;
    }

    public void parseTarHeader(byte[] bArr) {
        try {
            parseTarHeader(bArr, TarUtils.DEFAULT_ENCODING);
        } catch (IOException e) {
            try {
                parseTarHeader(bArr, TarUtils.DEFAULT_ENCODING, true);
            } catch (IOException e2) {
                throw new RuntimeException(e2);
            }
        }
    }

    public void parseTarHeader(byte[] bArr, ZipEncoding zipEncoding) throws IOException {
        parseTarHeader(bArr, zipEncoding, false);
    }

    public void setDevMajor(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("Major device number is out of range: " + i);
        }
        this.devMajor = i;
    }

    public void setDevMinor(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("Minor device number is out of range: " + i);
        }
        this.devMinor = i;
    }

    public void setGroupId(int i) {
        this.groupId = i;
    }

    public void setGroupName(String str) {
        this.groupName = str;
    }

    public void setIds(int i, int i2) {
        setUserId(i);
        setGroupId(i2);
    }

    public void setLinkName(String str) {
        this.linkName = str;
    }

    public void setModTime(long j) {
        this.modTime = j / 1000;
    }

    public void setModTime(Date date) {
        this.modTime = date.getTime() / 1000;
    }

    public void setMode(int i) {
        this.mode = i;
    }

    public void setName(String str) {
        this.name = normalizeFileName(str, false);
    }

    public void setNames(String str, String str2) {
        setUserName(str);
        setGroupName(str2);
    }

    public void setSize(long j) {
        if (j < 0) {
            throw new IllegalArgumentException("Size is out of range: " + j);
        }
        this.size = j;
    }

    public void setUserId(int i) {
        this.userId = i;
    }

    public void setUserName(String str) {
        this.userName = str;
    }

    public void writeEntryHeader(byte[] bArr) {
        try {
            writeEntryHeader(bArr, TarUtils.DEFAULT_ENCODING, false);
        } catch (IOException e) {
            try {
                writeEntryHeader(bArr, TarUtils.FALLBACK_ENCODING, false);
            } catch (IOException e2) {
                throw new RuntimeException(e2);
            }
        }
    }

    public void writeEntryHeader(byte[] bArr, ZipEncoding zipEncoding, boolean z) throws IOException {
        int writeEntryHeaderField = writeEntryHeaderField(this.modTime, bArr, writeEntryHeaderField(this.size, bArr, writeEntryHeaderField(this.groupId, bArr, writeEntryHeaderField(this.userId, bArr, writeEntryHeaderField(this.mode, bArr, TarUtils.formatNameBytes(this.name, bArr, 0, 100, zipEncoding), 8, z), 8, z), 8, z), 12, z), 12, z);
        int i = 0;
        int i2 = writeEntryHeaderField;
        while (i < 8) {
            bArr[i2] = (byte) 32;
            i++;
            i2++;
        }
        bArr[i2] = this.linkFlag;
        for (int writeEntryHeaderField2 = writeEntryHeaderField(this.devMinor, bArr, writeEntryHeaderField(this.devMajor, bArr, TarUtils.formatNameBytes(this.groupName, bArr, TarUtils.formatNameBytes(this.userName, bArr, TarUtils.formatNameBytes(this.version, bArr, TarUtils.formatNameBytes(this.magic, bArr, TarUtils.formatNameBytes(this.linkName, bArr, i2 + 1, 100, zipEncoding), 6), 2), 32, zipEncoding), 32, zipEncoding), 8, z), 8, z); writeEntryHeaderField2 < bArr.length; writeEntryHeaderField2++) {
            bArr[writeEntryHeaderField2] = (byte) 0;
        }
        TarUtils.formatCheckSumOctalBytes(TarUtils.computeCheckSum(bArr), bArr, writeEntryHeaderField, 8);
    }
}
