package org.apache.commons.io;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Stack;

/* loaded from: classes.jar:org/apache/commons/io/FilenameUtils.class */
public class FilenameUtils {
    public static final char EXTENSION_SEPARATOR = '.';
    private static final char OTHER_SEPARATOR;
    private static final char UNIX_SEPARATOR = '/';
    private static final char WINDOWS_SEPARATOR = '\\';
    public static final String EXTENSION_SEPARATOR_STR = Character.toString('.');
    private static final char SYSTEM_SEPARATOR = File.separatorChar;

    static {
        if (isSystemWindows()) {
            OTHER_SEPARATOR = (char) 47;
        } else {
            OTHER_SEPARATOR = (char) 92;
        }
    }

    public static String concat(String str, String str2) {
        String str3 = null;
        int prefixLength = getPrefixLength(str2);
        if (prefixLength >= 0) {
            if (prefixLength > 0) {
                str3 = normalize(str2);
            } else if (str != null) {
                int length = str.length();
                str3 = length == 0 ? normalize(str2) : isSeparator(str.charAt(length - 1)) ? normalize(str + str2) : normalize(str + '/' + str2);
            }
        }
        return str3;
    }

    public static boolean directoryContains(String str, String str2) throws IOException {
        boolean z = false;
        if (str == null) {
            throw new IllegalArgumentException("Directory must not be null");
        }
        if (str2 != null && !IOCase.SYSTEM.checkEquals(str, str2)) {
            z = IOCase.SYSTEM.checkStartsWith(str2, str);
        }
        return z;
    }

    private static String doGetFullPath(String str, boolean z) {
        String substring;
        if (str == null) {
            substring = null;
        } else {
            int prefixLength = getPrefixLength(str);
            if (prefixLength < 0) {
                substring = null;
            } else if (prefixLength >= str.length()) {
                substring = str;
                if (z) {
                    substring = getPrefix(str);
                }
            } else {
                int indexOfLastSeparator = indexOfLastSeparator(str);
                if (indexOfLastSeparator < 0) {
                    substring = str.substring(0, prefixLength);
                } else {
                    int i = indexOfLastSeparator + (z ? 1 : 0);
                    int i2 = i;
                    if (i == 0) {
                        i2 = i + 1;
                    }
                    substring = str.substring(0, i2);
                }
            }
        }
        return substring;
    }

    private static String doGetPath(String str, int i) {
        int prefixLength;
        String str2 = null;
        if (str != null && (prefixLength = getPrefixLength(str)) >= 0) {
            int indexOfLastSeparator = indexOfLastSeparator(str);
            int i2 = indexOfLastSeparator + i;
            str2 = (prefixLength >= str.length() || indexOfLastSeparator < 0 || prefixLength >= i2) ? "" : str.substring(prefixLength, i2);
        }
        return str2;
    }

