package org.apache.tools.ant.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.tools.ant.types.Mapper;

/* loaded from: classes.jar:org/apache/tools/ant/util/ContainerMapper.class */
public abstract class ContainerMapper implements FileNameMapper {
    private List mappers = new ArrayList();

    public void add(FileNameMapper fileNameMapper) {
        synchronized (this) {
            if (this != fileNameMapper) {
                if (!(fileNameMapper instanceof ContainerMapper) || !((ContainerMapper) fileNameMapper).contains(this)) {
                    this.mappers.add(fileNameMapper);
                }
            }
            throw new IllegalArgumentException("Circular mapper containment condition detected");
        }
    }

    public void addConfigured(FileNameMapper fileNameMapper) {
        add(fileNameMapper);
    }

    public void addConfiguredMapper(Mapper mapper) {
        add(mapper.getImplementation());
    }

    protected boolean contains(FileNameMapper fileNameMapper) {
        boolean z;
        synchronized (this) {
            z = false;
            Iterator it = this.mappers.iterator();
            while (it.hasNext() && !z) {
                FileNameMapper fileNameMapper2 = (FileNameMapper) it.next();
                z = fileNameMapper2 == fileNameMapper || ((fileNameMapper2 instanceof ContainerMapper) && ((ContainerMapper) fileNameMapper2).contains(fileNameMapper));
            }
        }
        return z;
    }

    public List getMappers() {
        List unmodifiableList;
        synchronized (this) {
            unmodifiableList = Collections.unmodifiableList(this.mappers);
        }
        return unmodifiableList;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) {
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
    }
}
