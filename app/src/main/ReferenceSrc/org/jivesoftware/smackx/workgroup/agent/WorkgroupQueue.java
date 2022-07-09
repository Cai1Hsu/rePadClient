package org.jivesoftware.smackx.workgroup.agent;

import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.jivesoftware.smackx.workgroup.QueueUser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/WorkgroupQueue.class */
public class WorkgroupQueue {
    private String name;
    private Status status = Status.CLOSED;
    private int averageWaitTime = -1;
    private Date oldestEntry = null;
    private Set<QueueUser> users = Collections.emptySet();
    private int maxChats = 0;
    private int currentChats = 0;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status.class */
    public static class Status {
        private String value;
        public static final Status OPEN = new Status("open");
        public static final Status ACTIVE = new Status("active");
        public static final Status CLOSED = new Status("closed");

        private Status(String str) {
            this.value = str;
        }

        public static Status fromString(String str) {
            Status status;
            if (str == null) {
                status = null;
            } else {
                String lowerCase = str.toLowerCase();
                if (OPEN.toString().equals(lowerCase)) {
                    status = OPEN;
                } else if (ACTIVE.toString().equals(lowerCase)) {
                    status = ACTIVE;
                } else {
                    status = null;
                    if (CLOSED.toString().equals(lowerCase)) {
                        status = CLOSED;
                    }
                }
            }
            return status;
        }

        public String toString() {
            return this.value;
        }
    }

    WorkgroupQueue(String str) {
        this.name = str;
    }

    public int getAverageWaitTime() {
        return this.averageWaitTime;
    }

    public int getCurrentChats() {
        return this.currentChats;
    }

    public int getMaxChats() {
        return this.maxChats;
    }

    public String getName() {
        return this.name;
    }

    public Date getOldestEntry() {
        return this.oldestEntry;
    }

    public Status getStatus() {
        return this.status;
    }

    public int getUserCount() {
        return this.users == null ? 0 : this.users.size();
    }

    public Iterator<QueueUser> getUsers() {
        return this.users == null ? new HashSet().iterator() : Collections.unmodifiableSet(this.users).iterator();
    }

    void setAverageWaitTime(int i) {
        this.averageWaitTime = i;
    }

    void setCurrentChats(int i) {
        this.currentChats = i;
    }

    void setMaxChats(int i) {
        this.maxChats = i;
    }

    void setOldestEntry(Date date) {
        this.oldestEntry = date;
    }

    void setStatus(Status status) {
        this.status = status;
    }

    void setUsers(Set<QueueUser> set) {
        this.users = set;
    }
}
