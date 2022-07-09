package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/FileSelector.class */
public interface FileSelector {
    boolean isSelected(File file, String str, File file2) throws BuildException;
}
