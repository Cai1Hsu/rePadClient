package org.apache.tools.ant.taskdefs.optional.j2ee;

import java.io.File;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/ServerDeploy.class */
public class ServerDeploy extends Task {
    private String action;
    private File source;
    private Vector vendorTools = new Vector();

    public void addGeneric(GenericHotDeploymentTool genericHotDeploymentTool) {
        genericHotDeploymentTool.setTask(this);
        this.vendorTools.addElement(genericHotDeploymentTool);
    }

    public void addJonas(JonasHotDeploymentTool jonasHotDeploymentTool) {
        jonasHotDeploymentTool.setTask(this);
        this.vendorTools.addElement(jonasHotDeploymentTool);
    }

    public void addWeblogic(WebLogicHotDeploymentTool webLogicHotDeploymentTool) {
        webLogicHotDeploymentTool.setTask(this);
        this.vendorTools.addElement(webLogicHotDeploymentTool);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Enumeration elements = this.vendorTools.elements();
        while (elements.hasMoreElements()) {
            HotDeploymentTool hotDeploymentTool = (HotDeploymentTool) elements.nextElement();
            hotDeploymentTool.validateAttributes();
            hotDeploymentTool.deploy();
        }
    }

    public String getAction() {
        return this.action;
    }

    public File getSource() {
        return this.source;
    }

    public void setAction(String str) {
        this.action = str;
    }

    public void setSource(File file) {
        this.source = file;
    }
}
