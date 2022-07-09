package org.apache.tools.ant;

import java.io.IOException;
import java.util.Enumeration;
import org.apache.tools.ant.dispatch.DispatchUtils;

/* loaded from: classes.jar:org/apache/tools/ant/Task.class */
public abstract class Task extends ProjectComponent {
    private boolean invalid;
    private UnknownElement replacement;
    protected Target target;
    protected String taskName;
    protected String taskType;
    protected RuntimeConfigurable wrapper;

    private UnknownElement getReplacement() {
        if (this.replacement == null) {
            this.replacement = new UnknownElement(this.taskType);
            this.replacement.setProject(getProject());
            this.replacement.setTaskType(this.taskType);
            this.replacement.setTaskName(this.taskName);
            this.replacement.setLocation(getLocation());
            this.replacement.setOwningTarget(this.target);
            this.replacement.setRuntimeConfigurableWrapper(this.wrapper);
            this.wrapper.setProxy(this.replacement);
            replaceChildren(this.wrapper, this.replacement);
            this.target.replaceChild(this, this.replacement);
            this.replacement.maybeConfigure();
        }
        return this.replacement;
    }

    private void replaceChildren(RuntimeConfigurable runtimeConfigurable, UnknownElement unknownElement) {
        Enumeration children = runtimeConfigurable.getChildren();
        while (children.hasMoreElements()) {
            RuntimeConfigurable runtimeConfigurable2 = (RuntimeConfigurable) children.nextElement();
            UnknownElement unknownElement2 = new UnknownElement(runtimeConfigurable2.getElementTag());
            unknownElement.addChild(unknownElement2);
            unknownElement2.setProject(getProject());
            unknownElement2.setRuntimeConfigurableWrapper(runtimeConfigurable2);
            runtimeConfigurable2.setProxy(unknownElement2);
            replaceChildren(runtimeConfigurable2, unknownElement2);
        }
    }

    public final void bindToOwner(Task task) {
        setProject(task.getProject());
        setOwningTarget(task.getOwningTarget());
        setTaskName(task.getTaskName());
        setDescription(task.getDescription());
        setLocation(task.getLocation());
        setTaskType(task.getTaskType());
    }

    public void execute() throws BuildException {
    }

    public Target getOwningTarget() {
        return this.target;
    }

    public RuntimeConfigurable getRuntimeConfigurableWrapper() {
        if (this.wrapper == null) {
            this.wrapper = new RuntimeConfigurable(this, getTaskName());
        }
        return this.wrapper;
    }

    public String getTaskName() {
        return this.taskName;
    }

    public String getTaskType() {
        return this.taskType;
    }

    protected RuntimeConfigurable getWrapper() {
        return this.wrapper;
    }

    protected void handleErrorFlush(String str) {
        handleErrorOutput(str);
    }

    protected void handleErrorOutput(String str) {
        log(str, 1);
    }

    protected void handleFlush(String str) {
        handleOutput(str);
    }

    protected int handleInput(byte[] bArr, int i, int i2) throws IOException {
        return getProject().defaultInput(bArr, i, i2);
    }

    protected void handleOutput(String str) {
        log(str, 2);
    }

    public void init() throws BuildException {
    }

    protected final boolean isInvalid() {
        return this.invalid;
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public void log(String str) {
        log(str, 2);
    }

    @Override // org.apache.tools.ant.ProjectComponent
    public void log(String str, int i) {
        if (getProject() != null) {
            getProject().log(this, str, i);
        } else {
            super.log(str, i);
        }
    }

    public void log(String str, Throwable th, int i) {
        if (getProject() != null) {
            getProject().log(this, str, th, i);
        } else {
            super.log(str, i);
        }
    }

    public void log(Throwable th, int i) {
        if (th != null) {
            log(th.getMessage(), th, i);
        }
    }

    final void markInvalid() {
        this.invalid = true;
    }

    public void maybeConfigure() throws BuildException {
        if (this.invalid) {
            getReplacement();
        } else if (this.wrapper == null) {
        } else {
            this.wrapper.maybeConfigure(getProject());
        }
    }

    public final void perform() {
        if (this.invalid) {
            getReplacement().getTask().perform();
            return;
        }
        getProject().fireTaskStarted(this);
        Throwable th = null;
        try {
            try {
                try {
                    maybeConfigure();
                    th = null;
                    DispatchUtils.execute(this);
                    getProject().fireTaskFinished(this, null);
                } catch (BuildException e) {
                    if (e.getLocation() == Location.UNKNOWN_LOCATION) {
                        e.setLocation(getLocation());
                    }
                    throw e;
                }
            } catch (Error e2) {
                throw e2;
            } catch (Exception e3) {
                BuildException buildException = new BuildException(e3);
                buildException.setLocation(getLocation());
                throw buildException;
            }
        } catch (Throwable th2) {
            getProject().fireTaskFinished(this, th);
            throw th2;
        }
    }

    public void reconfigure() {
        if (this.wrapper != null) {
            this.wrapper.reconfigure(getProject());
        }
    }

    public void setOwningTarget(Target target) {
        this.target = target;
    }

    public void setRuntimeConfigurableWrapper(RuntimeConfigurable runtimeConfigurable) {
        this.wrapper = runtimeConfigurable;
    }

    public void setTaskName(String str) {
        this.taskName = str;
    }

    public void setTaskType(String str) {
        this.taskType = str;
    }
}
