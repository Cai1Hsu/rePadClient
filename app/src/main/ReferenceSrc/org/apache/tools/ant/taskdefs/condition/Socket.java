package org.apache.tools.ant.taskdefs.condition;

import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Socket.class */
public class Socket extends ProjectComponent implements Condition {
    private String server = null;
    private int port = 0;

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        if (this.server == null) {
            throw new BuildException("No server specified in socket condition");
        }
        if (this.port == 0) {
            throw new BuildException("No port specified in socket condition");
        }
        log(new StringBuffer().append("Checking for listener at ").append(this.server).append(":").append(this.port).toString(), 3);
        try {
            java.net.Socket socket = new java.net.Socket(this.server, this.port);
            if (socket != null) {
                try {
                    socket.close();
                } catch (IOException e) {
                }
            }
            z = true;
        } catch (IOException e2) {
            z = false;
            if (0 != 0) {
                try {
                    throw new NullPointerException();
                } catch (IOException e3) {
                    z = false;
                }
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    throw new NullPointerException();
                } catch (IOException e4) {
                    throw th;
                }
            }
            throw th;
        }
        return z;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setServer(String str) {
        this.server = str;
    }
}
