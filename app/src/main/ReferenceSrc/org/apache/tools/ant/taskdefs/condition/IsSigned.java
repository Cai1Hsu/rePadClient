package org.apache.tools.ant.taskdefs.condition;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.ManifestTask;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsSigned.class */
public class IsSigned extends DataType implements Condition {
    private static final int SHORT_SIG_LIMIT = 8;
    private static final String SIG_END = ".SF";
    private static final String SIG_START = "META-INF/";
    private File file;
    private String name;

    /* JADX WARN: Code restructure failed: missing block: B:30:0x00c9, code lost:
        if (r13 != false) goto L31;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean isSigned(File file, String str) throws IOException {
        ZipFile zipFile;
        Throwable th;
        ZipFile zipFile2;
        boolean z = false;
        try {
            zipFile2 = new ZipFile(file);
        } catch (Throwable th2) {
            th = th2;
            zipFile = null;
        }
        try {
            if (str == null) {
                Enumeration entries = zipFile2.getEntries();
                while (true) {
                    if (!entries.hasMoreElements()) {
                        ZipFile.closeQuietly(zipFile2);
                        break;
                    }
                    String name = ((ZipEntry) entries.nextElement()).getName();
                    if (name.startsWith(SIG_START) && name.endsWith(SIG_END)) {
                        ZipFile.closeQuietly(zipFile2);
                        z = true;
                        break;
                    }
                }
            } else {
                String replaceInvalidChars = replaceInvalidChars(str);
                boolean z2 = zipFile2.getEntry(new StringBuffer().append(SIG_START).append(replaceInvalidChars.toUpperCase()).append(SIG_END).toString()) != null;
                boolean z3 = false;
                if (replaceInvalidChars.length() > 8) {
                    z3 = zipFile2.getEntry(new StringBuffer().append(SIG_START).append(replaceInvalidChars.substring(0, 8).toUpperCase()).append(SIG_END).toString()) != null;
                }
                if (!z2) {
                    z = false;
                }
                z = true;
                ZipFile.closeQuietly(zipFile2);
            }
            return z;
        } catch (Throwable th3) {
            th = th3;
            zipFile = zipFile2;
            ZipFile.closeQuietly(zipFile);
            throw th;
        }
    }

    private static String replaceInvalidChars(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        int length = str.length();
        boolean z = false;
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (ManifestTask.VALID_ATTRIBUTE_CHARS.indexOf(charAt) < 0) {
                stringBuffer.append("_");
                z = true;
            } else {
                stringBuffer.append(charAt);
            }
        }
        if (z) {
            str = stringBuffer.toString();
        }
        return str;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        boolean z;
        if (this.file == null) {
            throw new BuildException("The file attribute must be set.");
        }
        if (!this.file.exists()) {
            log(new StringBuffer().append("The file \"").append(this.file.getAbsolutePath()).append("\" does not exist.").toString(), 3);
            z = false;
        } else {
            boolean z2 = false;
            try {
                z2 = isSigned(this.file, this.name);
            } catch (IOException e) {
                log(new StringBuffer().append("Got IOException reading file \"").append(this.file.getAbsolutePath()).append("\"").append(e).toString(), 1);
            }
            z = z2;
            if (z2) {
                log(new StringBuffer().append("File \"").append(this.file.getAbsolutePath()).append("\" is signed.").toString(), 3);
                z = z2;
            }
        }
        return z;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setName(String str) {
        this.name = str;
    }
}
