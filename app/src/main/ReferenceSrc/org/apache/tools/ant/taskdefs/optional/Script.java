package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.ScriptRunnerHelper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Script.class */
public class Script extends Task {
    private ScriptRunnerHelper helper = new ScriptRunnerHelper();

    public void addText(String str) {
        this.helper.addText(str);
    }

    public Path createClasspath() {
        return this.helper.createClasspath();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        this.helper.getScriptRunner().executeScript("ANT");
    }

    public void setClasspath(Path path) {
        this.helper.setClasspath(path);
    }

    public void setClasspathRef(Reference reference) {
        this.helper.setClasspathRef(reference);
    }

    public void setLanguage(String str) {
        this.helper.setLanguage(str);
    }

    public void setManager(String str) {
        this.helper.setManager(str);
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public void setProject(Project project) {
        super.setProject(project);
        this.helper.setProjectComponent(this);
    }

    public void setSetBeans(boolean z) {
        this.helper.setSetBeans(z);
    }

    public void setSrc(String str) {
        this.helper.setSrc(new File(str));
    }
}
