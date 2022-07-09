package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.IdentityMapper;
import org.jivesoftware.smack.packet.PrivacyItem;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/PresentSelector.class */
public class PresentSelector extends BaseSelector {
    private File targetdir = null;
    private Mapper mapperElement = null;
    private FileNameMapper map = null;
    private boolean destmustexist = true;

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/PresentSelector$FilePresence.class */
    public static class FilePresence extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"srconly", PrivacyItem.PrivacyRule.SUBSCRIPTION_BOTH};
        }
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
                throw new BuildException(new StringBuffer().append("Invalid destination file results for ").append(this.targetdir).append(" with filename ").append(str).toString());
            }
            z = FileUtils.getFileUtils().resolveFile(this.targetdir, mapFileName[0]).exists() == this.destmustexist;
        }
        return z;
    }

    public void setPresent(FilePresence filePresence) {
        if (filePresence.getIndex() == 0) {
            this.destmustexist = false;
        }
    }

    public void setTargetdir(File file) {
        this.targetdir = file;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{presentselector targetdir: ");
        if (this.targetdir == null) {
            stringBuffer.append("NOT YET SET");
        } else {
            stringBuffer.append(this.targetdir.getName());
        }
        stringBuffer.append(" present: ");
        if (this.destmustexist) {
            stringBuffer.append(PrivacyItem.PrivacyRule.SUBSCRIPTION_BOTH);
        } else {
            stringBuffer.append("srconly");
        }
        if (this.map != null) {
            stringBuffer.append(this.map.toString());
        } else if (this.mapperElement != null) {
            stringBuffer.append(this.mapperElement.toString());
        }
        stringBuffer.append("}");
        return stringBuffer.toString();
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
