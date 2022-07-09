package org.apache.commons.compress.compressors.xz;

import java.util.HashMap;
import org.apache.commons.compress.compressors.FileNameUtil;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/xz/XZUtils.class */
public class XZUtils {
    private static final FileNameUtil fileNameUtil;

    static {
        HashMap hashMap = new HashMap();
        hashMap.put(".txz", ".tar");
        hashMap.put(".xz", "");
        hashMap.put("-xz", "");
        fileNameUtil = new FileNameUtil(hashMap, ".xz");
    }

    private XZUtils() {
    }

    public static String getCompressedFilename(String str) {
        return fileNameUtil.getCompressedFilename(str);
    }

    public static String getUncompressedFilename(String str) {
        return fileNameUtil.getUncompressedFilename(str);
    }

    public static boolean isCompressedFilename(String str) {
        return fileNameUtil.isCompressedFilename(str);
    }
}
