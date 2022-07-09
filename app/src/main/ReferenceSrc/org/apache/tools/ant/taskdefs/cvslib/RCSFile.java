package org.apache.tools.ant.taskdefs.cvslib;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/RCSFile.class */
class RCSFile {
    private String name;
    private String previousRevision;
    private String revision;

    RCSFile(String str, String str2) {
        this(str, str2, null);
    }

    RCSFile(String str, String str2, String str3) {
        this.name = str;
        this.revision = str2;
        if (!str2.equals(str3)) {
            this.previousRevision = str3;
        }
    }

    String getName() {
        return this.name;
    }

    String getPreviousRevision() {
        return this.previousRevision;
    }

    String getRevision() {
        return this.revision;
    }
}
