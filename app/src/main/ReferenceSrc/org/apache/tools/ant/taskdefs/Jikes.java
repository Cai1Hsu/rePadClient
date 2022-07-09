package org.apache.tools.ant.taskdefs;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Locale;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Jikes.class */
public class Jikes {
    private static final int MAX_FILES_ON_COMMAND_LINE = 250;
    protected String command;
    protected JikesOutputParser jop;
    protected Project project;

    protected Jikes(JikesOutputParser jikesOutputParser, String str, Project project) {
        System.err.println("As of Ant 1.2 released in October 2000, the Jikes class");
        System.err.println("is considered to be dead code by the Ant developers and is unmaintained.");
        System.err.println("Don't use it!");
        this.jop = jikesOutputParser;
        this.command = str;
        this.project = project;
    }

    protected void compile(String[] strArr) {
        Throwable th;
        String[] strArr2;
        File file;
        Throwable th2;
        IOException e;
        BufferedWriter bufferedWriter;
        File file2 = null;
        File file3 = null;
        File file4 = null;
        try {
            if (System.getProperty("os.name").toLowerCase(Locale.ENGLISH).indexOf(Os.FAMILY_WINDOWS) < 0 || strArr.length <= 250) {
                strArr2 = new String[strArr.length + 1];
                strArr2[0] = this.command;
                System.arraycopy(strArr, 0, strArr2, 1, strArr.length);
                file = null;
            } else {
                BufferedWriter bufferedWriter2 = null;
                try {
                    try {
                        file4 = FileUtils.getFileUtils().createTempFile("jikes", "tmp", null, false, true);
                        file2 = file4;
                        BufferedWriter bufferedWriter3 = new BufferedWriter(new FileWriter(file4));
                        for (String str : strArr) {
                            try {
                                bufferedWriter3.write(str);
                                bufferedWriter3.newLine();
                            } catch (IOException e2) {
                                e = e2;
                                bufferedWriter = bufferedWriter3;
                                BufferedWriter bufferedWriter4 = bufferedWriter;
                                bufferedWriter2 = bufferedWriter;
                                file3 = file4;
                                throw new BuildException("Error creating temporary file", e);
                            } catch (Throwable th3) {
                                th2 = th3;
                                bufferedWriter2 = bufferedWriter3;
                                file3 = file4;
                                FileUtils.close(bufferedWriter2);
                                File file5 = file3;
                                throw th2;
                            }
                        }
                        bufferedWriter3.flush();
                        String str2 = this.command;
                        String stringBuffer = new StringBuffer().append("@").append(file4.getAbsolutePath()).toString();
                        try {
                            FileUtils.close(bufferedWriter3);
                            strArr2 = new String[]{str2, stringBuffer};
                            file = file4;
                        } catch (Throwable th4) {
                            th = th4;
                            if (file4 != null && !file4.delete()) {
                                file4.deleteOnExit();
                            }
                            throw th;
                        }
                    } catch (IOException e3) {
                        file4 = file2;
                        bufferedWriter = null;
                        e = e3;
                    }
                } catch (Throwable th5) {
                    th2 = th5;
                }
            }
            file4 = file;
            try {
                File file6 = file;
                Execute execute = new Execute(this.jop);
                File file7 = file;
                execute.setAntRun(this.project);
                File file8 = file;
                execute.setWorkingDirectory(this.project.getBaseDir());
                File file9 = file;
                execute.setCommandline(strArr2);
                file4 = file;
                execute.execute();
                if (file == null || file.delete()) {
                    return;
                }
                file.deleteOnExit();
            } catch (IOException e4) {
                File file10 = file;
                File file11 = file;
                throw new BuildException("Error running Jikes compiler", e4);
            }
        } catch (Throwable th6) {
            th = th6;
            if (file4 != null) {
                file4.deleteOnExit();
            }
            throw th;
        }
    }
}
