package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.Enumeration;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SelectSelector.class */
public class SelectSelector extends BaseSelectorContainer {
    private Object ifCondition;
    private Object unlessCondition;

    private SelectSelector getRef() {
        return (SelectSelector) getCheckedRef(getClass(), "SelectSelector");
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public void appendSelector(FileSelector fileSelector) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        super.appendSelector(fileSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public FileSelector[] getSelectors(Project project) {
        return isReference() ? getRef().getSelectors(project) : super.getSelectors(project);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public boolean hasSelectors() {
        return isReference() ? getRef().hasSelectors() : super.hasSelectors();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean isSelected;
        validate();
        if (!passesConditions()) {
            isSelected = false;
        } else {
            Enumeration selectorElements = selectorElements();
            isSelected = !selectorElements.hasMoreElements() ? true : ((FileSelector) selectorElements.nextElement()).isSelected(file, str, file2);
        }
        return isSelected;
    }

    public boolean passesConditions() {
        PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
        return propertyHelper.testIfCondition(this.ifCondition) && propertyHelper.testUnlessCondition(this.unlessCondition);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public int selectorCount() {
        return isReference() ? getRef().selectorCount() : super.selectorCount();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public Enumeration selectorElements() {
        return isReference() ? getRef().selectorElements() : super.selectorElements();
    }

    public void setIf(Object obj) {
        this.ifCondition = obj;
    }

    public void setIf(String str) {
        setIf((Object) str);
    }

    public void setUnless(Object obj) {
        this.unlessCondition = obj;
    }

    public void setUnless(String str) {
        setUnless((Object) str);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelectorContainer, org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        if (hasSelectors()) {
            stringBuffer.append("{select");
            if (this.ifCondition != null) {
                stringBuffer.append(" if: ");
                stringBuffer.append(this.ifCondition);
            }
            if (this.unlessCondition != null) {
                stringBuffer.append(" unless: ");
                stringBuffer.append(this.unlessCondition);
            }
            stringBuffer.append(" ");
            stringBuffer.append(super.toString());
            stringBuffer.append("}");
        }
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        int selectorCount = selectorCount();
        if (selectorCount < 0 || selectorCount > 1) {
            setError("Only one selector is allowed within the <selector> tag");
        }
    }
}
