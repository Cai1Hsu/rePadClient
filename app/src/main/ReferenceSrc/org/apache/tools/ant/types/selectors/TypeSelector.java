package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/TypeSelector.class */
public class TypeSelector extends BaseExtendSelector {
    public static final String TYPE_KEY = "type";
    private String type = null;

    /* loaded from: classes.jar:org/apache/tools/ant/types/selectors/TypeSelector$FileType.class */
    public static class FileType extends EnumeratedAttribute {
        public static final String DIR = "dir";
        public static final String FILE = "file";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"file", "dir"};
        }
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        validate();
        return file2.isDirectory() ? this.type.equals("dir") : this.type.equals("file");
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if ("type".equalsIgnoreCase(name)) {
                    FileType fileType = new FileType();
                    fileType.setValue(parameterArr[i].getValue());
                    setType(fileType);
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setType(FileType fileType) {
        this.type = fileType.getValue();
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{typeselector type: ");
        stringBuffer.append(this.type);
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.type == null) {
            setError("The type attribute is required");
        }
    }
}
