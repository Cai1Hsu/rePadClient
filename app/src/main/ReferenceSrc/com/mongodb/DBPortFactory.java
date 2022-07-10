package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class DBPortFactory implements ConnectionFactory {
    private final MongoOptions options;

    public DBPortFactory(MongoOptions options) {
        this.options = options;
    }

    @Override // com.mongodb.ConnectionFactory
    public Connection create(ServerAddress serverAddress, PooledConnectionProvider provider, int generation) {
        return new DBPort(serverAddress, provider, this.options, generation);
    }
}
