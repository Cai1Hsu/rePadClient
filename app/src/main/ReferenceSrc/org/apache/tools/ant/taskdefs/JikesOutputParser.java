package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/JikesOutputParser.class */
public class JikesOutputParser implements ExecuteStreamHandler {
    protected BufferedReader br;
    protected boolean emacsMode;
    protected int errors;
    protected Task task;
    protected int warnings;
    protected boolean errorFlag = false;
    protected boolean error = false;

    protected JikesOutputParser(Task task, boolean z) {
        System.err.println("As of Ant 1.2 released in October 2000, the JikesOutputParser class");
        System.err.println("is considered to be dead code by the Ant developers and is unmaintained.");
        System.err.println("Don't use it!");
        this.task = task;
        this.emacsMode = z;
    }

    private void log(String str) {
        if (!this.emacsMode) {
            this.task.log("", this.error ? 0 : 1);
        }
        this.task.log(str, this.error ? 0 : 1);
    }

    private void parseEmacsOutput(BufferedReader bufferedReader) throws IOException {
        parseStandardOutput(bufferedReader);
    }

    private void parseStandardOutput(BufferedReader bufferedReader) throws IOException {
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine != null) {
                String lowerCase = readLine.toLowerCase();
                if (!readLine.trim().equals("")) {
                    if (lowerCase.indexOf("error") != -1) {
                        setError(true);
                    } else if (lowerCase.indexOf("warning") != -1) {
                        setError(false);
                    } else if (this.emacsMode) {
                        setError(true);
                    }
                    log(readLine);
                }
            } else {
                return;
            }
        }
    }

    private void setError(boolean z) {
        this.error = z;
        if (this.error) {
            this.errorFlag = true;
        }
    }

    protected boolean getErrorFlag() {
        return this.errorFlag;
    }

    protected void parseOutput(BufferedReader bufferedReader) throws IOException {
        if (this.emacsMode) {
            parseEmacsOutput(bufferedReader);
        } else {
            parseStandardOutput(bufferedReader);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessErrorStream(InputStream inputStream) {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessInputStream(OutputStream outputStream) {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessOutputStream(InputStream inputStream) throws IOException {
        this.br = new BufferedReader(new InputStreamReader(inputStream));
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void start() throws IOException {
        parseOutput(this.br);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void stop() {
    }
}
