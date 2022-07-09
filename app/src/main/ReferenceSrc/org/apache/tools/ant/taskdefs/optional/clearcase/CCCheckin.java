package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCCheckin.class */
public class CCCheckin extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_IDENTICAL = "-identical";
    public static final String FLAG_KEEPCOPY = "-keep";
    public static final String FLAG_NOCOMMENT = "-nc";
    public static final String FLAG_NOWARN = "-nwarn";
    public static final String FLAG_PRESERVETIME = "-ptime";
    private String mComment = null;
    private String mCfile = null;
    private boolean mNwarn = false;
    private boolean mPtime = false;
    private boolean mKeep = false;
    private boolean mIdentical = true;

    private void checkOptions(Commandline commandline) {
        if (getComment() != null) {
            getCommentCommand(commandline);
        } else if (getCommentFile() != null) {
            getCommentFileCommand(commandline);
        } else {
            commandline.createArgument().setValue("-nc");
        }
        if (getNoWarn()) {
            commandline.createArgument().setValue("-nwarn");
        }
        if (getPreserveTime()) {
            commandline.createArgument().setValue("-ptime");
        }
        if (getKeepCopy()) {
            commandline.createArgument().setValue("-keep");
        }
        if (getIdentical()) {
            commandline.createArgument().setValue("-identical");
        }
        commandline.createArgument().setValue(getViewPath());
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
        commandline.createArgument().setValue(ClearCase.COMMAND_CHECKIN);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getViewPathBasename()).toString(), 3);
        }
        if (!Execute.isFailure(run(commandline)) || !getFailOnErr()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
    }

    public String getComment() {
        return this.mComment;
    }

    public String getCommentFile() {
        return this.mCfile;
    }

    public boolean getIdentical() {
        return this.mIdentical;
    }

    public boolean getKeepCopy() {
        return this.mKeep;
    }

    public boolean getNoWarn() {
        return this.mNwarn;
    }

    public boolean getPreserveTime() {
        return this.mPtime;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setIdentical(boolean z) {
        this.mIdentical = z;
    }

    public void setKeepCopy(boolean z) {
        this.mKeep = z;
    }

    public void setNoWarn(boolean z) {
        this.mNwarn = z;
    }

    public void setPreserveTime(boolean z) {
        this.mPtime = z;
    }
}
