package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/CVSPass.class */
public class CVSPass extends Task {
    private File passFile;
    private String cvsRoot = null;
    private String password = null;
    private final char[] shifts = {0, 1, 2, 3, 4, 5, 6, 7, '\b', '\t', '\n', 11, '\f', '\r', 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 'r', 'x', '5', 'O', '`', 'm', 'H', 'l', 'F', '@', 'L', 'C', 't', 'J', 'D', 'W', 'o', '4', 'K', 'w', '1', '\"', 'R', 'Q', '_', 'A', 'p', 'V', 'v', 'n', 'z', 'i', ')', '9', 'S', '+', '.', 'f', '(', 'Y', '&', 'g', '-', '2', '*', '{', '[', '#', '}', '7', '6', 'B', '|', '~', ';', '/', '\\', 'G', 's', 'N', 'X', 'k', 'j', '8', '$', 'y', 'u', 'h', 'e', 'd', 'E', 'I', 'c', '?', '^', ']', '\'', '%', '=', '0', ':', 'q', ' ', 'Z', ',', 'b', '<', '3', '!', 'a', '>', 'M', 'T', 'P', 'U', 223, 225, 216, 187, 166, 229, 189, 222, 188, 141, 249, 148, 200, 184, 136, 248, 190, 199, 170, 181, 204, 138, 232, 218, 183, 255, 234, 220, 247, 213, 203, 226, 193, 174, 172, 228, 252, 217, 201, 131, 230, 197, 211, 145, 238, 161, 179, 160, 212, 207, 221, 254, 173, 202, 146, 224, 151, 140, 196, 205, 130, 135, 133, 143, 246, 192, 159, 244, 239, 185, 168, 215, 144, 139, 165, 180, 157, 147, 186, 214, 176, 227, 231, 219, 169, 175, 156, 206, 198, 129, 164, 150, 210, 154, 177, 134, 127, 182, 128, 158, 208, 162, 132, 167, 209, 149, 241, 153, 251, 237, 236, 171, 195, 243, 233, 253, 240, 194, 250, 191, 155, 142, 137, 245, 235, 163, 242, 178, 152};

    public CVSPass() {
        this.passFile = null;
        this.passFile = new File(new StringBuffer().append(System.getProperty("cygwin.user.home", System.getProperty("user.home"))).append(File.separatorChar).append(".cvspass").toString());
    }

    private final String mangle(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            stringBuffer.append(this.shifts[str.charAt(i)]);
        }
        return stringBuffer.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:88:0x0154 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void execute() throws BuildException {
        BufferedWriter bufferedWriter;
        Throwable th;
        String stringBuffer;
        BufferedWriter bufferedWriter2;
        if (this.cvsRoot == null) {
            throw new BuildException("cvsroot is required");
        }
        if (this.password == null) {
            throw new BuildException("password is required");
        }
        log(new StringBuffer().append("cvsRoot: ").append(this.cvsRoot).toString(), 4);
        log(new StringBuffer().append("password: ").append(this.password).toString(), 4);
        log(new StringBuffer().append("passFile: ").append(this.passFile).toString(), 4);
        BufferedReader bufferedReader = null;
        BufferedWriter bufferedWriter3 = null;
        BufferedReader bufferedReader2 = null;
        try {
            try {
                StringBuffer stringBuffer2 = new StringBuffer();
                if (this.passFile.exists()) {
                    bufferedReader = new BufferedReader(new FileReader(this.passFile));
                    while (true) {
                        try {
                            String readLine = bufferedReader.readLine();
                            if (readLine == null) {
                                break;
                            } else if (!readLine.startsWith(this.cvsRoot)) {
                                stringBuffer2.append(readLine).append(StringUtils.LINE_SEP);
                            }
                        } catch (IOException e) {
                            e = e;
                            bufferedWriter = null;
                            BufferedReader bufferedReader3 = bufferedReader;
                            BufferedReader bufferedReader4 = bufferedReader;
                            throw new BuildException(e);
                        } catch (Throwable th2) {
                            th = th2;
                            bufferedWriter3 = null;
                            if (bufferedReader != null) {
                            }
                            FileUtils.close(bufferedWriter3);
                            throw th;
                        }
                    }
                }
                BufferedReader bufferedReader5 = bufferedReader;
                BufferedReader bufferedReader6 = bufferedReader;
                stringBuffer = new StringBuffer().append(stringBuffer2.toString()).append(this.cvsRoot).append(" A").append(mangle(this.password)).toString();
                BufferedReader bufferedReader7 = bufferedReader;
                BufferedReader bufferedReader8 = bufferedReader;
                BufferedReader bufferedReader9 = bufferedReader;
                log(new StringBuffer().append("Writing -> ").append(stringBuffer).toString(), 4);
                BufferedReader bufferedReader10 = bufferedReader;
                BufferedReader bufferedReader11 = bufferedReader;
                BufferedReader bufferedReader12 = bufferedReader;
                BufferedReader bufferedReader13 = bufferedReader;
                bufferedReader2 = bufferedReader;
                bufferedWriter2 = new BufferedWriter(new FileWriter(this.passFile));
            } catch (Throwable th3) {
                th = th3;
                bufferedReader = null;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedReader = bufferedReader2;
            bufferedWriter = null;
        }
        try {
            bufferedWriter2.write(stringBuffer);
            bufferedWriter2.newLine();
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e3) {
                }
            }
            FileUtils.close(bufferedWriter2);
        } catch (IOException e4) {
            bufferedWriter = bufferedWriter2;
            e = e4;
            BufferedReader bufferedReader32 = bufferedReader;
            BufferedReader bufferedReader42 = bufferedReader;
            throw new BuildException(e);
        } catch (Throwable th4) {
            th = th4;
            bufferedWriter3 = bufferedWriter2;
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException e5) {
                }
            }
            FileUtils.close(bufferedWriter3);
            throw th;
        }
    }

    public void setCvsroot(String str) {
        this.cvsRoot = str;
    }

    public void setPassfile(File file) {
        this.passFile = file;
    }

    public void setPassword(String str) {
        this.password = str;
    }
}
