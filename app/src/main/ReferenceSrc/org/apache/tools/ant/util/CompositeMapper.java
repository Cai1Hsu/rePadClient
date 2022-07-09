package org.apache.tools.ant.util;

import java.util.LinkedHashSet;

/* loaded from: classes.jar:org/apache/tools/ant/util/CompositeMapper.class */
public class CompositeMapper extends ContainerMapper {
    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        String[] mapFileName;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        for (FileNameMapper fileNameMapper : getMappers()) {
            if (fileNameMapper != null && (mapFileName = fileNameMapper.mapFileName(str)) != null) {
                for (String str2 : mapFileName) {
                    linkedHashSet.add(str2);
                }
            }
        }
        return linkedHashSet.size() == 0 ? null : (String[]) linkedHashSet.toArray(new String[linkedHashSet.size()]);
    }
}
