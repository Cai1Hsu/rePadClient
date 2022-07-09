package org.apache.tools.ant.types.resources.selectors;

import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Not.class */
public class Not implements ResourceSelector {
    private ResourceSelector sel;

    public Not() {
    }

    public Not(ResourceSelector resourceSelector) {
        add(resourceSelector);
    }

    public void add(ResourceSelector resourceSelector) {
        if (this.sel != null) {
            throw new IllegalStateException("The Not ResourceSelector accepts a single nested ResourceSelector");
        }
        this.sel = resourceSelector;
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        return !this.sel.isSelected(resource);
    }
}
