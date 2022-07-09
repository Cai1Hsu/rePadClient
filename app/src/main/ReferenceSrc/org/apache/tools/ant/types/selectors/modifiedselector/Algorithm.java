package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/Algorithm.class */
public interface Algorithm {
    String getValue(File file);

    boolean isValid();
}
