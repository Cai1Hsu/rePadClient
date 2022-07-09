package org.apache.tools.ant.util;

import java.io.File;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.email.EmailTask;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.ClasspathUtils;

/* loaded from: classes.jar:org/apache/tools/ant/util/ScriptRunnerHelper.class */
public class ScriptRunnerHelper {
    private String language;
    private ProjectComponent projectComponent;
    private File srcFile;
    private String text;
    private ClasspathUtils.Delegate cpDelegate = null;
    private String manager = EmailTask.AUTO;
    private boolean setBeans = true;
    private ClassLoader scriptLoader = null;
    private Union resources = new Union();

    private ClassLoader generateClassLoader() {
        ClassLoader classLoader;
        synchronized (this) {
            if (this.scriptLoader != null) {
                classLoader = this.scriptLoader;
            } else if (this.cpDelegate == null) {
                this.scriptLoader = getClass().getClassLoader();
                classLoader = this.scriptLoader;
            } else {
                this.scriptLoader = this.cpDelegate.getClassLoader();
                classLoader = this.scriptLoader;
            }
        }
        return classLoader;
    }

    private ClasspathUtils.Delegate getClassPathDelegate() {
        if (this.cpDelegate == null) {
            this.cpDelegate = ClasspathUtils.getDelegate(this.projectComponent);
        }
        return this.cpDelegate;
    }

    private ScriptRunnerBase getRunner() {
        return new ScriptRunnerCreator(this.projectComponent.getProject()).createRunner(this.manager, this.language, generateClassLoader());
    }

    public void add(ResourceCollection resourceCollection) {
        this.resources.add(resourceCollection);
    }

    public void addText(String str) {
        this.text = str;
    }

    public Path createClasspath() {
        return getClassPathDelegate().createClasspath();
    }

    public String getLanguage() {
        return this.language;
    }

    public ScriptRunnerBase getScriptRunner() {
        ScriptRunnerBase runner = getRunner();
        if (this.srcFile != null) {
            runner.setSrc(this.srcFile);
        }
        if (this.text != null) {
            runner.addText(this.text);
        }
        if (this.resources != null) {
            runner.loadResources(this.resources);
        }
        if (this.setBeans) {
            runner.bindToComponent(this.projectComponent);
        } else {
            runner.bindToComponentMinimum(this.projectComponent);
        }
        return runner;
    }

    public void setClassLoader(ClassLoader classLoader) {
        this.scriptLoader = classLoader;
    }

    public void setClasspath(Path path) {
        getClassPathDelegate().setClasspath(path);
    }

    public void setClasspathRef(Reference reference) {
        getClassPathDelegate().setClasspathref(reference);
    }

    public void setLanguage(String str) {
        this.language = str;
    }

    public void setManager(String str) {
        this.manager = str;
    }

    public void setProjectComponent(ProjectComponent projectComponent) {
        this.projectComponent = projectComponent;
    }

    public void setSetBeans(boolean z) {
        this.setBeans = z;
    }

    public void setSrc(File file) {
        this.srcFile = file;
    }
}