    private static String doNormalize(String str, char c, boolean z) {
        String str2;
        if (str == null) {
            str2 = null;
        } else {
            int length = str.length();
            str2 = str;
            if (length != 0) {
                int prefixLength = getPrefixLength(str);
                if (prefixLength < 0) {
                    str2 = null;
                } else {
                    char[] cArr = new char[length + 2];
                    str.getChars(0, str.length(), cArr, 0);
                    char c2 = c == SYSTEM_SEPARATOR ? OTHER_SEPARATOR : SYSTEM_SEPARATOR;
                    for (int i = 0; i < cArr.length; i++) {
                        if (cArr[i] == c2) {
                            cArr[i] = c;
                        }
                    }
                    boolean z2 = true;
                    int i2 = length;
                    if (cArr[length - 1] != c) {
                        cArr[length] = c;
                        z2 = false;
                        i2 = length + 1;
                    }
                    int i3 = prefixLength + 1;
                    while (i3 < i2) {
                        int i4 = i3;
                        int i5 = i2;
                        if (cArr[i3] == c) {
                            i4 = i3;
                            i5 = i2;
                            if (cArr[i3 - 1] == c) {
                                System.arraycopy(cArr, i3, cArr, i3 - 1, i2 - i3);
                                i5 = i2 - 1;
                                i4 = i3 - 1;
                            }
                        }
                        i3 = i4 + 1;
                        i2 = i5;
                    }
                    int i6 = prefixLength + 1;
                    while (i6 < i2) {
                        int i7 = i6;
                        boolean z3 = z2;
                        int i8 = i2;
                        if (cArr[i6] == c) {
                            i7 = i6;
                            z3 = z2;
                            i8 = i2;
                            if (cArr[i6 - 1] == '.') {
                                if (i6 != prefixLength + 1) {
                                    i7 = i6;
                                    z3 = z2;
                                    i8 = i2;
                                    if (cArr[i6 - 2] != c) {
                                    }
                                }
                                if (i6 == i2 - 1) {
                                    z2 = true;
                                }
                                System.arraycopy(cArr, i6 + 1, cArr, i6 - 1, i2 - i6);
                                i8 = i2 - 2;
                                i7 = i6 - 1;
                                z3 = z2;
                            }
                        }
                        i6 = i7 + 1;
                        z2 = z3;
                        i2 = i8;
                    }
                    int i9 = i2;
                    int i10 = prefixLength + 2;
                    while (true) {
                        if (i10 < i9) {
                            int i11 = i10;
                            boolean z4 = z2;
                            int i12 = i9;
                            if (cArr[i10] == c) {
                                i11 = i10;
                                z4 = z2;
                                i12 = i9;
                                if (cArr[i10 - 1] == '.') {
                                    i11 = i10;
                                    z4 = z2;
                                    i12 = i9;
                                    if (cArr[i10 - 2] == '.') {
                                        if (i10 != prefixLength + 2) {
                                            i11 = i10;
                                            z4 = z2;
                                            i12 = i9;
                                            if (cArr[i10 - 3] != c) {
                                                continue;
                                            }
                                        }
                                        if (i10 == prefixLength + 2) {
                                            str2 = null;
                                            break;
                                        }
                                        if (i10 == i9 - 1) {
                                            z2 = true;
                                        }
                                        int i13 = i10 - 4;
                                        while (true) {
                                            if (i13 < prefixLength) {
                                                System.arraycopy(cArr, i10 + 1, cArr, prefixLength, i9 - i10);
                                                i12 = i9 - ((i10 + 1) - prefixLength);
                                                i11 = prefixLength + 1;
                                                z4 = z2;
                                                break;
                                            } else if (cArr[i13] == c) {
                                                System.arraycopy(cArr, i10 + 1, cArr, i13 + 1, i9 - i10);
                                                i11 = i13 + 1;
                                                i12 = i9 - (i10 - i13);
                                                z4 = z2;
                                                break;
                                            } else {
                                                i13--;
                                            }
                                        }
                                    } else {
                                        continue;
                                    }
                                } else {
                                    continue;
                                }
                            }
                            i10 = i11 + 1;
                            z2 = z4;
                            i9 = i12;
                        } else {
                            str2 = i9 <= 0 ? "" : i9 <= prefixLength ? new String(cArr, 0, i9) : (!z2 || !z) ? new String(cArr, 0, i9 - 1) : new String(cArr, 0, i9);
                        }
                    }
                }
            }
        }
        return str2;
    }

