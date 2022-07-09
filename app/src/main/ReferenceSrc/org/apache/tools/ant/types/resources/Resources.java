package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.CollectionUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Resources.class */
public class Resources extends DataType implements ResourceCollection {
    static Class class$org$apache$tools$ant$types$ResourceCollection;
    private boolean cache = false;
    private Collection coll;
    private Vector rc;
    public static final ResourceCollection NONE = new ResourceCollection() { // from class: org.apache.tools.ant.types.resources.Resources.1
        @Override // org.apache.tools.ant.types.ResourceCollection
        public boolean isFilesystemOnly() {
            return true;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public Iterator iterator() {
            return Resources.EMPTY_ITERATOR;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public int size() {
            return 0;
        }
    };
    public static final Iterator EMPTY_ITERATOR = new Iterator() { // from class: org.apache.tools.ant.types.resources.Resources.2
        @Override // java.util.Iterator
        public boolean hasNext() {
            return false;
        }

        @Override // java.util.Iterator
        public Object next() {
            throw new NoSuchElementException();
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    };

    /* loaded from: classes.jar:org/apache/tools/ant/types/resources/Resources$MyCollection.class */
    private class MyCollection extends AbstractCollection {
        private Collection cached;
        private final Resources this$0;

        /* loaded from: classes.jar:org/apache/tools/ant/types/resources/Resources$MyCollection$MyIterator.class */
        private class MyIterator implements Iterator {
            private Iterator rci;
            private Iterator ri;
            private final MyCollection this$1;

            private MyIterator(MyCollection myCollection) {
                this.this$1 = myCollection;
                this.rci = this.this$1.this$0.getNested().iterator();
                this.ri = null;
            }

            MyIterator(MyCollection myCollection, AnonymousClass1 anonymousClass1) {
                this(myCollection);
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                boolean z;
                boolean z2 = this.ri != null && this.ri.hasNext();
                while (true) {
                    z = z2;
                    if (z || !this.rci.hasNext()) {
                        break;
                    }
                    this.ri = ((ResourceCollection) this.rci.next()).iterator();
                    z2 = this.ri.hasNext();
                }
                return z;
            }

            @Override // java.util.Iterator
            public Object next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return this.ri.next();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        }

        MyCollection(Resources resources) {
            this.this$0 = resources;
        }

        private Collection getCache() {
            Collection collection;
            synchronized (this) {
                Collection collection2 = this.cached;
                collection = collection2;
                if (collection2 == null) {
                    Collection asCollection = CollectionUtils.asCollection(new MyIterator(this, null));
                    collection = asCollection;
                    if (this.this$0.cache) {
                        this.cached = asCollection;
                        collection = asCollection;
                    }
                }
            }
            return collection;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator iterator() {
            return getCache().iterator();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return getCache().size();
        }
    }

    public Resources() {
    }

    public Resources(Project project) {
        setProject(project);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v9, types: [java.util.List] */
    public List getNested() {
        Vector vector;
        synchronized (this) {
            vector = this.rc == null ? Collections.EMPTY_LIST : this.rc;
        }
        return vector;
    }

    private ResourceCollection getRef() {
        Class cls;
        if (class$org$apache$tools$ant$types$ResourceCollection == null) {
            cls = class$("org.apache.tools.ant.types.ResourceCollection");
            class$org$apache$tools$ant$types$ResourceCollection = cls;
        } else {
            cls = class$org$apache$tools$ant$types$ResourceCollection;
        }
        return (ResourceCollection) getCheckedRef(cls, "ResourceCollection");
    }

    private void validate() {
        synchronized (this) {
            dieOnCircularReference();
            this.coll = this.coll == null ? new MyCollection(this) : this.coll;
        }
    }

    public void add(ResourceCollection resourceCollection) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (resourceCollection != null) {
                if (this.rc == null) {
                    this.rc = new Vector();
                }
                this.rc.add(resourceCollection);
                invalidateExistingIterators();
                this.coll = null;
                setChecked(false);
            }
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        if (isChecked()) {
            return;
        }
        if (isReference()) {
            super.dieOnCircularReference(stack, project);
            return;
        }
        for (Object obj : getNested()) {
            if (obj instanceof DataType) {
                pushAndInvokeCircularReferenceCheck((DataType) obj, stack, project);
            }
        }
        setChecked(true);
    }

    protected void invalidateExistingIterators() {
        FailFast.invalidate(this);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        boolean z;
        if (!isReference()) {
            validate();
            Iterator it = getNested().iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = true;
                    break;
                } else if (!((ResourceCollection) it.next()).isFilesystemOnly()) {
                    z = false;
                    break;
                }
            }
        } else {
            z = getRef().isFilesystemOnly();
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        FailFast failFast;
        synchronized (this) {
            if (isReference()) {
                failFast = getRef().iterator();
            } else {
                validate();
                failFast = new FailFast(this, this.coll.iterator());
            }
        }
        return failFast;
    }

    public void setCache(boolean z) {
        synchronized (this) {
            this.cache = z;
        }
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int size;
        synchronized (this) {
            if (isReference()) {
                size = getRef().size();
            } else {
                validate();
                size = this.coll.size();
            }
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String str;
        synchronized (this) {
            if (isReference()) {
                str = getCheckedRef().toString();
            } else {
                validate();
                if (this.coll == null || this.coll.isEmpty()) {
                    str = "";
                } else {
                    StringBuffer stringBuffer = new StringBuffer();
                    for (Object obj : this.coll) {
                        if (stringBuffer.length() > 0) {
                            stringBuffer.append(File.pathSeparatorChar);
                        }
                        stringBuffer.append(obj);
                    }
                    str = stringBuffer.toString();
                }
            }
        }
        return str;
    }
}
