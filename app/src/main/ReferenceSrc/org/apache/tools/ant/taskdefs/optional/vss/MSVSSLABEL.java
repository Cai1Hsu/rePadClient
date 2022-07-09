package org.apache.tools.ant.taskdefs.optional.vss;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSSLABEL.class */
public class MSVSSLABEL extends MSVSS {
    @Override // org.apache.tools.ant.taskdefs.optional.vss.MSVSS
    Commandline buildCmdLine() {
        Commandline commandline = new Commandline();
        if (getVsspath() == null) {
            throw new BuildException("vsspath attribute must be set!", getLocation());
        }
        String label = getLabel();
        if (label.equals("")) {
            throw new BuildException("label attribute must be set!", getLocation());
        }
        commandline.setExecutable(getSSCommand());
        commandline.createArgument().setValue(MSVSSConstants.COMMAND_LABEL);
        commandline.createArgument().setValue(getVsspath());
        commandline.createArgument().setValue(getComment());
        commandline.createArgument().setValue(getAutoresponse());
        commandline.createArgument().setValue(label);
        commandline.createArgument().setValue(getVersion());
        commandline.createArgument().setValue(getLogin());
        return commandline;
    }

    public void setAutoresponse(String str) {
        super.setInternalAutoResponse(str);
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