    public static boolean equals(String str, String str2) {
        return equals(str, str2, false, IOCase.SENSITIVE);
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0037, code lost:
        if (r0 == null) goto L20;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean equals(String str, String str2, boolean z, IOCase iOCase) {
        boolean z2;
        if (str == null || str2 == null) {
            z2 = str == null && str2 == null;
        } else {
            String str3 = str;
            String str4 = str2;
            if (z) {
                str3 = normalize(str);
                String normalize = normalize(str2);
                if (str3 != null) {
                    str4 = normalize;
                }
                throw new NullPointerException("Error normalizing one or both of the file names");
            }
            IOCase iOCase2 = iOCase;
            if (iOCase == null) {
                iOCase2 = IOCase.SENSITIVE;
            }
            z2 = iOCase2.checkEquals(str3, str4);
        }
        return z2;
    }

    public static boolean equalsNormalized(String str, String str2) {
        return equals(str, str2, true, IOCase.SENSITIVE);
    }

    public static boolean equalsNormalizedOnSystem(String str, String str2) {
        return equals(str, str2, true, IOCase.SYSTEM);
    }

    public static boolean equalsOnSystem(String str, String str2) {
        return equals(str, str2, false, IOCase.SYSTEM);
    }

    public static String getBaseName(String str) {
        return removeExtension(getName(str));
    }

    public static String getExtension(String str) {
        String substring;
        if (str == null) {
            substring = null;
        } else {
            int indexOfExtension = indexOfExtension(str);
            substring = indexOfExtension == -1 ? "" : str.substring(indexOfExtension + 1);
        }
        return substring;
    }

    public static String getFullPath(String str) {
        return doGetFullPath(str, true);
    }

    public static String getFullPathNoEndSeparator(String str) {
        return doGetFullPath(str, false);
    }

    public static String getName(String str) {
        return str == null ? null : str.substring(indexOfLastSeparator(str) + 1);
    }

    public static String getPath(String str) {
        return doGetPath(str, 1);
    }

    public static String getPathNoEndSeparator(String str) {
        return doGetPath(str, 0);
    }

    public static String getPrefix(String str) {
        int prefixLength;
        String str2 = null;
        if (str != null && (prefixLength = getPrefixLength(str)) >= 0) {
            str2 = prefixLength > str.length() ? str + '/' : str.substring(0, prefixLength);
        }
        return str2;
    }

    public static int getPrefixLength(String str) {
        int i = 1;
        if (str == null) {
            i = -1;
        } else {
            int length = str.length();
            if (length == 0) {
                i = 0;
            } else {
                char charAt = str.charAt(0);
                if (charAt == ':') {
                    i = -1;
                } else if (length == 1) {
                    if (charAt == '~') {
                        i = 2;
                    } else if (!isSeparator(charAt)) {
                        i = 0;
                    }
                } else if (charAt == '~') {
                    int indexOf = str.indexOf(47, 1);
                    int indexOf2 = str.indexOf(92, 1);
                    if (indexOf == -1 && indexOf2 == -1) {
                        i = length + 1;
                    } else {
                        int i2 = indexOf;
                        if (indexOf == -1) {
                            i2 = indexOf2;
                        }
                        int i3 = indexOf2;
                        if (indexOf2 == -1) {
                            i3 = i2;
                        }
                        i = Math.min(i2, i3) + 1;
                    }
                } else {
                    char charAt2 = str.charAt(1);
                    if (charAt2 == ':') {
                        char upperCase = Character.toUpperCase(charAt);
                        i = (upperCase < 'A' || upperCase > 'Z') ? -1 : (length == 2 || !isSeparator(str.charAt(2))) ? 2 : 3;
                    } else if (isSeparator(charAt) && isSeparator(charAt2)) {
                        int indexOf3 = str.indexOf(47, 2);
                        int indexOf4 = str.indexOf(92, 2);
                        if ((indexOf3 == -1 && indexOf4 == -1) || indexOf3 == 2 || indexOf4 == 2) {
                            i = -1;
                        } else {
                            int i4 = indexOf3;
                            if (indexOf3 == -1) {
                                i4 = indexOf4;
                            }
                            int i5 = indexOf4;
                            if (indexOf4 == -1) {
                                i5 = i4;
                            }
                            i = Math.min(i4, i5) + 1;
                        }
                    } else if (!isSeparator(charAt)) {
                        i = 0;
                    }
                }
            }
        }
        return i;
    }

    public static int indexOfExtension(String str) {
        int i = -1;
        if (str != null) {
            int lastIndexOf = str.lastIndexOf(46);
            i = lastIndexOf;
            if (indexOfLastSeparator(str) > lastIndexOf) {
                i = -1;
            }
        }
        return i;
    }

    public static int indexOfLastSeparator(String str) {
        return str == null ? -1 : Math.max(str.lastIndexOf(47), str.lastIndexOf(92));
    }

    public static boolean isExtension(String str, String str2) {
        boolean z = false;
        if (str != null) {
            if (str2 != null && str2.length() != 0) {
                z = getExtension(str).equals(str2);
            } else if (indexOfExtension(str) == -1) {
                z = true;
            }
        }
        return z;
    }

    public static boolean isExtension(String str, Collection<String> collection) {
        boolean z = true;
        if (str != null) {
            if (collection != null && !collection.isEmpty()) {
                String extension = getExtension(str);
                Iterator<String> it = collection.iterator();
                while (true) {
                    z = false;
                    if (it.hasNext()) {
                        if (extension.equals(it.next())) {
                            z = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            } else if (indexOfExtension(str) != -1) {
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    public static boolean isExtension(String str, String[] strArr) {
        boolean z = true;
        if (str == null) {
            z = false;
        } else if (strArr != null && strArr.length != 0) {
            String extension = getExtension(str);
            int length = strArr.length;
            int i = 0;
            while (true) {
                z = false;
                if (i >= length) {
                    break;
                } else if (extension.equals(strArr[i])) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        } else if (indexOfExtension(str) != -1) {
            z = false;
        }
        return z;
    }

    private static boolean isSeparator(char c) {
        return c == '/' || c == '\\';
    }

    static boolean isSystemWindows() {
        return SYSTEM_SEPARATOR == '\\';
    }

    public static String normalize(String str) {
        return doNormalize(str, SYSTEM_SEPARATOR, true);
    }

    public static String normalize(String str, boolean z) {
        return doNormalize(str, z ? '/' : '\\', true);
    }

    public static String normalizeNoEndSeparator(String str) {
        return doNormalize(str, SYSTEM_SEPARATOR, false);
    }

    public static String normalizeNoEndSeparator(String str, boolean z) {
        return doNormalize(str, z ? '/' : '\\', false);
    }

    public static String removeExtension(String str) {
        String str2;
        if (str == null) {
            str2 = null;
        } else {
            int indexOfExtension = indexOfExtension(str);
            str2 = str;
            if (indexOfExtension != -1) {
                str2 = str.substring(0, indexOfExtension);
            }
        }
        return str2;
    }

    public static String separatorsToSystem(String str) {
        return str == null ? null : isSystemWindows() ? separatorsToWindows(str) : separatorsToUnix(str);
    }

    public static String separatorsToUnix(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str.indexOf(92) == -1 ? str : str.replace('\\', '/');
        }
        return str2;
    }

    public static String separatorsToWindows(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str.indexOf(47) == -1 ? str : str.replace('/', '\\');
        }
        return str2;
    }

    static String[] splitOnTokens(String str) {
        String[] strArr;
        if (str.indexOf(63) == -1 && str.indexOf(42) == -1) {
            strArr = new String[]{str};
        } else {
            char[] charArray = str.toCharArray();
            ArrayList arrayList = new ArrayList();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < charArray.length; i++) {
                if (charArray[i] == '?' || charArray[i] == '*') {
                    if (sb.length() != 0) {
                        arrayList.add(sb.toString());
                        sb.setLength(0);
                    }
                    if (charArray[i] == '?') {
                        arrayList.add("?");
                    } else if (arrayList.isEmpty() || (i > 0 && !((String) arrayList.get(arrayList.size() - 1)).equals("*"))) {
                        arrayList.add("*");
                    }
                } else {
                    sb.append(charArray[i]);
                }
            }
            if (sb.length() != 0) {
                arrayList.add(sb.toString());
            }
            strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
        }
        return strArr;
    }

    public static boolean wildcardMatch(String str, String str2) {
        return wildcardMatch(str, str2, IOCase.SENSITIVE);
    }

    public static boolean wildcardMatch(String str, String str2, IOCase iOCase) {
        boolean z;
        int i;
        int i2;
        boolean z2;
        if (str != null || str2 != null) {
            if (str != null && str2 != null) {
                IOCase iOCase2 = iOCase;
                if (iOCase == null) {
                    iOCase2 = IOCase.SENSITIVE;
                }
                String[] splitOnTokens = splitOnTokens(str2);
                boolean z3 = false;
                int i3 = 0;
                int i4 = 0;
                Stack stack = new Stack();
                while (true) {
                    if (stack.size() > 0) {
                        int[] iArr = (int[]) stack.pop();
                        i4 = iArr[0];
                        i3 = iArr[1];
                        z3 = true;
                    }
                    while (true) {
                        i = i3;
                        if (i4 >= splitOnTokens.length) {
                            break;
                        } else if (splitOnTokens[i4].equals("?")) {
                            i3++;
                            if (i3 > str.length()) {
                                i = i3;
                                break;
                            }
                            z2 = false;
                            i4++;
                            z3 = z2;
                        } else {
                            if (splitOnTokens[i4].equals("*")) {
                                z2 = true;
                                if (i4 == splitOnTokens.length - 1) {
                                    i3 = str.length();
                                    z2 = true;
                                }
                            } else if (z3) {
                                int checkIndexOf = iOCase2.checkIndexOf(str, i3, splitOnTokens[i4]);
                                i = checkIndexOf;
                                if (checkIndexOf == -1) {
                                    break;
                                }
                                int checkIndexOf2 = iOCase2.checkIndexOf(str, checkIndexOf + 1, splitOnTokens[i4]);
                                i2 = checkIndexOf;
                                if (checkIndexOf2 >= 0) {
                                    stack.push(new int[]{i4, checkIndexOf2});
                                    i2 = checkIndexOf;
                                }
                                i3 = i2 + splitOnTokens[i4].length();
                                z2 = false;
                            } else {
                                i2 = i3;
                                if (!iOCase2.checkRegionMatches(str, i3, splitOnTokens[i4])) {
                                    i = i3;
                                    break;
                                }
                                i3 = i2 + splitOnTokens[i4].length();
                                z2 = false;
                            }
                            i4++;
                            z3 = z2;
                        }
                    }
                    if (i4 == splitOnTokens.length) {
                        z = true;
                        if (i == str.length()) {
                            break;
                        }
                    }
                    i3 = i;
                    if (stack.size() <= 0) {
                        z = false;
                        break;
                    }
                }
            } else {
                z = false;
            }
        } else {
            z = true;
        }
        return z;
    }

    public static boolean wildcardMatchOnSystem(String str, String str2) {
        return wildcardMatch(str, str2, IOCase.SYSTEM);
    }
}
