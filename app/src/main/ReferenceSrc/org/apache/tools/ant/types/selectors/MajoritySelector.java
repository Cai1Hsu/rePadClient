package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.Enumeration;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/MajoritySelector.class */
public class MajoritySelector extends BaseSelectorContainer {
    private boolean allowtie = true;

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        validate();
        int i = 0;
        int i2 = 0;
        Enumeration selectorElements = selectorElements();
        while (selectorElements.hasMoreElements()) {
            if (((FileSelector) selectorElements.nextElement()).isSelected(file, str, file2)) {
                i++;
            } else {
                i2++;
            }
        }
        return i > i2 ? true : i2 > i ? false : this.allowtie;
    }

    public void setAllowtie(boolean z) {
        this.allowtie = z;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (hasSelectors()) {
            stringBuffer.append("{majorityselect: ");
            stringBuffer.append(super.toString());
            stringBuffer.append("}");
        }
        return stringBuffer.toString();
    }
}
