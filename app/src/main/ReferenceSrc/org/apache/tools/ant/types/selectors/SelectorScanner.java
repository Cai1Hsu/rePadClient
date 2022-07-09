package org.apache.tools.ant.types.selectors;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SelectorScanner.class */
public interface SelectorScanner {
    String[] getDeselectedDirectories();

    String[] getDeselectedFiles();

    void setSelectors(FileSelector[] fileSelectorArr);
}
