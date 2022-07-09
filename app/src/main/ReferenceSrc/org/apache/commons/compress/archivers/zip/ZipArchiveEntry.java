package org.apache.commons.compress.archivers.zip;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.zip.ExtraFieldUtils;

/* loaded from: classes.jar:org/apache/commons/compress/archivers/zip/ZipArchiveEntry.class */
public class ZipArchiveEntry extends ZipEntry implements ArchiveEntry {
    public static final int PLATFORM_FAT = 0;
    public static final int PLATFORM_UNIX = 3;
    private static final int SHORT_MASK = 65535;
    private static final int SHORT_SHIFT = 16;
    private long externalAttributes;
    private LinkedHashMap<ZipShort, ZipExtraField> extraFields;
    private GeneralPurposeBit gpb;
    private int internalAttributes;
    private int method;
    private String name;
    private int platform;
    private byte[] rawName;
    private long size;
    private UnparseableExtraFieldData unparseableExtra;

    protected ZipArchiveEntry() {
        this("");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ZipArchiveEntry(File file, String str) {
        this(r7);
        String str2 = str;
        if (file.isDirectory()) {
            str2 = str;
            if (!str.endsWith("/")) {
                str2 = str + "/";
            }
        }
        if (file.isFile()) {
            setSize(file.length());
        }
        setTime(file.lastModified());
    }

    public ZipArchiveEntry(String str) {
        super(str);
        this.method = -1;
        this.size = -1L;
        this.internalAttributes = 0;
        this.platform = 0;
        this.externalAttributes = 0L;
        this.extraFields = null;
        this.unparseableExtra = null;
        this.name = null;
        this.rawName = null;
        this.gpb = new GeneralPurposeBit();
        setName(str);
    }

    public ZipArchiveEntry(ZipEntry zipEntry) throws ZipException {
        super(zipEntry);
        this.method = -1;
        this.size = -1L;
        this.internalAttributes = 0;
        this.platform = 0;
        this.externalAttributes = 0L;
        this.extraFields = null;
        this.unparseableExtra = null;
        this.name = null;
        this.rawName = null;
        this.gpb = new GeneralPurposeBit();
        setName(zipEntry.getName());
        byte[] extra = zipEntry.getExtra();
        if (extra != null) {
            setExtraFields(ExtraFieldUtils.parse(extra, true, ExtraFieldUtils.UnparseableExtraField.READ));
        } else {
            setExtra();
        }
        setMethod(zipEntry.getMethod());
        this.size = zipEntry.getSize();
    }

    public ZipArchiveEntry(ZipArchiveEntry zipArchiveEntry) throws ZipException {
        this((ZipEntry) zipArchiveEntry);
        setInternalAttributes(zipArchiveEntry.getInternalAttributes());
        setExternalAttributes(zipArchiveEntry.getExternalAttributes());
        setExtraFields(zipArchiveEntry.getExtraFields(true));
    }

    private void mergeExtraFields(ZipExtraField[] zipExtraFieldArr, boolean z) throws ZipException {
        if (this.extraFields == null) {
            setExtraFields(zipExtraFieldArr);
            return;
        }
        for (ZipExtraField zipExtraField : zipExtraFieldArr) {
            UnparseableExtraFieldData extraField = zipExtraField instanceof UnparseableExtraFieldData ? this.unparseableExtra : getExtraField(zipExtraField.getHeaderId());
            if (extraField == null) {
                addExtraField(zipExtraField);
            } else if (z) {
                byte[] localFileDataData = zipExtraField.getLocalFileDataData();
                extraField.parseFromLocalFileData(localFileDataData, 0, localFileDataData.length);
            } else {
                byte[] centralDirectoryData = zipExtraField.getCentralDirectoryData();
                extraField.parseFromCentralDirectoryData(centralDirectoryData, 0, centralDirectoryData.length);
            }
        }
        setExtra();
    }

    public void addAsFirstExtraField(ZipExtraField zipExtraField) {
        if (zipExtraField instanceof UnparseableExtraFieldData) {
            this.unparseableExtra = (UnparseableExtraFieldData) zipExtraField;
        } else {
            LinkedHashMap<ZipShort, ZipExtraField> linkedHashMap = this.extraFields;
            this.extraFields = new LinkedHashMap<>();
            this.extraFields.put(zipExtraField.getHeaderId(), zipExtraField);
            if (linkedHashMap != null) {
                linkedHashMap.remove(zipExtraField.getHeaderId());
                this.extraFields.putAll(linkedHashMap);
            }
        }
        setExtra();
    }

    public void addExtraField(ZipExtraField zipExtraField) {
        if (zipExtraField instanceof UnparseableExtraFieldData) {
            this.unparseableExtra = (UnparseableExtraFieldData) zipExtraField;
        } else {
            if (this.extraFields == null) {
                this.extraFields = new LinkedHashMap<>();
            }
            this.extraFields.put(zipExtraField.getHeaderId(), zipExtraField);
        }
        setExtra();
    }

    @Override // java.util.zip.ZipEntry
    public Object clone() {
        ZipArchiveEntry zipArchiveEntry = (ZipArchiveEntry) super.clone();
        zipArchiveEntry.setInternalAttributes(getInternalAttributes());
        zipArchiveEntry.setExternalAttributes(getExternalAttributes());
        zipArchiveEntry.setExtraFields(getExtraFields(true));
        return zipArchiveEntry;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x003f, code lost:
        if (r0 == null) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0058, code lost:
        if (r0 == null) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else {
            z = false;
            if (obj != null) {
                z = false;
                if (getClass() == obj.getClass()) {
                    ZipArchiveEntry zipArchiveEntry = (ZipArchiveEntry) obj;
                    String name = getName();
                    String name2 = zipArchiveEntry.getName();
                    if (name == null) {
                        z = false;
                    } else {
                        if (!name.equals(name2)) {
                            z = false;
                        }
                        String comment = getComment();
                        String comment2 = zipArchiveEntry.getComment();
                        if (comment == null) {
                            z = false;
                        } else {
                            if (!comment.equals(comment2)) {
                                z = false;
                            }
                            z = getTime() == zipArchiveEntry.getTime() && getInternalAttributes() == zipArchiveEntry.getInternalAttributes() && getPlatform() == zipArchiveEntry.getPlatform() && getExternalAttributes() == zipArchiveEntry.getExternalAttributes() && getMethod() == zipArchiveEntry.getMethod() && getSize() == zipArchiveEntry.getSize() && getCrc() == zipArchiveEntry.getCrc() && getCompressedSize() == zipArchiveEntry.getCompressedSize() && Arrays.equals(getCentralDirectoryExtra(), zipArchiveEntry.getCentralDirectoryExtra()) && Arrays.equals(getLocalFileDataExtra(), zipArchiveEntry.getLocalFileDataExtra()) && this.gpb.equals(zipArchiveEntry.gpb);
                        }
                    }
                }
            }
        }
        return z;
    }

    public byte[] getCentralDirectoryExtra() {
        return ExtraFieldUtils.mergeCentralDirectoryData(getExtraFields(true));
    }

    public long getExternalAttributes() {
        return this.externalAttributes;
    }

    public ZipExtraField getExtraField(ZipShort zipShort) {
        return this.extraFields != null ? this.extraFields.get(zipShort) : null;
    }

    public ZipExtraField[] getExtraFields() {
        return getExtraFields(false);
    }

    public ZipExtraField[] getExtraFields(boolean z) {
        ZipExtraField[] zipExtraFieldArr;
        if (this.extraFields == null) {
            zipExtraFieldArr = (!z || this.unparseableExtra == null) ? new ZipExtraField[0] : new ZipExtraField[]{this.unparseableExtra};
        } else {
            ArrayList arrayList = new ArrayList(this.extraFields.values());
            if (z && this.unparseableExtra != null) {
                arrayList.add(this.unparseableExtra);
            }
            zipExtraFieldArr = (ZipExtraField[]) arrayList.toArray(new ZipExtraField[0]);
        }
        return zipExtraFieldArr;
    }

    public GeneralPurposeBit getGeneralPurposeBit() {
        return this.gpb;
    }

    public int getInternalAttributes() {
        return this.internalAttributes;
    }

    @Override // org.apache.commons.compress.archivers.ArchiveEntry
    public Date getLastModifiedDate() {
        return new Date(getTime());
    }

    public byte[] getLocalFileDataExtra() {
        byte[] extra = getExtra();
        if (extra == null) {
            extra = new byte[0];
        }
        return extra;
    }

    @Override // java.util.zip.ZipEntry
    public int getMethod() {
        return this.method;
    }

    @Override // java.util.zip.ZipEntry, org.apache.commons.compress.archivers.ArchiveEntry
    public String getName() {
        return this.name == null ? super.getName() : this.name;
    }

    public int getPlatform() {
        return this.platform;
    }

    public byte[] getRawName() {
        byte[] bArr;
        if (this.rawName != null) {
            bArr = new byte[this.rawName.length];
            System.arraycopy(this.rawName, 0, bArr, 0, this.rawName.length);
        } else {
            bArr = null;
        }
        return bArr;
    }

    @Override // java.util.zip.ZipEntry, org.apache.commons.compress.archivers.ArchiveEntry
    public long getSize() {
        return this.size;
    }

    public int getUnixMode() {
        return this.platform != 3 ? 0 : (int) ((getExternalAttributes() >> 16) & 65535);
    }

    public UnparseableExtraFieldData getUnparseableExtraFieldData() {
        return this.unparseableExtra;
    }

    @Override // java.util.zip.ZipEntry
    public int hashCode() {
        return getName().hashCode();
    }

    @Override // java.util.zip.ZipEntry, org.apache.commons.compress.archivers.ArchiveEntry
    public boolean isDirectory() {
        return getName().endsWith("/");
    }

    public void removeExtraField(ZipShort zipShort) {
        if (this.extraFields == null) {
            throw new NoSuchElementException();
        }
        if (this.extraFields.remove(zipShort) == null) {
            throw new NoSuchElementException();
        }
        setExtra();
    }

    public void removeUnparseableExtraFieldData() {
        if (this.unparseableExtra == null) {
            throw new NoSuchElementException();
        }
        this.unparseableExtra = null;
        setExtra();
    }

    public void setCentralDirectoryExtra(byte[] bArr) {
        try {
            mergeExtraFields(ExtraFieldUtils.parse(bArr, false, ExtraFieldUtils.UnparseableExtraField.READ), false);
        } catch (ZipException e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    public void setExternalAttributes(long j) {
        this.externalAttributes = j;
    }

    protected void setExtra() {
        super.setExtra(ExtraFieldUtils.mergeLocalFileDataData(getExtraFields(true)));
    }

    @Override // java.util.zip.ZipEntry
    public void setExtra(byte[] bArr) throws RuntimeException {
        try {
            mergeExtraFields(ExtraFieldUtils.parse(bArr, true, ExtraFieldUtils.UnparseableExtraField.READ), true);
        } catch (ZipException e) {
            throw new RuntimeException("Error parsing extra fields for entry: " + getName() + " - " + e.getMessage(), e);
        }
    }

    public void setExtraFields(ZipExtraField[] zipExtraFieldArr) {
        this.extraFields = new LinkedHashMap<>();
        for (ZipExtraField zipExtraField : zipExtraFieldArr) {
            if (zipExtraField instanceof UnparseableExtraFieldData) {
                this.unparseableExtra = (UnparseableExtraFieldData) zipExtraField;
            } else {
                this.extraFields.put(zipExtraField.getHeaderId(), zipExtraField);
            }
        }
        setExtra();
    }

    public void setGeneralPurposeBit(GeneralPurposeBit generalPurposeBit) {
        this.gpb = generalPurposeBit;
    }

    public void setInternalAttributes(int i) {
        this.internalAttributes = i;
    }

    @Override // java.util.zip.ZipEntry
    public void setMethod(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("ZIP compression method can not be negative: " + i);
        }
        this.method = i;
    }

    protected void setName(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (getPlatform() == 0) {
                str2 = str;
                if (str.indexOf("/") == -1) {
                    str2 = str.replace('\\', '/');
                }
            }
        }
        this.name = str2;
    }

    protected void setName(String str, byte[] bArr) {
        setName(str);
        this.rawName = bArr;
    }

    protected void setPlatform(int i) {
        this.platform = i;
    }

    @Override // java.util.zip.ZipEntry
    public void setSize(long j) {
        if (j < 0) {
            throw new IllegalArgumentException("invalid entry size");
        }
        this.size = j;
    }

    public void setUnixMode(int i) {
        int i2 = 0;
        int i3 = (i & 128) == 0 ? 1 : 0;
        if (isDirectory()) {
            i2 = 16;
        }
        setExternalAttributes(i3 | (i << 16) | i2);
        this.platform = 3;
    }
}
