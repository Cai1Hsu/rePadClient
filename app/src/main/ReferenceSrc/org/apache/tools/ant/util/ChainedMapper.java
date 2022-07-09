package org.apache.tools.ant.util;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes.jar:org/apache/tools/ant/util/ChainedMapper.class */
public class ChainedMapper extends ContainerMapper {
    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        ArrayList<String> arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(str);
        for (FileNameMapper fileNameMapper : getMappers()) {
            if (fileNameMapper != null) {
                arrayList.clear();
                arrayList.addAll(arrayList2);
                arrayList2.clear();
                for (String str2 : arrayList) {
                    String[] mapFileName = fileNameMapper.mapFileName(str2);
                    if (mapFileName != null) {
                        arrayList2.addAll(Arrays.asList(mapFileName));
                    }
                }
            }
        }
        return arrayList2.size() == 0 ? null : (String[]) arrayList2.toArray(new String[arrayList2.size()]);
    }
}
