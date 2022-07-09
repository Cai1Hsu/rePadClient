package org.apache.tools.ant.types.resources.selectors;

import org.apache.tools.ant.types.Comparison;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Size.class */
public class Size implements ResourceSelector {
    private long size = -1;
    private Comparison when = Comparison.EQUAL;

    public long getSize() {
        return this.size;
    }

    public Comparison getWhen() {
        return this.when;
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        long size = resource.getSize() - this.size;
        return this.when.evaluate(size == 0 ? 0 : (int) (size / Math.abs(size)));
    }

    public void setSize(long j) {
        this.size = j;
    }

    public void setWhen(Comparison comparison) {
        this.when = comparison;
    }
}
