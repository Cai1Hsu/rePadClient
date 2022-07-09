package org.jivesoftware.smackx.workgroup;

import java.util.Date;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/QueueUser.class */
public class QueueUser {
    private int estimatedTime;
    private Date joinDate;
    private int queuePosition;
    private String userID;

    public QueueUser(String str, int i, int i2, Date date) {
        this.userID = str;
        this.queuePosition = i;
        this.estimatedTime = i2;
        this.joinDate = date;
    }

    public int getEstimatedRemainingTime() {
        return this.estimatedTime;
    }

    public Date getQueueJoinTimestamp() {
        return this.joinDate;
    }

    public int getQueuePosition() {
        return this.queuePosition;
    }

    public String getUserID() {
        return this.userID;
    }
}
