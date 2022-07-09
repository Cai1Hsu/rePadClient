package org.apache.tools.ant.taskdefs.optional.extension.resolvers;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.optional.extension.Extension;
import org.apache.tools.ant.taskdefs.optional.extension.ExtensionResolver;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver.class */
public class LocationResolver implements ExtensionResolver {
    private String location;

    @Override // org.apache.tools.ant.taskdefs.optional.extension.ExtensionResolver
    public File resolve(Extension extension, Project project) throws BuildException {
        if (this.location == null) {
            throw new BuildException("No location specified for resolver");
        }
        return project.resolveFile(this.location);
    }

    public void setLocation(String str) {
        this.location = str;
    }

    public String toString() {
        return new StringBuffer().append("Location[").append(this.location).append("]").toString();
    }
}
