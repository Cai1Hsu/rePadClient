package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Locale;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Os;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Exec.class */
public class Exec extends Task {
    private String command;
    private File dir;
    private String os;
    private String out;
    protected PrintWriter fos = null;
    private boolean failOnError = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Exec$StreamPumper.class */
    class StreamPumper extends Thread {
        private static final int SLEEP_TIME = 5;
        private BufferedReader din;
        private boolean endOfStream = false;
        private int messageLevel;
        private final Exec this$0;

        public StreamPumper(Exec exec, InputStream inputStream, int i) {
            this.this$0 = exec;
            this.din = new BufferedReader(new InputStreamReader(inputStream));
            this.messageLevel = i;
        }

        public void pumpStream() throws IOException {
            if (!this.endOfStream) {
                String readLine = this.din.readLine();
                if (readLine != null) {
                    this.this$0.outputLog(readLine, this.messageLevel);
                } else {
                    this.endOfStream = true;
                }
            }
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (!this.endOfStream) {
                try {
                    try {
                        pumpStream();
                        sleep(5L);
                    } catch (InterruptedException e) {
                    }
                } catch (IOException e2) {
                    return;
                }
            }
            this.din.close();
        }
    }

    public Exec() {
        System.err.println("As of Ant 1.2 released in October 2000, the Exec class");
        System.err.println("is considered to be dead code by the Ant developers and is unmaintained.");
        System.err.println("Don't use it!");
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        run(this.command);
    }

    protected void logFlush() {
        if (this.fos != null) {
            this.fos.close();
        }
    }

    protected void outputLog(String str, int i) {
        if (this.fos == null) {
            log(str, i);
        } else {
            this.fos.println(str);
        }
    }

    protected int run(String str) throws BuildException {
        String stringBuffer;
        int i = 0;
        String property = System.getProperty("os.name");
        log(new StringBuffer().append("Myos = ").append(property).toString(), 3);
        if (this.os == null || this.os.indexOf(property) >= 0) {
            if (this.dir == null) {
                this.dir = getProject().getBaseDir();
            }
            if (property.toLowerCase(Locale.ENGLISH).indexOf(Os.FAMILY_WINDOWS) >= 0) {
                stringBuffer = str;
                if (!this.dir.equals(getProject().resolveFile("."))) {
                    if (property.toLowerCase(Locale.ENGLISH).indexOf("nt") >= 0) {
                        stringBuffer = new StringBuffer().append("cmd /c cd ").append(this.dir).append(" && ").append(str).toString();
                    } else {
                        String property2 = getProject().getProperty(MagicNames.ANT_HOME);
                        if (property2 == null) {
                            throw new BuildException("Property 'ant.home' not found", getLocation());
                        }
                        stringBuffer = new StringBuffer().append(getProject().resolveFile(new StringBuffer().append(property2).append("/bin/antRun.bat").toString()).toString()).append(" ").append(this.dir).append(" ").append(str).toString();
                    }
                }
            } else {
                String property3 = getProject().getProperty(MagicNames.ANT_HOME);
                if (property3 == null) {
                    throw new BuildException("Property 'ant.home' not found", getLocation());
                }
                stringBuffer = new StringBuffer().append(getProject().resolveFile(new StringBuffer().append(property3).append("/bin/antRun").toString()).toString()).append(" ").append(this.dir).append(" ").append(str).toString();
            }
            i = -1;
            try {
                log(stringBuffer, 3);
                Process exec = Runtime.getRuntime().exec(stringBuffer);
                if (this.out != null) {
                    this.fos = new PrintWriter(new FileWriter(this.out));
                    log(new StringBuffer().append("Output redirected to ").append(this.out).toString(), 3);
                }
                StreamPumper streamPumper = new StreamPumper(this, exec.getInputStream(), 2);
                StreamPumper streamPumper2 = new StreamPumper(this, exec.getErrorStream(), 1);
                streamPumper.start();
                streamPumper2.start();
                exec.waitFor();
                streamPumper.join();
                streamPumper2.join();
                exec.destroy();
                logFlush();
                int exitValue = exec.exitValue();
                i = exitValue;
                if (exitValue != 0) {
                    if (this.failOnError) {
                        throw new BuildException(new StringBuffer().append("Exec returned: ").append(exitValue).toString(), getLocation());
                    }
                    log(new StringBuffer().append("Result: ").append(exitValue).toString(), 0);
                    i = exitValue;
                }
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("Error exec: ").append(stringBuffer).toString(), e, getLocation());
            } catch (InterruptedException e2) {
            }
        } else {
            log(new StringBuffer().append("Not found in ").append(this.os).toString(), 3);
        }
        return i;
    }

    public void setCommand(String str) {
        this.command = str;
    }

    public void setDir(String str) {
        this.dir = getProject().resolveFile(str);
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public void setOs(String str) {
        this.os = str;
    }

    public void setOutput(String str) {
        this.out = str;
    }
}
