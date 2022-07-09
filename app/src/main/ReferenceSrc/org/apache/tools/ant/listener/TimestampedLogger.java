package org.apache.tools.ant.listener;

import org.apache.tools.ant.DefaultLogger;

/* loaded from: classes.jar:org/apache/tools/ant/listener/TimestampedLogger.class */
public class TimestampedLogger extends DefaultLogger {
    public static final String SPACER = " - at ";

    @Override // org.apache.tools.ant.DefaultLogger
    protected String getBuildFailedMessage() {
        return new StringBuffer().append(super.getBuildFailedMessage()).append(SPACER).append(getTimestamp()).toString();
    }

    @Override // org.apache.tools.ant.DefaultLogger
    protected String getBuildSuccessfulMessage() {
        return new StringBuffer().append(super.getBuildSuccessfulMessage()).append(SPACER).append(getTimestamp()).toString();
    }
}
