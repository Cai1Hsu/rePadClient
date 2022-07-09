package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.MergingMapper;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.SourceFileScanner;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/UpToDate.class */
public class UpToDate extends Task implements Condition {
    private String property;
    private File sourceFile;
    private File targetFile;
    private String value;
    private Vector sourceFileSets = new Vector();
    private Union sourceResources = new Union();
    protected Mapper mapperElement = null;

    private FileNameMapper getMapper() {
        MergingMapper implementation;
        if (this.mapperElement == null) {
            implementation = new MergingMapper();
            implementation.setTo(this.targetFile.getAbsolutePath());
        } else {
            implementation = this.mapperElement.getImplementation();
        }
        return implementation;
    }

    private String getValue() {
        return this.value != null ? this.value : "true";
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public void addSrcfiles(FileSet fileSet) {
        this.sourceFileSets.addElement(fileSet);
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapperElement != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapperElement = new Mapper(getProject());
        return this.mapperElement;
    }

    public Union createSrcResources() {
        return this.sourceResources;
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        boolean z;
        boolean z2 = false;
        if (this.sourceFileSets.size() == 0 && this.sourceResources.size() == 0 && this.sourceFile == null) {
            throw new BuildException("At least one srcfile or a nested <srcfiles> or <srcresources> element must be set.");
        }
        if ((this.sourceFileSets.size() > 0 || this.sourceResources.size() > 0) && this.sourceFile != null) {
            throw new BuildException("Cannot specify both the srcfile attribute and a nested <srcfiles> or <srcresources> element.");
        }
        if (this.targetFile == null && this.mapperElement == null) {
            throw new BuildException("The targetfile attribute or a nested mapper element must be set.");
        }
        if (this.targetFile != null && !this.targetFile.exists()) {
            log(new StringBuffer().append("The targetfile \"").append(this.targetFile.getAbsolutePath()).append("\" does not exist.").toString(), 3);
        } else if (this.sourceFile != null && !this.sourceFile.exists()) {
            throw new BuildException(new StringBuffer().append(this.sourceFile.getAbsolutePath()).append(" not found.").toString());
        } else {
            boolean z3 = true;
            if (this.sourceFile != null) {
                if (this.mapperElement == null) {
                    z = this.targetFile.lastModified() >= this.sourceFile.lastModified();
                } else {
                    z = new SourceFileScanner(this).restrict(new String[]{this.sourceFile.getAbsolutePath()}, null, null, this.mapperElement.getImplementation()).length == 0;
                }
                z3 = z;
                if (!z) {
                    log(new StringBuffer().append(this.sourceFile.getAbsolutePath()).append(" is newer than (one of) its target(s).").toString(), 3);
                    z3 = z;
                }
            }
            Enumeration elements = this.sourceFileSets.elements();
            while (z3 && elements.hasMoreElements()) {
                FileSet fileSet = (FileSet) elements.nextElement();
                z3 = scanDir(fileSet.getDir(getProject()), fileSet.getDirectoryScanner(getProject()).getIncludedFiles());
            }
            z2 = z3;
            if (z3) {
                Resource[] listResources = this.sourceResources.listResources();
                z2 = z3;
                if (listResources.length > 0) {
                    z2 = ResourceUtils.selectOutOfDateSources(this, listResources, getMapper(), getProject()).length == 0;
                }
            }
        }
        return z2;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.property == null) {
            throw new BuildException("property attribute is required.", getLocation());
        }
        if (!eval()) {
            return;
        }
        getProject().setNewProperty(this.property, getValue());
        if (this.mapperElement == null) {
            log(new StringBuffer().append("File \"").append(this.targetFile.getAbsolutePath()).append("\" is up-to-date.").toString(), 3);
        } else {
            log("All target files are up-to-date.", 3);
        }
    }

    protected boolean scanDir(File file, String[] strArr) {
        SourceFileScanner sourceFileScanner = new SourceFileScanner(this);
        FileNameMapper mapper = getMapper();
        File file2 = file;
        if (this.mapperElement == null) {
            file2 = null;
        }
        return sourceFileScanner.restrict(strArr, file, file2, mapper).length == 0;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setSrcfile(File file) {
        this.sourceFile = file;
    }

    public void setTargetFile(File file) {
        this.targetFile = file;
    }

    public void setValue(String str) {
        this.value = str;
    }
}
