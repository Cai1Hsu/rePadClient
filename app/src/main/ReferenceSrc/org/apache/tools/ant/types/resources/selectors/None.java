package org.apache.tools.ant.types.resources.selectors;

import java.util.Iterator;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/None.class */
public class None extends ResourceSelectorContainer implements ResourceSelector {
    public None() {
    }

    public None(ResourceSelector[] resourceSelectorArr) {
        super(resourceSelectorArr);
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z = true;
        Iterator selectors = getSelectors();
        while (z && selectors.hasNext()) {
            z = !((ResourceSelector) selectors.next()).isSelected(resource);
        }
        return z;
    }
}
