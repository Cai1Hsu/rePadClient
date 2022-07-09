package org.apache.tools.ant.types.resources.selectors;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Name.class */
public class Name implements ResourceSelector {
    private Regexp expression;
    private String pattern;
    private Project project;
    private RegularExpression reg;
    private String regex = null;
    private boolean cs = true;
    private boolean handleDirSep = false;

    private boolean matches(String str) {
        boolean matches;
        if (this.pattern != null) {
            matches = SelectorUtils.match(modify(this.pattern), modify(str), this.cs);
        } else {
            if (this.reg == null) {
                this.reg = new RegularExpression();
                this.reg.setPattern(this.regex);
                this.expression = this.reg.getRegexp(this.project);
            }
            matches = this.expression.matches(modify(str), RegexpUtil.asOptions(this.cs));
        }
        return matches;
    }

    private String modify(String str) {
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (this.handleDirSep) {
                str2 = str.indexOf("\\") == -1 ? str : str.replace('\\', '/');
            }
        }
        return str2;
    }

    public boolean doesHandledirSep() {
        return this.handleDirSep;
    }

    public String getName() {
        return this.pattern;
    }

    public String getRegex() {
        return this.regex;
    }

    public boolean isCaseSensitive() {
        return this.cs;
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean matches;
        String name = resource.getName();
        if (matches(name)) {
            matches = true;
        } else {
            String resource2 = resource.toString();
            matches = resource2.equals(name) ? false : matches(resource2);
        }
        return matches;
    }

    public void setCaseSensitive(boolean z) {
        this.cs = z;
    }

    public void setHandleDirSep(boolean z) {
        this.handleDirSep = z;
    }

    public void setName(String str) {
        this.pattern = str;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setRegex(String str) {
        this.regex = str;
        this.reg = null;
    }
}
