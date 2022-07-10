package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class ConnectionPoolListenerAdapter implements ConnectionPoolListener {
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
