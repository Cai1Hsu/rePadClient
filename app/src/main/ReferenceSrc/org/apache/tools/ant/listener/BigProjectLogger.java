package org.apache.tools.ant.listener;

import java.io.File;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.SubBuildListener;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/listener/BigProjectLogger.class */
public class BigProjectLogger extends SimpleBigProjectLogger implements SubBuildListener {
    public static final String FOOTER = "======================================================================";
    public static final String HEADER = "======================================================================";
    private volatile boolean subBuildStartedRaised = false;
    private final Object subBuildLock = new Object();

    private void maybeRaiseSubBuildStarted(BuildEvent buildEvent) {
        if (!this.subBuildStartedRaised) {
            synchronized (this.subBuildLock) {
                if (!this.subBuildStartedRaised) {
                    this.subBuildStartedRaised = true;
                    subBuildStarted(buildEvent);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        maybeRaiseSubBuildStarted(buildEvent);
        subBuildFinished(buildEvent);
        super.buildFinished(buildEvent);
    }

    protected String extractNameOrDefault(BuildEvent buildEvent) {
        String extractProjectName = extractProjectName(buildEvent);
        return extractProjectName == null ? "" : new StringBuffer().append('\"').append(extractProjectName).append('\"').toString();
    }

    @Override // org.apache.tools.ant.DefaultLogger
    protected String getBuildFailedMessage() {
        return new StringBuffer().append(super.getBuildFailedMessage()).append(TimestampedLogger.SPACER).append(getTimestamp()).toString();
    }

    @Override // org.apache.tools.ant.DefaultLogger
    protected String getBuildSuccessfulMessage() {
        return new StringBuffer().append(super.getBuildSuccessfulMessage()).append(TimestampedLogger.SPACER).append(getTimestamp()).toString();
    }

    protected String getFooter() {
        return "======================================================================";
    }

    protected String getHeader() {
        return "======================================================================";
    }

    @Override // org.apache.tools.ant.NoBannerLogger, org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
        maybeRaiseSubBuildStarted(buildEvent);
        super.messageLogged(buildEvent);
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildFinished(BuildEvent buildEvent) {
        printMessage(new StringBuffer().append(StringUtils.LINE_SEP).append(getHeader()).append(StringUtils.LINE_SEP).append("Exiting ").append(buildEvent.getException() != null ? "failing " : "").append("project ").append(extractNameOrDefault(buildEvent)).append(StringUtils.LINE_SEP).append(getFooter()).toString(), this.out, buildEvent.getPriority());
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildStarted(BuildEvent buildEvent) {
        String extractNameOrDefault = extractNameOrDefault(buildEvent);
        Project project = buildEvent.getProject();
        File baseDir = project == null ? null : project.getBaseDir();
        printMessage(new StringBuffer().append(StringUtils.LINE_SEP).append(getHeader()).append(StringUtils.LINE_SEP).append("Entering project ").append(extractNameOrDefault).append(StringUtils.LINE_SEP).append(baseDir == null ? "With no base directory" : new StringBuffer().append("In ").append(baseDir.getAbsolutePath()).toString()).append(StringUtils.LINE_SEP).append(getFooter()).toString(), this.out, buildEvent.getPriority());
    }

    @Override // org.apache.tools.ant.NoBannerLogger, org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        maybeRaiseSubBuildStarted(buildEvent);
        super.targetStarted(buildEvent);
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
        maybeRaiseSubBuildStarted(buildEvent);
        super.taskStarted(buildEvent);
    }
}
