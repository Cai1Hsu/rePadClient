package org.apache.tools.ant;

import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/NoBannerLogger.class */
public class NoBannerLogger extends DefaultLogger {
    protected String targetName;

    protected String extractTargetName(BuildEvent buildEvent) {
        return buildEvent.getTarget().getName();
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
        if (buildEvent.getPriority() > this.msgOutputLevel || buildEvent.getMessage() == null || "".equals(buildEvent.getMessage().trim())) {
            return;
        }
        synchronized (this) {
            if (this.targetName != null) {
                this.out.println(new StringBuffer().append(StringUtils.LINE_SEP).append(this.targetName).append(":").toString());
                this.targetName = null;
            }
        }
        super.messageLogged(buildEvent);
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
        synchronized (this) {
            this.targetName = null;
        }
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        synchronized (this) {
            this.targetName = extractTargetName(buildEvent);
        }
    }
}
