package org.apache.tools.ant.taskdefs;

import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.ProjectHelperRepository;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ProjectHelperTask.class */
public class ProjectHelperTask extends Task {
    private List projectHelpers = new ArrayList();

    public void addConfigured(ProjectHelper projectHelper) {
        synchronized (this) {
            this.projectHelpers.add(projectHelper);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        ProjectHelperRepository projectHelperRepository = ProjectHelperRepository.getInstance();
        for (ProjectHelper projectHelper : this.projectHelpers) {
            projectHelperRepository.registerProjectHelper(projectHelper.getClass());
        }
    }
}
