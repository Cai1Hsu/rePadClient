package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.LogLevel;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.LogOutputResource;
import org.apache.tools.ant.types.resources.StringResource;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Echo.class */
public class Echo extends Task {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Resource output;
    protected String message = "";
    protected File file = null;
    protected boolean append = false;
    private String encoding = "";
    private boolean force = false;
    protected int logLevel = 1;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Echo$EchoLevel.class */
    public static class EchoLevel extends LogLevel {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void addText(String str) {
        this.message = new StringBuffer().append(this.message).append(getProject().replaceProperties(str)).toString();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        String str = null;
        try {
            StringResource stringResource = new StringResource("".equals(this.message) ? StringUtils.LINE_SEP : this.message);
            Resource logOutputResource = this.output == null ? new LogOutputResource(this, this.logLevel) : this.output;
            boolean z = this.append;
            if (!"".equals(this.encoding)) {
                str = this.encoding;
            }
            ResourceUtils.copyResource(stringResource, logOutputResource, null, null, false, false, z, null, str, getProject(), this.force);
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setFile(File file) {
        setOutput(new FileResource(getProject(), file));
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setLevel(EchoLevel echoLevel) {
        this.logLevel = echoLevel.getLevel();
    }

    public void setMessage(String str) {
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        this.message = str2;
    }

    public void setOutput(Resource resource) {
        Class cls;
        if (this.output != null) {
            throw new BuildException("Cannot set > 1 output target");
        }
        this.output = resource;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        this.file = fileProvider != null ? fileProvider.getFile() : null;
    }
}
