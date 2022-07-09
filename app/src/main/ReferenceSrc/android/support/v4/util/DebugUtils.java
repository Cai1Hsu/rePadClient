package android.support.v4.util;

import android.support.annotation.RestrictTo;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/util/DebugUtils.class */
public class DebugUtils {
    /* JADX WARN: Code restructure failed: missing block: B:9:0x001e, code lost:
        if (r0.length() <= 0) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void buildShortClassTag(Object obj, StringBuilder sb) {
        String str;
        if (obj == null) {
            sb.append("null");
            return;
        }
        String simpleName = obj.getClass().getSimpleName();
        if (simpleName != null) {
            str = simpleName;
        }
        String name = obj.getClass().getName();
        int lastIndexOf = name.lastIndexOf(46);
        str = name;
        if (lastIndexOf > 0) {
            str = name.substring(lastIndexOf + 1);
        }
        sb.append(str);
        sb.append('{');
        sb.append(Integer.toHexString(System.identityHashCode(obj)));
    }
}
