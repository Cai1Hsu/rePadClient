package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCMkdir.class */
public class CCMkdir extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_NOCHECKOUT = "-nco";
    public static final String FLAG_NOCOMMENT = "-nc";
    private String mComment = null;
    private String mCfile = null;
    private boolean mNoco = false;

    private void checkOptions(Commandline commandline) {
        if (getComment() != null) {
            getCommentCommand(commandline);
        } else if (getCommentFile() != null) {
            getCommentFileCommand(commandline);
        } else {
            commandline.createArgument().setValue("-nc");
        }
        if (getNoCheckout()) {
            commandline.createArgument().setValue("-nco");
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
        commandline.createArgument().setValue(ClearCase.COMMAND_MKDIR);
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

    public boolean getNoCheckout() {
        return this.mNoco;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setNoCheckout(boolean z) {
        this.mNoco = z;
    }
}
