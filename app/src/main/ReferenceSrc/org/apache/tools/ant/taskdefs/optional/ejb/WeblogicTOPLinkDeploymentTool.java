package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.util.Hashtable;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/WeblogicTOPLinkDeploymentTool.class */
public class WeblogicTOPLinkDeploymentTool extends WeblogicDeploymentTool {
    private static final String TL_DTD_LOC = "http://www.objectpeople.com/tlwl/dtd/toplink-cmp_2_5_1.dtd";
    private String toplinkDTD;
    private String toplinkDescriptor;

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.WeblogicDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        super.addVendorFiles(hashtable, str);
        File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(this.toplinkDescriptor).toString());
        if (file.exists()) {
            hashtable.put(new StringBuffer().append("META-INF/").append(this.toplinkDescriptor).toString(), file);
        } else {
            log(new StringBuffer().append("Unable to locate toplink deployment descriptor. It was expected to be in ").append(file.getPath()).toString(), 1);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected DescriptorHandler getDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = super.getDescriptorHandler(file);
        if (this.toplinkDTD != null) {
            descriptorHandler.registerDTD("-//The Object People, Inc.//DTD TOPLink for WebLogic CMP 2.5.1//EN", this.toplinkDTD);
        } else {
            descriptorHandler.registerDTD("-//The Object People, Inc.//DTD TOPLink for WebLogic CMP 2.5.1//EN", TL_DTD_LOC);
        }
        return descriptorHandler;
    }

    public void setToplinkdescriptor(String str) {
        this.toplinkDescriptor = str;
    }

    public void setToplinkdtd(String str) {
        this.toplinkDTD = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.WeblogicDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool, org.apache.tools.ant.taskdefs.optional.ejb.EJBDeploymentTool
    public void validateConfigured() throws BuildException {
        super.validateConfigured();
        if (this.toplinkDescriptor == null) {
            throw new BuildException("The toplinkdescriptor attribute must be specified");
        }
    }
}
