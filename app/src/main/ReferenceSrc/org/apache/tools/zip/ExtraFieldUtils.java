package org.apache.tools.zip;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipException;

/* loaded from: classes.jar:org/apache/tools/zip/ExtraFieldUtils.class */
public class ExtraFieldUtils {
    private static final int WORD = 4;
    static Class class$org$apache$tools$zip$AsiExtraField;
    static Class class$org$apache$tools$zip$JarMarker;
    static Class class$org$apache$tools$zip$UnicodeCommentExtraField;
    static Class class$org$apache$tools$zip$UnicodePathExtraField;
    private static final Map implementations = new HashMap();

    /* loaded from: classes.jar:org/apache/tools/zip/ExtraFieldUtils$UnparseableExtraField.class */
    public static final class UnparseableExtraField {
        public static final int READ_KEY = 2;
        public static final int SKIP_KEY = 1;
        public static final int THROW_KEY = 0;
        private final int key;
        public static final UnparseableExtraField THROW = new UnparseableExtraField(0);
        public static final UnparseableExtraField SKIP = new UnparseableExtraField(1);
        public static final UnparseableExtraField READ = new UnparseableExtraField(2);

        private UnparseableExtraField(int i) {
            this.key = i;
        }

        public int getKey() {
            return this.key;
        }
    }

    static {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        if (class$org$apache$tools$zip$AsiExtraField == null) {
            cls = class$("org.apache.tools.zip.AsiExtraField");
            class$org$apache$tools$zip$AsiExtraField = cls;
        } else {
            cls = class$org$apache$tools$zip$AsiExtraField;
        }
        register(cls);
        if (class$org$apache$tools$zip$JarMarker == null) {
            cls2 = class$("org.apache.tools.zip.JarMarker");
            class$org$apache$tools$zip$JarMarker = cls2;
        } else {
            cls2 = class$org$apache$tools$zip$JarMarker;
        }
        register(cls2);
        if (class$org$apache$tools$zip$UnicodePathExtraField == null) {
            cls3 = class$("org.apache.tools.zip.UnicodePathExtraField");
            class$org$apache$tools$zip$UnicodePathExtraField = cls3;
        } else {
            cls3 = class$org$apache$tools$zip$UnicodePathExtraField;
        }
        register(cls3);
        if (class$org$apache$tools$zip$UnicodeCommentExtraField == null) {
            cls4 = class$("org.apache.tools.zip.UnicodeCommentExtraField");
            class$org$apache$tools$zip$UnicodeCommentExtraField = cls4;
        } else {
            cls4 = class$org$apache$tools$zip$UnicodeCommentExtraField;
        }
        register(cls4);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v10, types: [org.apache.tools.zip.ZipExtraField] */
    public static ZipExtraField createExtraField(ZipShort zipShort) throws InstantiationException, IllegalAccessException {
        UnrecognizedExtraField unrecognizedExtraField;
        Class cls = (Class) implementations.get(zipShort);
        if (cls != null) {
            unrecognizedExtraField = (ZipExtraField) cls.newInstance();
        } else {
            UnrecognizedExtraField unrecognizedExtraField2 = new UnrecognizedExtraField();
            unrecognizedExtraField2.setHeaderId(zipShort);
            unrecognizedExtraField = unrecognizedExtraField2;
        }
        return unrecognizedExtraField;
    }

    public static byte[] mergeCentralDirectoryData(ZipExtraField[] zipExtraFieldArr) {
        boolean z = zipExtraFieldArr.length > 0 && (zipExtraFieldArr[zipExtraFieldArr.length - 1] instanceof UnparseableExtraFieldData);
        int length = z ? zipExtraFieldArr.length - 1 : zipExtraFieldArr.length;
        int i = length * 4;
        for (ZipExtraField zipExtraField : zipExtraFieldArr) {
            i += zipExtraField.getCentralDirectoryLength().getValue();
        }
        byte[] bArr = new byte[i];
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            System.arraycopy(zipExtraFieldArr[i3].getHeaderId().getBytes(), 0, bArr, i2, 2);
            System.arraycopy(zipExtraFieldArr[i3].getCentralDirectoryLength().getBytes(), 0, bArr, i2 + 2, 2);
            byte[] centralDirectoryData = zipExtraFieldArr[i3].getCentralDirectoryData();
            System.arraycopy(centralDirectoryData, 0, bArr, i2 + 4, centralDirectoryData.length);
            i2 += centralDirectoryData.length + 4;
        }
        if (z) {
            byte[] centralDirectoryData2 = zipExtraFieldArr[zipExtraFieldArr.length - 1].getCentralDirectoryData();
            System.arraycopy(centralDirectoryData2, 0, bArr, i2, centralDirectoryData2.length);
        }
        return bArr;
    }

