package org.apache.tools.ant.taskdefs.optional.sos;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/sos/SOSLabel.class */
public class SOSLabel extends SOS {
    @Override // org.apache.tools.ant.taskdefs.optional.sos.SOS
    protected Commandline buildCmdLine() {
        this.commandLine = new Commandline();
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_COMMAND);
        this.commandLine.createArgument().setValue(SOSCmd.COMMAND_LABEL);
        getRequiredAttributes();
        if (getLabel() == null) {
            throw new BuildException("label attribute must be set!", getLocation());
        }
        this.commandLine.createArgument().setValue(SOSCmd.FLAG_LABEL);
        this.commandLine.createArgument().setValue(getLabel());
        this.commandLine.createArgument().setValue(getVerbose());
        if (getComment() != null) {
            this.commandLine.createArgument().setValue("-log");
            this.commandLine.createArgument().setValue(getComment());
        }
        return this.commandLine;
    }

    public void setComment(String str) {
        super.setInternalComment(str);
    }

    public void setLabel(String str) {
        super.setInternalLabel(str);
    }

    public void setVersion(String str) {
        super.setInternalVersion(str);
    }
}
