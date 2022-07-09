package org.apache.tools.ant.util;

import java.lang.ref.WeakReference;

/* loaded from: classes.jar:org/apache/tools/ant/util/WeakishReference.class */
public class WeakishReference {
    private WeakReference weakref;

    /* loaded from: classes.jar:org/apache/tools/ant/util/WeakishReference$HardReference.class */
    public static class HardReference extends WeakishReference {
        public HardReference(Object obj) {
            super(obj);
        }
    }

    WeakishReference(Object obj) {
        this.weakref = new WeakReference(obj);
    }

    public static WeakishReference createReference(Object obj) {
        return new WeakishReference(obj);
    }

    public Object get() {
        return this.weakref.get();
    }
}
