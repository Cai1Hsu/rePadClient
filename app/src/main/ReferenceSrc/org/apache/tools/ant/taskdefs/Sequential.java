package org.apache.tools.ant.taskdefs;

import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.property.LocalProperties;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Sequential.class */
public class Sequential extends Task implements TaskContainer {
    private Vector nestedTasks = new Vector();

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        this.nestedTasks.addElement(task);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        LocalProperties localProperties = LocalProperties.get(getProject());
        localProperties.enterScope();
        try {
            Iterator it = this.nestedTasks.iterator();
            while (it.hasNext()) {
                ((Task) it.next()).perform();
            }
        } finally {
            localProperties.exitScope();
        }
    }
}
