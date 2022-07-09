package org.apache.tools.ant.types.resources.selectors;

import java.util.Iterator;
import org.apache.tools.ant.types.Resource;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Majority.class */
public class Majority extends ResourceSelectorContainer implements ResourceSelector {
    private boolean tie = true;

    public Majority() {
    }

    public Majority(ResourceSelector[] resourceSelectorArr) {
        super(resourceSelectorArr);
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z;
        synchronized (this) {
            int i = 0;
            int i2 = 0;
            int selectorCount = selectorCount();
            boolean z2 = selectorCount % 2 == 0;
            int i3 = selectorCount / 2;
            Iterator selectors = getSelectors();
            while (selectors.hasNext()) {
                if (!((ResourceSelector) selectors.next()).isSelected(resource)) {
                    int i4 = i2 + 1;
                    if (i4 <= i3) {
                        i2 = i4;
                        if (z2) {
                            i2 = i4;
                            if (!this.tie) {
                                i2 = i4;
                                if (i4 == i3) {
                                }
                            } else {
                                continue;
                            }
                        } else {
                            continue;
                        }
                    }
                    z = false;
                    break;
                }
                int i5 = i + 1;
                if (i5 <= i3) {
                    i = i5;
                    if (z2) {
                        i = i5;
                        if (this.tie) {
                            i = i5;
                            if (i5 == i3) {
                            }
                        } else {
                            continue;
                        }
                    } else {
                        continue;
                    }
                }
                z = true;
                break;
            }
            z = false;
        }
        return z;
    }

    public void setAllowtie(boolean z) {
        synchronized (this) {
            this.tie = z;
        }
    }
}
