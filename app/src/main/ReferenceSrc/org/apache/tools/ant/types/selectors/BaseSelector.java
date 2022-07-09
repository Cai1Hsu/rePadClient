package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.DataType;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/BaseSelector.class */
public abstract class BaseSelector extends DataType implements FileSelector {
    private String errmsg = null;

    public String getError() {
        return this.errmsg;
    }

    public abstract boolean isSelected(File file, String str, File file2);

    public void setError(String str) {
        if (this.errmsg == null) {
            this.errmsg = str;
        }
    }

    public void validate() {
        if (getError() == null) {
            verifySettings();
        }
        if (getError() != null) {
            throw new BuildException(this.errmsg);
        }
        if (isReference()) {
            return;
        }
        dieOnCircularReference();
    }

    public void verifySettings() {
        if (isReference()) {
            ((BaseSelector) getCheckedRef()).verifySettings();
        }
    }
}
