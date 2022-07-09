package org.apache.tools.ant.types.resources;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/SizeLimitCollection.class */
public abstract class SizeLimitCollection extends BaseResourceCollectionWrapper {
    private static final String BAD_COUNT = "size-limited collection count should be set to an int >= 0";
    private int count = 1;

    public int getCount() {
        int i;
        synchronized (this) {
            i = this.count;
        }
        return i;
    }

    protected int getValidCount() {
        int count = getCount();
        if (count < 0) {
            throw new BuildException(BAD_COUNT);
        }
        return count;
    }

    public void setCount(int i) {
        synchronized (this) {
            checkAttributesAllowed();
            this.count = i;
        }
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper, org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            size = getResourceCollection().size();
            int validCount = getValidCount();
            if (size >= validCount) {
                size = validCount;
            }
        }
        return size;
    }
}
