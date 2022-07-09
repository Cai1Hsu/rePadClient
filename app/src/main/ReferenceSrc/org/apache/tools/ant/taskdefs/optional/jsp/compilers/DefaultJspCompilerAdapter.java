package org.apache.tools.ant.taskdefs.optional.jsp.compilers;

import java.io.File;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.optional.jsp.JspC;
import org.apache.tools.ant.types.CommandlineJava;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter.class */
public abstract class DefaultJspCompilerAdapter implements JspCompilerAdapter {
    private static String lSep = System.getProperty("line.separator");
    protected JspC owner;

    protected void addArg(CommandlineJava commandlineJava, String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        commandlineJava.createArgument().setValue(str);
    }

    protected void addArg(CommandlineJava commandlineJava, String str, File file) {
        if (file != null) {
            commandlineJava.createArgument().setValue(str);
            commandlineJava.createArgument().setFile(file);
        }
    }

    protected void addArg(CommandlineJava commandlineJava, String str, String str2) {
        if (str2 != null) {
            commandlineJava.createArgument().setValue(str);
            commandlineJava.createArgument().setValue(str2);
        }
    }

    public JspC getJspc() {
        return this.owner;
    }

    public Project getProject() {
        return getJspc().getProject();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapter
    public boolean implementsOwnDependencyChecking() {
        return false;
    }

    protected void logAndAddFilesToCompile(JspC jspC, Vector vector, CommandlineJava commandlineJava) {
        jspC.log(new StringBuffer().append("Compilation ").append(commandlineJava.describeJavaCommand()).toString(), 3);
        StringBuffer stringBuffer = new StringBuffer("File");
        if (vector.size() != 1) {
            stringBuffer.append("s");
        }
        stringBuffer.append(" to be compiled:");
        stringBuffer.append(lSep);
        Enumeration elements = vector.elements();
        while (elements.hasMoreElements()) {
            String str = (String) elements.nextElement();
            commandlineJava.createArgument().setValue(str);
            stringBuffer.append("    ");
            stringBuffer.append(str);
            stringBuffer.append(lSep);
        }
        jspC.log(stringBuffer.toString(), 3);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.compilers.JspCompilerAdapter
    public void setJspc(JspC jspC) {
        this.owner = jspC;
    }
}
