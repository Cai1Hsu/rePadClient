package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Available.class */
public class Available extends Task implements Condition {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private String classname;
    private Path classpath;
    private File file;
    private String filename;
    private Path filepath;
    private AntClassLoader loader;
    private String property;
    private String resource;
    private FileDir type;
    private Object value = "true";
    private boolean isTask = false;
    private boolean ignoreSystemclasses = false;
    private boolean searchParents = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Available$FileDir.class */
    public static class FileDir extends EnumeratedAttribute {
        private static final String[] VALUES = {"file", "dir"};

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return VALUES;
        }

        public boolean isDir() {
            return "dir".equalsIgnoreCase(getValue());
        }

        public boolean isFile() {
            return "file".equalsIgnoreCase(getValue());
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:10:0x003b */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:26:0x0002 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.lang.SecurityException] */
    private boolean checkClass(String e) {
        boolean z = true;
        try {
            if (this.ignoreSystemclasses) {
                this.loader = getProject().createClassLoader(this.classpath);
                this.loader.setParentFirst(false);
                this.loader.addJavaLibraries();
                if (this.loader != null) {
                    try {
                        this.loader.findClass(e);
                    } catch (SecurityException e2) {
                        e = e2;
                    }
                } else {
                    z = false;
                }
            } else if (this.loader != null) {
                this.loader.loadClass(e);
            } else {
                ClassLoader classLoader = getClass().getClassLoader();
                if (classLoader != null) {
                    Class.forName(e, true, classLoader);
                } else {
                    Class.forName(e);
                }
            }
        } catch (ClassNotFoundException e3) {
            log(new StringBuffer().append("class \"").append((String) e).append("\" was not found").toString(), 4);
            z = false;
        } catch (NoClassDefFoundError e4) {
            log(new StringBuffer().append("Could not load dependent class \"").append(e4.getMessage()).append("\" for class \"").append((String) e).append("\"").toString(), 4);
            z = false;
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x007b, code lost:
        if (r6.type != null) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x007e, code lost:
        log(new java.lang.StringBuffer().append("Found: ").append(r0).toString(), 3);
        r8 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00a3, code lost:
        if (r6.type.isDir() == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00ab, code lost:
        if (r0.isDirectory() == false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00ae, code lost:
        log(new java.lang.StringBuffer().append("Found directory: ").append(r0).toString(), 3);
        r8 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00d3, code lost:
        if (r6.type.isFile() == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00db, code lost:
        if (r0.isFile() == false) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00de, code lost:
        log(new java.lang.StringBuffer().append("Found file: ").append(r0).toString(), 3);
        r8 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00fc, code lost:
        r8 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean checkFile() {
        boolean z;
        if (this.filepath != null) {
            String[] list = this.filepath.list();
            int i = 0;
            loop0: while (true) {
                if (i >= list.length) {
                    z = false;
                    break;
                }
                log(new StringBuffer().append("Searching ").append(list[i]).toString(), 3);
                File file = new File(list[i]);
                if (!file.exists() || (!this.filename.equals(list[i]) && !this.filename.equals(file.getName()))) {
                    File parentFile = file.getParentFile();
                    if (parentFile == null || !parentFile.exists() || !this.filename.equals(parentFile.getAbsolutePath())) {
                        File file2 = parentFile;
                        if (file.exists()) {
                            file2 = parentFile;
                            if (file.isDirectory()) {
                                z = true;
                                if (checkFile(new File(file, this.filename), new StringBuffer().append(this.filename).append(" in ").append(file).toString())) {
                                    break;
                                }
                                file2 = parentFile;
                            }
                        }
                        while (this.searchParents && file2 != null && file2.exists()) {
                            z = true;
                            if (checkFile(new File(file2, this.filename), new StringBuffer().append(this.filename).append(" in ").append(file2).toString())) {
                                break loop0;
                            }
                            file2 = file2.getParentFile();
                        }
                        i++;
                    } else if (this.type == null) {
                        log(new StringBuffer().append("Found: ").append(parentFile).toString(), 3);
                        z = true;
                    } else if (this.type.isDir()) {
                        log(new StringBuffer().append("Found directory: ").append(parentFile).toString(), 3);
                        z = true;
                    } else {
                        z = false;
                    }
                }
            }
        } else {
            z = checkFile(this.file, this.filename);
        }
        return z;
    }

    private boolean checkFile(File file, String str) {
        boolean exists;
        if (this.type != null) {
            if (this.type.isDir()) {
                if (file.isDirectory()) {
                    log(new StringBuffer().append("Found directory: ").append(str).toString(), 3);
                }
                exists = file.isDirectory();
            } else if (this.type.isFile()) {
                if (file.isFile()) {
                    log(new StringBuffer().append("Found file: ").append(str).toString(), 3);
                }
                exists = file.isFile();
            }
            return exists;
        }
        if (file.exists()) {
            log(new StringBuffer().append("Found: ").append(str).toString(), 3);
        }
        exists = file.exists();
        return exists;
    }

    private boolean checkResource(String str) {
        boolean z = true;
        if (this.loader == null) {
            ClassLoader classLoader = getClass().getClassLoader();
            if (classLoader != null) {
                if (classLoader.getResourceAsStream(str) == null) {
                    z = false;
                }
            } else if (ClassLoader.getSystemResourceAsStream(str) == null) {
                z = false;
            }
        } else if (this.loader.getResourceAsStream(str) == null) {
            z = false;
        }
        return z;
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public Path createFilepath() {
        if (this.filepath == null) {
            this.filepath = new Path(getProject());
        }
        return this.filepath.createPath();
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x00fb, code lost:
        if (r4.isTask == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00fe, code lost:
        setTaskName(null);
        r8 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0171, code lost:
        if (r4.isTask == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01c5, code lost:
        if (r4.isTask == false) goto L46;
     */
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean eval() throws BuildException {
        boolean z;
        try {
            if (this.classname == null && this.file == null && this.resource == null) {
                throw new BuildException("At least one of (classname|file|resource) is required", getLocation());
            }
            if (this.type != null && this.file == null) {
                throw new BuildException("The type attribute is only valid when specifying the file attribute.", getLocation());
            }
            if (this.classpath != null) {
                this.classpath.setProject(getProject());
                this.loader = getProject().createClassLoader(this.classpath);
            }
            String str = "";
            if (this.isTask) {
                str = new StringBuffer().append(" to set property ").append(this.property).toString();
            } else {
                setTaskName("available");
            }
            if (this.classname != null && !checkClass(this.classname)) {
                log(new StringBuffer().append("Unable to load class ").append(this.classname).append(str).toString(), 3);
                if (this.loader != null) {
                    this.loader.cleanup();
                    this.loader = null;
                }
                z = false;
            } else if (this.file == null || checkFile()) {
                if (this.resource == null || checkResource(this.resource)) {
                    z = true;
                } else {
                    log(new StringBuffer().append("Unable to load resource ").append(this.resource).append(str).toString(), 3);
                    if (this.loader != null) {
                        this.loader.cleanup();
                        this.loader = null;
                    }
                    z = false;
                }
                return z;
            } else {
                StringBuffer stringBuffer = new StringBuffer("Unable to find ");
                if (this.type != null) {
                    stringBuffer.append(this.type).append(' ');
                }
                stringBuffer.append(this.filename).append(str);
                log(stringBuffer.toString(), 3);
                if (this.loader != null) {
                    this.loader.cleanup();
                    this.loader = null;
                }
                z = false;
            }
        } finally {
            if (this.loader != null) {
                this.loader.cleanup();
                this.loader = null;
            }
            if (!this.isTask) {
                setTaskName(null);
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.property == null) {
            throw new BuildException("property attribute is required", getLocation());
        }
        this.isTask = true;
        try {
            if (eval()) {
                PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
                Object property = propertyHelper.getProperty(this.property);
                if (property != null && !property.equals(this.value)) {
                    log(new StringBuffer().append("DEPRECATED - <available> used to override an existing property.").append(StringUtils.LINE_SEP).append("  Build file should not reuse the same property").append(" name for different values.").toString(), 1);
                }
                propertyHelper.setProperty(this.property, this.value, true);
            }
        } finally {
            this.isTask = false;
        }
    }

    public void setClassname(String str) {
        if (!"".equals(str)) {
            this.classname = str;
        }
    }

    public void setClasspath(Path path) {
        createClasspath().append(path);
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setFile(File file) {
        this.file = file;
        this.filename = FILE_UTILS.removeLeadingPath(getProject().getBaseDir(), file);
    }

    public void setFilepath(Path path) {
        createFilepath().append(path);
    }

    public void setIgnoresystemclasses(boolean z) {
        this.ignoreSystemclasses = z;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setResource(String str) {
        this.resource = str;
    }

    public void setSearchParents(boolean z) {
        this.searchParents = z;
    }

    public void setType(String str) {
        log("DEPRECATED - The setType(String) method has been deprecated. Use setType(Available.FileDir) instead.", 1);
        this.type = new FileDir();
        this.type.setValue(str);
    }

    public void setType(FileDir fileDir) {
        this.type = fileDir;
    }

    public void setValue(Object obj) {
        this.value = obj;
    }

    public void setValue(String str) {
        setValue((Object) str);
    }
}
