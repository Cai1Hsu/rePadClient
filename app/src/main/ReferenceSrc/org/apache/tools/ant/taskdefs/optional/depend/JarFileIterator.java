package org.apache.tools.ant.taskdefs.optional.depend;

import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/JarFileIterator.class */
public class JarFileIterator implements ClassFileIterator {
    private ZipInputStream jarStream;

    public JarFileIterator(InputStream inputStream) throws IOException {
        this.jarStream = new ZipInputStream(inputStream);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.ClassFileIterator
    public ClassFile getNextClassFile() {
        ClassFile classFile = null;
        try {
            ZipEntry nextEntry = this.jarStream.getNextEntry();
            while (classFile == null && nextEntry != null) {
                String name = nextEntry.getName();
                if (nextEntry.isDirectory() || !name.endsWith(".class")) {
                    nextEntry = this.jarStream.getNextEntry();
                } else {
                    classFile = new ClassFile();
                    classFile.read(this.jarStream);
                }
            }
            return classFile;
        } catch (IOException e) {
            String message = e.getMessage();
            String name2 = e.getClass().getName();
            String str = name2;
            if (message != null) {
                str = new StringBuffer().append(name2).append(": ").append(message).toString();
            }
            throw new RuntimeException(new StringBuffer().append("Problem reading JAR file: ").append(str).toString());
        }
    }
}
