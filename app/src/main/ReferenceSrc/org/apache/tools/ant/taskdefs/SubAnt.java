package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Main;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Ant;
import org.apache.tools.ant.types.DirSet;
import org.apache.tools.ant.types.FileList;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/SubAnt.class */
public class SubAnt extends Task {
    private Path buildpath;
    private Ant ant = null;
    private String subTarget = null;
    private String antfile = getDefaultBuildFile();
    private File genericantfile = null;
    private boolean verbose = false;
    private boolean inheritAll = false;
    private boolean inheritRefs = false;
    private boolean failOnError = true;
    private String output = null;
    private Vector properties = new Vector();
    private Vector references = new Vector();
    private Vector propertySets = new Vector();
    private Vector targets = new Vector();

    private static void copyProperty(Property property, Property property2) {
        property.setName(property2.getName());
        if (property2.getValue() != null) {
            property.setValue(property2.getValue());
        }
        if (property2.getFile() != null) {
            property.setFile(property2.getFile());
        }
        if (property2.getResource() != null) {
            property.setResource(property2.getResource());
        }
        if (property2.getPrefix() != null) {
            property.setPrefix(property2.getPrefix());
        }
        if (property2.getRefid() != null) {
            property.setRefid(property2.getRefid());
        }
        if (property2.getEnvironment() != null) {
            property.setEnvironment(property2.getEnvironment());
        }
        if (property2.getClasspath() != null) {
            property.setClasspath(property2.getClasspath());
        }
    }

    private Ant createAntTask(File file) {
        Ant ant = new Ant(this);
        ant.init();
        if (this.subTarget != null && this.subTarget.length() > 0) {
            ant.setTarget(this.subTarget);
        }
        if (this.output != null) {
            ant.setOutput(this.output);
        }
        if (file != null) {
            ant.setDir(file);
        } else {
            ant.setUseNativeBasedir(true);
        }
        ant.setInheritAll(this.inheritAll);
        Enumeration elements = this.properties.elements();
        while (elements.hasMoreElements()) {
            copyProperty(ant.createProperty(), (Property) elements.nextElement());
        }
        Enumeration elements2 = this.propertySets.elements();
        while (elements2.hasMoreElements()) {
            ant.addPropertyset((PropertySet) elements2.nextElement());
        }
        ant.setInheritRefs(this.inheritRefs);
        Enumeration elements3 = this.references.elements();
        while (elements3.hasMoreElements()) {
            ant.addReference((Ant.Reference) elements3.nextElement());
        }
        return ant;
    }

    private void execute(File file, File file2) throws BuildException {
        if (!file.exists() || file.isDirectory() || !file.canRead()) {
            String stringBuffer = new StringBuffer().append("Invalid file: ").append(file).toString();
            if (this.failOnError) {
                throw new BuildException(stringBuffer);
            }
            log(stringBuffer, 1);
            return;
        }
        this.ant = createAntTask(file2);
        String absolutePath = file.getAbsolutePath();
        this.ant.setAntfile(absolutePath);
        int size = this.targets.size();
        for (int i = 0; i < size; i++) {
            try {
                this.ant.addConfiguredTarget((Ant.TargetElement) this.targets.get(i));
            } catch (BuildException e) {
                if (this.failOnError || isHardError(e)) {
                    throw e;
                }
                log(new StringBuffer().append("Failure for target '").append(this.subTarget).append("' of: ").append(absolutePath).append("\n").append(e.getMessage()).toString(), 1);
                return;
            } catch (Throwable th) {
                if (this.failOnError || isHardError(th)) {
                    throw new BuildException(th);
                }
                log(new StringBuffer().append("Failure for target '").append(this.subTarget).append("' of: ").append(absolutePath).append("\n").append(th.toString()).toString(), 1);
                return;
            } finally {
                this.ant = null;
            }
        }
        this.ant.execute();
    }

    private Path getBuildpath() {
        if (this.buildpath == null) {
            this.buildpath = new Path(getProject());
        }
        return this.buildpath;
    }

