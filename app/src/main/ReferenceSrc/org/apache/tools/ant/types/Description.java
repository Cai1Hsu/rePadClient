package org.apache.tools.ant.types;

import java.util.Vector;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.UnknownElement;
import org.apache.tools.ant.helper.ProjectHelper2;
import org.apache.tools.ant.helper.ProjectHelperImpl;

/* loaded from: classes.jar:org/apache/tools/ant/types/Description.class */
public class Description extends DataType {
    private static void concatDescriptions(Project project, Target target, StringBuffer stringBuffer) {
        Vector findElementInTarget;
        String stringBuffer2;
        if (target == null || (findElementInTarget = findElementInTarget(project, target, "description")) == null) {
            return;
        }
        int size = findElementInTarget.size();
        for (int i = 0; i < size; i++) {
            Task task = (Task) findElementInTarget.elementAt(i);
            if ((task instanceof UnknownElement) && (stringBuffer2 = ((UnknownElement) task).getWrapper().getText().toString()) != null) {
                stringBuffer.append(project.replaceProperties(stringBuffer2));
            }
        }
    }

    private static Vector findElementInTarget(Project project, Target target, String str) {
        Task[] tasks = target.getTasks();
        Vector vector = new Vector();
        for (int i = 0; i < tasks.length; i++) {
            if (str.equals(tasks[i].getTaskName())) {
                vector.addElement(tasks[i]);
            }
        }
        return vector;
    }

    public static String getDescription(Project project) {
        String stringBuffer;
        Vector vector = (Vector) project.getReference(ProjectHelper2.REFID_TARGETS);
        if (vector == null) {
            stringBuffer = null;
        } else {
            StringBuffer stringBuffer2 = new StringBuffer();
            int size = vector.size();
            for (int i = 0; i < size; i++) {
                concatDescriptions(project, (Target) vector.elementAt(i), stringBuffer2);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    public void addText(String str) {
        if (!(((ProjectHelper) getProject().getReference("ant.projectHelper")) instanceof ProjectHelperImpl)) {
            return;
        }
        String description = getProject().getDescription();
        if (description == null) {
            getProject().setDescription(str);
        } else {
            getProject().setDescription(new StringBuffer().append(description).append(str).toString());
        }
    }
}
