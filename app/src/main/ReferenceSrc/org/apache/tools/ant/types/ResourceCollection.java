package org.apache.tools.ant.types;

import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/types/ResourceCollection.class */
public interface ResourceCollection {
    boolean isFilesystemOnly();

    Iterator iterator();

    int size();
}
