package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/AntlibDefinition.class */
public class AntlibDefinition extends Task {
    private ClassLoader antlibClassLoader;
    private String uri = "";

    public ClassLoader getAntlibClassLoader() {
        return this.antlibClassLoader;
    }

    public String getURI() {
        return this.uri;
    }

    public void setAntlibClassLoader(ClassLoader classLoader) {
        this.antlibClassLoader = classLoader;
    }

    public void setURI(String str) throws BuildException {
        String str2 = str;
        if (str.equals(ProjectHelper.ANT_CORE_URI)) {
            str2 = "";
        }
        if (str2.startsWith("ant:")) {
            throw new BuildException(new StringBuffer().append("Attempt to use a reserved URI ").append(str2).toString());
        }
        this.uri = str2;
    }
}
