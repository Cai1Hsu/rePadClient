package com.mongodb;

import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes.dex */
final class ConnectionPoolStatistics extends ConnectionPoolListenerAdapter implements ConnectionPoolStatisticsMBean {
    private final ServerAddress serverAddress;
    private final ConnectionPoolSettings settings;
    private final AtomicInteger size = new AtomicInteger();
    private final AtomicInteger checkedOutCount = new AtomicInteger();
    private final AtomicInteger waitQueueSize = new AtomicInteger();

    public ConnectionPoolStatistics(ConnectionPoolOpenedEvent event) {
        this.serverAddress = event.getServerAddress();
        this.settings = event.getSettings();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public String getHost() {
        return this.serverAddress.getHost();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getPort() {
        return this.serverAddress.getPort();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getMinSize() {
        return this.settings.getMinSize();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getMaxSize() {
        return this.settings.getMaxSize();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getSize() {
        return this.size.get();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getCheckedOutCount() {
        return this.checkedOutCount.get();
    }

    @Override // com.mongodb.ConnectionPoolStatisticsMBean
    public int getWaitQueueSize() {
        return this.waitQueueSize.get();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void connectionCheckedOut(ConnectionEvent event) {
        this.checkedOutCount.incrementAndGet();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void connectionCheckedIn(ConnectionEvent event) {
        this.checkedOutCount.decrementAndGet();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void connectionAdded(ConnectionEvent event) {
        this.size.incrementAndGet();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void connectionRemoved(ConnectionEvent event) {
        this.size.decrementAndGet();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void waitQueueEntered(ConnectionPoolWaitQueueEvent event) {
        this.waitQueueSize.incrementAndGet();
    }

    @Override // com.mongodb.ConnectionPoolListenerAdapter, com.mongodb.ConnectionPoolListener
    public void waitQueueExited(ConnectionPoolWaitQueueEvent event) {
        this.waitQueueSize.decrementAndGet();
    }
}
