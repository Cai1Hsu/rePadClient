package org.apache.tools.ant.taskdefs.optional.vss;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSSCP.class */
public class MSVSSCP extends MSVSS {
    @Override // org.apache.tools.ant.taskdefs.optional.vss.MSVSS
    protected Commandline buildCmdLine() {
        Commandline commandline = new Commandline();
        if (getVsspath() == null) {
            throw new BuildException("vsspath attribute must be set!", getLocation());
        }
        commandline.setExecutable(getSSCommand());
        commandline.createArgument().setValue(MSVSSConstants.COMMAND_CP);
        commandline.createArgument().setValue(getVsspath());
        commandline.createArgument().setValue(getAutoresponse());
        commandline.createArgument().setValue(getLogin());
        return commandline;
    }

    public void setAutoresponse(String str) {
        super.setInternalAutoResponse(str);
    }
}
