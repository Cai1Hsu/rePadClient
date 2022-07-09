package com.mongodb;

/* loaded from: classes.dex */
class ConnectionEvent extends ClusterEvent {
    private final ServerAddress serverAddress;

    public ConnectionEvent(String clusterId, ServerAddress serverAddress) {
        super(clusterId);
        this.serverAddress = serverAddress;
    }

    public ServerAddress getServerAddress() {
        return this.serverAddress;
    }

    @Override // com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        if (!super.equals(o)) {
            return false;
        }
        ConnectionEvent that = (ConnectionEvent) o;
        return getClusterId().equals(that.getClusterId()) && getServerAddress().equals(that.getServerAddress()) && this.serverAddress.equals(that.serverAddress);
    }

    @Override // com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (result * 31) + this.serverAddress.hashCode();
    }
}
