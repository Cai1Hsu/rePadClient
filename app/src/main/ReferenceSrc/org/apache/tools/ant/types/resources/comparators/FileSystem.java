package org.apache.tools.ant.types.resources.comparators;

import java.io.File;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/comparators/FileSystem.class */
public class FileSystem extends ResourceComparator {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.resources.comparators.ResourceComparator
    protected int resourceCompare(Resource resource, Resource resource2) {
        Class cls;
        Class cls2;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        if (fileProvider == null) {
            throw new ClassCastException(new StringBuffer().append(resource.getClass()).append(" doesn't provide files").toString());
        }
        File file = fileProvider.getFile();
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls2 = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider2 = (FileProvider) resource2.as(cls2);
        if (fileProvider2 == null) {
            throw new ClassCastException(new StringBuffer().append(resource2.getClass()).append(" doesn't provide files").toString());
        }
        File file2 = fileProvider2.getFile();
        return file.equals(file2) ? 0 : FILE_UTILS.isLeadingPath(file, file2) ? -1 : FILE_UTILS.normalize(file.getAbsolutePath()).compareTo(FILE_UTILS.normalize(file2.getAbsolutePath()));
    }
}
