package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.StringTokenizer;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/DepthSelector.class */
public class DepthSelector extends BaseExtendSelector {
    public static final String MAX_KEY = "max";
    public static final String MIN_KEY = "min";
    public int min = -1;
    public int max = -1;

    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) {
        boolean z = false;
        validate();
        int i = -1;
        String absolutePath = file.getAbsolutePath();
        String absolutePath2 = file2.getAbsolutePath();
        StringTokenizer stringTokenizer = new StringTokenizer(absolutePath, File.separator);
        StringTokenizer stringTokenizer2 = new StringTokenizer(absolutePath2, File.separator);
        while (true) {
            if (stringTokenizer2.hasMoreTokens()) {
                String nextToken = stringTokenizer2.nextToken();
                if (!stringTokenizer.hasMoreTokens()) {
                    int i2 = i + 1;
                    i = i2;
                    if (this.max > -1) {
                        i = i2;
                        if (i2 > this.max) {
                            break;
                        }
                    } else {
                        continue;
                    }
                } else if (!stringTokenizer.nextToken().equals(nextToken)) {
                    throw new BuildException(new StringBuffer().append("File ").append(str).append(" does not appear within ").append(absolutePath).append(EjbJar.NamingScheme.DIRECTORY).toString());
                }
            } else if (stringTokenizer.hasMoreTokens()) {
                throw new BuildException(new StringBuffer().append("File ").append(str).append(" is outside of ").append(absolutePath).append("directory tree").toString());
            } else {
                if (this.min <= -1 || i >= this.min) {
                    z = true;
                }
            }
        }
        return z;
    }

    public void setMax(int i) {
        this.max = i;
    }

    public void setMin(int i) {
        this.min = i;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0035 -> B:10:0x002e). Please submit an issue!!! */
    @Override // org.apache.tools.ant.types.selectors.BaseExtendSelector, org.apache.tools.ant.types.Parameterizable
    public void setParameters(Parameter[] parameterArr) {
        super.setParameters(parameterArr);
        if (parameterArr != null) {
            for (int i = 0; i < parameterArr.length; i++) {
                String name = parameterArr[i].getName();
                if (MIN_KEY.equalsIgnoreCase(name)) {
                    try {
                        setMin(Integer.parseInt(parameterArr[i].getValue()));
                    } catch (NumberFormatException e) {
                        setError(new StringBuffer().append("Invalid minimum value ").append(parameterArr[i].getValue()).toString());
                    }
                } else if (MAX_KEY.equalsIgnoreCase(name)) {
                    try {
                        setMax(Integer.parseInt(parameterArr[i].getValue()));
                    } catch (NumberFormatException e2) {
                        setError(new StringBuffer().append("Invalid maximum value ").append(parameterArr[i].getValue()).toString());
                    }
                } else {
                    setError(new StringBuffer().append("Invalid parameter ").append(name).toString());
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        StringBuffer stringBuffer = new StringBuffer("{depthselector min: ");
        stringBuffer.append(this.min);
        stringBuffer.append(" max: ");
        stringBuffer.append(this.max);
        stringBuffer.append("}");
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.min < 0 && this.max < 0) {
            setError("You must set at least one of the min or the max levels.");
        }
        if (this.max >= this.min || this.max <= -1) {
            return;
        }
        setError("The maximum depth is lower than the minimum.");
    }
}
