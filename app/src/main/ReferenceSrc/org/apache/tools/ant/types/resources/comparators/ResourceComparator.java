package org.apache.tools.ant.types.resources.comparators;

import java.util.Comparator;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/ResourceComparator.class */
public abstract class ResourceComparator extends DataType implements Comparator {
    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        dieOnCircularReference();
        return (isReference() ? (ResourceComparator) getCheckedRef() : this).resourceCompare((Resource) obj, (Resource) obj2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x002c, code lost:
        if (r4.getClass().equals(getClass()) != false) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z;
        if (isReference()) {
            z = getCheckedRef().equals(obj);
        } else {
            z = false;
            if (obj != null) {
                if (obj != this) {
                    z = false;
                }
                z = true;
            }
        }
        return z;
    }

    public int hashCode() {
        int hashCode;
        synchronized (this) {
            hashCode = isReference() ? getCheckedRef().hashCode() : getClass().hashCode();
        }
        return hashCode;
    }

    protected abstract int resourceCompare(Resource resource, Resource resource2);
}
