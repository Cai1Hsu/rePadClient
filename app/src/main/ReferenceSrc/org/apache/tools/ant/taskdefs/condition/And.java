package org.apache.tools.ant.taskdefs.condition;

import java.util.Enumeration;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/And.class */
public class And extends ConditionBase implements Condition {
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        Enumeration conditions = getConditions();
        while (true) {
            if (!conditions.hasMoreElements()) {
                z = true;
                break;
            } else if (!((Condition) conditions.nextElement()).eval()) {
                z = false;
                break;
            }
        }
        return z;
    }
}
