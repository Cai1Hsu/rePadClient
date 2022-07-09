package org.apache.tools.ant.taskdefs;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.BuildLogger;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.SubBuildListener;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/RecorderEntry.class */
public class RecorderEntry implements BuildLogger, SubBuildListener {
    private String filename;
    private Project project;
    private long targetStartTime;
    private boolean record = true;
    private int loglevel = 2;
    private PrintStream out = null;
    private boolean emacsMode = false;

    protected RecorderEntry(String str) {
        this.filename = null;
        this.targetStartTime = 0L;
        this.targetStartTime = System.currentTimeMillis();
        this.filename = str;
    }

    private void flush() {
        if (!this.record || this.out == null) {
            return;
        }
        this.out.flush();
    }

    private static String formatTime(long j) {
        String stringBuffer;
        long j2 = j / 1000;
        long j3 = j2 / 60;
        if (j3 > 0) {
            stringBuffer = new StringBuffer().append(Long.toString(j3)).append(" minute").append(j3 == 1 ? " " : "s ").append(Long.toString(j2 % 60)).append(" second").append(j2 % 60 == 1 ? "" : "s").toString();
        } else {
            stringBuffer = new StringBuffer().append(Long.toString(j2)).append(" second").append(j2 % 60 == 1 ? "" : "s").toString();
        }
        return stringBuffer;
    }

    private void log(String str, int i) {
        if (!this.record || i > this.loglevel || this.out == null) {
            return;
        }
        this.out.println(str);
    }

    private void openFileImpl(boolean z) throws BuildException {
        if (this.out == null) {
            try {
                this.out = new PrintStream(new FileOutputStream(this.filename, z));
            } catch (IOException e) {
                throw new BuildException("Problems opening file using a recorder entry", e);
            }
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        log("< BUILD FINISHED", 4);
        if (this.record && this.out != null) {
            Throwable exception = buildEvent.getException();
            if (exception == null) {
                this.out.println(new StringBuffer().append(StringUtils.LINE_SEP).append("BUILD SUCCESSFUL").toString());
            } else {
                this.out.println(new StringBuffer().append(StringUtils.LINE_SEP).append("BUILD FAILED").append(StringUtils.LINE_SEP).toString());
                exception.printStackTrace(this.out);
            }
        }
        cleanup();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
        log("> BUILD STARTED", 4);
    }

    public void cleanup() {
        closeFile();
        if (this.project != null) {
            this.project.removeBuildListener(this);
        }
        this.project = null;
    }

    void closeFile() {
        if (this.out != null) {
            this.out.close();
            this.out = null;
        }
    }

    public String getFilename() {
        return this.filename;
    }

    public Project getProject() {
        return this.project;
    }

    @Override // org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
        log("--- MESSAGE LOGGED", 4);
        StringBuffer stringBuffer = new StringBuffer();
        if (buildEvent.getTask() != null) {
            String taskName = buildEvent.getTask().getTaskName();
            if (!this.emacsMode) {
                String stringBuffer2 = new StringBuffer().append("[").append(taskName).append("] ").toString();
                int length = stringBuffer2.length();
                for (int i = 0; i < 12 - length; i++) {
                    stringBuffer.append(" ");
                }
                stringBuffer.append(stringBuffer2);
            }
        }
        stringBuffer.append(buildEvent.getMessage());
        log(stringBuffer.toString(), buildEvent.getPriority());
    }

    void openFile(boolean z) throws BuildException {
        openFileImpl(z);
    }

    void reopenFile() throws BuildException {
        openFileImpl(true);
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setEmacsMode(boolean z) {
        this.emacsMode = z;
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setErrorPrintStream(PrintStream printStream) {
        setOutputPrintStream(printStream);
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setMessageOutputLevel(int i) {
        if (i < 0 || i > 4) {
            return;
        }
        this.loglevel = i;
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setOutputPrintStream(PrintStream printStream) {
        closeFile();
        this.out = printStream;
    }

    public void setProject(Project project) {
        this.project = project;
        if (project != null) {
            project.addBuildListener(this);
        }
    }

    public void setRecordState(Boolean bool) {
        if (bool != null) {
            flush();
            this.record = bool.booleanValue();
        }
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildFinished(BuildEvent buildEvent) {
        if (buildEvent.getProject() == this.project) {
            cleanup();
        }
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
        log(new StringBuffer().append("<< TARGET FINISHED -- ").append(buildEvent.getTarget()).toString(), 4);
        log(new StringBuffer().append(buildEvent.getTarget()).append(":  duration ").append(formatTime(System.currentTimeMillis() - this.targetStartTime)).toString(), 3);
        flush();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        log(new StringBuffer().append(">> TARGET STARTED -- ").append(buildEvent.getTarget()).toString(), 4);
        log(new StringBuffer().append(StringUtils.LINE_SEP).append(buildEvent.getTarget().getName()).append(":").toString(), 2);
        this.targetStartTime = System.currentTimeMillis();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
        log(new StringBuffer().append("<<< TASK FINISHED -- ").append(buildEvent.getTask()).toString(), 4);
        flush();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
        log(new StringBuffer().append(">>> TASK STARTED -- ").append(buildEvent.getTask()).toString(), 4);
    }
}
