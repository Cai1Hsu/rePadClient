package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.taskdefs.condition.IsSigned;
import org.apache.tools.ant.types.DataType;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SignedSelector.class */
public class SignedSelector extends DataType implements FileSelector {
    private IsSigned isSigned = new IsSigned();

    @Override // org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean eval;
        if (file2.isDirectory()) {
            eval = false;
        } else {
            this.isSigned.setProject(getProject());
            this.isSigned.setFile(file2);
            eval = this.isSigned.eval();
        }
        return eval;
    }

    public void setName(String str) {
        this.isSigned.setName(str);
    }
}
