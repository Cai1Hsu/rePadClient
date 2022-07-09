package org.apache.tools.ant.taskdefs.optional.native2ascii;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.optional.Native2Ascii;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii.class */
public abstract class DefaultNative2Ascii implements Native2AsciiAdapter {
    protected void addFiles(Commandline commandline, ProjectComponent projectComponent, File file, File file2) throws BuildException {
        commandline.createArgument().setFile(file);
        commandline.createArgument().setFile(file2);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.native2ascii.Native2AsciiAdapter
    public final boolean convert(Native2Ascii native2Ascii, File file, File file2) throws BuildException {
        Commandline commandline = new Commandline();
        setup(commandline, native2Ascii);
        addFiles(commandline, native2Ascii, file, file2);
        return run(commandline, native2Ascii);
    }

    protected abstract boolean run(Commandline commandline, ProjectComponent projectComponent) throws BuildException;

    protected void setup(Commandline commandline, Native2Ascii native2Ascii) throws BuildException {
        if (native2Ascii.getEncoding() != null) {
            commandline.createArgument().setValue("-encoding");
            commandline.createArgument().setValue(native2Ascii.getEncoding());
        }
        commandline.addArguments(native2Ascii.getCurrentArgs());
    }
}
