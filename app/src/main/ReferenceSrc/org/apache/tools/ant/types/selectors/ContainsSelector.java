package org.apache.tools.ant.types.selectors;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/ContainsSelector.class */
public class ContainsSelector extends BaseExtendSelector implements ResourceSelector {
    public static final String CASE_KEY = "casesensitive";
    public static final String CONTAINS_KEY = "text";
    public static final String EXPRESSION_KEY = "expression";
    public static final String WHITESPACE_KEY = "ignorewhitespace";
    private String contains = null;
    private boolean casesensitive = true;
    private boolean ignorewhitespace = false;

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        return isSelected(new FileResource(file2));
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        BufferedReader bufferedReader;
        validate();
        boolean z = true;
        if (!resource.isDirectory()) {
            if (this.contains.length() == 0) {
                z = true;
            } else {
                String str = this.contains;
                if (!this.casesensitive) {
                    str = this.contains.toLowerCase();
                }
                String str2 = str;
                if (this.ignorewhitespace) {
                    str2 = SelectorUtils.removeWhitespace(str);
                }
                try {
                    try {
                        bufferedReader = new BufferedReader(new InputStreamReader(resource.getInputStream()));
                        try {
                            String readLine = bufferedReader.readLine();
                            while (true) {
                                if (readLine == null) {
                                    z = false;
                                    break;
                                }
                                String str3 = readLine;
                                if (!this.casesensitive) {
                                    str3 = readLine.toLowerCase();
                                }
                                String str4 = str3;
                                if (this.ignorewhitespace) {
                                    str4 = SelectorUtils.removeWhitespace(str3);
                                }
                                if (str4.indexOf(str2) > -1) {
                                    FileUtils.close(bufferedReader);
                                    z = true;
                                    break;
                                }
                                readLine = bufferedReader.readLine();
                            }
                        } catch (IOException e) {
                            throw new BuildException(new StringBuffer().append("Could not read ").append(resource.toLongString()).toString());
                        }
                    } finally {
                        FileUtils.close(bufferedReader);
                    }
                } catch (Exception e2) {
                    throw new BuildException(new StringBuffer().append("Could not get InputStream from ").append(resource.toLongString()).toString(), e2);
                }
            }
        }
        return z;
    }

    public void setCasesensitive(boolean z) {
        this.casesensitive = z;
    }

    public void setIgnorewhitespace(boolean z) {
        this.ignorewhitespace = z;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if (CONTAINS_KEY.equalsIgnoreCase(name)) {
                    setText(parameterArr[i].getValue());
                } else if ("casesensitive".equalsIgnoreCase(name)) {
                    setCasesensitive(Project.toBoolean(parameterArr[i].getValue()));
                } else if (WHITESPACE_KEY.equalsIgnoreCase(name)) {
                    setIgnorewhitespace(Project.toBoolean(parameterArr[i].getValue()));
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    public void setText(String str) {
        this.contains = str;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{containsselector text: ");
        stringBuffer.append('\"').append(this.contains).append('\"');
        stringBuffer.append(" casesensitive: ");
        stringBuffer.append(this.casesensitive ? "true" : "false");
        stringBuffer.append(" ignorewhitespace: ");
        stringBuffer.append(this.ignorewhitespace ? "true" : "false");
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.contains == null) {
            setError("The text attribute is required");
        }
    }
}
