package org.apache.tools.ant.types;

import java.io.File;
import java.util.Collections;
import java.util.Iterator;
import java.util.Locale;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.PathTokenizer;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.apache.tools.ant.types.resources.FileResourceIterator;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/Path.class */
public class Path extends DataType implements Cloneable, ResourceCollection {
    static Class class$org$apache$tools$ant$types$Path;
    private boolean cache;
    private Boolean preserveBC;
    private Union union;
    public static Path systemClasspath = new Path(null, System.getProperty("java.class.path"));
    public static Path systemBootClasspath = new Path(null, System.getProperty("sun.boot.class.path"));
    private static final Iterator EMPTY_ITERATOR = Collections.EMPTY_SET.iterator();

    /* loaded from: classes.jar:org/apache/tools/ant/types/Path$PathElement.class */
    public class PathElement implements ResourceCollection {
        private String[] parts;
        private final Path this$0;

        public PathElement(Path path) {
            this.this$0 = path;
        }

        public String[] getParts() {
            return this.parts;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public boolean isFilesystemOnly() {
            return true;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public Iterator iterator() {
            return new FileResourceIterator(this.this$0.getProject(), null, this.parts);
        }

        public void setLocation(File file) {
            this.parts = new String[]{Path.translateFile(file.getAbsolutePath())};
        }

        public void setPath(String str) {
            this.parts = Path.translatePath(this.this$0.getProject(), str);
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public int size() {
            return this.parts == null ? 0 : this.parts.length;
        }
    }

    public Path(Project project) {
        this.union = null;
        this.cache = false;
        setProject(project);
    }

    public Path(Project project, String str) {
        this(project);
        createPathElement().setPath(str);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Path concatSpecialPath(String str, Path path) {
        Path path2 = new Path(getProject());
        String str2 = str;
        String property = getProject() != null ? getProject().getProperty(MagicNames.BUILD_SYSCLASSPATH) : System.getProperty(MagicNames.BUILD_SYSCLASSPATH);
        if (property != null) {
            str2 = property;
        }
        if (str2.equals("only")) {
            path2.addExisting(path, true);
        } else if (str2.equals("first")) {
            path2.addExisting(path, true);
            path2.addExisting(this);
        } else if (str2.equals(Definer.OnError.POLICY_IGNORE)) {
            path2.addExisting(this);
        } else {
            if (!str2.equals("last")) {
                log(new StringBuffer().append("invalid value for build.sysclasspath: ").append(str2).toString(), 1);
            }
            path2.addExisting(this);
            path2.addExisting(path, true);
        }
        return path2;
    }

    private static boolean containsWildcards(String str) {
        return str != null && (str.indexOf("*") > -1 || str.indexOf("?") > -1);
    }

    private boolean getPreserveBC() {
        boolean booleanValue;
        synchronized (this) {
            if (this.preserveBC == null) {
                this.preserveBC = delegateIteratorToList() ? Boolean.TRUE : Boolean.FALSE;
            }
            booleanValue = this.preserveBC.booleanValue();
        }
        return booleanValue;
    }

    private static File resolveFile(Project project, String str) {
        return FileUtils.getFileUtils().resolveFile(project == null ? null : project.getBaseDir(), str);
    }

    public static String translateFile(String str) {
        String stringBuffer;
        if (str == null) {
            stringBuffer = "";
        } else {
            StringBuffer stringBuffer2 = new StringBuffer(str);
            for (int i = 0; i < stringBuffer2.length(); i++) {
                translateFileSep(stringBuffer2, i);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    protected static boolean translateFileSep(StringBuffer stringBuffer, int i) {
        boolean z;
        if (stringBuffer.charAt(i) == '/' || stringBuffer.charAt(i) == '\\') {
            stringBuffer.setCharAt(i, File.separatorChar);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public static String[] translatePath(Project project, String str) {
        String[] strArr;
        Vector vector = new Vector();
        if (str == null) {
            strArr = new String[0];
        } else {
            PathTokenizer pathTokenizer = new PathTokenizer(str);
            StringBuffer stringBuffer = new StringBuffer();
            while (true) {
                StringBuffer stringBuffer2 = stringBuffer;
                if (!pathTokenizer.hasMoreTokens()) {
                    break;
                }
                String nextToken = pathTokenizer.nextToken();
                try {
                    stringBuffer2.append(resolveFile(project, nextToken).getPath());
                } catch (BuildException e) {
                    project.log(new StringBuffer().append("Dropping path element ").append(nextToken).append(" as it is not valid relative to the project").toString(), 3);
                }
                for (int i = 0; i < stringBuffer2.length(); i++) {
                    translateFileSep(stringBuffer2, i);
                }
                vector.addElement(stringBuffer2.toString());
                stringBuffer = new StringBuffer();
            }
            strArr = new String[vector.size()];
            vector.copyInto(strArr);
        }
        return strArr;
    }

    public void add(Path path) throws BuildException {
        if (path == this) {
            throw circularReference();
        }
        if (path.getProject() == null) {
            path.setProject(getProject());
        }
        add((ResourceCollection) path);
    }

    public void add(ResourceCollection resourceCollection) {
        checkChildrenAllowed();
        if (resourceCollection == null) {
            return;
        }
        if (this.union == null) {
            this.union = new Union();
            this.union.setProject(getProject());
            this.union.setCache(this.cache);
        }
        this.union.add(resourceCollection);
        setChecked(false);
    }

    public void addDirset(DirSet dirSet) throws BuildException {
        if (dirSet.getProject() == null) {
            dirSet.setProject(getProject());
        }
        add(dirSet);
    }

    public void addExisting(Path path) {
        addExisting(path, false);
    }

    public void addExisting(Path path, boolean z) {
        String[] list = path.list();
        File file = z ? new File(System.getProperty("user.dir")) : null;
        for (int i = 0; i < list.length; i++) {
            File resolveFile = resolveFile(getProject(), list[i]);
            File file2 = resolveFile;
            if (z) {
                file2 = resolveFile;
                if (!resolveFile.exists()) {
                    file2 = new File(file, list[i]);
                }
            }
            if (file2.exists()) {
                setLocation(file2);
            } else if (file2.getParentFile() == null || !file2.getParentFile().exists() || !containsWildcards(file2.getName())) {
                log(new StringBuffer().append("dropping ").append(file2).append(" from path as it doesn't exist").toString(), 3);
            } else {
                setLocation(file2);
                log(new StringBuffer().append("adding ").append(file2).append(" which contains wildcards and may not").append(" do what you intend it to do depending on your OS or").append(" version of Java").toString(), 3);
            }
        }
    }

    public void addExtdirs(Path path) {
        Path path2 = path;
        if (path == null) {
            String property = System.getProperty("java.ext.dirs");
            if (property == null) {
                return;
            }
            path2 = new Path(getProject(), property);
        }
        for (String str : path2.list()) {
            File resolveFile = resolveFile(getProject(), str);
            if (resolveFile.exists() && resolveFile.isDirectory()) {
                FileSet fileSet = new FileSet();
                fileSet.setDir(resolveFile);
                fileSet.setIncludes("*");
                addFileset(fileSet);
            }
        }
    }

    public void addFilelist(FileList fileList) throws BuildException {
        if (fileList.getProject() == null) {
            fileList.setProject(getProject());
        }
        add(fileList);
    }

    public void addFileset(FileSet fileSet) throws BuildException {
        if (fileSet.getProject() == null) {
            fileSet.setProject(getProject());
        }
        add(fileSet);
    }

    public void addJavaRuntime() {
        if (JavaEnvUtils.isKaffe()) {
            File file = new File(new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("share").append(File.separator).append("kaffe").toString());
            if (file.isDirectory()) {
                FileSet fileSet = new FileSet();
                fileSet.setDir(file);
                fileSet.setIncludes("*.jar");
                addFileset(fileSet);
            }
        } else if ("GNU libgcj".equals(System.getProperty("java.vm.name"))) {
            addExisting(systemBootClasspath);
        }
        if (System.getProperty("java.vendor").toLowerCase(Locale.ENGLISH).indexOf("microsoft") >= 0) {
            FileSet fileSet2 = new FileSet();
            fileSet2.setDir(new File(new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("Packages").toString()));
            fileSet2.setIncludes("*.ZIP");
            addFileset(fileSet2);
            return;
        }
        addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("lib").append(File.separator).append("rt.jar").toString()));
        addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("jre").append(File.separator).append("lib").append(File.separator).append("rt.jar").toString()));
        String[] strArr = {"jce", "jsse"};
        for (int i = 0; i < strArr.length; i++) {
            addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("lib").append(File.separator).append(strArr[i]).append(".jar").toString()));
            addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("..").append(File.separator).append("Classes").append(File.separator).append(strArr[i]).append(".jar").toString()));
        }
        for (String str : new String[]{"core", "graphics", "security", "server", "xml"}) {
            addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("lib").append(File.separator).append(str).append(".jar").toString()));
        }
        addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("..").append(File.separator).append("Classes").append(File.separator).append("classes.jar").toString()));
        addExisting(new Path(null, new StringBuffer().append(System.getProperty("java.home")).append(File.separator).append("..").append(File.separator).append("Classes").append(File.separator).append("ui.jar").toString()));
    }

    public void append(Path path) {
        if (path == null) {
            return;
        }
        add(path);
    }

    protected ResourceCollection assertFilesystemOnly(ResourceCollection resourceCollection) {
        if (resourceCollection == null || resourceCollection.isFilesystemOnly()) {
            return resourceCollection;
        }
        throw new BuildException(new StringBuffer().append(getDataTypeName()).append(" allows only filesystem resources.").toString());
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            Path path = (Path) super.clone();
            path.union = this.union == null ? this.union : (Union) this.union.clone();
            return path;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    public Path concatSystemBootClasspath(String str) {
        return concatSpecialPath(str, systemBootClasspath);
    }

    public Path concatSystemClasspath() {
        return concatSystemClasspath("last");
    }

    public Path concatSystemClasspath(String str) {
        return concatSpecialPath(str, systemClasspath);
    }

    public Path createPath() throws BuildException {
        Path path = new Path(getProject());
        add(path);
        return path;
    }

    public PathElement createPathElement() throws BuildException {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        PathElement pathElement = new PathElement(this);
        add(pathElement);
        return pathElement;
    }

    protected boolean delegateIteratorToList() {
        Class cls;
        Class cls2;
        boolean z = false;
        Class<?> cls3 = getClass();
        if (class$org$apache$tools$ant$types$Path == null) {
            cls = class$("org.apache.tools.ant.types.Path");
            class$org$apache$tools$ant$types$Path = cls;
        } else {
            cls = class$org$apache$tools$ant$types$Path;
        }
        if (!cls3.equals(cls)) {
            try {
                Class<?> declaringClass = getClass().getMethod(HotDeploymentTool.ACTION_LIST, null).getDeclaringClass();
                if (class$org$apache$tools$ant$types$Path == null) {
                    cls2 = class$("org.apache.tools.ant.types.Path");
                    class$org$apache$tools$ant$types$Path = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$types$Path;
                }
                z = !declaringClass.equals(cls2);
            } catch (Exception e) {
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.union != null) {
                        pushAndInvokeCircularReferenceCheck(this.union, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        synchronized (this) {
            if (isReference()) {
                z = ((Path) getCheckedRef()).isFilesystemOnly();
            } else {
                dieOnCircularReference();
                assertFilesystemOnly(this.union);
                z = true;
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public final Iterator iterator() {
        FileResourceIterator fileResourceIterator;
        synchronized (this) {
            if (isReference()) {
                fileResourceIterator = ((Path) getCheckedRef()).iterator();
            } else {
                dieOnCircularReference();
                fileResourceIterator = getPreserveBC() ? new FileResourceIterator(getProject(), null, list()) : this.union == null ? EMPTY_ITERATOR : assertFilesystemOnly(this.union).iterator();
            }
        }
        return fileResourceIterator;
    }

    public String[] list() {
        return isReference() ? ((Path) getCheckedRef()).list() : assertFilesystemOnly(this.union) == null ? new String[0] : this.union.list();
    }

    public void setCache(boolean z) {
        checkAttributesAllowed();
        this.cache = z;
        if (this.union != null) {
            this.union.setCache(z);
        }
    }

    public void setLocation(File file) throws BuildException {
        checkAttributesAllowed();
        createPathElement().setLocation(file);
    }

    public void setPath(String str) throws BuildException {
        checkAttributesAllowed();
        createPathElement().setPath(str);
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.union != null) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            if (isReference()) {
                size = ((Path) getCheckedRef()).size();
            } else {
                dieOnCircularReference();
                size = this.union == null ? 0 : assertFilesystemOnly(this.union).size();
            }
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        return isReference() ? getCheckedRef().toString() : this.union == null ? "" : this.union.toString();
    }
}
