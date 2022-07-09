package org.apache.tools.ant.types.optional.depend;

import java.util.Enumeration;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/optional/depend/ClassfileSet.class */
public class ClassfileSet extends FileSet {
    private Vector rootClasses;
    private Vector rootFileSets;

    /* loaded from: classes.jar:org/apache/tools/ant/types/optional/depend/ClassfileSet$ClassRoot.class */
    public static class ClassRoot {
        private String rootClass;

        public String getClassname() {
            return this.rootClass;
        }

        public void setClassname(String str) {
            this.rootClass = str;
        }
    }

    public ClassfileSet() {
        this.rootClasses = new Vector();
        this.rootFileSets = new Vector();
    }

    protected ClassfileSet(ClassfileSet classfileSet) {
        super(classfileSet);
        this.rootClasses = new Vector();
        this.rootFileSets = new Vector();
        this.rootClasses = (Vector) classfileSet.rootClasses.clone();
    }

    public void addConfiguredRoot(ClassRoot classRoot) {
        this.rootClasses.addElement(classRoot.getClassname());
    }

    public void addRootFileset(FileSet fileSet) {
        this.rootFileSets.addElement(fileSet);
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return new ClassfileSet(isReference() ? (ClassfileSet) getRef(getProject()) : this);
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) {
        synchronized (this) {
            if (!isChecked()) {
                super.dieOnCircularReference(stack, project);
                if (!isReference()) {
                    Enumeration elements = this.rootFileSets.elements();
                    while (elements.hasMoreElements()) {
                        pushAndInvokeCircularReferenceCheck((FileSet) elements.nextElement(), stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet
    public DirectoryScanner getDirectoryScanner(Project project) {
        DependScanner dependScanner;
        if (isReference()) {
            dependScanner = getRef(project).getDirectoryScanner(project);
        } else {
            dieOnCircularReference(project);
            DependScanner dependScanner2 = new DependScanner(super.getDirectoryScanner(project));
            Vector vector = (Vector) this.rootClasses.clone();
            Enumeration elements = this.rootFileSets.elements();
            while (elements.hasMoreElements()) {
                FileSet fileSet = (FileSet) elements.nextElement();
                String[] includedFiles = fileSet.getDirectoryScanner(project).getIncludedFiles();
                for (int i = 0; i < includedFiles.length; i++) {
                    if (includedFiles[i].endsWith(".class")) {
                        vector.addElement(StringUtils.removeSuffix(includedFiles[i], ".class").replace('/', '.').replace('\\', '.'));
                    }
                }
                dependScanner2.addBasedir(fileSet.getDir(project));
            }
            dependScanner2.setBasedir(getDir(project));
            dependScanner2.setRootClasses(vector);
            dependScanner2.scan();
            dependScanner = dependScanner2;
        }
        return dependScanner;
    }

    public void setRootClass(String str) {
        this.rootClasses.addElement(str);
    }
}
