package org.apache.tools.ant.types.resources.selectors;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Type.class */
public class Type implements ResourceSelector {
    private static final String DIR_ATTR = "dir";
    private static final String FILE_ATTR = "file";
    private FileDir type = null;
    public static final Type FILE = new Type(new FileDir("file"));
    public static final Type DIR = new Type(new FileDir("dir"));
    private static final String ANY_ATTR = "any";
    public static final Type ANY = new Type(new FileDir(ANY_ATTR));

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Type$FileDir.class */
    public static class FileDir extends EnumeratedAttribute {
        private static final String[] VALUES = {"file", "dir", Type.ANY_ATTR};

        public FileDir() {
        }

        public FileDir(String str) {
            setValue(str);
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return VALUES;
        }
    }

    public Type() {
    }

    public Type(FileDir fileDir) {
        setType(fileDir);
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0039, code lost:
        if (r0 != 0) goto L17;
     */
    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean isSelected(Resource resource) {
        if (this.type == null) {
            throw new BuildException("The type attribute is required.");
        }
        int index = this.type.getIndex();
        boolean z = true;
        if (index != 2) {
            if (resource.isDirectory()) {
                if (index == 1) {
                    z = true;
                }
                z = false;
            } else {
                z = true;
            }
        }
        return z;
    }

    public void setType(FileDir fileDir) {
        this.type = fileDir;
    }
}
