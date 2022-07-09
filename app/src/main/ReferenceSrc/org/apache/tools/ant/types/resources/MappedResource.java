package org.apache.tools.ant.types.resources;

import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileNameMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/MappedResource.class */
public class MappedResource extends ResourceDecorator {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private final FileNameMapper mapper;

    public MappedResource(Resource resource, FileNameMapper fileNameMapper) {
        super(resource);
        this.mapper = fileNameMapper;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public Object as(Class cls) {
        Class cls2;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls2 = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        return cls2.isAssignableFrom(cls) ? null : getResource().as(cls);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0034, code lost:
        if (r0 == null) goto L13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x0037, code lost:
        r6 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0044, code lost:
        if (getResource().equals(r0.getResource()) == false) goto L7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0047, code lost:
        r6 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0055, code lost:
        if (r0.equals(r0) != false) goto L13;
     */
    @Override // org.apache.tools.ant.types.Resource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = false;
        if (obj != null) {
            if (!obj.getClass().equals(getClass())) {
                z = false;
            } else {
                MappedResource mappedResource = (MappedResource) obj;
                String name = getName();
                String name2 = mappedResource.getName();
                z = name == null ? false : false;
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public String getName() {
        String name = getResource().getName();
        if (!isReference()) {
            String[] mapFileName = this.mapper.mapFileName(name);
            name = (mapFileName == null || mapFileName.length <= 0) ? null : mapFileName[0];
        }
        return name;
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource
    public int hashCode() {
        String name = getName();
        return name == null ? super.hashCode() : name.hashCode();
    }

    @Override // org.apache.tools.ant.types.resources.ResourceDecorator, org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.mapper != null) {
            throw noChildrenAllowed();
        }
        super.setRefid(reference);
    }
}
