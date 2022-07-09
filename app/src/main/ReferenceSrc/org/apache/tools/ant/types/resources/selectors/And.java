package org.apache.tools.ant.types.resources.selectors;

import java.util.Iterator;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/And.class */
public class And extends ResourceSelectorContainer implements ResourceSelector {
    public And() {
    }

    public And(ResourceSelector[] resourceSelectorArr) {
        super(resourceSelectorArr);
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z;
        Iterator selectors = getSelectors();
        while (true) {
            if (!selectors.hasNext()) {
                z = true;
                break;
            } else if (!((ResourceSelector) selectors.next()).isSelected(resource)) {
                z = false;
                break;
            }
        }
        return z;
    }
}
