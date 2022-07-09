package org.apache.tools.tar;

import java.io.File;
import java.util.Date;
import java.util.Locale;
import org.apache.tools.ant.taskdefs.condition.Os;

/* loaded from: classes.jar:org/apache/tools/tar/TarEntry.class */
public class TarEntry implements TarConstants {
    public static final int DEFAULT_DIR_MODE = 16877;
    public static final int DEFAULT_FILE_MODE = 33188;
    public static final int MAX_NAMELEN = 31;
    public static final int MILLIS_PER_SECOND = 1000;
    private int devMajor;
    private int devMinor;
    private File file;
    private int groupId;
    private StringBuffer groupName;
    private byte linkFlag;
    private StringBuffer linkName;
    private StringBuffer magic;
    private long modTime;
    private int mode;
    private StringBuffer name;
    private long size;
    private int userId;
    private StringBuffer userName;

    private TarEntry() {
        this.magic = new StringBuffer(TarConstants.TMAGIC);
        this.name = new StringBuffer();
        this.linkName = new StringBuffer();
        String property = System.getProperty("user.name", "");
        String substring = property.length() > 31 ? property.substring(0, 31) : property;
        this.userId = 0;
        this.groupId = 0;
        this.userName = new StringBuffer(substring);
        this.groupName = new StringBuffer("");
        this.file = null;
    }

    public TarEntry(File file) {
        this();
        this.file = file;
        String normalizeFileName = normalizeFileName(file.getPath(), false);
        this.linkName = new StringBuffer("");
        this.name = new StringBuffer(normalizeFileName);
        if (file.isDirectory()) {
            this.mode = 16877;
            this.linkFlag = (byte) 53;
            int length = this.name.length();
            if (length == 0 || this.name.charAt(length - 1) != '/') {
                this.name.append("/");
            }
            this.size = 0L;
        } else {
            this.mode = 33188;
            this.linkFlag = (byte) 48;
            this.size = file.length();
        }
        this.modTime = file.lastModified() / 1000;
        this.devMajor = 0;
        this.devMinor = 0;
    }

    public TarEntry(String str) {
        this(str, false);
    }

    public TarEntry(String str, byte b) {
        this(str);
        this.linkFlag = b;
        if (b == 76) {
            this.magic = new StringBuffer(TarConstants.GNU_TMAGIC);
        }
    }

    public TarEntry(String str, boolean z) {
        this();
        String normalizeFileName = normalizeFileName(str, z);
        boolean endsWith = normalizeFileName.endsWith("/");
        this.devMajor = 0;
        this.devMinor = 0;
        this.name = new StringBuffer(normalizeFileName);
        this.mode = endsWith ? 16877 : 33188;
        this.linkFlag = (byte) (endsWith ? 53 : 48);
        this.userId = 0;
        this.groupId = 0;
        this.size = 0L;
        this.modTime = new Date().getTime() / 1000;
        this.linkName = new StringBuffer("");
        this.userName = new StringBuffer("");
        this.groupName = new StringBuffer("");
        this.devMajor = 0;
        this.devMinor = 0;
    }

