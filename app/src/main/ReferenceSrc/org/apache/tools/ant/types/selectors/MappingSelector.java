package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.IdentityMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/MappingSelector.class */
public abstract class MappingSelector extends BaseSelector {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    protected int granularity;
    protected File targetdir = null;
    protected Mapper mapperElement = null;
    protected FileNameMapper map = null;

    public MappingSelector() {
        this.granularity = 0;
        this.granularity = (int) FILE_UTILS.getFileTimestampGranularity();
    }

    public void addConfigured(FileNameMapper fileNameMapper) {
        if (this.map == null && this.mapperElement == null) {
            this.map = fileNameMapper;
            return;
        }
        throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS);
    }

    public Mapper createMapper() throws BuildException {
        if (this.map == null && this.mapperElement == null) {
            this.mapperElement = new Mapper(getProject());
            return this.mapperElement;
        }
        throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean z = false;
        validate();
        String[] mapFileName = this.map.mapFileName(str);
        if (mapFileName != null) {
            if (mapFileName.length != 1 || mapFileName[0] == null) {
                throw new BuildException(new StringBuffer().append("Invalid destination file results for ").append(this.targetdir.getName()).append(" with filename ").append(str).toString());
            }
            z = selectionTest(file2, FILE_UTILS.resolveFile(this.targetdir, mapFileName[0]));
        }
        return z;
    }

    protected abstract boolean selectionTest(File file, File file2);

    public void setGranularity(int i) {
        this.granularity = i;
    }

    public void setTargetdir(File file) {
        this.targetdir = file;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.targetdir == null) {
            setError("The targetdir attribute is required.");
        }
        if (this.map == null) {
            if (this.mapperElement == null) {
                this.map = new IdentityMapper();
                return;
            }
            this.map = this.mapperElement.getImplementation();
            if (this.map != null) {
                return;
            }
            setError("Could not set <mapper> element.");
        }
    }
}
