package org.apache.tools.ant.taskdefs.condition;

import java.util.Enumeration;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Or.class */
public class Or extends ConditionBase implements Condition {
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        Enumeration conditions = getConditions();
        while (true) {
            if (!conditions.hasMoreElements()) {
                z = false;
                break;
            } else if (((Condition) conditions.nextElement()).eval()) {
                z = true;
                break;
            }
        }
        return z;
    }
}
