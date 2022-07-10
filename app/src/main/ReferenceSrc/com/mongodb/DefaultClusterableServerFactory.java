package com.mongodb;

import java.util.concurrent.TimeUnit;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class DefaultClusterableServerFactory implements ClusterableServerFactory {
    private final String clusterId;
    private final Mongo mongo;
    private ServerSettings settings;

    public DefaultClusterableServerFactory(String clusterId, ServerSettings settings, Mongo mongo) {
        this.clusterId = clusterId;
        this.settings = settings;
        this.mongo = mongo;
    }

    @Override // com.mongodb.ClusterableServerFactory
    public ClusterableServer create(ServerAddress serverAddress) {
        MongoOptions options = this.mongo.getMongoOptions();
        ConnectionPoolSettings connectionPoolSettings = ConnectionPoolSettings.builder().minSize(options.minConnectionsPerHost).maxSize(options.getConnectionsPerHost()).maxConnectionIdleTime(options.maxConnectionIdleTime, TimeUnit.MILLISECONDS).maxConnectionLifeTime(options.maxConnectionLifeTime, TimeUnit.MILLISECONDS).maxWaitQueueSize(options.getConnectionsPerHost() * options.getThreadsAllowedToBlockForConnectionMultiplier()).maxWaitTime(options.getMaxWaitTime(), TimeUnit.MILLISECONDS).build();
        return new DefaultServer(serverAddress, this.settings, this.clusterId, new PooledConnectionProvider(this.clusterId, serverAddress, new DBPortFactory(options), connectionPoolSettings, new JMXConnectionPoolListener(this.mongo.getMongoOptions().getDescription())), this.mongo);
    }

    @Override // com.mongodb.ClusterableServerFactory
    public ServerSettings getSettings() {
        return this.settings;
    }
}
