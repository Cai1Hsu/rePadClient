package org.apache.tools.ant.taskdefs.optional.sos;

import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/sos/SOSCheckin.class */
public class SOSCheckin extends SOS {
    @Override // org.apache.tools.ant.taskdefs.optional.sos.SOS
    protected Commandline buildCmdLine() {
        this.commandLine = new Commandline();
        if (getFilename() != null) {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_COMMAND);
            this.commandLine.createArgument().setValue(SOSCmd.COMMAND_CHECKIN_FILE);
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_FILE);
            this.commandLine.createArgument().setValue(getFilename());
        } else {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_COMMAND);
            this.commandLine.createArgument().setValue(SOSCmd.COMMAND_CHECKIN_PROJECT);
            this.commandLine.createArgument().setValue(getRecursive());
        }
        getRequiredAttributes();
        getOptionalAttributes();
        if (getComment() != null) {
            this.commandLine.createArgument().setValue("-log");
            this.commandLine.createArgument().setValue(getComment());
        }
        return this.commandLine;
    }

    public void setComment(String str) {
        super.setInternalComment(str);
    }

    public final void setFile(String str) {
        super.setInternalFilename(str);
    }

    public void setRecursive(boolean z) {
        super.setInternalRecursive(z);
    }
}
