package org.apache.tools.ant.types.selectors;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/ContainsRegexpSelector.class */
public class ContainsRegexpSelector extends BaseExtendSelector implements ResourceSelector {
    private static final String CS_KEY = "casesensitive";
    public static final String EXPRESSION_KEY = "expression";
    private static final String ML_KEY = "multiline";
    private static final String SL_KEY = "singleline";
    private String userProvidedExpression = null;
    private RegularExpression myRegExp = null;
    private Regexp myExpression = null;
    private boolean caseSensitive = true;
    private boolean multiLine = false;
    private boolean singleLine = false;

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        return isSelected(new FileResource(file2));
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean z = true;
        validate();
        if (!resource.isDirectory()) {
            if (this.myRegExp == null) {
                this.myRegExp = new RegularExpression();
                this.myRegExp.setPattern(this.userProvidedExpression);
                this.myExpression = this.myRegExp.getRegexp(getProject());
            }
            try {
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(resource.getInputStream()));
                try {
                    try {
                        String readLine = bufferedReader.readLine();
                        while (true) {
                            if (readLine == null) {
                                z = false;
                                try {
                                    bufferedReader.close();
                                    break;
                                } catch (Exception e) {
                                    throw new BuildException(new StringBuffer().append("Could not close ").append(resource.toLongString()).toString());
                                }
                            } else if (this.myExpression.matches(readLine, RegexpUtil.asOptions(this.caseSensitive, this.multiLine, this.singleLine))) {
                                try {
                                    bufferedReader.close();
                                    break;
                                } catch (Exception e2) {
                                    throw new BuildException(new StringBuffer().append("Could not close ").append(resource.toLongString()).toString());
                                }
                            } else {
                                readLine = bufferedReader.readLine();
                            }
                        }
                    } catch (IOException e3) {
                        throw new BuildException(new StringBuffer().append("Could not read ").append(resource.toLongString()).toString());
                    }
                } catch (Throwable th) {
                    try {
                        bufferedReader.close();
                        throw th;
                    } catch (Exception e4) {
                        throw new BuildException(new StringBuffer().append("Could not close ").append(resource.toLongString()).toString());
                    }
                }
            } catch (Exception e5) {
                throw new BuildException(new StringBuffer().append("Could not get InputStream from ").append(resource.toLongString()).toString(), e5);
            }
        }
        return z;
    }

    public void setCaseSensitive(boolean z) {
        this.caseSensitive = z;
    }

    public void setExpression(String str) {
        this.userProvidedExpression = str;
    }

    public void setMultiLine(boolean z) {
        this.multiLine = z;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if ("expression".equalsIgnoreCase(name)) {
                    setExpression(parameterArr[i].getValue());
                } else if ("casesensitive".equalsIgnoreCase(name)) {
                    setCaseSensitive(Project.toBoolean(parameterArr[i].getValue()));
                } else if (ML_KEY.equalsIgnoreCase(name)) {
                    setMultiLine(Project.toBoolean(parameterArr[i].getValue()));
                } else if (SL_KEY.equalsIgnoreCase(name)) {
                    setSingleLine(Project.toBoolean(parameterArr[i].getValue()));
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setSingleLine(boolean z) {
        this.singleLine = z;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{containsregexpselector expression: ");
        stringBuffer.append(this.userProvidedExpression);
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.userProvidedExpression == null) {
            setError("The expression attribute is required");
        }
    }
}
