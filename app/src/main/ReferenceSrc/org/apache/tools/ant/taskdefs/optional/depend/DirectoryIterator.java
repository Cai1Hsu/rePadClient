package org.apache.tools.ant.taskdefs.optional.depend;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Stack;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/DirectoryIterator.class */
public class DirectoryIterator implements ClassFileIterator {
    private Enumeration currentEnum;
    private Stack enumStack = new Stack();

    public DirectoryIterator(File file, boolean z) throws IOException {
        this.currentEnum = getDirectoryEntries(file).elements();
    }

    private Vector getDirectoryEntries(File file) {
        Vector vector = new Vector();
        String[] list = file.list();
        if (list != null) {
            for (String str : list) {
                vector.addElement(new File(file, str));
            }
        }
        return vector;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.ClassFileIterator
    public ClassFile getNextClassFile() {
        ClassFile classFile;
        ClassFile classFile2 = null;
        while (true) {
            classFile = classFile2;
            if (classFile2 != null) {
                break;
            }
            try {
                if (!this.currentEnum.hasMoreElements()) {
                    classFile = classFile2;
                    if (this.enumStack.empty()) {
                        break;
                    }
                    this.currentEnum = (Enumeration) this.enumStack.pop();
                } else {
                    File file = (File) this.currentEnum.nextElement();
                    if (file.isDirectory()) {
                        this.enumStack.push(this.currentEnum);
                        this.currentEnum = getDirectoryEntries(file).elements();
                    } else {
                        FileInputStream fileInputStream = new FileInputStream(file);
                        if (file.getName().endsWith(".class")) {
                            classFile2 = new ClassFile();
                            classFile2.read(fileInputStream);
                        }
                    }
                }
            } catch (IOException e) {
                classFile = null;
            }
        }
        return classFile;
    }
}
