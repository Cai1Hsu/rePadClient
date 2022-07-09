package org.apache.tools.ant.types.selectors.modifiedselector;

import java.util.Comparator;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/EqualComparator.class */
public class EqualComparator implements Comparator {
    @Override // java.util.Comparator
    public int compare(Object obj, Object obj2) {
        int i = 0;
        if (obj == null) {
            if (obj2 == null) {
                i = 1;
            }
        } else if (!obj.equals(obj2)) {
            i = 1;
        }
        return i;
    }

    public String toString() {
        return "EqualComparator";
    }
}
