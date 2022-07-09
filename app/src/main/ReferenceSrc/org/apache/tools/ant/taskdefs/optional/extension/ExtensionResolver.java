package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver.class */
public interface ExtensionResolver {
    File resolve(Extension extension, Project project) throws BuildException;
}
