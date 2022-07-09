package org.apache.tools.ant.taskdefs.optional.clearcase;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/clearcase/CCUnCheckout.class */
public class CCUnCheckout extends ClearCase {
    public static final String FLAG_KEEPCOPY = "-keep";
    public static final String FLAG_RM = "-rm";
    private boolean mKeep = false;

    private void checkOptions(Commandline commandline) {
        if (getKeepCopy()) {
            commandline.createArgument().setValue("-keep");
        } else {
            commandline.createArgument().setValue(FLAG_RM);
        }
        commandline.createArgument().setValue(getViewPath());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline commandline = new Commandline();
        Project project = getProject();
        if (getViewPath() == null) {
            setViewPath(project.getBaseDir().getPath());
        }
        commandline.setExecutable(getClearToolCommand());
        commandline.createArgument().setValue(ClearCase.COMMAND_UNCHECKOUT);
        checkOptions(commandline);
        if (!getFailOnErr()) {
            getProject().log(new StringBuffer().append("Ignoring any errors that occur for: ").append(getViewPathBasename()).toString(), 3);
        }
        if (!Execute.isFailure(run(commandline)) || !getFailOnErr()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
    }

    public boolean getKeepCopy() {
        return this.mKeep;
    }

    public void setKeepCopy(boolean z) {
        this.mKeep = z;
    }
}
