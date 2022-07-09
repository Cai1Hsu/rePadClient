package org.apache.tools.ant.types.resources.selectors;

import java.util.Iterator;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Or.class */
public class Or extends ResourceSelectorContainer implements ResourceSelector {
    public Or() {
    }

    public Or(ResourceSelector[] resourceSelectorArr) {
        super(resourceSelectorArr);
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z;
        Iterator selectors = getSelectors();
        while (true) {
            if (!selectors.hasNext()) {
                z = false;
                break;
            } else if (((ResourceSelector) selectors.next()).isSelected(resource)) {
                z = true;
                break;
            }
        }
        return z;
    }
}
