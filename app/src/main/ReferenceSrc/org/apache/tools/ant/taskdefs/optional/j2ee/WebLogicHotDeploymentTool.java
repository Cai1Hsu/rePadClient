package org.apache.tools.ant.taskdefs.optional.j2ee;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.Java;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/j2ee/WebLogicHotDeploymentTool.class */
public class WebLogicHotDeploymentTool extends AbstractHotDeploymentTool implements HotDeploymentTool {
    private static final int STRING_BUFFER_SIZE = 1024;
    private static final String[] VALID_ACTIONS = {HotDeploymentTool.ACTION_DELETE, HotDeploymentTool.ACTION_DEPLOY, HotDeploymentTool.ACTION_LIST, HotDeploymentTool.ACTION_UNDEPLOY, "update"};
    private static final String WEBLOGIC_DEPLOY_CLASS_NAME = "weblogic.deploy";
    private String application;
    private String component;
    private boolean debug;

    protected StringBuffer buildArgsPrefix() {
        return new StringBuffer(1024).append(getServer() != null ? new StringBuffer().append("-url ").append(getServer()).toString() : "").append(" ").append(this.debug ? "-debug " : "").append(getUserName() != null ? new StringBuffer().append("-username ").append(getUserName()).toString() : "").append(" ").append(getTask().getAction()).append(" ").append(getPassword()).append(" ");
    }

    protected String buildDeployArgs() {
        String stringBuffer = buildArgsPrefix().append(this.application).append(" ").append(getTask().getSource()).toString();
        String str = stringBuffer;
        if (this.component != null) {
            str = new StringBuffer().append("-component ").append(this.component).append(" ").append(stringBuffer).toString();
        }
        return str;
    }

    protected String buildListArgs() {
        return buildArgsPrefix().toString();
    }

    protected String buildUndeployArgs() {
        return buildArgsPrefix().append(this.application).append(" ").toString();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void deploy() {
        Java java = new Java(getTask());
        java.setFork(true);
        java.setFailonerror(true);
        java.setClasspath(getClasspath());
        java.setClassname(WEBLOGIC_DEPLOY_CLASS_NAME);
        java.createArg().setLine(getArguments());
        java.execute();
    }

    public String getArguments() throws BuildException {
        String action = getTask().getAction();
        String str = null;
        if (action.equals(HotDeploymentTool.ACTION_DEPLOY) || action.equals("update")) {
            str = buildDeployArgs();
        } else if (action.equals(HotDeploymentTool.ACTION_DELETE) || action.equals(HotDeploymentTool.ACTION_UNDEPLOY)) {
            str = buildUndeployArgs();
        } else if (action.equals(HotDeploymentTool.ACTION_LIST)) {
            str = buildListArgs();
        }
        return str;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool
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

    public void setApplication(String str) {
        this.application = str;
    }

    public void setComponent(String str) {
        this.component = str;
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.j2ee.AbstractHotDeploymentTool, org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool
    public void validateAttributes() throws BuildException {
        super.validateAttributes();
        String action = getTask().getAction();
        if (getPassword() == null) {
            throw new BuildException("The password attribute must be set.");
        }
        if ((action.equals(HotDeploymentTool.ACTION_DEPLOY) || action.equals("update")) && this.application == null) {
            throw new BuildException(new StringBuffer().append("The application attribute must be set if action = ").append(action).toString());
        }
        if ((action.equals(HotDeploymentTool.ACTION_DEPLOY) || action.equals("update")) && getTask().getSource() == null) {
            throw new BuildException(new StringBuffer().append("The source attribute must be set if action = ").append(action).toString());
        }
        if ((!action.equals(HotDeploymentTool.ACTION_DELETE) && !action.equals(HotDeploymentTool.ACTION_UNDEPLOY)) || this.application != null) {
            return;
        }
        throw new BuildException(new StringBuffer().append("The application attribute must be set if action = ").append(action).toString());
    }
}