    public static byte[] mergeLocalFileDataData(ZipExtraField[] zipExtraFieldArr) {
        boolean z = zipExtraFieldArr.length > 0 && (zipExtraFieldArr[zipExtraFieldArr.length - 1] instanceof UnparseableExtraFieldData);
        int length = z ? zipExtraFieldArr.length - 1 : zipExtraFieldArr.length;
        int i = length * 4;
        for (ZipExtraField zipExtraField : zipExtraFieldArr) {
            i += zipExtraField.getLocalFileDataLength().getValue();
        }
        byte[] bArr = new byte[i];
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            System.arraycopy(zipExtraFieldArr[i3].getHeaderId().getBytes(), 0, bArr, i2, 2);
            System.arraycopy(zipExtraFieldArr[i3].getLocalFileDataLength().getBytes(), 0, bArr, i2 + 2, 2);
            byte[] localFileDataData = zipExtraFieldArr[i3].getLocalFileDataData();
            System.arraycopy(localFileDataData, 0, bArr, i2 + 4, localFileDataData.length);
            i2 += localFileDataData.length + 4;
        }
        if (z) {
            byte[] localFileDataData2 = zipExtraFieldArr[zipExtraFieldArr.length - 1].getLocalFileDataData();
            System.arraycopy(localFileDataData2, 0, bArr, i2, localFileDataData2.length);
        }
        return bArr;
    }

    public static ZipExtraField[] parse(byte[] bArr) throws ZipException {
        return parse(bArr, true, UnparseableExtraField.THROW);
    }

    public static ZipExtraField[] parse(byte[] bArr, boolean z) throws ZipException {
        return parse(bArr, z, UnparseableExtraField.THROW);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static ZipExtraField[] parse(byte[] bArr, boolean z, UnparseableExtraField unparseableExtraField) throws ZipException {
        ArrayList arrayList = new ArrayList();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 > bArr.length - 4) {
                break;
            }
            ZipShort zipShort = new ZipShort(bArr, i2);
            int value = new ZipShort(bArr, i2 + 2).getValue();
            if (i2 + 4 + value > bArr.length) {
                switch (unparseableExtraField.getKey()) {
                    case 0:
                        throw new ZipException(new StringBuffer().append("bad extra field starting at ").append(i2).append(".  Block length of ").append(value).append(" bytes exceeds remaining").append(" data of ").append((bArr.length - i2) - 4).append(" bytes.").toString());
                    case 1:
                        break;
                    case 2:
                        UnparseableExtraFieldData unparseableExtraFieldData = new UnparseableExtraFieldData();
                        if (z) {
                            unparseableExtraFieldData.parseFromLocalFileData(bArr, i2, bArr.length - i2);
                        } else {
                            unparseableExtraFieldData.parseFromCentralDirectoryData(bArr, i2, bArr.length - i2);
                        }
                        arrayList.add(unparseableExtraFieldData);
                        break;
                    default:
                        throw new ZipException(new StringBuffer().append("unknown UnparseableExtraField key: ").append(unparseableExtraField.getKey()).toString());
                }
            } else {
                try {
                    ZipExtraField createExtraField = createExtraField(zipShort);
                    if (z || !(createExtraField instanceof CentralDirectoryParsingZipExtraField)) {
                        createExtraField.parseFromLocalFileData(bArr, i2 + 4, value);
                    } else {
                        ((CentralDirectoryParsingZipExtraField) createExtraField).parseFromCentralDirectoryData(bArr, i2 + 4, value);
                    }
                    arrayList.add(createExtraField);
                    i = i2 + value + 4;
                } catch (IllegalAccessException e) {
                    throw new ZipException(e.getMessage());
                } catch (InstantiationException e2) {
                    throw new ZipException(e2.getMessage());
                }
            }
        }
        return (ZipExtraField[]) arrayList.toArray(new ZipExtraField[arrayList.size()]);
    }

    public static void register(Class cls) {
        try {
            implementations.put(((ZipExtraField) cls.newInstance()).getHeaderId(), cls);
        } catch (ClassCastException e) {
            throw new RuntimeException(new StringBuffer().append(cls).append(" doesn't implement ZipExtraField").toString());
        } catch (IllegalAccessException e2) {
            throw new RuntimeException(new StringBuffer().append(cls).append("'s no-arg constructor is not public").toString());
        } catch (InstantiationException e3) {
            throw new RuntimeException(new StringBuffer().append(cls).append(" is not a concrete class").toString());
        }
    }
}
