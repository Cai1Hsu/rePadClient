package org.apache.tools.ant.taskdefs.optional.javah;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.optional.Javah;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/javah/Gcjh.class */
public class Gcjh implements JavahAdapter {
    public static final String IMPLEMENTATION_NAME = "gcjh";

    private Commandline setupGcjhCommand(Javah javah) {
        Commandline commandline = new Commandline();
        commandline.setExecutable(JavaEnvUtils.getJdkExecutable(IMPLEMENTATION_NAME));
        if (javah.getDestdir() != null) {
            commandline.createArgument().setValue("-d");
            commandline.createArgument().setFile(javah.getDestdir());
        }
        if (javah.getOutputfile() != null) {
            commandline.createArgument().setValue("-o");
            commandline.createArgument().setFile(javah.getOutputfile());
        }
        Path path = new Path(javah.getProject());
        if (javah.getBootclasspath() != null) {
            path.append(javah.getBootclasspath());
        }
        Path concatSystemBootClasspath = path.concatSystemBootClasspath(Definer.OnError.POLICY_IGNORE);
        if (javah.getClasspath() != null) {
            concatSystemBootClasspath.append(javah.getClasspath());
        }
        if (concatSystemBootClasspath.size() > 0) {
            commandline.createArgument().setValue("--classpath");
            commandline.createArgument().setPath(concatSystemBootClasspath);
        }
        if (!javah.getOld()) {
            commandline.createArgument().setValue("-jni");
        }
        commandline.addArguments(javah.getCurrentArgs());
        javah.logAndAddFiles(commandline);
        return commandline;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.javah.JavahAdapter
    public boolean compile(Javah javah) throws BuildException {
        boolean z;
        try {
            Execute.runCommand(javah, setupGcjhCommand(javah).getCommandline());
            z = true;
        } catch (BuildException e) {
            if (e.getMessage().indexOf("failed with return code") == -1) {
                throw e;
            }
            z = false;
        }
        return z;
    }
}
