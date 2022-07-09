package org.apache.tools.ant.types.selectors;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.selectors.modifiedselector.ModifiedSelector;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/AbstractSelectorContainer.class */
public abstract class AbstractSelectorContainer extends DataType implements Cloneable, SelectorContainer {
    private Vector selectorsList = new Vector();

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void add(FileSelector fileSelector) {
        appendSelector(fileSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addAnd(AndSelector andSelector) {
        appendSelector(andSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContains(ContainsSelector containsSelector) {
        appendSelector(containsSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContainsRegexp(ContainsRegexpSelector containsRegexpSelector) {
        appendSelector(containsRegexpSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addCustom(ExtendSelector extendSelector) {
        appendSelector(extendSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDate(DateSelector dateSelector) {
        appendSelector(dateSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepend(DependSelector dependSelector) {
        appendSelector(dependSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepth(DepthSelector depthSelector) {
        appendSelector(depthSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDifferent(DifferentSelector differentSelector) {
        appendSelector(differentSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addFilename(FilenameSelector filenameSelector) {
        appendSelector(filenameSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addMajority(MajoritySelector majoritySelector) {
        appendSelector(majoritySelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addModified(ModifiedSelector modifiedSelector) {
        appendSelector(modifiedSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNone(NoneSelector noneSelector) {
        appendSelector(noneSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNot(NotSelector notSelector) {
        appendSelector(notSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addOr(OrSelector orSelector) {
        appendSelector(orSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addPresent(PresentSelector presentSelector) {
        appendSelector(presentSelector);
    }

    public void addReadable(ReadableSelector readableSelector) {
        appendSelector(readableSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSelector(SelectSelector selectSelector) {
        appendSelector(selectSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSize(SizeSelector sizeSelector) {
        appendSelector(sizeSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addType(TypeSelector typeSelector) {
        appendSelector(typeSelector);
    }

    public void addWritable(WritableSelector writableSelector) {
        appendSelector(writableSelector);
    }

    public void appendSelector(FileSelector fileSelector) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        this.selectorsList.addElement(fileSelector);
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        AbstractSelectorContainer abstractSelectorContainer;
        synchronized (this) {
            if (isReference()) {
                abstractSelectorContainer = ((AbstractSelectorContainer) getCheckedRef()).clone();
            } else {
                try {
                    abstractSelectorContainer = (AbstractSelectorContainer) super.clone();
                    abstractSelectorContainer.selectorsList = new Vector(this.selectorsList);
                } catch (CloneNotSupportedException e) {
                    throw new BuildException(e);
                }
            }
        }
        return abstractSelectorContainer;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    Iterator it = this.selectorsList.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        if (next instanceof DataType) {
                            pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
                        }
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public FileSelector[] getSelectors(Project project) {
        FileSelector[] fileSelectorArr;
        if (isReference()) {
            fileSelectorArr = ((AbstractSelectorContainer) getCheckedRef(project)).getSelectors(project);
        } else {
            dieOnCircularReference(project);
            fileSelectorArr = new FileSelector[this.selectorsList.size()];
            this.selectorsList.copyInto(fileSelectorArr);
        }
        return fileSelectorArr;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public boolean hasSelectors() {
        boolean z;
        if (isReference()) {
            z = ((AbstractSelectorContainer) getCheckedRef()).hasSelectors();
        } else {
            dieOnCircularReference();
            z = !this.selectorsList.isEmpty();
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public int selectorCount() {
        int size;
        if (isReference()) {
            size = ((AbstractSelectorContainer) getCheckedRef()).selectorCount();
        } else {
            dieOnCircularReference();
            size = this.selectorsList.size();
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public Enumeration selectorElements() {
        Enumeration elements;
        if (isReference()) {
            elements = ((AbstractSelectorContainer) getCheckedRef()).selectorElements();
        } else {
            dieOnCircularReference();
            elements = this.selectorsList.elements();
        }
        return elements;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        Enumeration selectorElements = selectorElements();
        if (selectorElements.hasMoreElements()) {
            while (selectorElements.hasMoreElements()) {
                stringBuffer.append(selectorElements.nextElement().toString());
                if (selectorElements.hasMoreElements()) {
                    stringBuffer.append(", ");
                }
            }
        }
        return stringBuffer.toString();
    }

    public void validate() {
        if (isReference()) {
            ((AbstractSelectorContainer) getCheckedRef()).validate();
        }
        dieOnCircularReference();
        Enumeration selectorElements = selectorElements();
        while (selectorElements.hasMoreElements()) {
            Object nextElement = selectorElements.nextElement();
            if (nextElement instanceof BaseSelector) {
                ((BaseSelector) nextElement).validate();
            }
        }
    }
}
