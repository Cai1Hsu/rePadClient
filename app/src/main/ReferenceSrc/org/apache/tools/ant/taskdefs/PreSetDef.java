package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.UnknownElement;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PreSetDef.class */
public class PreSetDef extends AntlibDefinition implements TaskContainer {
    private String name;
    private UnknownElement nestedTask;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition.class */
    public static class PreSetDefinition extends AntTypeDefinition {
        private UnknownElement element;
        private AntTypeDefinition parent;

        public PreSetDefinition(AntTypeDefinition antTypeDefinition, UnknownElement unknownElement) {
            AntTypeDefinition antTypeDefinition2 = antTypeDefinition;
            if (antTypeDefinition instanceof PreSetDefinition) {
                PreSetDefinition preSetDefinition = (PreSetDefinition) antTypeDefinition;
                unknownElement.applyPreSet(preSetDefinition.element);
                antTypeDefinition2 = preSetDefinition.parent;
            }
            this.parent = antTypeDefinition2;
            this.element = unknownElement;
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void checkClass(Project project) {
            this.parent.checkClass(project);
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public Object create(Project project) {
            return this;
        }

        public Object createObject(Project project) {
            return this.parent.create(project);
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public ClassLoader getClassLoader() {
            return this.parent.getClassLoader();
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public String getClassName() {
            return this.parent.getClassName();
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public Class getExposedClass(Project project) {
            return this.parent.getExposedClass(project);
        }

        public UnknownElement getPreSets() {
            return this.element;
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public Class getTypeClass(Project project) {
            return this.parent.getTypeClass(project);
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public boolean sameDefinition(AntTypeDefinition antTypeDefinition, Project project) {
            return antTypeDefinition != null && antTypeDefinition.getClass() == getClass() && this.parent != null && this.parent.sameDefinition(((PreSetDefinition) antTypeDefinition).parent, project) && this.element.similar(((PreSetDefinition) antTypeDefinition).element);
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void setAdaptToClass(Class cls) {
            throw new BuildException("Not supported");
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void setAdapterClass(Class cls) {
            throw new BuildException("Not supported");
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void setClass(Class cls) {
            throw new BuildException("Not supported");
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void setClassLoader(ClassLoader classLoader) {
            throw new BuildException("Not supported");
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public void setClassName(String str) {
            throw new BuildException("Not supported");
        }

        @Override // org.apache.tools.ant.AntTypeDefinition
        public boolean similarDefinition(AntTypeDefinition antTypeDefinition, Project project) {
            return antTypeDefinition != null && antTypeDefinition.getClass().getName().equals(getClass().getName()) && this.parent != null && this.parent.similarDefinition(((PreSetDefinition) antTypeDefinition).parent, project) && this.element.similar(((PreSetDefinition) antTypeDefinition).element);
        }
    }

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        if (this.nestedTask != null) {
            throw new BuildException("Only one nested element allowed");
        }
        if (!(task instanceof UnknownElement)) {
            throw new BuildException("addTask called with a task that is not an unknown element");
        }
        this.nestedTask = (UnknownElement) task;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        if (this.nestedTask == null) {
            throw new BuildException("Missing nested element");
        }
        if (this.name == null) {
            throw new BuildException("Name not specified");
        }
        this.name = ProjectHelper.genComponentName(getURI(), this.name);
        ComponentHelper componentHelper = ComponentHelper.getComponentHelper(getProject());
        String genComponentName = ProjectHelper.genComponentName(this.nestedTask.getNamespace(), this.nestedTask.getTag());
        AntTypeDefinition definition = componentHelper.getDefinition(genComponentName);
        if (definition == null) {
            throw new BuildException(new StringBuffer().append("Unable to find typedef ").append(genComponentName).toString());
        }
        PreSetDefinition preSetDefinition = new PreSetDefinition(definition, this.nestedTask);
        preSetDefinition.setName(this.name);
        componentHelper.addDataTypeDefinition(preSetDefinition);
        log(new StringBuffer().append("defining preset ").append(this.name).toString(), 3);
    }

    public void setName(String str) {
        this.name = str;
    }
}
