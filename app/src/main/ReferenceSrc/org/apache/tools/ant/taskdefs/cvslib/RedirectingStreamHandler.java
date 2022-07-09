package org.apache.tools.ant.taskdefs.cvslib;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import org.apache.http.protocol.HTTP;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.PumpStreamHandler;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler.class */
class RedirectingStreamHandler extends PumpStreamHandler {
    RedirectingStreamHandler(ChangeLogParser changeLogParser) {
        super(new RedirectingOutputStream(changeLogParser), new ByteArrayOutputStream());
    }

    String getErrors() {
        String str;
        try {
            str = ((ByteArrayOutputStream) getErr()).toString(HTTP.ASCII);
        } catch (Exception e) {
            str = null;
        }
        return str;
    }

    @Override // org.apache.tools.ant.taskdefs.PumpStreamHandler, org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void stop() {
        super.stop();
        try {
            getErr().close();
            getOut().close();
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }
}
