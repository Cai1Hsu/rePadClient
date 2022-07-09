package org.jivesoftware.smackx.workgroup.user;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/user/QueueListener.class */
public interface QueueListener {
    void departedQueue();

    void joinedQueue();

    void queuePositionUpdated(int i);

    void queueWaitTimeUpdated(int i);
}
