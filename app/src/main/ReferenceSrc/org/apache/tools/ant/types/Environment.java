package org.apache.tools.ant.types;

import java.io.File;
import java.util.Vector;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/Environment.class */
public class Environment {
    protected Vector variables = new Vector();

    /* loaded from: classes.jar:org/apache/tools/ant/types/Environment$Variable.class */
    public static class Variable {
        private String key;
        private String value;

        public String getContent() throws BuildException {
            validate();
            StringBuffer stringBuffer = new StringBuffer(this.key.trim());
            stringBuffer.append("=").append(this.value.trim());
            return stringBuffer.toString();
        }

        public String getKey() {
            return this.key;
        }

        public String getValue() {
            return this.value;
        }

        public void setFile(File file) {
            this.value = file.getAbsolutePath();
        }

        public void setKey(String str) {
            this.key = str;
        }

        public void setPath(Path path) {
            this.value = path.toString();
        }

        public void setValue(String str) {
            this.value = str;
        }

        public void validate() {
            if (this.key == null || this.value == null) {
                throw new BuildException("key and value must be specified for environment variables.");
            }
        }
    }

    public void addVariable(Variable variable) {
        this.variables.addElement(variable);
    }

    public String[] getVariables() throws BuildException {
        String[] strArr;
        if (this.variables.size() != 0) {
            String[] strArr2 = new String[this.variables.size()];
            int i = 0;
            while (true) {
                strArr = strArr2;
                if (i >= strArr2.length) {
                    break;
                }
                strArr2[i] = ((Variable) this.variables.elementAt(i)).getContent();
                i++;
            }
        } else {
            strArr = null;
        }
        return strArr;
    }

    public Vector getVariablesVector() {
        return this.variables;
    }
}
