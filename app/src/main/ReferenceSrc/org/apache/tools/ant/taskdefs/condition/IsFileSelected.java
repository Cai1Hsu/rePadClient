package org.apache.tools.ant.taskdefs.condition;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.selectors.AbstractSelectorContainer;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsFileSelected.class */
public class IsFileSelected extends AbstractSelectorContainer implements Condition {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File baseDir;
    private File file;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() {
        if (this.file == null) {
            throw new BuildException("file attribute not set");
        }
        validate();
        File file = this.baseDir;
        File file2 = file;
        if (file == null) {
            file2 = getProject().getBaseDir();
        }
        return getSelectors(getProject())[0].isSelected(file2, FILE_UTILS.removeLeadingPath(file2, this.file), this.file);
    }

    public void setBaseDir(File file) {
        this.baseDir = file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    @Override // org.apache.tools.ant.types.selectors.AbstractSelectorContainer
    public void validate() {
        if (selectorCount() != 1) {
            throw new BuildException("Only one selector allowed");
        }
        super.validate();
    }
}
