package org.apache.tools.ant.types;

import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/Substitution.class */
public class Substitution extends DataType {
    public static final String DATA_TYPE_NAME = "substitution";
    private String expression = null;

    public String getExpression(Project project) {
        return isReference() ? getRef(project).getExpression(project) : this.expression;
    }

    public Substitution getRef(Project project) {
        return (Substitution) getCheckedRef(project);
    }

    public void setExpression(String str) {
        this.expression = str;
    }
}