    public TarEntry(byte[] bArr) {
        this();
        parseTarHeader(bArr);
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

    public boolean equals(Object obj) {
        return (obj == null || getClass() != obj.getClass()) ? false : equals((TarEntry) obj);
    }

    public boolean equals(TarEntry tarEntry) {
        return getName().equals(tarEntry.getName());
    }

    public TarEntry[] getDirectoryEntries() {
        TarEntry[] tarEntryArr;
        if (this.file != null && this.file.isDirectory()) {
            String[] list = this.file.list();
            TarEntry[] tarEntryArr2 = new TarEntry[list.length];
            int i = 0;
            while (true) {
                tarEntryArr = tarEntryArr2;
                if (i >= list.length) {
                    break;
                }
                tarEntryArr2[i] = new TarEntry(new File(this.file, list[i]));
                i++;
            }
        } else {
            tarEntryArr = new TarEntry[0];
        }
        return tarEntryArr;
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

    public String getLinkName() {
        return this.linkName.toString();
    }

    public Date getModTime() {
        return new Date(this.modTime * 1000);
    }

    public int getMode() {
        return this.mode;
    }

    public String getName() {
        return this.name.toString();
    }

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

    public boolean isDescendent(TarEntry tarEntry) {
        return tarEntry.getName().startsWith(getName());
    }

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

    public boolean isGNULongNameEntry() {
        return this.linkFlag == 76 && this.name.toString().equals("././@LongLink");
    }

    public void parseTarHeader(byte[] bArr) {
        this.name = TarUtils.parseName(bArr, 0, 100);
        int i = 0 + 100;
        this.mode = (int) TarUtils.parseOctal(bArr, i, 8);
        int i2 = i + 8;
        this.userId = (int) TarUtils.parseOctal(bArr, i2, 8);
        int i3 = i2 + 8;
        this.groupId = (int) TarUtils.parseOctal(bArr, i3, 8);
        int i4 = i3 + 8;
        this.size = TarUtils.parseOctal(bArr, i4, 12);
        int i5 = i4 + 12;
        this.modTime = TarUtils.parseOctal(bArr, i5, 12);
        int i6 = i5 + 12 + 8;
        int i7 = i6 + 1;
        this.linkFlag = bArr[i6];
        this.linkName = TarUtils.parseName(bArr, i7, 100);
        int i8 = i7 + 100;
        this.magic = TarUtils.parseName(bArr, i8, 8);
        int i9 = i8 + 8;
        this.userName = TarUtils.parseName(bArr, i9, 32);
        int i10 = i9 + 32;
        this.groupName = TarUtils.parseName(bArr, i10, 32);
        int i11 = i10 + 32;
        this.devMajor = (int) TarUtils.parseOctal(bArr, i11, 8);
        this.devMinor = (int) TarUtils.parseOctal(bArr, i11 + 8, 8);
    }

    public void setGroupId(int i) {
        this.groupId = i;
    }

    public void setGroupName(String str) {
        this.groupName = new StringBuffer(str);
    }

    public void setIds(int i, int i2) {
        setUserId(i);
        setGroupId(i2);
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
        this.name = new StringBuffer(normalizeFileName(str, false));
    }

    public void setNames(String str, String str2) {
        setUserName(str);
        setGroupName(str2);
    }

    public void setSize(long j) {
        this.size = j;
    }

    public void setUserId(int i) {
        this.userId = i;
    }

    public void setUserName(String str) {
        this.userName = new StringBuffer(str);
    }

    public void writeEntryHeader(byte[] bArr) {
        int longOctalBytes = TarUtils.getLongOctalBytes(this.modTime, bArr, TarUtils.getLongOctalBytes(this.size, bArr, TarUtils.getOctalBytes(this.groupId, bArr, TarUtils.getOctalBytes(this.userId, bArr, TarUtils.getOctalBytes(this.mode, bArr, TarUtils.getNameBytes(this.name, bArr, 0, 100), 8), 8), 8), 12), 12);
        int i = 0;
        int i2 = longOctalBytes;
        while (i < 8) {
            bArr[i2] = (byte) 32;
            i++;
            i2++;
        }
        bArr[i2] = this.linkFlag;
        for (int octalBytes = TarUtils.getOctalBytes(this.devMinor, bArr, TarUtils.getOctalBytes(this.devMajor, bArr, TarUtils.getNameBytes(this.groupName, bArr, TarUtils.getNameBytes(this.userName, bArr, TarUtils.getNameBytes(this.magic, bArr, TarUtils.getNameBytes(this.linkName, bArr, i2 + 1, 100), 8), 32), 32), 8), 8); octalBytes < bArr.length; octalBytes++) {
            bArr[octalBytes] = (byte) 0;
        }
        TarUtils.getCheckSumOctalBytes(TarUtils.computeCheckSum(bArr), bArr, longOctalBytes, 8);
    }
}
