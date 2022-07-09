package org.apache.tools.ant.types.selectors.modifiedselector;

import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/Cache.class */
public interface Cache {
    void delete();

    Object get(Object obj);

    boolean isValid();

    Iterator iterator();

    void load();

    void put(Object obj, Object obj2);

    void save();
}
