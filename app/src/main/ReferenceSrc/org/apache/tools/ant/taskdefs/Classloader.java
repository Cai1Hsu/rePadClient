package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Classloader.class */
public class Classloader extends Task {
    public static final String SYSTEM_LOADER_REF = "ant.coreLoader";
    private Path classpath;
    private String name = null;
    private boolean reset = false;
    private boolean parentFirst = true;
    private String parentName = null;

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(null);
        }
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        boolean z = true;
        try {
            if ("only".equals(getProject().getProperty(MagicNames.BUILD_SYSCLASSPATH)) && (this.name == null || "ant.coreLoader".equals(this.name))) {
                log("Changing the system loader is disabled by build.sysclasspath=only", 1);
                return;
            }
            String str = this.name == null ? "ant.coreLoader" : this.name;
            Object reference = getProject().getReference(str);
            if (this.reset) {
                reference = null;
            }
            if (reference != null && !(reference instanceof AntClassLoader)) {
                log("Referenced object is not an AntClassLoader", 0);
                return;
            }
            AntClassLoader antClassLoader = (AntClassLoader) reference;
            if (antClassLoader == null) {
                z = false;
            }
            AntClassLoader antClassLoader2 = antClassLoader;
            if (antClassLoader == null) {
                ClassLoader classLoader = null;
                if (this.parentName != null) {
                    Object reference2 = getProject().getReference(this.parentName);
                    classLoader = reference2;
                    if (!(reference2 instanceof ClassLoader)) {
                        classLoader = null;
                    }
                }
                if (classLoader == null) {
                    classLoader = getClass().getClassLoader();
                }
                if (this.name == null) {
                }
                getProject().log(new StringBuffer().append("Setting parent loader ").append(this.name).append(" ").append(classLoader).append(" ").append(this.parentFirst).toString(), 4);
                AntClassLoader newAntClassLoader = AntClassLoader.newAntClassLoader(classLoader, getProject(), this.classpath, this.parentFirst);
                getProject().addReference(str, newAntClassLoader);
                antClassLoader2 = newAntClassLoader;
                if (this.name == null) {
                    newAntClassLoader.addLoaderPackageRoot("org.apache.tools.ant.taskdefs.optional");
                    getProject().setCoreLoader(newAntClassLoader);
                    antClassLoader2 = newAntClassLoader;
                }
            }
            if (!z || this.classpath == null) {
                return;
            }
            for (String str2 : this.classpath.list()) {
                File file = new File(str2);
                if (file.exists()) {
                    log(new StringBuffer().append("Adding to class loader ").append(antClassLoader2).append(" ").append(file.getAbsolutePath()).toString(), 4);
                    antClassLoader2.addPathElement(file.getAbsolutePath());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) throws BuildException {
        this.classpath = (Path) reference.getReferencedObject(getProject());
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setParentFirst(boolean z) {
        this.parentFirst = z;
    }

    public void setParentName(String str) {
        this.parentName = str;
    }

    public void setReset(boolean z) {
        this.reset = z;
    }

    public void setReverse(boolean z) {
        this.parentFirst = !z;
    }
}
