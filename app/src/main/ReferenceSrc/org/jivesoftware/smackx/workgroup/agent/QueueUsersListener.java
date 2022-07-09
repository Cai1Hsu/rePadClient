package org.jivesoftware.smackx.workgroup.agent;

import java.util.Date;
import java.util.Set;
import org.jivesoftware.smackx.workgroup.QueueUser;
import org.jivesoftware.smackx.workgroup.agent.WorkgroupQueue;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/QueueUsersListener.class */
public interface QueueUsersListener {
    void averageWaitTimeUpdated(WorkgroupQueue workgroupQueue, int i);

    void oldestEntryUpdated(WorkgroupQueue workgroupQueue, Date date);

    void statusUpdated(WorkgroupQueue workgroupQueue, WorkgroupQueue.Status status);

    void usersUpdated(WorkgroupQueue workgroupQueue, Set<QueueUser> set);
}
