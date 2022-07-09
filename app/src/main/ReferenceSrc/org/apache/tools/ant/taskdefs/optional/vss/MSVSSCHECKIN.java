package org.apache.tools.ant.taskdefs.optional.vss;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKIN.class */
public class MSVSSCHECKIN extends MSVSS {
    @Override // org.apache.tools.ant.taskdefs.optional.vss.MSVSS
    protected Commandline buildCmdLine() {
        Commandline commandline = new Commandline();
        if (getVsspath() == null) {
            throw new BuildException("vsspath attribute must be set!", getLocation());
        }
        commandline.setExecutable(getSSCommand());
        commandline.createArgument().setValue(MSVSSConstants.COMMAND_CHECKIN);
        commandline.createArgument().setValue(getVsspath());
        commandline.createArgument().setValue(getLocalpath());
        commandline.createArgument().setValue(getAutoresponse());
        commandline.createArgument().setValue(getRecursive());
        commandline.createArgument().setValue(getWritable());
        commandline.createArgument().setValue(getLogin());
        commandline.createArgument().setValue(getComment());
        return commandline;
    }

    public void setAutoresponse(String str) {
        super.setInternalAutoResponse(str);
    }

    public void setComment(String str) {
        super.setInternalComment(str);
    }

    public void setLocalpath(Path path) {
        super.setInternalLocalPath(path.toString());
    }

    public void setRecursive(boolean z) {
        super.setInternalRecursive(z);
    }

    public final void setWritable(boolean z) {
        super.setInternalWritable(z);
    }
}
