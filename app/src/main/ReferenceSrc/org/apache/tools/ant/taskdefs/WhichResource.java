package org.apache.tools.ant.taskdefs;

import java.net.URL;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/WhichResource.class */
public class WhichResource extends Task {
    private String classname;
    private Path classpath;
    private String property;
    private String resource;

    private void validate() {
        int i = 0;
        if (this.classname != null) {
            i = 0 + 1;
        }
        int i2 = i;
        if (this.resource != null) {
            i2 = i + 1;
        }
        if (i2 == 0) {
            throw new BuildException("One of classname or resource must be specified");
        }
        if (i2 > 1) {
            throw new BuildException("Only one of classname or resource can be specified");
        }
        if (this.property != null) {
            return;
        }
        throw new BuildException(MakeUrl.ERROR_NO_PROPERTY);
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[INVOKE, IF] complete} */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        if (this.classpath != null) {
            this.classpath = this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
            getProject().log(new StringBuffer().append("using user supplied classpath: ").append(this.classpath).toString(), 4);
        } else {
            this.classpath = new Path(getProject());
            this.classpath = this.classpath.concatSystemClasspath("only");
            getProject().log(new StringBuffer().append("using system classpath: ").append(this.classpath).toString(), 4);
        }
        AntClassLoader antClassLoader = null;
        try {
            antClassLoader = AntClassLoader.newAntClassLoader(getProject().getCoreLoader(), getProject(), this.classpath, false);
            if (this.classname != null) {
                this.resource = new StringBuffer().append(this.classname.replace('.', '/')).append(".class").toString();
            }
            if (this.resource == null) {
                throw new BuildException("One of class or resource is required");
            }
            if (this.resource.startsWith("/")) {
                this.resource = this.resource.substring(1);
            }
            log(new StringBuffer().append("Searching for ").append(this.resource).toString(), 3);
            URL resource = antClassLoader.getResource(this.resource);
            if (resource != null) {
                getProject().setNewProperty(this.property, resource.toExternalForm());
            }
        } finally {
            if (antClassLoader != null) {
                antClassLoader.cleanup();
            }
        }
    }

    public void setClass(String str) {
        this.classname = str;
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setResource(String str) {
        this.resource = str;
    }
}
