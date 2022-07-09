package org.apache.tools.ant.listener;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/listener/ProfileLogger.class */
public class ProfileLogger extends DefaultLogger {
    private Map profileData = new HashMap();

    private void logFinish(BuildEvent buildEvent, Date date, String str) {
        String stringBuffer;
        Date date2 = new Date();
        if (date != null) {
            stringBuffer = new StringBuffer().append(StringUtils.LINE_SEP).append(str).append(": finished ").append(date2).append(" (").append(date2.getTime() - date.getTime()).append("ms)").toString();
        } else {
            stringBuffer = new StringBuffer().append(StringUtils.LINE_SEP).append(str).append(": finished ").append(date2).append(" (unknown duration, start not detected)").toString();
        }
        printMessage(stringBuffer, this.out, buildEvent.getPriority());
        log(stringBuffer);
    }

    private void logStart(BuildEvent buildEvent, Date date, String str) {
        String stringBuffer = new StringBuffer().append(StringUtils.LINE_SEP).append(str).append(": started ").append(date).toString();
        printMessage(stringBuffer, this.out, buildEvent.getPriority());
        log(stringBuffer);
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
        logFinish(buildEvent, (Date) this.profileData.remove(buildEvent.getTarget()), new StringBuffer().append("Target ").append(buildEvent.getTarget().getName()).toString());
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        Date date = new Date();
        logStart(buildEvent, date, new StringBuffer().append("Target ").append(buildEvent.getTarget().getName()).toString());
        this.profileData.put(buildEvent.getTarget(), date);
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
        logFinish(buildEvent, (Date) this.profileData.remove(buildEvent.getTask()), buildEvent.getTask().getTaskName());
    }

    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
        String taskName = buildEvent.getTask().getTaskName();
        Date date = new Date();
        logStart(buildEvent, date, taskName);
        this.profileData.put(buildEvent.getTask(), date);
    }
}
