package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCUnlock.class */
public class CCUnlock extends ClearCase {
    public static final String FLAG_COMMENT = "-comment";
    public static final String FLAG_PNAME = "-pname";
    private String mComment = null;
    private String mPname = null;

    private void checkOptions(Commandline commandline) {
        getCommentCommand(commandline);
        if (getObjSelect() == null && getPname() == null) {
            throw new BuildException("Should select either an element (pname) or an object (objselect)");
        }
        getPnameCommand(commandline);
        if (getObjSelect() == null) {
            return;
        }
        commandline.createArgument().setValue(getObjSelect());
    }

    private void getCommentCommand(Commandline commandline) {
        if (getComment() == null) {
            return;
        }
        commandline.createArgument().setValue("-comment");
        commandline.createArgument().setValue(getComment());
    }

    private String getOpType() {
        return getPname() != null ? getPname() : getObjSelect();
    }

    private void getPnameCommand(Commandline commandline) {
        if (getPname() == null) {
            return;
        }
        commandline.createArgument().setValue("-pname");
        commandline.createArgument().setValue(getPname());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        Project project = getProject();
        if (getViewPath() == null) {
            setViewPath(project.getBaseDir().getPath());
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_UNLOCK);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getOpType()).toString(), 3);
        }
        if (!Execute.isFailure(run(commandline)) || !getFailOnErr()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
    }

    public String getComment() {
        return this.mComment;
    }

    public String getObjselect() {
        return getObjSelect();
    }

    public String getPname() {
        return this.mPname;
    }

    public void setComment(String str) {
        this.mComment = str;
    }

    public void setObjSel(String str) {
        setObjSelect(str);
    }

    public void setObjselect(String str) {
        setObjSelect(str);
    }

    public void setPname(String str) {
        this.mPname = str;
    }
}
