package com.mongodb;

import java.util.Collection;
import java.util.Iterator;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class StringUtils {
    public static String join(String delimiter, Collection<?> s) {
        StringBuilder builder = new StringBuilder();
        Iterator<?> iter = s.iterator();
        while (iter.hasNext()) {
            builder.append(iter.next());
            if (!iter.hasNext()) {
                break;
            }
            builder.append(delimiter);
        }
        return builder.toString();
    }

    private StringUtils() {
    }
}
