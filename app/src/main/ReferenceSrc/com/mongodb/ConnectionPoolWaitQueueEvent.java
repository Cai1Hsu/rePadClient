package com.mongodb;

/* loaded from: classes.dex */
class ConnectionPoolWaitQueueEvent extends ConnectionPoolEvent {
    private final long threadId;

    public ConnectionPoolWaitQueueEvent(String clusterId, ServerAddress serverAddress, long threadId) {
        super(clusterId, serverAddress);
        this.threadId = threadId;
    }

    public long getThreadId() {
        return this.threadId;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ConnectionPoolWaitQueueEvent that = (ConnectionPoolWaitQueueEvent) o;
        return getClusterId().equals(that.getClusterId()) && getServerAddress().equals(that.getServerAddress()) && this.threadId == that.threadId;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (result * 31) + ((int) (this.threadId ^ (this.threadId >>> 32)));
    }
}
