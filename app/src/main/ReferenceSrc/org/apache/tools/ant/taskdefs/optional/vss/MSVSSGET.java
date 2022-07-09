package org.apache.tools.ant.taskdefs.optional.vss;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSS;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSSGET.class */
public class MSVSSGET extends MSVSS {
    @Override // org.apache.tools.ant.taskdefs.optional.vss.MSVSS
    Commandline buildCmdLine() {
        Commandline commandline = new Commandline();
        commandline.setExecutable(getSSCommand());
        commandline.createArgument().setValue(MSVSSConstants.COMMAND_GET);
        if (getVsspath() == null) {
            throw new BuildException("vsspath attribute must be set!", getLocation());
        }
        commandline.createArgument().setValue(getVsspath());
        commandline.createArgument().setValue(getLocalpath());
        commandline.createArgument().setValue(getAutoresponse());
        commandline.createArgument().setValue(getQuiet());
        commandline.createArgument().setValue(getRecursive());
        commandline.createArgument().setValue(getVersionDateLabel());
        commandline.createArgument().setValue(getWritable());
        commandline.createArgument().setValue(getLogin());
        commandline.createArgument().setValue(getFileTimeStamp());
        commandline.createArgument().setValue(getWritableFiles());
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

    public void setLabel(String str) {
        super.setInternalLabel(str);
    }

    public void setLocalpath(Path path) {
        super.setInternalLocalPath(path.toString());
    }

    public final void setQuiet(boolean z) {
        super.setInternalQuiet(z);
    }

    public final void setRecursive(boolean z) {
        super.setInternalRecursive(z);
    }

    public void setVersion(String str) {
        super.setInternalVersion(str);
    }

    public final void setWritable(boolean z) {
        super.setInternalWritable(z);
    }

    public void setWritableFiles(MSVSS.WritableFiles writableFiles) {
        super.setInternalWritableFiles(writableFiles);
    }
}
