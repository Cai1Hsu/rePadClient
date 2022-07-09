package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/WritableSelector.class */
public class WritableSelector implements FileSelector, ResourceSelector {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        return file2 != null && file2.canWrite();
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        Class cls;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        return fileProvider != null ? isSelected(null, null, fileProvider.getFile()) : false;
    }
}
