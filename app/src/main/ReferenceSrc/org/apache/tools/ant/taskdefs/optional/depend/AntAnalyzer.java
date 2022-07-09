package org.apache.tools.ant.taskdefs.optional.depend;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.depend.AbstractAnalyzer;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer.class */
public class AntAnalyzer extends AbstractAnalyzer {
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0225, code lost:
        r0 = r11.elements();
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0233, code lost:
        if (r0.hasMoreElements() == false) goto L112;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0236, code lost:
        r0 = (java.lang.String) r0.nextElement();
        r0.put(r0, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x024e, code lost:
        r6.removeAllElements();
        r0 = r0.keys();
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0260, code lost:
        if (r0.hasMoreElements() == false) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0263, code lost:
        r6.addElement((java.io.File) r0.nextElement());
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0274, code lost:
        r7.removeAllElements();
        r0 = r0.keys();
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0283, code lost:
        if (r0.hasMoreElements() == false) goto L114;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0286, code lost:
        r7.addElement((java.lang.String) r0.nextElement());
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0296, code lost:
        return;
     */
    @Override // org.apache.tools.ant.util.depend.AbstractAnalyzer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected void determineDependencies(Vector vector, Vector vector2) {
        Throwable th;
        FileInputStream fileInputStream;
        ZipFile zipFile;
        Hashtable hashtable = new Hashtable();
        Hashtable hashtable2 = new Hashtable();
        Hashtable hashtable3 = new Hashtable();
        Enumeration rootClasses = getRootClasses();
        while (rootClasses.hasMoreElements()) {
            String str = (String) rootClasses.nextElement();
            hashtable3.put(str, str);
        }
        int i = 0;
        int i2 = isClosureRequired() ? 1000 : 1;
        Hashtable hashtable4 = null;
        loop1: while (true) {
            Hashtable hashtable5 = hashtable4;
            if (hashtable3.size() == 0 || i >= i2) {
                break;
            }
            Hashtable hashtable6 = new Hashtable();
            Enumeration keys = hashtable3.keys();
            while (keys.hasMoreElements()) {
                String str2 = (String) keys.nextElement();
                hashtable.put(str2, str2);
                try {
                    File classContainer = getClassContainer(str2);
                    if (classContainer != null) {
                        hashtable2.put(classContainer, classContainer);
                        InputStream inputStream = null;
                        ZipFile zipFile2 = null;
                        try {
                            if (!classContainer.getName().endsWith(".class")) {
                                ZipFile zipFile3 = new ZipFile(classContainer.getPath());
                                try {
                                    zipFile = zipFile3;
                                    fileInputStream = zipFile3.getInputStream(new ZipEntry(new StringBuffer().append(str2.replace('.', '/')).append(".class").toString()));
                                } catch (Throwable th2) {
                                    zipFile2 = zipFile3;
                                    th = th2;
                                    FileUtils.close(inputStream);
                                    if (zipFile2 != null) {
                                        zipFile2.close();
                                    }
                                    throw th;
                                    break loop1;
                                }
                            } else {
                                fileInputStream = new FileInputStream(classContainer.getPath());
                                zipFile = null;
                            }
                            InputStream inputStream2 = fileInputStream;
                            ClassFile classFile = new ClassFile();
                            InputStream inputStream3 = fileInputStream;
                            classFile.read(fileInputStream);
                            InputStream inputStream4 = fileInputStream;
                            Enumeration elements = classFile.getClassRefs().elements();
                            while (true) {
                                InputStream inputStream5 = fileInputStream;
                                if (!elements.hasMoreElements()) {
                                    break;
                                }
                                InputStream inputStream6 = fileInputStream;
                                String str3 = (String) elements.nextElement();
                                InputStream inputStream7 = fileInputStream;
                                hashtable6.put(str3, str3);
                            }
                            FileUtils.close(fileInputStream);
                            if (zipFile != null) {
                                zipFile.close();
                            }
                        } catch (Throwable th3) {
                            th = th3;
                            inputStream = null;
                        }
                    } else {
                        continue;
                    }
                } catch (IOException e) {
                }
            }
            hashtable3.clear();
            Enumeration elements2 = hashtable6.elements();
            while (elements2.hasMoreElements()) {
                String str4 = (String) elements2.nextElement();
                if (!hashtable.containsKey(str4)) {
                    hashtable3.put(str4, str4);
                }
            }
            i++;
            hashtable4 = hashtable6;
        }
    }

    @Override // org.apache.tools.ant.util.depend.AbstractAnalyzer
    protected boolean supportsFileDependencies() {
        return true;
    }
}
