package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SelectorUtils.class */
public final class SelectorUtils {
    public static final String DEEP_TREE_MATCH = "**";
    private static final SelectorUtils instance = new SelectorUtils();
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();

    private SelectorUtils() {
    }

    private static boolean allStars(char[] cArr, int i, int i2) {
        boolean z;
        while (true) {
            if (i > i2) {
                z = true;
                break;
            } else if (cArr[i] != '*') {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private static boolean different(boolean z, char c, char c2) {
        boolean z2;
        if (z) {
            z2 = c != c2;
        } else {
            z2 = true;
            if (Character.toUpperCase(c) == Character.toUpperCase(c2)) {
                z2 = false;
            }
        }
        return z2;
    }

    public static SelectorUtils getInstance() {
        return instance;
    }

    public static boolean hasWildcards(String str) {
        return (str.indexOf(42) == -1 && str.indexOf(63) == -1) ? false : true;
    }

    public static boolean isOutOfDate(File file, File file2, int i) {
        boolean z = false;
        if (file.exists()) {
            if (!file2.exists()) {
                z = true;
            } else if (file.lastModified() - i > file2.lastModified()) {
                z = true;
            }
        }
        return z;
    }

    public static boolean isOutOfDate(Resource resource, Resource resource2, int i) {
        return isOutOfDate(resource, resource2, i);
    }

    public static boolean isOutOfDate(Resource resource, Resource resource2, long j) {
        long lastModified = resource.getLastModified();
        long lastModified2 = resource2.getLastModified();
        return resource.isExists() && (lastModified == 0 || lastModified2 == 0 || lastModified - j > lastModified2);
    }

    public static boolean match(String str, String str2) {
        return match(str, str2, true);
    }

    public static boolean match(String str, String str2, boolean z) {
        boolean z2;
        boolean allStars;
        int i;
        int i2;
        char[] charArray = str.toCharArray();
        char[] charArray2 = str2.toCharArray();
        int i3 = 0;
        int length = charArray.length - 1;
        int length2 = charArray2.length - 1;
        int i4 = 0;
        while (true) {
            z2 = false;
            if (i4 >= charArray.length) {
                break;
            } else if (charArray[i4] == '*') {
                z2 = true;
                break;
            } else {
                i4++;
            }
        }
        if (z2) {
            int i5 = 0;
            if (length == 0) {
                allStars = true;
            } else {
                while (true) {
                    char c = charArray[i3];
                    if (c == '*' || i5 > length2) {
                        break;
                    }
                    if (c != '?' && different(z, c, charArray2[i5])) {
                        allStars = false;
                        break;
                    }
                    i3++;
                    i5++;
                }
                int i6 = length;
                int i7 = length2;
                if (i5 > length2) {
                    allStars = allStars(charArray, i3, length);
                } else {
                    while (true) {
                        char c2 = charArray[i6];
                        if (c2 == '*' || i5 > i7) {
                            break;
                        }
                        if (c2 != '?' && different(z, c2, charArray2[i7])) {
                            allStars = false;
                            break;
                        }
                        i6--;
                        i7--;
                    }
                    int i8 = i3;
                    int i9 = i5;
                    if (i5 > i7) {
                        allStars = allStars(charArray, i3, i6);
                    } else {
                        while (i8 != i6 && i9 <= i7) {
                            int i10 = i8 + 1;
                            while (true) {
                                i = -1;
                                if (i10 > i6) {
                                    break;
                                } else if (charArray[i10] == '*') {
                                    i = i10;
                                    break;
                                } else {
                                    i10++;
                                }
                            }
                            if (i == i8 + 1) {
                                i8++;
                            } else {
                                int i11 = (i - i8) - 1;
                                int i12 = 0;
                                while (true) {
                                    i2 = -1;
                                    if (i12 > ((i7 - i9) + 1) - i11) {
                                        break;
                                    }
                                    for (int i13 = 0; i13 < i11; i13++) {
                                        char c3 = charArray[i8 + i13 + 1];
                                        if (c3 == '?' || !different(z, c3, charArray2[i9 + i12 + i13])) {
                                        }
                                    }
                                    i2 = i9 + i12;
                                    break;
                                    i12++;
                                }
                                if (i2 == -1) {
                                    allStars = false;
                                    break;
                                }
                                i8 = i;
                                i9 = i2 + i11;
                            }
                        }
                        allStars = allStars(charArray, i8, i6);
                    }
                }
            }
        } else if (length == length2) {
            int i14 = 0;
            while (true) {
                if (i14 > length) {
                    allStars = true;
                    break;
                }
                char c4 = charArray[i14];
                if (c4 != '?' && different(z, c4, charArray2[i14])) {
                    allStars = false;
                    break;
                }
                i14++;
            }
        } else {
            allStars = false;
        }
        return allStars;
    }

    public static boolean matchPath(String str, String str2) {
        return matchPath(tokenizePathAsArray(str), tokenizePathAsArray(str2), true);
    }

    public static boolean matchPath(String str, String str2, boolean z) {
        return matchPath(tokenizePathAsArray(str), tokenizePathAsArray(str2), z);
    }

    static boolean matchPath(String[] strArr, String[] strArr2, boolean z) {
        boolean z2;
        int i;
        int i2;
        int i3 = 0;
        int length = strArr.length - 1;
        int i4 = 0;
        int length2 = strArr2.length - 1;
        while (i3 <= length && i4 <= length2) {
            String str = strArr[i3];
            if (str.equals(DEEP_TREE_MATCH)) {
                break;
            } else if (!match(str, strArr2[i4], z)) {
                z2 = false;
                break;
            } else {
                i3++;
                i4++;
            }
        }
        if (i4 <= length2) {
            int i5 = length;
            if (i3 <= length) {
                while (i3 <= i5 && i4 <= length2) {
                    String str2 = strArr[i5];
                    if (str2.equals(DEEP_TREE_MATCH)) {
                        break;
                    } else if (!match(str2, strArr2[length2], z)) {
                        z2 = false;
                        break;
                    } else {
                        i5--;
                        length2--;
                    }
                }
                int i6 = i3;
                int i7 = i4;
                if (i4 <= length2) {
                    while (i6 != i5 && i7 <= length2) {
                        int i8 = i6 + 1;
                        while (true) {
                            i = -1;
                            if (i8 > i5) {
                                break;
                            } else if (strArr[i8].equals(DEEP_TREE_MATCH)) {
                                i = i8;
                                break;
                            } else {
                                i8++;
                            }
                        }
                        if (i == i6 + 1) {
                            i6++;
                        } else {
                            int i9 = (i - i6) - 1;
                            int i10 = 0;
                            while (true) {
                                i2 = -1;
                                if (i10 > ((length2 - i7) + 1) - i9) {
                                    break;
                                }
                                for (int i11 = 0; i11 < i9; i11++) {
                                    if (!match(strArr[i6 + i11 + 1], strArr2[i7 + i10 + i11], z)) {
                                        break;
                                    }
                                }
                                i2 = i7 + i10;
                                break;
                                i10++;
                            }
                            if (i2 == -1) {
                                z2 = false;
                                break;
                            }
                            i7 = i2 + i9;
                            i6 = i;
                        }
                    }
                    int i12 = i6;
                    while (true) {
                        if (i12 > i5) {
                            z2 = true;
                            break;
                        } else if (!strArr[i12].equals(DEEP_TREE_MATCH)) {
                            z2 = false;
                            break;
                        } else {
                            i12++;
                        }
                    }
                } else {
                    while (true) {
                        if (i3 > i5) {
                            z2 = true;
                            break;
                        } else if (!strArr[i3].equals(DEEP_TREE_MATCH)) {
                            z2 = false;
                            break;
                        } else {
                            i3++;
                        }
                    }
                }
            } else {
                z2 = false;
            }
        } else {
            while (true) {
                if (i3 > length) {
                    z2 = true;
                    break;
                } else if (!strArr[i3].equals(DEEP_TREE_MATCH)) {
                    z2 = false;
                    break;
                } else {
                    i3++;
                }
            }
        }
        return z2;
    }

    public static boolean matchPatternStart(String str, String str2) {
        return matchPatternStart(str, str2, true);
    }

    public static boolean matchPatternStart(String str, String str2, boolean z) {
        return str2.startsWith(File.separator) != str.startsWith(File.separator) ? false : matchPatternStart(tokenizePathAsArray(str), tokenizePathAsArray(str2), z);
    }

    static boolean matchPatternStart(String[] strArr, String[] strArr2, boolean z) {
        boolean z2;
        int i = 0;
        int length = strArr.length - 1;
        int i2 = 0;
        int length2 = strArr2.length - 1;
        while (i <= length && i2 <= length2) {
            String str = strArr[i];
            if (!str.equals(DEEP_TREE_MATCH)) {
                z2 = false;
                if (!match(str, strArr2[i2], z)) {
                    break;
                }
                i++;
                i2++;
            } else {
                break;
            }
        }
        if (i2 > length2) {
            z2 = true;
        } else {
            z2 = false;
            if (i <= length) {
                z2 = true;
            }
        }
        return z2;
    }

    public static String removeWhitespace(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        if (str != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(str);
            while (stringTokenizer.hasMoreTokens()) {
                stringBuffer.append(stringTokenizer.nextToken());
            }
        }
        return stringBuffer.toString();
    }

    public static String rtrimWildcardTokens(String str) {
        return new TokenizedPattern(str).rtrimWildcardTokens().toString();
    }

    public static Vector tokenizePath(String str) {
        return tokenizePath(str, File.separator);
    }

    public static Vector tokenizePath(String str, String str2) {
        Vector vector = new Vector();
        String str3 = str;
        if (FileUtils.isAbsolutePath(str)) {
            String[] dissect = FILE_UTILS.dissect(str);
            vector.add(dissect[0]);
            str3 = dissect[1];
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str3, str2);
        while (stringTokenizer.hasMoreTokens()) {
            vector.addElement(stringTokenizer.nextToken());
        }
        return vector;
    }

    static String[] tokenizePathAsArray(String str) {
        int i;
        String str2 = null;
        String str3 = str;
        if (FileUtils.isAbsolutePath(str)) {
            String[] dissect = FILE_UTILS.dissect(str);
            str2 = dissect[0];
            str3 = dissect[1];
        }
        char c = File.separatorChar;
        int i2 = 0;
        int length = str3.length();
        int i3 = 0;
        int i4 = 0;
        while (i4 < length) {
            int i5 = i3;
            int i6 = i2;
            if (str3.charAt(i4) == c) {
                i5 = i3;
                if (i4 != i2) {
                    i5 = i3 + 1;
                }
                i6 = i4 + 1;
            }
            i4++;
            i3 = i5;
            i2 = i6;
        }
        int i7 = i3;
        if (length != i2) {
            i7 = i3 + 1;
        }
        int i8 = 1;
        if (str2 == null) {
            i8 = 0;
        }
        String[] strArr = new String[i8 + i7];
        if (str2 != null) {
            strArr[0] = str2;
            i = 1;
        } else {
            i = 0;
        }
        int i9 = 0;
        for (int i10 = 0; i10 < length; i10++) {
            if (str3.charAt(i10) == c) {
                if (i10 != i9) {
                    strArr[i] = str3.substring(i9, i10);
                    i++;
                }
                i9 = i10 + 1;
            }
        }
        if (length != i9) {
            strArr[i] = str3.substring(i9);
        }
        return strArr;
    }
}
