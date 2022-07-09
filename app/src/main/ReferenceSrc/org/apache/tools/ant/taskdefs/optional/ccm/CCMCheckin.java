package org.apache.tools.ant.taskdefs.optional.ccm;

import java.util.Date;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ccm/CCMCheckin.class */
public class CCMCheckin extends CCMCheck {
    public CCMCheckin() {
        setCcmAction(Continuus.COMMAND_CHECKIN);
        setComment(new StringBuffer().append("Checkin ").append(new Date()).toString());
    }
}
