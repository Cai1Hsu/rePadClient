package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.Enumeration;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/AndSelector.class */
public class AndSelector extends BaseSelectorContainer {
    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean z;
        validate();
        Enumeration selectorElements = selectorElements();
        while (true) {
            if (!selectorElements.hasMoreElements()) {
                z = true;
                break;
            } else if (!((FileSelector) selectorElements.nextElement()).isSelected(file, str, file2)) {
                z = false;
                break;
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (hasSelectors()) {
            stringBuffer.append("{andselect: ");
            stringBuffer.append(super.toString());
            stringBuffer.append("}");
        }
        return stringBuffer.toString();
    }
}
