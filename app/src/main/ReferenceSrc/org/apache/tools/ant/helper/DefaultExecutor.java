package org.apache.tools.ant.helper;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Executor;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/helper/DefaultExecutor.class */
public class DefaultExecutor implements Executor {
    private static final SingleCheckExecutor SUB_EXECUTOR = new SingleCheckExecutor();

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:9:0x001f -> B:6:0x0014). Please submit an issue!!! */
    @Override // org.apache.tools.ant.Executor
    public void executeTargets(Project project, String[] strArr) throws BuildException {
        BuildException e = null;
        for (String str : strArr) {
            try {
                project.executeTarget(str);
            } catch (BuildException e2) {
                e = e2;
                if (!project.isKeepGoingMode()) {
                    throw e;
                }
            }
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
