package org.jivesoftware.smackx.workgroup.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import org.apache.tools.ant.types.selectors.DepthSelector;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/util/ModelUtil.class */
public final class ModelUtil {
    private ModelUtil() {
    }

    public static final boolean areBooleansDifferent(Boolean bool, Boolean bool2) {
        return !areBooleansEqual(bool, bool2);
    }

    public static final boolean areBooleansEqual(Boolean bool, Boolean bool2) {
        return (bool == Boolean.TRUE && bool2 == Boolean.TRUE) || !(bool == Boolean.TRUE || bool2 == Boolean.TRUE);
    }

    public static final boolean areDifferent(Object obj, Object obj2) {
        return !areEqual(obj, obj2);
    }

    public static final boolean areEqual(Object obj, Object obj2) {
        return obj == obj2 ? true : (obj == null || obj2 == null) ? false : obj.equals(obj2);
    }

    public static final String concat(String[] strArr) {
        return concat(strArr, " ");
    }

    public static final String concat(String[] strArr, String str) {
        String str2;
        if (strArr != null) {
            StringBuilder sb = new StringBuilder();
            for (String str3 : strArr) {
                if (str3 != null) {
                    sb.append(str3).append(str);
                }
            }
            int length = sb.length();
            if (length > 0) {
                sb.setLength(length - 1);
            }
            str2 = sb.toString();
        } else {
            str2 = "";
        }
        return str2;
    }

    public static String getTimeFromLong(long j) {
        long j2 = j % 86400000;
        long j3 = j2 / 3600000;
        long j4 = j2 % 3600000;
        long j5 = j4 / 60000;
        long j6 = (j4 % 60000) / 1000;
        StringBuilder sb = new StringBuilder();
        if (j3 > 0) {
            sb.append(j3 + " h, ");
        }
        if (j5 > 0) {
            sb.append(j5 + " " + DepthSelector.MIN_KEY + ", ");
        }
        sb.append(j6 + " sec");
        return sb.toString();
    }

    public static final boolean hasLength(String str) {
        return str != null && str.length() > 0;
    }

    public static final boolean hasNonNullElement(Object[] objArr) {
        boolean z;
        if (objArr != null) {
            for (Object obj : objArr) {
                if (obj != null) {
                    z = true;
                    break;
                }
            }
        }
        z = false;
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0015, code lost:
        if (r4 == null) goto L13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x001f, code lost:
        if (r4 != null) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean hasStringChanged(String str, String str2) {
        boolean z;
        if (str == null && str2 == null) {
            z = false;
        } else {
            if (str == null) {
                z = true;
            }
            if (str != null) {
                z = true;
            }
            z = true;
            if (str.equals(str2)) {
                z = false;
            }
        }
        return z;
    }

    public static <T> List<T> iteratorAsList(Iterator<T> it) {
        ArrayList arrayList = new ArrayList(10);
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }

    public static final String nullifyIfEmpty(String str) {
        if (!hasLength(str)) {
            str = null;
        }
        return str;
    }

    public static final String nullifyingToString(Object obj) {
        return obj != null ? nullifyIfEmpty(obj.toString()) : null;
    }

    public static <T> Iterator<T> reverseListIterator(ListIterator<T> listIterator) {
        return new ReverseListIterator(listIterator);
    }
}
