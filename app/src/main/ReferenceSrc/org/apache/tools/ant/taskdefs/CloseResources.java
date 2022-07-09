package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import java.util.Iterator;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.URLProvider;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/CloseResources.class */
public class CloseResources extends Task {
    static Class class$org$apache$tools$ant$types$resources$URLProvider;
    private Union resources = new Union();

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        this.resources.add(resourceCollection);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        Class cls;
        Iterator it = this.resources.iterator();
        while (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.URLProvider");
                class$org$apache$tools$ant$types$resources$URLProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$URLProvider;
            }
            URLProvider uRLProvider = (URLProvider) resource.as(cls);
            if (uRLProvider != null) {
                try {
                    FileUtils.close(uRLProvider.getURL().openConnection());
                } catch (IOException e) {
                }
            }
        }
    }
}
