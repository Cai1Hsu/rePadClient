package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCRmtype.class */
public class CCRmtype extends ClearCase {
    public static final String FLAG_COMMENT = "-c";
    public static final String FLAG_COMMENTFILE = "-cfile";
    public static final String FLAG_FORCE = "-force";
    public static final String FLAG_IGNORE = "-ignore";
    public static final String FLAG_NOCOMMENT = "-nc";
    public static final String FLAG_RMALL = "-rmall";
    private String mTypeKind = null;
    private String mTypeName = null;
    private String mVOB = null;
    private String mComment = null;
    private String mCfile = null;
    private boolean mRmall = false;
    private boolean mIgnore = false;

    private void checkOptions(Commandline commandline) {
        if (getIgnore()) {
            commandline.createArgument().setValue(FLAG_IGNORE);
        }
        if (getRmAll()) {
            commandline.createArgument().setValue(FLAG_RMALL);
            commandline.createArgument().setValue(FLAG_FORCE);
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
        String typeKind = getTypeKind();
        String stringBuffer = new StringBuffer().append(typeKind).append(":").append(getTypeName()).toString();
        String str = stringBuffer;
        if (getVOB() != null) {
            str = new StringBuffer().append(stringBuffer).append("@").append(getVOB()).toString();
        }
        return str;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        if (getTypeKind() == null) {
            throw new BuildException("Required attribute TypeKind not specified");
        }
        if (getTypeName() == null) {
            throw new BuildException("Required attribute TypeName not specified");
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_RMTYPE);
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

    public boolean getIgnore() {
        return this.mIgnore;
    }

    public boolean getRmAll() {
        return this.mRmall;
    }

    public String getTypeKind() {
        return this.mTypeKind;
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

    public void setIgnore(boolean z) {
        this.mIgnore = z;
    }

    public void setRmAll(boolean z) {
        this.mRmall = z;
    }

    public void setTypeKind(String str) {
        this.mTypeKind = str;
    }

    public void setTypeName(String str) {
        this.mTypeName = str;
    }

    public void setVOB(String str) {
        this.mVOB = str;
    }
}
