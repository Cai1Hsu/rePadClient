package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/ProjectComponent.class */
public abstract class ProjectComponent implements Cloneable {
    protected String description;
    protected Location location = Location.UNKNOWN_LOCATION;
    protected Project project;

    public Object clone() throws CloneNotSupportedException {
        ProjectComponent projectComponent = (ProjectComponent) super.clone();
        projectComponent.setLocation(getLocation());
        projectComponent.setProject(getProject());
        return projectComponent;
    }

    public String getDescription() {
        return this.description;
    }

    public Location getLocation() {
        return this.location;
    }

    public Project getProject() {
        return this.project;
    }

    public void log(String str) {
        log(str, 2);
    }

    public void log(String str, int i) {
        if (getProject() != null) {
            getProject().log(str, i);
        } else if (i > 2) {
        } else {
            System.err.println(str);
        }
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
