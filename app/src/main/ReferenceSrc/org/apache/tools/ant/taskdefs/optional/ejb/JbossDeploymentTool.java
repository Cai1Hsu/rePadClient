package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.util.Hashtable;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/JbossDeploymentTool.class */
public class JbossDeploymentTool extends GenericDeploymentTool {
    protected static final String JBOSS_CMP10D = "jaws.xml";
    protected static final String JBOSS_CMP20D = "jbosscmp-jdbc.xml";
    protected static final String JBOSS_DD = "jboss.xml";
    private String jarSuffix = ".jar";

    private EjbJar getParent() {
        return (EjbJar) getTask();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(JBOSS_DD).toString());
        if (!file.exists()) {
            log(new StringBuffer().append("Unable to locate jboss deployment descriptor. It was expected to be in ").append(file.getPath()).toString(), 1);
            return;
        }
        hashtable.put("META-INF/jboss.xml", file);
        String str2 = JBOSS_CMP10D;
        if (EjbJar.CMPVersion.CMP2_0.equals(getParent().getCmpversion())) {
            str2 = JBOSS_CMP20D;
        }
        File file2 = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(str2).toString());
        if (file2.exists()) {
            hashtable.put(new StringBuffer().append("META-INF/").append(str2).toString(), file2);
        } else {
            log(new StringBuffer().append("Unable to locate jboss cmp descriptor. It was expected to be in ").append(file2.getPath()).toString(), 3);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    File getVendorOutputJarFile(String str) {
        if (getDestDir() == null && getParent().getDestdir() == null) {
            throw new BuildException("DestDir not specified");
        }
        return getDestDir() == null ? new File(getParent().getDestdir(), new StringBuffer().append(str).append(this.jarSuffix).toString()) : new File(getDestDir(), new StringBuffer().append(str).append(this.jarSuffix).toString());
    }

    public void setSuffix(String str) {
        this.jarSuffix = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void validateConfigured() throws BuildException {
    }
}
