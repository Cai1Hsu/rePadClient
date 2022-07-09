package org.apache.tools.ant.types.selectors;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/NotSelector.class */
public class NotSelector extends NoneSelector {
    public NotSelector() {
    }

    public NotSelector(FileSelector fileSelector) {
        this();
        appendSelector(fileSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.NoneSelector, org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (hasSelectors()) {
            stringBuffer.append("{notselect: ");
            stringBuffer.append(super.toString());
            stringBuffer.append("}");
        }
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (selectorCount() != 1) {
            setError("One and only one selector is allowed within the <not> tag");
        }
    }
}
