package org.apache.tools.ant.listener;

import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.NoBannerLogger;

/* loaded from: classes.jar:org/apache/tools/ant/listener/SimpleBigProjectLogger.class */
public class SimpleBigProjectLogger extends NoBannerLogger {
    @Override // org.apache.tools.ant.NoBannerLogger
    protected String extractTargetName(BuildEvent buildEvent) {
        String extractTargetName = super.extractTargetName(buildEvent);
        String extractProjectName = extractProjectName(buildEvent);
        String str = extractTargetName;
        if (extractProjectName != null) {
            str = extractTargetName;
            if (extractTargetName != null) {
                str = new StringBuffer().append(extractProjectName).append('.').append(extractTargetName).toString();
            }
        }
        return str;
    }
}
