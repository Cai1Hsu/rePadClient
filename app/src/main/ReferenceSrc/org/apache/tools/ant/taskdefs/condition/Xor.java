package org.apache.tools.ant.taskdefs.condition;

import java.util.Enumeration;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Xor.class */
public class Xor extends ConditionBase implements Condition {
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        Enumeration conditions = getConditions();
        boolean z = false;
        while (true) {
            boolean z2 = z;
            if (conditions.hasMoreElements()) {
                z = z2 ^ ((Condition) conditions.nextElement()).eval();
            } else {
                return z2;
            }
        }
    }
}
