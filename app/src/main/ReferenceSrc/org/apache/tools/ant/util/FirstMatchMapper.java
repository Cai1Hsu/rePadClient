package org.apache.tools.ant.util;

import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/util/FirstMatchMapper.class */
public class FirstMatchMapper extends ContainerMapper {
    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        String[] strArr;
        String[] mapFileName;
        Iterator it = getMappers().iterator();
        while (true) {
            if (!it.hasNext()) {
                strArr = null;
                break;
            }
            FileNameMapper fileNameMapper = (FileNameMapper) it.next();
            if (fileNameMapper != null && (mapFileName = fileNameMapper.mapFileName(str)) != null) {
                strArr = mapFileName;
                break;
            }
        }
        return strArr;
    }
}
