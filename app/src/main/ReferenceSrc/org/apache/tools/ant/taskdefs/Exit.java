package org.apache.tools.ant.taskdefs;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ExitStatusException;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.taskdefs.condition.ConditionBase;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Exit.class */
public class Exit extends Task {
    private Object ifCondition;
    private String message;
    private NestedCondition nestedCondition;
    private Integer status;
    private Object unlessCondition;

    /* renamed from: org.apache.tools.ant.taskdefs.Exit$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Exit$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Exit$NestedCondition.class */
    private static class NestedCondition extends ConditionBase implements Condition {
        private NestedCondition() {
        }

        NestedCondition(AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.apache.tools.ant.taskdefs.condition.Condition
        public boolean eval() {
            if (countConditions() != 1) {
                throw new BuildException("A single nested condition is required.");
            }
            return ((Condition) getConditions().nextElement()).eval();
        }
    }

    private boolean nestedConditionPresent() {
        return this.nestedCondition != null;
    }

    private boolean testIfCondition() {
        return PropertyHelper.getPropertyHelper(getProject()).testIfCondition(this.ifCondition);
    }

    private boolean testNestedCondition() {
        boolean nestedConditionPresent = nestedConditionPresent();
        if ((!nestedConditionPresent || this.ifCondition == null) && this.unlessCondition == null) {
            return nestedConditionPresent && this.nestedCondition.eval();
        }
        throw new BuildException("Nested conditions not permitted in conjunction with if/unless attributes");
    }

    private boolean testUnlessCondition() {
        return PropertyHelper.getPropertyHelper(getProject()).testUnlessCondition(this.unlessCondition);
    }

    public void addText(String str) {
        if (this.message == null) {
            this.message = "";
        }
        this.message = new StringBuffer().append(this.message).append(getProject().replaceProperties(str)).toString();
    }

    public ConditionBase createCondition() {
        if (this.nestedCondition != null) {
            throw new BuildException("Only one nested condition is allowed.");
        }
        this.nestedCondition = new NestedCondition(null);
        return this.nestedCondition;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        String str;
        if (nestedConditionPresent() ? testNestedCondition() : testIfCondition() && testUnlessCondition()) {
            if (this.message == null || this.message.trim().length() <= 0) {
                String str2 = null;
                if (this.ifCondition != null) {
                    str2 = null;
                    if (!"".equals(this.ifCondition)) {
                        str2 = null;
                        if (testIfCondition()) {
                            str2 = new StringBuffer().append("if=").append(this.ifCondition).toString();
                        }
                    }
                }
                String str3 = str2;
                if (this.unlessCondition != null) {
                    str3 = str2;
                    if (!"".equals(this.unlessCondition)) {
                        str3 = str2;
                        if (testUnlessCondition()) {
                            str3 = new StringBuffer().append(str2 == null ? "" : new StringBuffer().append(str2).append(" and ").toString()).append("unless=").append(this.unlessCondition).toString();
                        }
                    }
                }
                if (nestedConditionPresent()) {
                    str = "condition satisfied";
                } else {
                    str = str3;
                    if (str3 == null) {
                        str = "No message";
                    }
                }
            } else {
                str = this.message.trim();
            }
            log(new StringBuffer().append("failing due to ").append(str).toString(), 4);
            throw (this.status == null ? new BuildException(str) : new ExitStatusException(str, this.status.intValue()));
        }
    }

    public void setIf(Object obj) {
        this.ifCondition = obj;
    }

    public void setIf(String str) {
        setIf((Object) str);
    }

    public void setMessage(String str) {
        this.message = str;
    }

    public void setStatus(int i) {
        this.status = new Integer(i);
    }

    public void setUnless(Object obj) {
        this.unlessCondition = obj;
    }

    public void setUnless(String str) {
        setUnless((Object) str);
    }
}
