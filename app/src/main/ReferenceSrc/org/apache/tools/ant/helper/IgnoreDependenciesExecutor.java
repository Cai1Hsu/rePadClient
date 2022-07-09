package org.apache.tools.ant.helper;

import java.util.Hashtable;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Executor;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Target;

/* loaded from: classes.jar:org/apache/tools/ant/helper/IgnoreDependenciesExecutor.class */
public class IgnoreDependenciesExecutor implements Executor {
    private static final SingleCheckExecutor SUB_EXECUTOR = new SingleCheckExecutor();

    @Override // org.apache.tools.ant.Executor
    public void executeTargets(Project project, String[] strArr) throws BuildException {
        Target target;
        Hashtable targets = project.getTargets();
        BuildException e = null;
        for (int i = 0; i < strArr.length; i++) {
            try {
                target = (Target) targets.get(strArr[i]);
            } catch (BuildException e2) {
                e = e2;
                if (!project.isKeepGoingMode()) {
                    throw e;
                }
            }
            if (target == null) {
                throw new BuildException(new StringBuffer().append("Unknown target ").append(strArr[i]).toString());
                break;
            }
            target.performTasks();
        }
        if (e != null) {
            throw e;
        }
    }

    @Override // org.apache.tools.ant.Executor
    public Executor getSubProjectExecutor() {
        return SUB_EXECUTOR;
    }
}
