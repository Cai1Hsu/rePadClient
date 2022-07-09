package org.apache.tools.ant;

import java.util.EventObject;

/* loaded from: classes.jar:org/apache/tools/ant/BuildEvent.class */
public class BuildEvent extends EventObject {
    private static final long serialVersionUID = 4538050075952288486L;
    private Throwable exception;
    private String message;
    private int priority;
    private final Project project;
    private final Target target;
    private final Task task;

    public BuildEvent(Project project) {
        super(project);
        this.priority = 3;
        this.project = project;
        this.target = null;
        this.task = null;
    }

    public BuildEvent(Target target) {
        super(target);
        this.priority = 3;
        this.project = target.getProject();
        this.target = target;
        this.task = null;
    }

    public BuildEvent(Task task) {
        super(task);
        this.priority = 3;
        this.project = task.getProject();
        this.target = task.getOwningTarget();
        this.task = task;
    }

    public Throwable getException() {
        return this.exception;
    }

    public String getMessage() {
        return this.message;
    }

    public int getPriority() {
        return this.priority;
    }

    public Project getProject() {
        return this.project;
    }

    public Target getTarget() {
        return this.target;
    }

    public Task getTask() {
        return this.task;
    }

    public void setException(Throwable th) {
        this.exception = th;
    }

    public void setMessage(String str, int i) {
        this.message = str;
        this.priority = i;
    }
}
