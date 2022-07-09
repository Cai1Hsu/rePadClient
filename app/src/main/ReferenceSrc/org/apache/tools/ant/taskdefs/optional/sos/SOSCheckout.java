package org.apache.tools.ant.taskdefs.optional.sos;

import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/sos/SOSCheckout.class */
public class SOSCheckout extends SOS {
    @Override // org.apache.tools.ant.taskdefs.optional.sos.SOS
    protected Commandline buildCmdLine() {
        this.commandLine = new Commandline();
        if (getFilename() != null) {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_COMMAND);
            this.commandLine.createArgument().setValue(SOSCmd.COMMAND_CHECKOUT_FILE);
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_FILE);
            this.commandLine.createArgument().setValue(getFilename());
        } else {
            this.commandLine.createArgument().setValue(SOSCmd.FLAG_COMMAND);
            this.commandLine.createArgument().setValue(SOSCmd.COMMAND_CHECKOUT_PROJECT);
            this.commandLine.createArgument().setValue(getRecursive());
        }
        getRequiredAttributes();
        getOptionalAttributes();
        return this.commandLine;
    }

    public final void setFile(String str) {
        super.setInternalFilename(str);
    }

    public void setRecursive(boolean z) {
        super.setInternalRecursive(z);
    }
}
