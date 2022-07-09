package org.apache.tools.ant.types.resources;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Union.class */
public class Union extends BaseResourceCollectionContainer {
    public Union() {
    }

    public Union(Project project) {
        super(project);
    }

    public Union(Project project, ResourceCollection resourceCollection) {
        super(project);
        add(resourceCollection);
    }

    public Union(ResourceCollection resourceCollection) {
        this(Project.getProject(resourceCollection), resourceCollection);
    }

    public static Union getInstance(ResourceCollection resourceCollection) {
        return resourceCollection instanceof Union ? (Union) resourceCollection : new Union(resourceCollection);
    }

    private static ResourceCollection nextRC(Iterator it) {
        return (ResourceCollection) it.next();
    }

    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionContainer
    protected Collection getCollection() {
        return getCollection(false);
    }

    protected Collection getCollection(boolean z) {
        Collection collection;
        List resourceCollections = getResourceCollections();
        if (!resourceCollections.isEmpty()) {
            LinkedHashSet linkedHashSet = new LinkedHashSet(resourceCollections.size() * 2);
            Iterator it = resourceCollections.iterator();
            while (true) {
                collection = linkedHashSet;
                if (!it.hasNext()) {
                    break;
                }
                for (Object obj : nextRC(it)) {
                    String str = obj;
                    if (z) {
                        str = obj.toString();
                    }
                    linkedHashSet.add(str);
                }
            }
        } else {
            collection = Collections.EMPTY_LIST;
        }
        return collection;
    }

    public String[] list() {
        String[] strArr;
        if (isReference()) {
            strArr = ((Union) getCheckedRef()).list();
        } else {
            Collection collection = getCollection(true);
            strArr = (String[]) collection.toArray(new String[collection.size()]);
        }
        return strArr;
    }

    public Resource[] listResources() {
        Resource[] resourceArr;
        if (isReference()) {
            resourceArr = ((Union) getCheckedRef()).listResources();
        } else {
            Collection collection = getCollection();
            resourceArr = (Resource[]) collection.toArray(new Resource[collection.size()]);
        }
        return resourceArr;
    }
}
