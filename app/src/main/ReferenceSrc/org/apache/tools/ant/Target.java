package org.apache.tools.ant;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.tools.ant.property.LocalProperties;

/* loaded from: classes.jar:org/apache/tools/ant/Target.class */
public class Target implements TaskContainer {
    private List children;
    private List dependencies;
    private String description;
    private String ifCondition;
    private Location location;
    private String name;
    private Project project;
    private String unlessCondition;

    public Target() {
        this.ifCondition = "";
        this.unlessCondition = "";
        this.dependencies = null;
        this.children = new ArrayList();
        this.location = Location.UNKNOWN_LOCATION;
        this.description = null;
    }

    public Target(Target target) {
        this.ifCondition = "";
        this.unlessCondition = "";
        this.dependencies = null;
        this.children = new ArrayList();
        this.location = Location.UNKNOWN_LOCATION;
        this.description = null;
        this.name = target.name;
        this.ifCondition = target.ifCondition;
        this.unlessCondition = target.unlessCondition;
        this.dependencies = target.dependencies;
        this.location = target.location;
        this.project = target.project;
        this.description = target.description;
        this.children = target.children;
    }

    public static List parseDepends(String str, String str2, String str3) {
        ArrayList arrayList = new ArrayList();
        if (str.length() > 0) {
            StringTokenizer stringTokenizer = new StringTokenizer(str, ",", true);
            while (stringTokenizer.hasMoreTokens()) {
                String trim = stringTokenizer.nextToken().trim();
                if ("".equals(trim) || ",".equals(trim)) {
                    throw new BuildException(new StringBuffer().append("Syntax Error: ").append(str3).append(" attribute of target \"").append(str2).append("\" contains an empty string.").toString());
                }
                arrayList.add(trim);
                if (stringTokenizer.hasMoreTokens()) {
                    String nextToken = stringTokenizer.nextToken();
                    if (!stringTokenizer.hasMoreTokens() || !",".equals(nextToken)) {
                        throw new BuildException(new StringBuffer().append("Syntax Error: ").append(str3).append(" attribute for target \"").append(str2).append("\" ends with a \",\" ").append("character").toString());
                    }
                }
            }
        }
        return arrayList;
    }

    private boolean testIfAllows() {
        PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
        return propertyHelper.testIfCondition(propertyHelper.parseProperties(this.ifCondition));
    }

    private boolean testUnlessAllows() {
        PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(getProject());
        return propertyHelper.testUnlessCondition(propertyHelper.parseProperties(this.unlessCondition));
    }

    public void addDataType(RuntimeConfigurable runtimeConfigurable) {
        this.children.add(runtimeConfigurable);
    }

    public void addDependency(String str) {
        if (this.dependencies == null) {
            this.dependencies = new ArrayList(2);
        }
        this.dependencies.add(str);
    }

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        this.children.add(task);
    }

    public boolean dependsOn(String str) {
        Project project = getProject();
        Hashtable targets = project == null ? null : project.getTargets();
        boolean z = false;
        if (project != null) {
            z = false;
            if (project.topoSort(getName(), targets, false).contains(targets.get(str))) {
                z = true;
            }
        }
        return z;
    }

    public void execute() throws BuildException {
        if (!testIfAllows()) {
            this.project.log(this, new StringBuffer().append("Skipped because property '").append(this.project.replaceProperties(this.ifCondition)).append("' not set.").toString(), 3);
        } else if (!testUnlessAllows()) {
            this.project.log(this, new StringBuffer().append("Skipped because property '").append(this.project.replaceProperties(this.unlessCondition)).append("' set.").toString(), 3);
        } else {
            LocalProperties localProperties = LocalProperties.get(getProject());
            localProperties.enterScope();
            for (int i = 0; i < this.children.size(); i++) {
                try {
                    Object obj = this.children.get(i);
                    if (obj instanceof Task) {
                        ((Task) obj).perform();
                    } else {
                        ((RuntimeConfigurable) obj).maybeConfigure(this.project);
                    }
                } finally {
                    localProperties.exitScope();
                }
            }
        }
    }

    public Enumeration getDependencies() {
        return Collections.enumeration(this.dependencies == null ? Collections.EMPTY_LIST : this.dependencies);
    }

    public String getDescription() {
        return this.description;
    }

    public String getIf() {
        return "".equals(this.ifCondition) ? null : this.ifCondition;
    }

    public Location getLocation() {
        return this.location;
    }

    public String getName() {
        return this.name;
    }

    public Project getProject() {
        return this.project;
    }

    public Task[] getTasks() {
        ArrayList arrayList = new ArrayList(this.children.size());
        for (Object obj : this.children) {
            if (obj instanceof Task) {
                arrayList.add(obj);
            }
        }
        return (Task[]) arrayList.toArray(new Task[arrayList.size()]);
    }

    public String getUnless() {
        return "".equals(this.unlessCondition) ? null : this.unlessCondition;
    }

    public final void performTasks() {
        RuntimeException runtimeException = null;
        this.project.fireTargetStarted(this);
        try {
            try {
                execute();
                this.project.fireTargetFinished(this, null);
            } catch (RuntimeException e) {
                runtimeException = e;
                throw e;
            }
        } catch (Throwable th) {
            this.project.fireTargetFinished(this, runtimeException);
            throw th;
        }
    }

    void replaceChild(Task task, RuntimeConfigurable runtimeConfigurable) {
        while (true) {
            int indexOf = this.children.indexOf(task);
            if (indexOf >= 0) {
                this.children.set(indexOf, runtimeConfigurable);
            } else {
                return;
            }
        }
    }

    void replaceChild(Task task, Task task2) {
        while (true) {
            int indexOf = this.children.indexOf(task);
            if (indexOf >= 0) {
                this.children.set(indexOf, task2);
            } else {
                return;
            }
        }
    }

    public void setDepends(String str) {
        for (String str2 : parseDepends(str, getName(), "depends")) {
            addDependency(str2);
        }
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setIf(String str) {
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        this.ifCondition = str2;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setUnless(String str) {
        String str2 = str;
        if (str == null) {
            str2 = "";
        }
        this.unlessCondition = str2;
    }

    public String toString() {
        return this.name;
    }
}
