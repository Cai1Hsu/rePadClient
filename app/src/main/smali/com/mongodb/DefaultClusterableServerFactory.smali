.class Lcom/mongodb/DefaultClusterableServerFactory;
.super Ljava/lang/Object;
.source "DefaultClusterableServerFactory.java"

# interfaces
.implements Lcom/mongodb/ClusterableServerFactory;


# instance fields
.field private final clusterId:Ljava/lang/String;

.field private final mongo:Lcom/mongodb/Mongo;

.field private settings:Lcom/mongodb/ServerSettings;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerSettings;Lcom/mongodb/Mongo;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "settings"    # Lcom/mongodb/ServerSettings;
    .param p3, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/mongodb/DefaultClusterableServerFactory;->clusterId:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/mongodb/DefaultClusterableServerFactory;->settings:Lcom/mongodb/ServerSettings;

    .line 29
    iput-object p3, p0, Lcom/mongodb/DefaultClusterableServerFactory;->mongo:Lcom/mongodb/Mongo;

    .line 30
    return-void
.end method


# virtual methods
.method public create(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;
    .locals 13
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mongodb/DefaultClusterableServerFactory;->mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v11

    .line 35
    .local v11, "options":Lcom/mongodb/MongoOptions;
    invoke-static {}, Lcom/mongodb/ConnectionPoolSettings;->builder()Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    iget v1, v11, Lcom/mongodb/MongoOptions;->minConnectionsPerHost:I

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->minSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    invoke-virtual {v11}, Lcom/mongodb/MongoOptions;->getConnectionsPerHost()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    iget v1, v11, Lcom/mongodb/MongoOptions;->maxConnectionIdleTime:I

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionIdleTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    iget v1, v11, Lcom/mongodb/MongoOptions;->maxConnectionLifeTime:I

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionLifeTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    invoke-virtual {v11}, Lcom/mongodb/MongoOptions;->getConnectionsPerHost()I

    move-result v1

    invoke-virtual {v11}, Lcom/mongodb/MongoOptions;->getThreadsAllowedToBlockForConnectionMultiplier()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitQueueSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    invoke-virtual {v11}, Lcom/mongodb/MongoOptions;->getMaxWaitTime()I

    move-result v1

    int-to-long v2, v1

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolSettings$Builder;->build()Lcom/mongodb/ConnectionPoolSettings;

    move-result-object v4

    .line 44
    .local v4, "connectionPoolSettings":Lcom/mongodb/ConnectionPoolSettings;
    new-instance v12, Lcom/mongodb/DefaultServer;

    iget-object v7, p0, Lcom/mongodb/DefaultClusterableServerFactory;->settings:Lcom/mongodb/ServerSettings;

    iget-object v8, p0, Lcom/mongodb/DefaultClusterableServerFactory;->clusterId:Ljava/lang/String;

    new-instance v0, Lcom/mongodb/PooledConnectionProvider;

    iget-object v1, p0, Lcom/mongodb/DefaultClusterableServerFactory;->clusterId:Ljava/lang/String;

    new-instance v3, Lcom/mongodb/DBPortFactory;

    invoke-direct {v3, v11}, Lcom/mongodb/DBPortFactory;-><init>(Lcom/mongodb/MongoOptions;)V

    new-instance v5, Lcom/mongodb/JMXConnectionPoolListener;

    iget-object v2, p0, Lcom/mongodb/DefaultClusterableServerFactory;->mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/MongoOptions;->getDescription()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v2}, Lcom/mongodb/JMXConnectionPoolListener;-><init>(Ljava/lang/String;)V

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/PooledConnectionProvider;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/ConnectionFactory;Lcom/mongodb/ConnectionPoolSettings;Lcom/mongodb/ConnectionPoolListener;)V

    iget-object v10, p0, Lcom/mongodb/DefaultClusterableServerFactory;->mongo:Lcom/mongodb/Mongo;

    move-object v5, v12

    move-object v6, p1

    move-object v9, v0

    invoke-direct/range {v5 .. v10}, Lcom/mongodb/DefaultServer;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ServerSettings;Ljava/lang/String;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Mongo;)V

    return-object v12
.end method

.method public getSettings()Lcom/mongodb/ServerSettings;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mongodb/DefaultClusterableServerFactory;->settings:Lcom/mongodb/ServerSettings;

    return-object v0
.end method
