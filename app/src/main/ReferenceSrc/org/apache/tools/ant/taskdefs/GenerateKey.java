package org.apache.tools.ant.taskdefs;

import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/GenerateKey.class */
public class GenerateKey extends Task {
    protected String alias;
    protected String dname;
    protected DistinguishedName expandedDname;
    protected String keyalg;
    protected String keypass;
    protected int keysize;
    protected String keystore;
    protected String sigalg;
    protected String storepass;
    protected String storetype;
    protected int validity;
    protected boolean verbose;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName.class */
    public static class DistinguishedName {
        private Vector params = new Vector();

        public Object createParam() {
            DnameParam dnameParam = new DnameParam();
            this.params.addElement(dnameParam);
            return dnameParam;
        }

        public String encode(String str) {
            int indexOf = str.indexOf(44);
            if (-1 != indexOf) {
                StringBuffer stringBuffer = new StringBuffer();
                int i = 0;
                while (-1 != indexOf) {
                    stringBuffer.append(str.substring(i, indexOf));
                    stringBuffer.append("\\,");
                    i = indexOf + 1;
                    indexOf = str.indexOf(44, i);
                }
                stringBuffer.append(str.substring(i));
                str = stringBuffer.toString();
            }
            return str;
        }

        public Enumeration getParams() {
            return this.params.elements();
        }

        public String toString() {
            int size = this.params.size();
            StringBuffer stringBuffer = new StringBuffer();
            boolean z = true;
            for (int i = 0; i < size; i++) {
                if (!z) {
                    stringBuffer.append(" ,");
                }
                z = false;
                DnameParam dnameParam = (DnameParam) this.params.elementAt(i);
                stringBuffer.append(encode(dnameParam.getName()));
                stringBuffer.append('=');
                stringBuffer.append(encode(dnameParam.getValue()));
            }
            return stringBuffer.toString();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/GenerateKey$DnameParam.class */
    public static class DnameParam {
        private String name;
        private String value;

        public String getName() {
            return this.name;
        }

        public String getValue() {
            return this.value;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    public DistinguishedName createDname() throws BuildException {
        if (this.expandedDname != null) {
            throw new BuildException("DName sub-element can only be specified once.");
        }
        if (this.dname != null) {
            throw new BuildException("It is not possible to specify dname  both as attribute and element.");
        }
        this.expandedDname = new DistinguishedName();
        return this.expandedDname;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.alias == null) {
            throw new BuildException(SignJar.ERROR_NO_ALIAS);
        }
        if (this.storepass == null) {
            throw new BuildException(SignJar.ERROR_NO_STOREPASS);
        }
        if (this.dname == null && this.expandedDname == null) {
            throw new BuildException("dname must be set");
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("-genkey ");
        if (this.verbose) {
            stringBuffer.append("-v ");
        }
        stringBuffer.append("-alias \"");
        stringBuffer.append(this.alias);
        stringBuffer.append("\" ");
        if (this.dname != null) {
            stringBuffer.append("-dname \"");
            stringBuffer.append(this.dname);
            stringBuffer.append("\" ");
        }
        if (this.expandedDname != null) {
            stringBuffer.append("-dname \"");
            stringBuffer.append(this.expandedDname);
            stringBuffer.append("\" ");
        }
        if (this.keystore != null) {
            stringBuffer.append("-keystore \"");
            stringBuffer.append(this.keystore);
            stringBuffer.append("\" ");
        }
        if (this.storepass != null) {
            stringBuffer.append("-storepass \"");
            stringBuffer.append(this.storepass);
            stringBuffer.append("\" ");
        }
        if (this.storetype != null) {
            stringBuffer.append("-storetype \"");
            stringBuffer.append(this.storetype);
            stringBuffer.append("\" ");
        }
        stringBuffer.append("-keypass \"");
        if (this.keypass != null) {
            stringBuffer.append(this.keypass);
        } else {
            stringBuffer.append(this.storepass);
        }
        stringBuffer.append("\" ");
        if (this.sigalg != null) {
            stringBuffer.append("-sigalg \"");
            stringBuffer.append(this.sigalg);
            stringBuffer.append("\" ");
        }
        if (this.keyalg != null) {
            stringBuffer.append("-keyalg \"");
            stringBuffer.append(this.keyalg);
            stringBuffer.append("\" ");
        }
        if (this.keysize > 0) {
            stringBuffer.append("-keysize \"");
            stringBuffer.append(this.keysize);
            stringBuffer.append("\" ");
        }
        if (this.validity > 0) {
            stringBuffer.append("-validity \"");
            stringBuffer.append(this.validity);
            stringBuffer.append("\" ");
        }
        log(new StringBuffer().append("Generating Key for ").append(this.alias).toString());
        ExecTask execTask = new ExecTask(this);
        execTask.setExecutable(JavaEnvUtils.getJdkExecutable("keytool"));
        execTask.createArg().setLine(stringBuffer.toString());
        execTask.setFailonerror(true);
        execTask.setTaskName(getTaskName());
        execTask.execute();
    }

    public void setAlias(String str) {
        this.alias = str;
    }

    public void setDname(String str) {
        if (this.expandedDname != null) {
            throw new BuildException("It is not possible to specify dname  both as attribute and element.");
        }
        this.dname = str;
    }

    public void setKeyalg(String str) {
        this.keyalg = str;
    }

    public void setKeypass(String str) {
        this.keypass = str;
    }

    public void setKeysize(String str) throws BuildException {
        try {
            this.keysize = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            throw new BuildException("KeySize attribute should be a integer");
        }
    }

    public void setKeystore(String str) {
        this.keystore = str;
    }

    public void setSigalg(String str) {
        this.sigalg = str;
    }

    public void setStorepass(String str) {
        this.storepass = str;
    }

    public void setStoretype(String str) {
        this.storetype = str;
    }

    public void setValidity(String str) throws BuildException {
        try {
            this.validity = Integer.parseInt(str);
        } catch (NumberFormatException e) {
            throw new BuildException("Validity attribute should be a integer");
        }
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
