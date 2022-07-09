package org.apache.commons.compress.compressors;

import java.util.Collections;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes.jar:org/apache/commons/compress/compressors/FileNameUtil.class */
public class FileNameUtil {
    private final Map<String, String> compressSuffix = new HashMap();
    private final String defaultExtension;
    private final int longestCompressedSuffix;
    private final int longestUncompressedSuffix;
    private final int shortestCompressedSuffix;
    private final int shortestUncompressedSuffix;
    private final Map<String, String> uncompressSuffix;

    public FileNameUtil(Map<String, String> map, String str) {
        this.uncompressSuffix = Collections.unmodifiableMap(map);
        int i = Integer.MIN_VALUE;
        int i2 = Integer.MAX_VALUE;
        int i3 = Integer.MIN_VALUE;
        int i4 = Integer.MAX_VALUE;
        for (Map.Entry<String, String> entry : map.entrySet()) {
            int length = entry.getKey().length();
            int i5 = length > i ? length : i;
            int i6 = length < i2 ? length : i2;
            String value = entry.getValue();
            int length2 = value.length();
            i = i5;
            i2 = i6;
            if (length2 > 0) {
                if (!this.compressSuffix.containsKey(value)) {
                    this.compressSuffix.put(value, entry.getKey());
                }
                int i7 = length2 > i3 ? length2 : i3;
                i = i5;
                i3 = i7;
                i2 = i6;
                if (length2 < i4) {
                    i4 = length2;
                    i = i5;
                    i3 = i7;
                    i2 = i6;
                }
            }
        }
        this.longestCompressedSuffix = i;
        this.longestUncompressedSuffix = i3;
        this.shortestCompressedSuffix = i2;
        this.shortestUncompressedSuffix = i4;
        this.defaultExtension = str;
    }

    public String getCompressedFilename(String str) {
        String str2;
        String lowerCase = str.toLowerCase(Locale.ENGLISH);
        int length = lowerCase.length();
        for (int i = this.shortestUncompressedSuffix; i <= this.longestUncompressedSuffix && i < length; i++) {
            String str3 = this.compressSuffix.get(lowerCase.substring(length - i));
            if (str3 != null) {
                str2 = str.substring(0, length - i) + str3;
                break;
            }
        }
        str2 = str + this.defaultExtension;
        return str2;
    }

    public String getUncompressedFilename(String str) {
        String str2;
        String lowerCase = str.toLowerCase(Locale.ENGLISH);
        int length = lowerCase.length();
        int i = this.shortestCompressedSuffix;
        while (true) {
            str2 = str;
            if (i > this.longestCompressedSuffix) {
                break;
            }
            str2 = str;
            if (i >= length) {
                break;
            }
            String str3 = this.uncompressSuffix.get(lowerCase.substring(length - i));
            if (str3 != null) {
                str2 = str.substring(0, length - i) + str3;
                break;
            }
            i++;
        }
        return str2;
    }

    public boolean isCompressedFilename(String str) {
        boolean z;
        String lowerCase = str.toLowerCase(Locale.ENGLISH);
        int length = lowerCase.length();
        for (int i = this.shortestCompressedSuffix; i <= this.longestCompressedSuffix && i < length; i++) {
            if (this.uncompressSuffix.containsKey(lowerCase.substring(length - i))) {
                z = true;
                break;
            }
        }
        z = false;
        return z;
    }
}
