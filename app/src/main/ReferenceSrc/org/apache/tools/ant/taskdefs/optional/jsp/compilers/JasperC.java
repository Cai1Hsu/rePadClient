package org.apache.tools.ant.taskdefs.optional.jsp.compilers;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.optional.jsp.JspC;
import org.apache.tools.ant.taskdefs.optional.jsp.JspMangler;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC.class */
public class JasperC extends DefaultJspCompilerAdapter {
    JspMangler mangler;

    public JasperC(JspMangler jspMangler) {
        this.mangler = jspMangler;
    }

    private Path getClasspath() {
        Path classpath = getJspc().getClasspath();
        return classpath == null ? new Path(getProject()).concatSystemClasspath("only") : classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE);
    }

    private boolean isTomcat5x() {
        boolean z;
        AntClassLoader antClassLoader = null;
        AntClassLoader antClassLoader2 = null;
        try {
            AntClassLoader createClassLoader = getProject().createClassLoader(getClasspath());
            antClassLoader2 = createClassLoader;
            antClassLoader = createClassLoader;
            createClassLoader.loadClass("org.apache.jasper.tagplugins.jstl.If");
            z = true;
            if (createClassLoader != null) {
                createClassLoader.cleanup();
                z = true;
            }
        } catch (ClassNotFoundException e) {
            z = false;
            if (antClassLoader2 != null) {
                antClassLoader2.cleanup();
                z = false;
            }
        } catch (Throwable th) {
            if (antClassLoader != null) {
                antClassLoader.cleanup();
            }
            throw th;
        }
        return z;
    }

    private CommandlineJava setupJasperCommand() {
        CommandlineJava commandlineJava = new CommandlineJava();
        JspC jspc = getJspc();
        addArg(commandlineJava, "-d", jspc.getDestdir());
        addArg(commandlineJava, "-p", jspc.getPackage());
        if (!isTomcat5x()) {
            addArg(commandlineJava, new StringBuffer().append("-v").append(jspc.getVerbose()).toString());
        } else {
            getProject().log("this task doesn't support Tomcat 5.x properly, please use the Tomcat provided jspc task instead");
        }
        addArg(commandlineJava, "-uriroot", jspc.getUriroot());
        addArg(commandlineJava, "-uribase", jspc.getUribase());
        addArg(commandlineJava, "-ieplugin", jspc.getIeplugin());
        addArg(commandlineJava, "-webinc", jspc.getWebinc());
        addArg(commandlineJava, "-webxml", jspc.getWebxml());
        addArg(commandlineJava, "-die9");
        if (jspc.isMapped()) {
            addArg(commandlineJava, "-mapped");
        }
        if (jspc.getWebApp() != null) {
            addArg(commandlineJava, "-webapp", jspc.getWebApp().getDirectory());
        }
        logAndAddFilesToCompile(getJspc(), getJspc().getCompileList(), commandlineJava);
        return commandlineJava;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapter
    public JspMangler createMangler() {
        return this.mangler;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapter
    public boolean execute() throws BuildException {
        getJspc().log("Using jasper compiler", 3);
        CommandlineJava commandlineJava = setupJasperCommand();
        try {
            try {
                Java java = new Java(this.owner);
                Path classpath = getClasspath();
                if (getJspc().getClasspath() != null) {
                    getProject().log(new StringBuffer().append("using user supplied classpath: ").append(classpath).toString(), 4);
                } else {
                    getProject().log(new StringBuffer().append("using system classpath: ").append(classpath).toString(), 4);
                }
                java.setClasspath(classpath);
                java.setDir(getProject().getBaseDir());
                java.setClassname("org.apache.jasper.JspC");
                for (String str : commandlineJava.getJavaCommand().getArguments()) {
                    java.createArg().setValue(str);
                }
                java.setFailonerror(getJspc().getFailonerror());
                java.setFork(true);
                java.setTaskName("jasperc");
                java.execute();
                getJspc().deleteEmptyJavaFiles();
                return true;
            } catch (Exception e) {
                if (!(e instanceof BuildException)) {
                    throw new BuildException("Error running jsp compiler: ", e, getJspc().getLocation());
                }
                throw ((BuildException) e);
            }
        } catch (Throwable th) {
            getJspc().deleteEmptyJavaFiles();
            throw th;
        }
    }
}
