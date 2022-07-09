package org.apache.tools.ant.types;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpFactory;

/* loaded from: classes.jar:org/apache/tools/ant/types/RegularExpression.class */
public class RegularExpression extends DataType {
    public static final String DATA_TYPE_NAME = "regexp";
    private static final RegexpFactory FACTORY = new RegexpFactory();
    private String myPattern;
    private boolean alreadyInit = false;
    private Regexp regexp = null;
    private boolean setPatternPending = false;

    private void init(Project project) {
        if (!this.alreadyInit) {
            this.regexp = FACTORY.newRegexp(project);
            this.alreadyInit = true;
        }
    }

    private void setPattern() {
        if (this.setPatternPending) {
            this.regexp.setPattern(this.myPattern);
            this.setPatternPending = false;
        }
    }

    public String getPattern(Project project) {
        String pattern;
        init(project);
        if (isReference()) {
            pattern = getRef(project).getPattern(project);
        } else {
            setPattern();
            pattern = this.regexp.getPattern();
        }
        return pattern;
    }

    public RegularExpression getRef(Project project) {
        return (RegularExpression) getCheckedRef(project);
    }

    public Regexp getRegexp(Project project) {
        Regexp regexp;
        init(project);
        if (isReference()) {
            regexp = getRef(project).getRegexp(project);
        } else {
            setPattern();
            regexp = this.regexp;
        }
        return regexp;
    }

    public void setPattern(String str) {
        if (this.regexp != null) {
            this.regexp.setPattern(str);
            return;
        }
        this.myPattern = str;
        this.setPatternPending = true;
    }
}
