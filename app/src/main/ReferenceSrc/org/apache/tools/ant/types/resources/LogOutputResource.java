package org.apache.tools.ant.types.resources;

import java.io.IOException;
import java.io.OutputStream;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/LogOutputResource.class */
public class LogOutputResource extends Resource implements Appendable {
    private static final String NAME = "[Ant log]";
    private LogOutputStream outputStream;

    public LogOutputResource(ProjectComponent projectComponent) {
        super(NAME);
        this.outputStream = new LogOutputStream(projectComponent);
    }

    public LogOutputResource(ProjectComponent projectComponent, int i) {
        super(NAME);
        this.outputStream = new LogOutputStream(projectComponent, i);
    }

    @Override // org.apache.tools.ant.types.resources.Appendable
    public OutputStream getAppendOutputStream() throws IOException {
        return this.outputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        return this.outputStream;
    }
}
