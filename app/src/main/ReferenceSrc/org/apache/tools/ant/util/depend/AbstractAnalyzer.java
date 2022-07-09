package org.apache.tools.ant.util.depend;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;
import java.util.zip.ZipFile;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/util/depend/AbstractAnalyzer.class */
public abstract class AbstractAnalyzer implements DependencyAnalyzer {
    public static final int MAX_LOOPS = 1000;
    private Vector classDependencies;
    private Vector fileDependencies;
    private Path sourcePath = new Path(null);
    private Path classPath = new Path(null);
    private final Vector rootClasses = new VectorSet();
    private boolean determined = false;
    private boolean closure = true;

    protected AbstractAnalyzer() {
        reset();
    }

    private File getResourceContainer(String str, String[] strArr) throws IOException {
        File file;
        ZipFile zipFile;
        Throwable th;
        ZipFile zipFile2;
        int i = 0;
        while (true) {
            if (i >= strArr.length) {
                file = null;
                break;
            }
            File file2 = new File(strArr[i]);
            if (file2.exists()) {
                if (file2.isDirectory()) {
                    File file3 = new File(file2, str);
                    if (file3.exists()) {
                        file = file3;
                        break;
                    }
                } else {
                    try {
                        zipFile2 = new ZipFile(file2);
                    } catch (Throwable th2) {
                        th = th2;
                        zipFile = null;
                    }
                    try {
                        if (zipFile2.getEntry(str) != null) {
                            if (zipFile2 != null) {
                                zipFile2.close();
                            }
                            file = file2;
                        } else if (zipFile2 != null) {
                            zipFile2.close();
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        zipFile = zipFile2;
                        if (zipFile != null) {
                            zipFile.close();
                        }
                        throw th;
                    }
                }
            }
            i++;
        }
        return file;
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void addClassPath(Path path) {
        if (path == null) {
            return;
        }
        this.classPath.append(path);
        this.classPath.setProject(path.getProject());
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void addRootClass(String str) {
        if (str != null && !this.rootClasses.contains(str)) {
            this.rootClasses.addElement(str);
        }
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void addSourcePath(Path path) {
        if (path == null) {
            return;
        }
        this.sourcePath.append(path);
        this.sourcePath.setProject(path.getProject());
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void config(String str, Object obj) {
    }

    protected abstract void determineDependencies(Vector vector, Vector vector2);

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public File getClassContainer(String str) throws IOException {
        return getResourceContainer(new StringBuffer().append(str.replace('.', '/')).append(".class").toString(), this.classPath.list());
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public Enumeration getClassDependencies() {
        if (!this.determined) {
            determineDependencies(this.fileDependencies, this.classDependencies);
        }
        return this.classDependencies.elements();
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public Enumeration getFileDependencies() {
        if (!supportsFileDependencies()) {
            throw new RuntimeException("File dependencies are not supported by this analyzer");
        }
        if (!this.determined) {
            determineDependencies(this.fileDependencies, this.classDependencies);
        }
        return this.fileDependencies.elements();
    }

    protected Enumeration getRootClasses() {
        return this.rootClasses.elements();
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public File getSourceContainer(String str) throws IOException {
        return getResourceContainer(new StringBuffer().append(str.replace('.', '/')).append(".java").toString(), this.sourcePath.list());
    }

    protected boolean isClosureRequired() {
        return this.closure;
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void reset() {
        this.rootClasses.removeAllElements();
        this.determined = false;
        this.fileDependencies = new Vector();
        this.classDependencies = new Vector();
    }

    @Override // org.apache.tools.ant.util.depend.DependencyAnalyzer
    public void setClosure(boolean z) {
        this.closure = z;
    }

    protected abstract boolean supportsFileDependencies();
}
