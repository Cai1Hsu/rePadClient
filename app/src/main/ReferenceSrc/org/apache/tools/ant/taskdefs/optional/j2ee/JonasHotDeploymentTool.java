package org.apache.tools.ant.taskdefs.optional.j2ee;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/JonasHotDeploymentTool.class */
public class JonasHotDeploymentTool extends GenericHotDeploymentTool implements HotDeploymentTool {
    protected static final String DEFAULT_ORB = "RMI";
    private static final String JONAS_DEPLOY_CLASS_NAME = "org.objectweb.jonas.adm.JonasAdmin";
    private static final String[] VALID_ACTIONS = {HotDeploymentTool.ACTION_DELETE, HotDeploymentTool.ACTION_DEPLOY, HotDeploymentTool.ACTION_LIST, HotDeploymentTool.ACTION_UNDEPLOY, "update"};
    private String davidHost;
    private int davidPort;
    private File jonasroot;
    private String orb = null;

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool
    public Path getClasspath() {
        Path classpath = super.getClasspath();
        Path path = classpath;
        if (classpath == null) {
            path = new Path(getTask().getProject());
        }
        if (this.orb != null) {
            String file = new File(this.jonasroot, new StringBuffer().append("lib/").append(this.orb).append("_jonas.jar").toString()).toString();
            path.append(new Path(path.getProject(), new StringBuffer().append(file).append(File.pathSeparator).append(new File(this.jonasroot, "config/").toString()).toString()));
        }
        return path;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.GenericHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool
    protected boolean isActionValid() {
        boolean z;
        String action = getTask().getAction();
        int i = 0;
        while (true) {
            z = false;
            if (i >= VALID_ACTIONS.length) {
                break;
            } else if (action.equals(VALID_ACTIONS[i])) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public void setDavidhost(String str) {
        this.davidHost = str;
    }

    public void setDavidport(int i) {
        this.davidPort = i;
    }

    public void setJonasroot(File file) {
        this.jonasroot = file;
    }

    public void setOrb(String str) {
        this.orb = str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.GenericHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void validateAttributes() throws BuildException {
        Java java = getJava();
        String action = getTask().getAction();
        if (action == null) {
            throw new BuildException("The \"action\" attribute must be set");
        }
        if (!isActionValid()) {
            throw new BuildException(new StringBuffer().append("Invalid action \"").append(action).append("\" passed").toString());
        }
        if (getClassName() == null) {
            setClassName(JONAS_DEPLOY_CLASS_NAME);
        }
        if (this.jonasroot == null || this.jonasroot.isDirectory()) {
            java.createJvmarg().setValue(new StringBuffer().append("-Dinstall.root=").append(this.jonasroot).toString());
            java.createJvmarg().setValue(new StringBuffer().append("-Djava.security.policy=").append(this.jonasroot).append("/config/java.policy").toString());
            if ("DAVID".equals(this.orb)) {
                java.createJvmarg().setValue("-Dorg.omg.CORBA.ORBClass=org.objectweb.david.libs.binding.orbs.iiop.IIOPORB");
                java.createJvmarg().setValue("-Dorg.omg.CORBA.ORBSingletonClass=org.objectweb.david.libs.binding.orbs.ORBSingletonClass");
                java.createJvmarg().setValue("-Djavax.rmi.CORBA.StubClass=org.objectweb.david.libs.stub_factories.rmi.StubDelegate");
                java.createJvmarg().setValue("-Djavax.rmi.CORBA.PortableRemoteObjectClass=org.objectweb.david.libs.binding.rmi.ORBPortableRemoteObjectDelegate");
                java.createJvmarg().setValue("-Djavax.rmi.CORBA.UtilClass=org.objectweb.david.libs.helpers.RMIUtilDelegate");
                java.createJvmarg().setValue("-Ddavid.CosNaming.default_method=0");
                java.createJvmarg().setValue("-Ddavid.rmi.ValueHandlerClass=com.sun.corba.se.internal.io.ValueHandlerImpl");
                if (this.davidHost != null) {
                    java.createJvmarg().setValue(new StringBuffer().append("-Ddavid.CosNaming.default_host=").append(this.davidHost).toString());
                }
                if (this.davidPort != 0) {
                    java.createJvmarg().setValue(new StringBuffer().append("-Ddavid.CosNaming.default_port=").append(this.davidPort).toString());
                }
            }
        }
        if (getServer() != null) {
            java.createArg().setLine(new StringBuffer().append("-n ").append(getServer()).toString());
        }
        if (action.equals(HotDeploymentTool.ACTION_DEPLOY) || action.equals("update") || action.equals("redeploy")) {
            java.createArg().setLine(new StringBuffer().append("-a ").append(getTask().getSource()).toString());
        } else if (action.equals(HotDeploymentTool.ACTION_DELETE) || action.equals(HotDeploymentTool.ACTION_UNDEPLOY)) {
            java.createArg().setLine(new StringBuffer().append("-r ").append(getTask().getSource()).toString());
        } else if (!action.equals(HotDeploymentTool.ACTION_LIST)) {
        } else {
            java.createArg().setValue("-l");
        }
    }
}
