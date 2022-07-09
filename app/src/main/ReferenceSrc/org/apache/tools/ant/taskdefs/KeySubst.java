package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Hashtable;
import java.util.StringTokenizer;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/KeySubst.class */
public class KeySubst extends Task {
    private File source = null;
    private File dest = null;
    private String sep = "*";
    private Hashtable replacements = new Hashtable();

    public static void main(String[] strArr) {
        try {
            Hashtable hashtable = new Hashtable();
            hashtable.put("VERSION", "1.0.3");
            hashtable.put("b", "ffff");
            System.out.println(replace("$f ${VERSION} f ${b} jj $", hashtable));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String replace(String str, Hashtable hashtable) throws BuildException {
        StringBuffer stringBuffer = new StringBuffer();
        int i = 0;
        while (true) {
            int i2 = i;
            int indexOf = str.indexOf("${", i2);
            if (indexOf <= -1) {
                stringBuffer.append(str.substring(i2));
                return stringBuffer.toString();
            }
            String substring = str.substring(indexOf + 2, str.indexOf("}", indexOf + 3));
            stringBuffer.append(str.substring(i2, indexOf));
            if (hashtable.containsKey(substring)) {
                stringBuffer.append(hashtable.get(substring));
            } else {
                stringBuffer.append("${");
                stringBuffer.append(substring);
                stringBuffer.append("}");
            }
            i = indexOf + 3 + substring.length();
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        BufferedReader bufferedReader;
        Throwable th;
        log("!! KeySubst is deprecated. Use Filter + Copy instead. !!");
        log("Performing Substitutions");
        if (this.source == null || this.dest == null) {
            log("Source and destinations must not be null");
            return;
        }
        BufferedWriter bufferedWriter = null;
        BufferedReader bufferedReader2 = null;
        BufferedWriter bufferedWriter2 = null;
        try {
            try {
                bufferedReader = new BufferedReader(new FileReader(this.source));
                try {
                    this.dest.delete();
                    BufferedWriter bufferedWriter3 = new BufferedWriter(new FileWriter(this.dest));
                    try {
                        for (String readLine = bufferedReader.readLine(); readLine != null; readLine = bufferedReader.readLine()) {
                            if (readLine.length() == 0) {
                                bufferedWriter3.newLine();
                            } else {
                                bufferedWriter3.write(replace(readLine, this.replacements));
                                bufferedWriter3.newLine();
                            }
                        }
                        bufferedWriter3.flush();
                        FileUtils.close(bufferedWriter3);
                        FileUtils.close(bufferedReader);
                    } catch (IOException e) {
                        e = e;
                        bufferedWriter = bufferedWriter3;
                        bufferedReader2 = bufferedReader;
                        bufferedWriter2 = bufferedWriter;
                        e.printStackTrace();
                        FileUtils.close(bufferedWriter);
                        FileUtils.close(bufferedReader);
                    } catch (Throwable th2) {
                        bufferedWriter2 = bufferedWriter3;
                        bufferedReader2 = bufferedReader;
                        th = th2;
                        FileUtils.close(bufferedWriter2);
                        FileUtils.close(bufferedReader2);
                        throw th;
                    }
                } catch (IOException e2) {
                    e = e2;
                } catch (Throwable th3) {
                    bufferedReader2 = bufferedReader;
                    bufferedWriter2 = null;
                    th = th3;
                }
            } catch (IOException e3) {
                e = e3;
                bufferedReader = null;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    public void setDest(File file) {
        this.dest = file;
    }

    public void setKeys(String str) {
        if (str == null || str.length() <= 0) {
            return;
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, this.sep, false);
        while (stringTokenizer.hasMoreTokens()) {
            StringTokenizer stringTokenizer2 = new StringTokenizer(stringTokenizer.nextToken().trim(), "=", false);
            this.replacements.put(stringTokenizer2.nextToken(), stringTokenizer2.nextToken());
        }
    }

    public void setSep(String str) {
        this.sep = str;
    }

    public void setSrc(File file) {
        this.source = file;
    }
}
