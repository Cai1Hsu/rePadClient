package org.apache.tools.ant.taskdefs.cvslib;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/CvsUser.class */
public class CvsUser {
    private String displayName;
    private String userID;

    public String getDisplayname() {
        return this.displayName;
    }

    public String getUserID() {
        return this.userID;
    }

    public void setDisplayname(String str) {
        this.displayName = str;
    }

    public void setUserid(String str) {
        this.userID = str;
    }

    public void validate() throws BuildException {
        if (this.userID == null) {
            throw new BuildException("Username attribute must be set.");
        }
        if (this.displayName != null) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Displayname attribute must be set for userID ").append(this.userID).toString());
    }
}
