package org.apache.tools.ant.types.selectors;

import java.io.File;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/FilenameSelector.class */
public class FilenameSelector extends BaseExtendSelector {
    public static final String CASE_KEY = "casesensitive";
    public static final String NAME_KEY = "name";
    public static final String NEGATE_KEY = "negate";
    public static final String REGEX_KEY = "regex";
    private Regexp expression;
    private RegularExpression reg;
    private String pattern = null;
    private String regex = null;
    private boolean casesensitive = true;
    private boolean negated = false;

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean z;
        validate();
        if (this.pattern != null) {
            z = SelectorUtils.matchPath(this.pattern, str, this.casesensitive) == (!this.negated);
        } else {
            if (this.reg == null) {
                this.reg = new RegularExpression();
                this.reg.setPattern(this.regex);
                this.expression = this.reg.getRegexp(getProject());
            }
            z = true;
            if (this.expression.matches(str, RegexpUtil.asOptions(this.casesensitive)) != (!this.negated)) {
                z = false;
            }
        }
        return z;
    }

    public void setCasesensitive(boolean z) {
        this.casesensitive = z;
    }

    public void setName(String str) {
        String replace = str.replace('/', File.separatorChar).replace('\\', File.separatorChar);
        String str2 = replace;
        if (replace.endsWith(File.separator)) {
            str2 = new StringBuffer().append(replace).append(SelectorUtils.DEEP_TREE_MATCH).toString();
        }
        this.pattern = str2;
    }

    public void setNegate(boolean z) {
        this.negated = z;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if ("name".equalsIgnoreCase(name)) {
                    setName(parameterArr[i].getValue());
                } else if ("casesensitive".equalsIgnoreCase(name)) {
                    setCasesensitive(Project.toBoolean(parameterArr[i].getValue()));
                } else if (NEGATE_KEY.equalsIgnoreCase(name)) {
                    setNegate(Project.toBoolean(parameterArr[i].getValue()));
                } else if (REGEX_KEY.equalsIgnoreCase(name)) {
                    setRegex(parameterArr[i].getValue());
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setRegex(String str) {
        this.regex = str;
        this.reg = null;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{filenameselector name: ");
        if (this.pattern != null) {
            stringBuffer.append(this.pattern);
        }
        if (this.regex != null) {
            stringBuffer.append(this.regex).append(" [as regular expression]");
        }
        stringBuffer.append(" negate: ").append(this.negated);
        stringBuffer.append(" casesensitive: ").append(this.casesensitive);
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.pattern == null && this.regex == null) {
            setError("The name or regex attribute is required");
        } else if (this.pattern == null || this.regex == null) {
        } else {
            setError("Only one of name and regex attribute is allowed");
        }
    }
}
