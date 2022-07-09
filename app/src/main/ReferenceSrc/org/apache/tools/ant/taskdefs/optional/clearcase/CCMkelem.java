package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCMkelem.class */
public class CCMkelem extends ClearCase {
    public static final String FLAG_CHECKIN = "-ci";
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_ELTYPE = "-eltype";
    public static final String FLAG_MASTER = "-master";
    public static final String FLAG_NOCHECKOUT = "-nco";
    public static final String FLAG_NOCOMMENT = "-nc";
    public static final String FLAG_NOWARN = "-nwarn";
    public static final String FLAG_PRESERVETIME = "-ptime";
    private String mComment = null;
    private String mCfile = null;
    private boolean mNwarn = false;
    private boolean mPtime = false;
    private boolean mNoco = false;
    private boolean mCheckin = false;
    private boolean mMaster = false;
    private String mEltype = null;

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
        if (!getNoCheckout() || !getCheckin()) {
            if (getNoCheckout()) {
                commandline.createArgument().setValue("-nco");
            }
            if (getCheckin()) {
                commandline.createArgument().setValue(FLAG_CHECKIN);
                if (getPreserveTime()) {
                    commandline.createArgument().setValue("-ptime");
                }
            }
            if (getMaster()) {
                commandline.createArgument().setValue(FLAG_MASTER);
            }
            if (getEltype() != null) {
                getEltypeCommand(commandline);
            }
            commandline.createArgument().setValue(getViewPath());
            return;
        }
        throw new BuildException("Should choose either [nocheckout | checkin]");
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

    private void getEltypeCommand(Commandline commandline) {
        if (getEltype() != null) {
            commandline.createArgument().setValue(FLAG_ELTYPE);
            commandline.createArgument().setValue(getEltype());
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
        commandline.createArgument().setValue(ClearCase.COMMAND_MKELEM);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getViewPathBasename()).toString(), 3);
        }
        if (!Execute.isFailure(run(commandline)) || !getFailOnErr()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
    }

    public boolean getCheckin() {
        return this.mCheckin;
    }

    public String getComment() {
        return this.mComment;
    }

    public String getCommentFile() {
        return this.mCfile;
    }

    public String getEltype() {
        return this.mEltype;
    }

    public boolean getMaster() {
        return this.mMaster;
    }

    public boolean getNoCheckout() {
        return this.mNoco;
    }

    public boolean getNoWarn() {
        return this.mNwarn;
    }

    public boolean getPreserveTime() {
        return this.mPtime;
    }

    public void setCheckin(boolean z) {
        this.mCheckin = z;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setEltype(String str) {
        this.mEltype = str;
    }

    public void setMaster(boolean z) {
        this.mMaster = z;
    }

    public void setNoCheckout(boolean z) {
        this.mNoco = z;
    }

    public void setNoWarn(boolean z) {
        this.mNwarn = z;
    }

    public void setPreserveTime(boolean z) {
        this.mPtime = z;
    }
}
