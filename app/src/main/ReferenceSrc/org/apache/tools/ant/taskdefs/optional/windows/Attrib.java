package org.apache.tools.ant.taskdefs.optional.windows;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.ExecuteOn;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FileSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/windows/Attrib.class */
public class Attrib extends ExecuteOn {
    private static final String ATTR_ARCHIVE = "A";
    private static final String ATTR_HIDDEN = "H";
    private static final String ATTR_READONLY = "R";
    private static final String ATTR_SYSTEM = "S";
    private static final String SET = "+";
    private static final String UNSET = "-";
    private boolean haveAttr = false;

    public Attrib() {
        super.setExecutable("attrib");
        super.setParallel(false);
    }

    private void addArg(boolean z, String str) {
        createArg().setValue(new StringBuffer().append(getSignString(z)).append(str).toString());
        this.haveAttr = true;
    }

    private static String getSignString(boolean z) {
        return z ? SET : UNSET;
    }

    private boolean haveAttr() {
        return this.haveAttr;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn, org.apache.tools.ant.taskdefs.ExecTask
    protected void checkConfiguration() {
        if (!haveAttr()) {
            throw new BuildException("Missing attribute parameter", getLocation());
        }
        super.checkConfiguration();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    protected boolean isValidOs() {
        return (getOs() == null && getOsFamily() == null) ? Os.isFamily(Os.FAMILY_WINDOWS) : super.isValidOs();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setAddsourcefile(boolean z) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the addsourcefile attribute").toString(), getLocation());
    }

    public void setArchive(boolean z) {
        addArg(z, ATTR_ARCHIVE);
    }

    public void setCommand(String str) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the command attribute").toString(), getLocation());
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    public void setExecutable(String str) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the executable attribute").toString(), getLocation());
    }

    public void setFile(File file) {
        FileSet fileSet = new FileSet();
        fileSet.setFile(file);
        addFileset(fileSet);
    }

    public void setHidden(boolean z) {
        addArg(z, ATTR_HIDDEN);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setMaxParallel(int i) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the maxparallel attribute").toString(), getLocation());
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setParallel(boolean z) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the parallel attribute").toString(), getLocation());
    }

    public void setReadonly(boolean z) {
        addArg(z, ATTR_READONLY);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteOn
    public void setSkipEmptyFilesets(boolean z) {
        throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support the ").append("skipemptyfileset attribute").toString(), getLocation());
    }

    public void setSystem(boolean z) {
        addArg(z, ATTR_SYSTEM);
    }
}
