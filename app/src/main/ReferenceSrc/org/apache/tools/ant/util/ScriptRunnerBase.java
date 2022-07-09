package org.apache.tools.ant.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/util/ScriptRunnerBase.class */
public abstract class ScriptRunnerBase {
    private String language;
    private Project project;
    private ClassLoader scriptLoader;
    private boolean keepEngine = false;
    private String script = "";
    private Map beans = new HashMap();

    private void readSource(Reader reader, String str) {
        Throwable th;
        IOException e;
        BufferedReader bufferedReader;
        BufferedReader bufferedReader2;
        BufferedReader bufferedReader3 = null;
        try {
            try {
                bufferedReader2 = new BufferedReader(reader);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedReader = null;
        }
        try {
            this.script = new StringBuffer().append(this.script).append(FileUtils.safeReadFully(bufferedReader2)).toString();
            FileUtils.close(bufferedReader2);
        } catch (IOException e3) {
            e = e3;
            bufferedReader = bufferedReader2;
            BufferedReader bufferedReader4 = bufferedReader;
            BufferedReader bufferedReader5 = bufferedReader;
            BufferedReader bufferedReader6 = bufferedReader;
            BufferedReader bufferedReader7 = bufferedReader;
            throw new BuildException(new StringBuffer().append("Failed to read ").append(str).toString(), e);
        } catch (Throwable th3) {
            th = th3;
            bufferedReader3 = bufferedReader2;
            FileUtils.close(bufferedReader3);
            throw th;
        }
    }

    public void addBean(String str, Object obj) {
        boolean z = false;
        if (str.length() > 0) {
            z = false;
            if (Character.isJavaIdentifierStart(str.charAt(0))) {
                z = true;
            }
        }
        for (int i = 1; z && i < str.length(); i++) {
            z = Character.isJavaIdentifierPart(str.charAt(i));
        }
        if (z) {
            this.beans.put(str, obj);
        }
    }

    public void addBeans(Map map) {
        for (String str : map.keySet()) {
            try {
                addBean(str, map.get(str));
            } catch (BuildException e) {
            }
        }
    }

    public void addText(String str) {
        this.script = new StringBuffer().append(this.script).append(str).toString();
    }

    public void bindToComponent(ProjectComponent projectComponent) {
        this.project = projectComponent.getProject();
        addBeans(this.project.getProperties());
        addBeans(this.project.getUserProperties());
        addBeans(this.project.getCopyOfTargets());
        addBeans(this.project.getCopyOfReferences());
        addBean("project", this.project);
        addBean("self", projectComponent);
    }

    public void bindToComponentMinimum(ProjectComponent projectComponent) {
        this.project = projectComponent.getProject();
        addBean("project", this.project);
        addBean("self", projectComponent);
    }

    protected void checkLanguage() {
        if (this.language == null) {
            throw new BuildException("script language must be specified");
        }
    }

    public void clearScript() {
        this.script = "";
    }

    public abstract Object evaluateScript(String str);

    public abstract void executeScript(String str);

    protected Map getBeans() {
        return this.beans;
    }

    public boolean getKeepEngine() {
        return this.keepEngine;
    }

    public String getLanguage() {
        return this.language;
    }

    public abstract String getManagerName();

    public Project getProject() {
        return this.project;
    }

    public String getScript() {
        return this.script;
    }

    protected ClassLoader getScriptClassLoader() {
        return this.scriptLoader;
    }

    public void loadResource(Resource resource) {
        String longString = resource.toLongString();
        try {
            readSource(new InputStreamReader(resource.getInputStream()), longString);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Failed to open ").append(longString).toString(), e);
        } catch (UnsupportedOperationException e2) {
            throw new BuildException(new StringBuffer().append("Failed to open ").append(longString).append(" -it is not readable").toString(), e2);
        }
    }

    public void loadResources(ResourceCollection resourceCollection) {
        Iterator it = resourceCollection.iterator();
        while (it.hasNext()) {
            loadResource((Resource) it.next());
        }
    }

    protected ClassLoader replaceContextLoader() {
        ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
        if (getScriptClassLoader() == null) {
            setScriptClassLoader(getClass().getClassLoader());
        }
        Thread.currentThread().setContextClassLoader(getScriptClassLoader());
        return contextClassLoader;
    }

    protected void restoreContextLoader(ClassLoader classLoader) {
        Thread.currentThread().setContextClassLoader(classLoader);
    }

    public void setKeepEngine(boolean z) {
        this.keepEngine = z;
    }

    public void setLanguage(String str) {
        this.language = str;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setScriptClassLoader(ClassLoader classLoader) {
        this.scriptLoader = classLoader;
    }

    public void setSrc(File file) {
        String path = file.getPath();
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("file ").append(path).append(" not found.").toString());
        }
        try {
            readSource(new FileReader(file), path);
        } catch (FileNotFoundException e) {
            throw new BuildException(new StringBuffer().append("file ").append(path).append(" not found.").toString());
        }
    }

    public abstract boolean supportsLanguage();
}
