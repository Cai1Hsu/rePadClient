package org.apache.tools.ant.types.selectors;

import java.util.Enumeration;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.selectors.modifiedselector.ModifiedSelector;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/SelectorContainer.class */
public interface SelectorContainer {
    void add(FileSelector fileSelector);

    void addAnd(AndSelector andSelector);

    void addContains(ContainsSelector containsSelector);

    void addContainsRegexp(ContainsRegexpSelector containsRegexpSelector);

    void addCustom(ExtendSelector extendSelector);

    void addDate(DateSelector dateSelector);

    void addDepend(DependSelector dependSelector);

    void addDepth(DepthSelector depthSelector);

    void addDifferent(DifferentSelector differentSelector);

    void addFilename(FilenameSelector filenameSelector);

    void addMajority(MajoritySelector majoritySelector);

    void addModified(ModifiedSelector modifiedSelector);

    void addNone(NoneSelector noneSelector);

    void addNot(NotSelector notSelector);

    void addOr(OrSelector orSelector);

    void addPresent(PresentSelector presentSelector);

    void addSelector(SelectSelector selectSelector);

    void addSize(SizeSelector sizeSelector);

    void addType(TypeSelector typeSelector);

    void appendSelector(FileSelector fileSelector);

    FileSelector[] getSelectors(Project project);

    boolean hasSelectors();

    int selectorCount();

    Enumeration selectorElements();
}
