package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ConnectionPoolOpenedEvent extends ConnectionPoolEvent {
    private final ConnectionPoolSettings settings;

    public ConnectionPoolOpenedEvent(String clusterId, ServerAddress serverAddress, ConnectionPoolSettings settings) {
        super(clusterId, serverAddress);
        this.settings = settings;
    }

    public ConnectionPoolSettings getSettings() {
        return this.settings;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ConnectionPoolOpenedEvent that = (ConnectionPoolOpenedEvent) o;
        return getClusterId().equals(that.getClusterId()) && getServerAddress().equals(that.getServerAddress()) && this.settings.equals(that.getSettings());
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (result * 31) + this.settings.hashCode();
    }
}
