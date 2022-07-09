package org.apache.tools.ant.types.optional;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.selectors.BaseSelector;
import org.apache.tools.ant.util.ScriptRunnerBase;
import org.apache.tools.ant.util.ScriptRunnerHelper;

/* loaded from: classes.jar:org/apache/tools/ant/types/optional/ScriptSelector.class */
public class ScriptSelector extends BaseSelector {
    private File basedir;
    private File file;
    private String filename;
    private ScriptRunnerHelper helper = new ScriptRunnerHelper();
    private ScriptRunnerBase runner;
    private boolean selected;

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

    public File getBasedir() {
        return this.basedir;
    }

    public File getFile() {
        return this.file;
    }

    public String getFilename() {
        return this.filename;
    }

    public boolean isSelected() {
        return this.selected;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        init();
        setSelected(true);
        this.file = file2;
        this.basedir = file;
        this.filename = str;
        this.runner.addBean(MagicNames.PROJECT_BASEDIR, file);
        this.runner.addBean("filename", str);
        this.runner.addBean("file", file2);
        this.runner.executeScript("ant_selector");
        return isSelected();
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

    public void setSelected(boolean z) {
        this.selected = z;
    }

    public void setSetBeans(boolean z) {
        this.helper.setSetBeans(z);
    }

    public void setSrc(File file) {
        this.helper.setSrc(file);
    }
}
