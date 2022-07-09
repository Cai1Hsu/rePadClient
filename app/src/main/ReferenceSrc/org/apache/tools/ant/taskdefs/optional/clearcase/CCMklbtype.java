package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCMklbtype.class */
public class CCMklbtype extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_GLOBAL = "-global";
    public static final String FLAG_NOCOMMENT = "-nc";
    public static final String FLAG_ORDINARY = "-ordinary";
    public static final String FLAG_PBRANCH = "-pbranch";
    public static final String FLAG_REPLACE = "-replace";
    public static final String FLAG_SHARED = "-shared";
    private String mTypeName = null;
    private String mVOB = null;
    private String mComment = null;
    private String mCfile = null;
    private boolean mReplace = false;
    private boolean mGlobal = false;
    private boolean mOrdinary = true;
    private boolean mPbranch = false;
    private boolean mShared = false;

    private void checkOptions(Commandline commandline) {
        if (getReplace()) {
            commandline.createArgument().setValue("-replace");
        }
        if (getOrdinary()) {
            commandline.createArgument().setValue(FLAG_ORDINARY);
        } else if (getGlobal()) {
            commandline.createArgument().setValue(FLAG_GLOBAL);
        }
        if (getPbranch()) {
            commandline.createArgument().setValue(FLAG_PBRANCH);
        }
        if (getShared()) {
            commandline.createArgument().setValue(FLAG_SHARED);
        }
        if (getComment() != null) {
            getCommentCommand(commandline);
        } else if (getCommentFile() != null) {
            getCommentFileCommand(commandline);
        } else {
            commandline.createArgument().setValue("-nc");
        }
        commandline.createArgument().setValue(getTypeSpecifier());
    }

    private void getCommentCommand(Commandline commandline) {
        if (getComment() != null) {
            commandline.createArgument().setValue("-c");
            commandline.createArgument().setValue(getComment());
        }
    }

    private void getCommentFileCommand(Commandline commandline) {
        if (getCommentFile() != null) {
            commandline.createArgument().setValue("-cfile");
            commandline.createArgument().setValue(getCommentFile());
        }
    }

    private String getTypeSpecifier() {
        String typeName = getTypeName();
        String str = typeName;
        if (getVOB() != null) {
            str = new StringBuffer().append(typeName).append("@").append(getVOB()).toString();
        }
        return str;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        if (getTypeName() == null) {
            throw new BuildException("Required attribute TypeName not specified");
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_MKLBTYPE);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getTypeSpecifier()).toString(), 3);
        }
        if (Execute.isFailure(run(commandline)) && getFailOnErr()) {
            throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
        }
    }

    public String getComment() {
        return this.mComment;
    }

    public String getCommentFile() {
        return this.mCfile;
    }

    public boolean getGlobal() {
        return this.mGlobal;
    }

    public boolean getOrdinary() {
        return this.mOrdinary;
    }

    public boolean getPbranch() {
        return this.mPbranch;
    }

    public boolean getReplace() {
        return this.mReplace;
    }

    public boolean getShared() {
        return this.mShared;
    }

    public String getTypeName() {
        return this.mTypeName;
    }

    public String getVOB() {
        return this.mVOB;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setGlobal(boolean z) {
        this.mGlobal = z;
    }

    public void setOrdinary(boolean z) {
        this.mOrdinary = z;
    }

    public void setPbranch(boolean z) {
        this.mPbranch = z;
    }

    public void setReplace(boolean z) {
        this.mReplace = z;
    }

    public void setShared(boolean z) {
        this.mShared = z;
    }

    public void setTypeName(String str) {
        this.mTypeName = str;
    }

    public void setVOB(String str) {
        this.mVOB = str;
    }
}
