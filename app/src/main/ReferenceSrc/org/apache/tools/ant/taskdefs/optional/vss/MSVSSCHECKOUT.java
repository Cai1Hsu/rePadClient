package org.apache.tools.ant.taskdefs.optional.vss;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSS;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSSCHECKOUT.class */
public class MSVSSCHECKOUT extends MSVSS {
    @Override // org.apache.tools.ant.taskdefs.optional.vss.MSVSS
    protected Commandline buildCmdLine() {
        Commandline commandline = new Commandline();
        if (getVsspath() == null) {
            throw new BuildException("vsspath attribute must be set!", getLocation());
        }
        commandline.setExecutable(getSSCommand());
        commandline.createArgument().setValue(MSVSSConstants.COMMAND_CHECKOUT);
        commandline.createArgument().setValue(getVsspath());
        commandline.createArgument().setValue(getLocalpath());
        commandline.createArgument().setValue(getAutoresponse());
        commandline.createArgument().setValue(getRecursive());
        commandline.createArgument().setValue(getVersionDateLabel());
        commandline.createArgument().setValue(getLogin());
        commandline.createArgument().setValue(getFileTimeStamp());
        commandline.createArgument().setValue(getWritableFiles());
        commandline.createArgument().setValue(getGetLocalCopy());
        return commandline;
    }

    public void setAutoresponse(String str) {
        super.setInternalAutoResponse(str);
    }

    public void setDate(String str) {
        super.setInternalDate(str);
    }

    public void setFileTimeStamp(MSVSS.CurrentModUpdated currentModUpdated) {
        super.setInternalFileTimeStamp(currentModUpdated);
    }

    public void setGetLocalCopy(boolean z) {
        super.setInternalGetLocalCopy(z);
    }

    public void setLabel(String str) {
        super.setInternalLabel(str);
    }

    public void setLocalpath(Path path) {
        super.setInternalLocalPath(path.toString());
    }

    public void setRecursive(boolean z) {
        super.setInternalRecursive(z);
    }

    public void setVersion(String str) {
        super.setInternalVersion(str);
    }

    public void setWritableFiles(MSVSS.WritableFiles writableFiles) {
        super.setInternalWritableFiles(writableFiles);
    }
}
