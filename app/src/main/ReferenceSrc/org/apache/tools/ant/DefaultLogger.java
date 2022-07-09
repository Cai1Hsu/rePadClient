package org.apache.tools.ant;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.StringReader;
import java.text.DateFormat;
import java.util.Date;
import org.apache.tools.ant.util.DateUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/DefaultLogger.class */
public class DefaultLogger implements BuildLogger {
    public static final int LEFT_COLUMN_SIZE = 12;
    protected static final String lSep = StringUtils.LINE_SEP;
    protected PrintStream err;
    protected PrintStream out;
    protected int msgOutputLevel = 0;
    private long startTime = System.currentTimeMillis();
    protected boolean emacsMode = false;

    protected static String formatTime(long j) {
        return DateUtils.formatElapsedTime(j);
    }

    static void throwableMessage(StringBuffer stringBuffer, Throwable th, boolean z) {
        Throwable cause;
        while ((th instanceof BuildException) && (cause = th.getCause()) != null) {
            String th2 = th.toString();
            String th3 = cause.toString();
            if (!th2.endsWith(th3)) {
                break;
            }
            stringBuffer.append(th2.substring(0, th2.length() - th3.length()));
            th = cause;
        }
        if (z || !(th instanceof BuildException)) {
            stringBuffer.append(StringUtils.getStackTrace(th));
        } else {
            stringBuffer.append(th).append(lSep);
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        Throwable exception = buildEvent.getException();
        StringBuffer stringBuffer = new StringBuffer();
        if (exception == null) {
            stringBuffer.append(StringUtils.LINE_SEP);
            stringBuffer.append(getBuildSuccessfulMessage());
        } else {
            stringBuffer.append(StringUtils.LINE_SEP);
            stringBuffer.append(getBuildFailedMessage());
            stringBuffer.append(StringUtils.LINE_SEP);
            throwableMessage(stringBuffer, exception, 3 <= this.msgOutputLevel);
        }
        stringBuffer.append(StringUtils.LINE_SEP);
        stringBuffer.append("Total time: ");
        stringBuffer.append(formatTime(System.currentTimeMillis() - this.startTime));
        String stringBuffer2 = stringBuffer.toString();
        if (exception == null) {
            printMessage(stringBuffer2, this.out, 3);
        } else {
            printMessage(stringBuffer2, this.err, 0);
        }
        log(stringBuffer2);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
        this.startTime = System.currentTimeMillis();
    }

    protected String extractProjectName(BuildEvent buildEvent) {
        Project project = buildEvent.getProject();
        return project != null ? project.getName() : null;
    }

    protected String getBuildFailedMessage() {
        return "BUILD FAILED";
    }

    protected String getBuildSuccessfulMessage() {
        return "BUILD SUCCESSFUL";
    }

    protected String getTimestamp() {
        return DateFormat.getDateTimeInstance(3, 3).format(new Date(System.currentTimeMillis()));
    }

    protected void log(String str) {
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00c5, code lost:
        r0.append(r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0171  */
    @Override // org.apache.tools.ant.BuildListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void messageLogged(BuildEvent buildEvent) {
        Throwable exception;
        Throwable th;
        BufferedReader bufferedReader;
        int priority = buildEvent.getPriority();
        if (priority <= this.msgOutputLevel) {
            StringBuffer stringBuffer = new StringBuffer();
            if (buildEvent.getTask() == null || this.emacsMode) {
                stringBuffer.append(buildEvent.getMessage());
            } else {
                String stringBuffer2 = new StringBuffer().append("[").append(buildEvent.getTask().getTaskName()).append("] ").toString();
                int length = stringBuffer2.length();
                StringBuffer stringBuffer3 = new StringBuffer();
                for (int i = 0; i < 12 - length; i++) {
                    stringBuffer3.append(" ");
                }
                stringBuffer3.append(stringBuffer2);
                String stringBuffer4 = stringBuffer3.toString();
                BufferedReader bufferedReader2 = null;
                try {
                    try {
                        bufferedReader = new BufferedReader(new StringReader(buildEvent.getMessage()));
                    } catch (IOException e) {
                        bufferedReader = null;
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
                try {
                    String readLine = bufferedReader.readLine();
                    boolean z = true;
                    while (true) {
                        if (z) {
                            if (readLine == null) {
                                break;
                            }
                        } else {
                            stringBuffer.append(StringUtils.LINE_SEP);
                        }
                        z = false;
                        stringBuffer.append(stringBuffer4).append(readLine);
                        String readLine2 = bufferedReader.readLine();
                        readLine = readLine2;
                        if (readLine2 == null) {
                            break;
                        }
                    }
                    if (bufferedReader != null) {
                        FileUtils.close(bufferedReader);
                    }
                } catch (IOException e2) {
                    bufferedReader2 = bufferedReader;
                    stringBuffer.append(stringBuffer4).append(buildEvent.getMessage());
                    if (bufferedReader != null) {
                        FileUtils.close(bufferedReader);
                    }
                    exception = buildEvent.getException();
                    if (4 <= this.msgOutputLevel) {
                        stringBuffer.append(StringUtils.getStackTrace(exception));
                    }
                    String stringBuffer5 = stringBuffer.toString();
                    if (priority == 0) {
                    }
                    log(stringBuffer5);
                } catch (Throwable th3) {
                    th = th3;
                    bufferedReader2 = bufferedReader;
                    if (bufferedReader2 != null) {
                        FileUtils.close(bufferedReader2);
                    }
                    throw th;
                }
            }
            exception = buildEvent.getException();
            if (4 <= this.msgOutputLevel && exception != null) {
                stringBuffer.append(StringUtils.getStackTrace(exception));
            }
            String stringBuffer52 = stringBuffer.toString();
            if (priority == 0) {
                printMessage(stringBuffer52, this.out, priority);
            } else {
                printMessage(stringBuffer52, this.err, priority);
            }
            log(stringBuffer52);
        }
    }

    protected void printMessage(String str, PrintStream printStream, int i) {
        printStream.println(str);
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setEmacsMode(boolean z) {
        this.emacsMode = z;
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setErrorPrintStream(PrintStream printStream) {
        this.err = new PrintStream((OutputStream) printStream, true);
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setMessageOutputLevel(int i) {
        this.msgOutputLevel = i;
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setOutputPrintStream(PrintStream printStream) {
        this.out = new PrintStream((OutputStream) printStream, true);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        if (2 > this.msgOutputLevel || buildEvent.getTarget().getName().equals("")) {
            return;
        }
        String stringBuffer = new StringBuffer().append(StringUtils.LINE_SEP).append(buildEvent.getTarget().getName()).append(":").toString();
        printMessage(stringBuffer, this.out, buildEvent.getPriority());
        log(stringBuffer);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
    }
}
