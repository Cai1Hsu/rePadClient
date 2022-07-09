package org.apache.tools.ant.types.optional;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.filters.TokenFilter;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.ScriptRunnerBase;
import org.apache.tools.ant.util.ScriptRunnerHelper;

/* loaded from: classes.jar:org/apache/tools/ant/types/optional/ScriptFilter.class */
public class ScriptFilter extends TokenFilter.ChainableReaderFilter {
    private ScriptRunnerHelper helper = new ScriptRunnerHelper();
    private ScriptRunnerBase runner = null;
    private String token;

    private void init() throws BuildException {
        if (this.runner != null) {
            return;
        }
        this.runner = this.helper.getScriptRunner();
    }

    public void addText(String str) {
        this.helper.addText(str);
    }

    public Path createClasspath() {
        return this.helper.createClasspath();
    }

    @Override // org.apache.tools.ant.filters.TokenFilter.Filter
    public String filter(String str) {
        init();
        setToken(str);
        this.runner.executeScript("ant_filter");
        return getToken();
    }

    public String getToken() {
        return this.token;
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

    public void setSrc(File file) {
        this.helper.setSrc(file);
    }

    public void setToken(String str) {
        this.token = str;
    }
}
