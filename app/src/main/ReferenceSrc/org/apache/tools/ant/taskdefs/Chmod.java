package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.PatternSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Chmod.class */
public class Chmod extends ExecuteOn {
    private FileSet defaultSet = new FileSet();
    private boolean defaultSetDefined = false;
    private boolean havePerm = false;

    public Chmod() {
        super.setExecutable("chmod");
        super.setParallel(true);
        super.setSkipEmptyFilesets(true);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn, org.apache.tools.ant.taskdefs.ExecTask
    protected void checkConfiguration() {
        if (!this.havePerm) {
            throw new BuildException("Required attribute perm not set in chmod", getLocation());
        }
        if (this.defaultSetDefined && this.defaultSet.getDir(getProject()) != null) {
            addFileset(this.defaultSet);
        }
        super.checkConfiguration();
    }

    public PatternSet.NameEntry createExclude() {
        this.defaultSetDefined = true;
        return this.defaultSet.createExclude();
    }

    public PatternSet.NameEntry createInclude() {
        this.defaultSetDefined = true;
        return this.defaultSet.createInclude();
    }

    public PatternSet createPatternSet() {
        this.defaultSetDefined = true;
        return this.defaultSet.createPatternSet();
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[IGET]}, finally: {[IGET, IGET, IGET, INVOKE, IF, IGET, INVOKE, INVOKE, IF] complete} */
    @Override // org.apache.tools.ant.taskdefs.ExecTask, org.apache.tools.ant.Task
    public void execute() throws BuildException {
        boolean z;
        if (this.defaultSetDefined || this.defaultSet.getDir(getProject()) == null) {
            try {
                super.execute();
                if (!z) {
                    return;
                }
            } finally {
                if (this.defaultSetDefined && this.defaultSet.getDir(getProject()) != null) {
                    this.filesets.removeElement(this.defaultSet);
                }
            }
        } else if (!isValidOs()) {
        } else {
            Execute prepareExec = prepareExec();
            Commandline commandline = (Commandline) this.cmdl.clone();
            commandline.createArgument().setValue(this.defaultSet.getDir(getProject()).getPath());
            try {
                try {
                    prepareExec.setCommandline(commandline.getCommandline());
                    runExecute(prepareExec);
                } catch (IOException e) {
                    throw new BuildException(new StringBuffer().append("Execute failed: ").append(e).toString(), e, getLocation());
                }
            } finally {
                logFlush();
            }
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    protected boolean isValidOs() {
        return (getOs() == null && getOsFamily() == null) ? Os.isFamily(Os.FAMILY_UNIX) : super.isValidOs();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setAddsourcefile(boolean z) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the addsourcefile attribute").toString(), getLocation());
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setCommand(Commandline commandline) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the command attribute").toString(), getLocation());
    }

    public void setDefaultexcludes(boolean z) {
        this.defaultSetDefined = true;
        this.defaultSet.setDefaultexcludes(z);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setDir(File file) {
        this.defaultSet.setDir(file);
    }

    public void setExcludes(String str) {
        this.defaultSetDefined = true;
        this.defaultSet.setExcludes(str);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setExecutable(String str) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the executable attribute").toString(), getLocation());
    }

    public void setFile(File file) {
        FileSet fileSet = new FileSet();
        fileSet.setFile(file);
        addFileset(fileSet);
    }

    public void setIncludes(String str) {
        this.defaultSetDefined = true;
        this.defaultSet.setIncludes(str);
    }

    public void setPerm(String str) {
        createArg().setValue(str);
        this.havePerm = true;
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public void setProject(Project project) {
        super.setProject(project);
        this.defaultSet.setProject(project);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setSkipEmptyFilesets(boolean z) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the skipemptyfileset attribute").toString(), getLocation());
    }
}
