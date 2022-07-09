package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCMklabel.class */
public class CCMklabel extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_NOCOMMENT = "-nc";
    public static final String FLAG_RECURSE = "-recurse";
    public static final String FLAG_REPLACE = "-replace";
    public static final String FLAG_VERSION = "-version";
    private boolean mReplace = false;
    private boolean mRecurse = false;
    private String mVersion = null;
    private String mTypeName = null;
    private String mVOB = null;
    private String mComment = null;
    private String mCfile = null;

    private void checkOptions(Commandline commandline) {
        if (getReplace()) {
            commandline.createArgument().setValue("-replace");
        }
        if (getRecurse()) {
            commandline.createArgument().setValue("-recurse");
        }
        if (getVersion() != null) {
            getVersionCommand(commandline);
        }
        if (getComment() != null) {
            getCommentCommand(commandline);
        } else if (getCommentFile() != null) {
            getCommentFileCommand(commandline);
        } else {
            commandline.createArgument().setValue("-nc");
        }
        if (getTypeName() != null) {
            getTypeCommand(commandline);
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

    private void getTypeCommand(Commandline commandline) {
        if (getTypeName() != null) {
            String typeName = getTypeName();
            String str = typeName;
            if (getVOB() != null) {
                str = new StringBuffer().append(typeName).append("@").append(getVOB()).toString();
            }
            commandline.createArgument().setValue(str);
        }
    }

    private void getVersionCommand(Commandline commandline) {
        if (getVersion() != null) {
            commandline.createArgument().setValue("-version");
            commandline.createArgument().setValue(getVersion());
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        Project project = getProject();
        if (getTypeName() == null) {
            throw new BuildException("Required attribute TypeName not specified");
        }
        if (getViewPath() == null) {
            setViewPath(project.getBaseDir().getPath());
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_MKLABEL);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getViewPathBasename()).toString(), 3);
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

    public boolean getRecurse() {
        return this.mRecurse;
    }

    public boolean getReplace() {
        return this.mReplace;
    }

    public String getTypeName() {
        return this.mTypeName;
    }

    public String getVOB() {
        return this.mVOB;
    }

    public String getVersion() {
        return this.mVersion;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setCommentFile(String str) {
        this.mCfile = str;
    }

    public void setRecurse(boolean z) {
        this.mRecurse = z;
    }

    public void setReplace(boolean z) {
        this.mReplace = z;
    }

    public void setTypeName(String str) {
        this.mTypeName = str;
    }

    public void setVOB(String str) {
        this.mVOB = str;
    }

    public void setVersion(String str) {
        this.mVersion = str;
    }
}
