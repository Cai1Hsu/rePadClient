package org.apache.tools.ant.taskdefs.optional.jsp.compilers;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.jsp.Jasper41Mangler;
import org.apache.tools.ant.taskdefs.optional.jsp.JspNameMangler;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapterFactory.class */
public final class JspCompilerAdapterFactory {
    private JspCompilerAdapterFactory() {
    }

    public static JspCompilerAdapter getCompiler(String str, Task task) throws BuildException {
        return getCompiler(str, task, task.getProject().createClassLoader(null));
    }

    public static JspCompilerAdapter getCompiler(String str, Task task, AntClassLoader antClassLoader) throws BuildException {
        return str.equalsIgnoreCase("jasper") ? new JasperC(new JspNameMangler()) : str.equalsIgnoreCase("jasper41") ? new JasperC(new Jasper41Mangler()) : resolveClassName(str, antClassLoader);
    }

    private static JspCompilerAdapter resolveClassName(String str, AntClassLoader antClassLoader) throws BuildException {
        try {
            return (JspCompilerAdapter) antClassLoader.findClass(str).newInstance();
        } catch (ClassCastException e) {
            throw new BuildException(new StringBuffer().append(str).append(" isn't the classname of ").append("a compiler adapter.").toString(), e);
        } catch (ClassNotFoundException e2) {
            throw new BuildException(new StringBuffer().append(str).append(" can't be found.").toString(), e2);
        } catch (Throwable th) {
            throw new BuildException(new StringBuffer().append(str).append(" caused an interesting ").append("exception.").toString(), th);
        }
    }
}
