package com.mongodb;

/* loaded from: classes.dex */
class NoOpConnectionPoolListener implements ConnectionPoolListener {
    NoOpConnectionPoolListener() {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolOpened(ConnectionPoolOpenedEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolClosed(ConnectionPoolEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedOut(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedIn(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueEntered(ConnectionPoolWaitQueueEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueExited(ConnectionPoolWaitQueueEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionAdded(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionRemoved(ConnectionEvent event) {
    }
}
