package org.apache.tools.ant.types.selectors;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/DependSelector.class */
public class DependSelector extends MappingSelector {
    @Override // org.apache.tools.ant.types.selectors.MappingSelector
    public boolean selectionTest(File file, File file2) {
        return SelectorUtils.isOutOfDate(file, file2, this.granularity);
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{dependselector targetdir: ");
        if (this.targetdir == null) {
            stringBuffer.append("NOT YET SET");
        } else {
            stringBuffer.append(this.targetdir.getName());
        }
        stringBuffer.append(" granularity: ");
        stringBuffer.append(this.granularity);
        if (this.map != null) {
            stringBuffer.append(" mapper: ");
            stringBuffer.append(this.map.toString());
        } else if (this.mapperElement != null) {
            stringBuffer.append(" mapper: ");
            stringBuffer.append(this.mapperElement.toString());
        }
        stringBuffer.append("}");
        return stringBuffer.toString();
    }
}
