package org.apache.tools.ant.taskdefs.optional.extension;

import org.apache.tools.ant.types.FileSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/LibFileSet.class */
public class LibFileSet extends FileSet {
    private boolean includeImpl;
    private boolean includeURL;
    private String urlBase;

    String getUrlBase() {
        return this.urlBase;
    }

    boolean isIncludeImpl() {
        return this.includeImpl;
    }

    boolean isIncludeURL() {
        return this.includeURL;
    }

    public void setIncludeImpl(boolean z) {
        this.includeImpl = z;
    }

    public void setIncludeUrl(boolean z) {
        this.includeURL = z;
    }

    public void setUrlBase(String str) {
        this.urlBase = str;
    }
}
