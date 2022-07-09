package org.apache.tools.zip;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.NoSuchElementException;
import java.util.zip.ZipException;
import org.apache.tools.zip.ExtraFieldUtils;

/* loaded from: classes.jar:org/apache/tools/zip/ZipEntry.class */
public class ZipEntry extends java.util.zip.ZipEntry implements Cloneable {
    public static final int PLATFORM_FAT = 0;
    public static final int PLATFORM_UNIX = 3;
    private static final int SHORT_MASK = 65535;
    private static final int SHORT_SHIFT = 16;
    private long externalAttributes;
    private LinkedHashMap extraFields;
    private int internalAttributes;
    private String name;
    private int platform;
    private UnparseableExtraFieldData unparseableExtra;

    protected ZipEntry() {
        super("");
        this.internalAttributes = 0;
        this.platform = 0;
        this.externalAttributes = 0L;
        this.extraFields = null;
        this.unparseableExtra = null;
        this.name = null;
    }

    public ZipEntry(String str) {
        super(str);
        this.internalAttributes = 0;
        this.platform = 0;
        this.externalAttributes = 0L;
        this.extraFields = null;
        this.unparseableExtra = null;
        this.name = null;
    }

    public ZipEntry(java.util.zip.ZipEntry zipEntry) throws ZipException {
        super(zipEntry);
        this.internalAttributes = 0;
        this.platform = 0;
        this.externalAttributes = 0L;
        this.extraFields = null;
        this.unparseableExtra = null;
        this.name = null;
        byte[] extra = zipEntry.getExtra();
        if (extra != null) {
            setExtraFields(ExtraFieldUtils.parse(extra, true, ExtraFieldUtils.UnparseableExtraField.READ));
        } else {
            setExtra();
        }
    }

    public ZipEntry(ZipEntry zipEntry) throws ZipException {
        this((java.util.zip.ZipEntry) zipEntry);
        setInternalAttributes(zipEntry.getInternalAttributes());
        setExternalAttributes(zipEntry.getExternalAttributes());
        setExtraFields(zipEntry.getExtraFields(true));
    }

    private void mergeExtraFields(ZipExtraField[] zipExtraFieldArr, boolean z) throws ZipException {
        if (this.extraFields == null) {
            setExtraFields(zipExtraFieldArr);
            return;
        }
        for (int i = 0; i < zipExtraFieldArr.length; i++) {
            UnparseableExtraFieldData extraField = zipExtraFieldArr[i] instanceof UnparseableExtraFieldData ? this.unparseableExtra : getExtraField(zipExtraFieldArr[i].getHeaderId());
            if (extraField == null) {
                addExtraField(zipExtraFieldArr[i]);
            } else if (z || !(extraField instanceof CentralDirectoryParsingZipExtraField)) {
                byte[] localFileDataData = zipExtraFieldArr[i].getLocalFileDataData();
                extraField.parseFromLocalFileData(localFileDataData, 0, localFileDataData.length);
            } else {
                byte[] centralDirectoryData = zipExtraFieldArr[i].getCentralDirectoryData();
                ((CentralDirectoryParsingZipExtraField) extraField).parseFromCentralDirectoryData(centralDirectoryData, 0, centralDirectoryData.length);
            }
        }
        setExtra();
    }

    public void addAsFirstExtraField(ZipExtraField zipExtraField) {
        if (zipExtraField instanceof UnparseableExtraFieldData) {
            this.unparseableExtra = (UnparseableExtraFieldData) zipExtraField;
        } else {
            LinkedHashMap linkedHashMap = this.extraFields;
            this.extraFields = new LinkedHashMap();
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
                this.extraFields = new LinkedHashMap();
            }
            this.extraFields.put(zipExtraField.getHeaderId(), zipExtraField);
        }
        setExtra();
    }

    @Override // java.util.zip.ZipEntry
    public Object clone() {
        ZipEntry zipEntry = (ZipEntry) super.clone();
        zipEntry.setInternalAttributes(getInternalAttributes());
        zipEntry.setExternalAttributes(getExternalAttributes());
        zipEntry.setExtraFields(getExtraFields(true));
        return zipEntry;
    }

    public boolean equals(Object obj) {
        return this == obj;
    }

    public byte[] getCentralDirectoryExtra() {
        return ExtraFieldUtils.mergeCentralDirectoryData(getExtraFields(true));
    }

    public long getExternalAttributes() {
        return this.externalAttributes;
    }

    public ZipExtraField getExtraField(ZipShort zipShort) {
        return this.extraFields != null ? (ZipExtraField) this.extraFields.get(zipShort) : null;
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

    public int getInternalAttributes() {
        return this.internalAttributes;
    }

    public byte[] getLocalFileDataExtra() {
        byte[] extra = getExtra();
        if (extra == null) {
            extra = new byte[0];
        }
        return extra;
    }

    @Override // java.util.zip.ZipEntry
    public String getName() {
        return this.name == null ? super.getName() : this.name;
    }

    public int getPlatform() {
        return this.platform;
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

    @Override // java.util.zip.ZipEntry
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
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    public void setComprSize(long j) {
        setCompressedSize(j);
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
        } catch (Exception e) {
            throw new RuntimeException(new StringBuffer().append("Error parsing extra fields for entry: ").append(getName()).append(" - ").append(e.getMessage()).toString(), e);
        }
    }

    public void setExtraFields(ZipExtraField[] zipExtraFieldArr) {
        this.extraFields = new LinkedHashMap();
        for (int i = 0; i < zipExtraFieldArr.length; i++) {
            if (zipExtraFieldArr[i] instanceof UnparseableExtraFieldData) {
                this.unparseableExtra = (UnparseableExtraFieldData) zipExtraFieldArr[i];
            } else {
                this.extraFields.put(zipExtraFieldArr[i].getHeaderId(), zipExtraFieldArr[i]);
            }
        }
        setExtra();
    }

    public void setInternalAttributes(int i) {
        this.internalAttributes = i;
    }

    protected void setName(String str) {
        this.name = str;
    }

    protected void setPlatform(int i) {
        this.platform = i;
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