    private boolean isHardError(Throwable th) {
        boolean z;
        if (th instanceof BuildException) {
            z = isHardError(th.getCause());
        } else {
            z = true;
            if (!(th instanceof OutOfMemoryError)) {
                z = true;
                if (!(th instanceof ThreadDeath)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public void add(ResourceCollection resourceCollection) {
        getBuildpath().add(resourceCollection);
    }

    public void addConfiguredTarget(Ant.TargetElement targetElement) {
        if ("".equals(targetElement.getName())) {
            throw new BuildException("target name must not be empty");
        }
        this.targets.add(targetElement);
    }

    public void addDirset(DirSet dirSet) {
        add(dirSet);
    }

    public void addFilelist(FileList fileList) {
        add(fileList);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    public void addProperty(Property property) {
        this.properties.addElement(property);
    }

    public void addPropertyset(PropertySet propertySet) {
        this.propertySets.addElement(propertySet);
    }

    public void addReference(Ant.Reference reference) {
        this.references.addElement(reference);
    }

    public Path createBuildpath() {
        return getBuildpath().createPath();
    }

    public Path.PathElement createBuildpathElement() {
        return getBuildpath().createPathElement();
    }

    /* JADX WARN: Removed duplicated region for block: B:115:0x0247 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01cb  */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() {
        Throwable th;
        String str;
        File file;
        String str2;
        RuntimeException runtimeException;
        RuntimeException e;
        String str3;
        BuildException buildException;
        File file2;
        if (this.buildpath == null) {
            throw new BuildException("No buildpath specified");
        }
        String[] list = this.buildpath.list();
        int length = list.length;
        if (length < 1) {
            log("No sub-builds to iterate on", 1);
            return;
        }
        BuildException buildException2 = null;
        int i = 0;
        while (i < length) {
            String str4 = null;
            File file3 = null;
            File file4 = null;
            File file5 = null;
            try {
                file2 = new File(list[i]);
                str = null;
                str3 = null;
            } catch (RuntimeException e2) {
                e = e2;
                str3 = null;
            } catch (Throwable th2) {
                th = th2;
                str = null;
            }
            try {
                if (file2.isDirectory()) {
                    str4 = null;
                    if (this.verbose) {
                        str4 = file2.getPath();
                        log(new StringBuffer().append("Entering directory: ").append(str4).append("\n").toString(), 2);
                    }
                    String str5 = str4;
                    if (this.genericantfile != null) {
                        file3 = file2;
                        file2 = this.genericantfile;
                    } else {
                        file2 = new File(file2, this.antfile);
                    }
                }
                execute(file2, file3);
                file = file2;
                str2 = str4;
                runtimeException = null;
                if (this.verbose) {
                    file = file2;
                    str2 = str4;
                    runtimeException = null;
                    if (str4 != null) {
                        File file6 = file2;
                        File file7 = file2;
                        log(new StringBuffer().append("Leaving directory: ").append(str4).append("\n").toString(), 2);
                        runtimeException = null;
                        str2 = str4;
                        file = file2;
                    }
                }
            } catch (RuntimeException e3) {
                file4 = file2;
                e = e3;
                if (!getProject().isKeepGoingMode()) {
                    if (this.verbose && str3 != null) {
                        log(new StringBuffer().append("Leaving directory: ").append(str3).append("\n").toString(), 2);
                    }
                    throw e;
                }
                file = file4;
                str2 = str3;
                runtimeException = e;
                BuildException buildException3 = buildException2;
                if (runtimeException != null) {
                }
                i++;
                buildException2 = buildException3;
            } catch (Throwable th3) {
                file5 = file2;
                th = th3;
                if (!getProject().isKeepGoingMode()) {
                    if (this.verbose && str != null) {
                        log(new StringBuffer().append("Leaving directory: ").append(str).append("\n").toString(), 2);
                    }
                    throw new BuildException(th);
                }
                file = file5;
                str2 = str;
                runtimeException = th;
                BuildException buildException32 = buildException2;
                if (runtimeException != null) {
                }
                i++;
                buildException2 = buildException32;
            }
            BuildException buildException322 = buildException2;
            if (runtimeException != null) {
                if (runtimeException instanceof BuildException) {
                    log(new StringBuffer().append("File '").append(file).append("' failed with message '").append(runtimeException.getMessage()).append("'.").toString(), 0);
                    buildException = buildException2;
                    if (buildException2 == null) {
                        buildException = (BuildException) runtimeException;
                    }
                } else {
                    log(new StringBuffer().append("Target '").append(file).append("' failed with message '").append(runtimeException.getMessage()).append("'.").toString(), 0);
                    runtimeException.printStackTrace(System.err);
                    buildException = buildException2;
                    if (buildException2 == null) {
                        buildException = new BuildException(runtimeException);
                    }
                }
                buildException322 = buildException;
                if (this.verbose) {
                    buildException322 = buildException;
                    if (str2 != null) {
                        log(new StringBuffer().append("Leaving directory: ").append(str2).append("\n").toString(), 2);
                        buildException322 = buildException;
                    }
                }
            }
            i++;
            buildException2 = buildException322;
        }
        if (buildException2 == null) {
            return;
        }
        throw buildException2;
    }

    protected String getDefaultBuildFile() {
        return Main.DEFAULT_BUILD_FILENAME;
    }

    @Override // org.apache.tools.ant.Task
    public void handleErrorFlush(String str) {
        if (this.ant != null) {
            this.ant.handleErrorFlush(str);
        } else {
            super.handleErrorFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void handleErrorOutput(String str) {
        if (this.ant != null) {
            this.ant.handleErrorOutput(str);
        } else {
            super.handleErrorOutput(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void handleFlush(String str) {
        if (this.ant != null) {
            this.ant.handleFlush(str);
        } else {
            super.handleFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public int handleInput(byte[] bArr, int i, int i2) throws IOException {
        return this.ant != null ? this.ant.handleInput(bArr, i, i2) : super.handleInput(bArr, i, i2);
    }

    @Override // org.apache.tools.ant.Task
    public void handleOutput(String str) {
        if (this.ant != null) {
            this.ant.handleOutput(str);
        } else {
            super.handleOutput(str);
        }
    }

    public void setAntfile(String str) {
        this.antfile = str;
    }

    public void setBuildpath(Path path) {
        getBuildpath().append(path);
    }

    public void setBuildpathRef(Reference reference) {
        createBuildpath().setRefid(reference);
    }

    public void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public void setGenericAntfile(File file) {
        this.genericantfile = file;
    }

    public void setInheritall(boolean z) {
        this.inheritAll = z;
    }

    public void setInheritrefs(boolean z) {
        this.inheritRefs = z;
    }

    public void setOutput(String str) {
        this.output = str;
    }

    public void setTarget(String str) {
        this.subTarget = str;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
