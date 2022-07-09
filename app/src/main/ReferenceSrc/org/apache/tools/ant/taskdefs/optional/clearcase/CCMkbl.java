package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCMkbl.class */
public class CCMkbl extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_FULL = "-full";
    public static final String FLAG_IDENTICAL = "-identical";
    public static final String FLAG_INCREMENTAL = "-incremental";
    public static final String FLAG_NLABEL = "-nlabel";
    public static final String FLAG_NOCOMMENT = "-nc";
    private String mComment = null;
    private String mCfile = null;
    private String mBaselineRootName = null;
    private boolean mNwarn = false;
    private boolean mIdentical = true;
    private boolean mFull = false;
    private boolean mNlabel = false;

    private void checkOptions(Commandline commandline) {
        if (getComment() != null) {
            getCommentCommand(commandline);
        } else if (getCommentFile() != null) {
            getCommentFileCommand(commandline);
        } else {
            commandline.createArgument().setValue("-nc");
        }
        if (getIdentical()) {
            commandline.createArgument().setValue("-identical");
        }
        if (getFull()) {
            commandline.createArgument().setValue(FLAG_FULL);
        } else {
            commandline.createArgument().setValue(FLAG_INCREMENTAL);
        }
        if (getNlabel()) {
            commandline.createArgument().setValue(FLAG_NLABEL);
        }
        commandline.createArgument().setValue(getBaselineRootName());
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

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        Project project = getProject();
        if (getViewPath() == null) {
            setViewPath(project.getBaseDir().getPath());
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_MKBL);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getBaselineRootName()).toString(), 3);
        }
        if (!Execute.isFailure(run(commandline)) || !getFailOnErr()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
    }

    public String getBaselineRootName() {
        return this.mBaselineRootName;
    }

    public String getComment() {
        return this.mComment;
    }

    public String getCommentFile() {
        return this.mCfile;
    }

    public boolean getFull() {
        return this.mFull;
    }

    public boolean getIdentical() {
        return this.mIdentical;
    }

    public boolean getNlabel() {
        return this.mNlabel;
    }

    public boolean getNoWarn() {
        return this.mNwarn;
    }

    public void setBaselineRootName(String str) {
        this.mBaselineRootName = str;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setFull(boolean z) {
        this.mFull = z;
    }

    public void setIdentical(boolean z) {
        this.mIdentical = z;
    }

    public void setNlabel(boolean z) {
        this.mNlabel = z;
    }

    public void setNoWarn(boolean z) {
        this.mNwarn = z;
    }
}
