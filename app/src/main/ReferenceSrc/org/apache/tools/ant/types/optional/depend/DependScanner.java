package org.apache.tools.ant.types.optional.depend;

import java.io.File;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.depend.DependencyAnalyzer;

/* loaded from: classes.jar:org/apache/tools/ant/types/optional/depend/DependScanner.class */
public class DependScanner extends DirectoryScanner {
    public static final String DEFAULT_ANALYZER_CLASS = "org.apache.tools.ant.util.depend.bcel.FullAnalyzer";
    private Vector additionalBaseDirs = new Vector();
    private Vector included;
    private DirectoryScanner parentScanner;
    private Vector rootClasses;

    public DependScanner(DirectoryScanner directoryScanner) {
        this.parentScanner = directoryScanner;
    }

    public void addBasedir(File file) {
        this.additionalBaseDirs.addElement(file);
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void addDefaultExcludes() {
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getExcludedDirectories() {
        return null;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getExcludedFiles() {
        return null;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getIncludedDirectories() {
        return new String[0];
    }

    @Override // org.apache.tools.ant.DirectoryScanner
    public int getIncludedDirsCount() {
        return 0;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getIncludedFiles() {
        String[] strArr = new String[getIncludedFilesCount()];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = (String) this.included.elementAt(i);
        }
        return strArr;
    }

    @Override // org.apache.tools.ant.DirectoryScanner
    public int getIncludedFilesCount() {
        int size;
        synchronized (this) {
            if (this.included == null) {
                throw new IllegalStateException();
            }
            size = this.included.size();
        }
        return size;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getNotIncludedDirectories() {
        return null;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public String[] getNotIncludedFiles() {
        return null;
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void scan() throws IllegalStateException {
        synchronized (this) {
            this.included = new Vector();
            try {
                DependencyAnalyzer dependencyAnalyzer = (DependencyAnalyzer) Class.forName("org.apache.tools.ant.util.depend.bcel.FullAnalyzer").newInstance();
                dependencyAnalyzer.addClassPath(new Path(null, this.basedir.getPath()));
                Enumeration elements = this.additionalBaseDirs.elements();
                while (elements.hasMoreElements()) {
                    dependencyAnalyzer.addClassPath(new Path(null, ((File) elements.nextElement()).getPath()));
                }
                Enumeration elements2 = this.rootClasses.elements();
                while (elements2.hasMoreElements()) {
                    dependencyAnalyzer.addRootClass((String) elements2.nextElement());
                }
                Enumeration classDependencies = dependencyAnalyzer.getClassDependencies();
                String[] includedFiles = this.parentScanner.getIncludedFiles();
                Hashtable hashtable = new Hashtable();
                for (int i = 0; i < includedFiles.length; i++) {
                    hashtable.put(includedFiles[i], includedFiles[i]);
                }
                while (classDependencies.hasMoreElements()) {
                    String stringBuffer = new StringBuffer().append(((String) classDependencies.nextElement()).replace('.', File.separatorChar)).append(".class").toString();
                    if (new File(this.basedir, stringBuffer).exists() && hashtable.containsKey(stringBuffer)) {
                        this.included.addElement(stringBuffer);
                    }
                }
            } catch (Exception e) {
                throw new BuildException(new StringBuffer().append("Unable to load dependency analyzer: ").append("org.apache.tools.ant.util.depend.bcel.FullAnalyzer").toString(), e);
            }
        }
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void setCaseSensitive(boolean z) {
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void setExcludes(String[] strArr) {
    }

    @Override // org.apache.tools.ant.DirectoryScanner, org.apache.tools.ant.FileScanner
    public void setIncludes(String[] strArr) {
    }

    public void setRootClasses(Vector vector) {
        synchronized (this) {
            this.rootClasses = vector;
        }
    }
}
