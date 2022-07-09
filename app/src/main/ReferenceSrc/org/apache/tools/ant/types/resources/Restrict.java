package org.apache.tools.ant.types.resources;

import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.types.resources.selectors.ResourceSelectorContainer;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Restrict.class */
public class Restrict extends ResourceSelectorContainer implements ResourceCollection {
    private LazyResourceCollectionWrapper w = new LazyResourceCollectionWrapper(this) { // from class: org.apache.tools.ant.types.resources.Restrict.1
        private final Restrict this$0;

        {
            this.this$0 = this;
        }

        @Override // org.apache.tools.ant.types.resources.LazyResourceCollectionWrapper
        protected boolean filterResource(Resource resource) {
            boolean z;
            Iterator selectors = this.this$0.getSelectors();
            while (true) {
                if (!selectors.hasNext()) {
                    z = false;
                    break;
                } else if (!((ResourceSelector) selectors.next()).isSelected(resource)) {
                    z = true;
                    break;
                }
            }
            return z;
        }
    };

    public void add(ResourceCollection resourceCollection) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (resourceCollection != null) {
                this.w.add(resourceCollection);
                setChecked(false);
            }
        }
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelectorContainer
    public void add(ResourceSelector resourceSelector) {
        synchronized (this) {
            if (resourceSelector != null) {
                super.add(resourceSelector);
                FailFast.invalidate(this);
            }
        }
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelectorContainer, org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) {
        synchronized (this) {
            if (!isChecked()) {
                super.dieOnCircularReference(stack, project);
                if (!isReference()) {
                    pushAndInvokeCircularReferenceCheck(this.w, stack, project);
                    setChecked(true);
                }
            }
        }
    }

    public boolean isCache() {
        boolean isCache;
        synchronized (this) {
            isCache = this.w.isCache();
        }
        return isCache;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean isFilesystemOnly;
        synchronized (this) {
            if (isReference()) {
                isFilesystemOnly = ((Restrict) getCheckedRef()).isFilesystemOnly();
            } else {
                dieOnCircularReference();
                isFilesystemOnly = this.w.isFilesystemOnly();
            }
        }
        return isFilesystemOnly;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public final Iterator iterator() {
        Iterator it;
        synchronized (this) {
            if (isReference()) {
                it = ((Restrict) getCheckedRef()).iterator();
            } else {
                dieOnCircularReference();
                it = this.w.iterator();
            }
        }
        return it;
    }

    public void setCache(boolean z) {
        synchronized (this) {
            this.w.setCache(z);
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            if (isReference()) {
                size = ((Restrict) getCheckedRef()).size();
            } else {
                dieOnCircularReference();
                size = this.w.size();
            }
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String lazyResourceCollectionWrapper;
        synchronized (this) {
            if (isReference()) {
                lazyResourceCollectionWrapper = getCheckedRef().toString();
            } else {
                dieOnCircularReference();
                lazyResourceCollectionWrapper = this.w.toString();
            }
        }
        return lazyResourceCollectionWrapper;
    }
}
