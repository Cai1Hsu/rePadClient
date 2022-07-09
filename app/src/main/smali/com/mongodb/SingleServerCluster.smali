.class final Lcom/mongodb/SingleServerCluster;
.super Lcom/mongodb/BaseCluster;
.source "SingleServerCluster.java"


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final server:Lcom/mongodb/ClusterableServer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string/jumbo v0, "cluster"

    invoke-static {v0}, Lcom/mongodb/Loggers;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/SingleServerCluster;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V
    .locals 5
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "settings"    # Lcom/mongodb/ClusterSettings;
    .param p3, "serverFactory"    # Lcom/mongodb/ClusterableServerFactory;
    .param p4, "clusterListener"    # Lcom/mongodb/ClusterListener;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/BaseCluster;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V

    .line 37
    const-string/jumbo v3, "one server in a direct cluster"

    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 38
    const-string/jumbo v3, "connection mode is single"

    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v0

    sget-object v4, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-ne v0, v4, :cond_1

    move v0, v1

    :goto_1
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 40
    sget-object v0, Lcom/mongodb/SingleServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v3, "Cluster created with settings %s"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getShortDescription()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 44
    monitor-enter p0

    .line 45
    :try_start_0
    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getHosts()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerAddress;

    new-instance v1, Lcom/mongodb/SingleServerCluster$1;

    invoke-direct {v1, p0}, Lcom/mongodb/SingleServerCluster$1;-><init>(Lcom/mongodb/SingleServerCluster;)V

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/SingleServerCluster;->createServer(Lcom/mongodb/ServerAddress;Lcom/mongodb/ChangeListener;)Lcom/mongodb/ClusterableServer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/SingleServerCluster;->server:Lcom/mongodb/ClusterableServer;

    .line 64
    iget-object v0, p0, Lcom/mongodb/SingleServerCluster;->server:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->getDescription()Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/SingleServerCluster;->publishDescription(Lcom/mongodb/ServerDescription;)V

    .line 65
    monitor-exit p0

    .line 66
    return-void

    :cond_0
    move v0, v2

    .line 37
    goto :goto_0

    :cond_1
    move v0, v2

    .line 38
    goto :goto_1

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic access$000(Lcom/mongodb/SingleServerCluster;Lcom/mongodb/ServerDescription;)V
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/SingleServerCluster;
    .param p1, "x1"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/mongodb/SingleServerCluster;->publishDescription(Lcom/mongodb/ServerDescription;)V

    return-void
.end method

.method private publishDescription(Lcom/mongodb/ServerDescription;)V
    .locals 5
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 74
    invoke-virtual {p0}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ClusterSettings;->getRequiredClusterType()Lcom/mongodb/ClusterType;

    move-result-object v0

    .line 75
    .local v0, "clusterType":Lcom/mongodb/ClusterType;
    sget-object v2, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v0, v2, :cond_0

    if-eqz p1, :cond_0

    .line 76
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getClusterType()Lcom/mongodb/ClusterType;

    move-result-object v0

    .line 78
    :cond_0
    new-instance v1, Lcom/mongodb/ClusterDescription;

    sget-object v3, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-nez p1, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_0
    invoke-direct {v1, v3, v0, v2}, Lcom/mongodb/ClusterDescription;-><init>(Lcom/mongodb/ClusterConnectionMode;Lcom/mongodb/ClusterType;Ljava/util/List;)V

    .line 81
    .local v1, "description":Lcom/mongodb/ClusterDescription;
    invoke-virtual {p0, v1}, Lcom/mongodb/SingleServerCluster;->updateDescription(Lcom/mongodb/ClusterDescription;)V

    .line 82
    invoke-virtual {p0}, Lcom/mongodb/SingleServerCluster;->fireChangeEvent()V

    .line 83
    return-void

    .line 78
    .end local v1    # "description":Lcom/mongodb/ClusterDescription;
    :cond_1
    const/4 v2, 0x1

    new-array v2, v2, [Lcom/mongodb/ServerDescription;

    const/4 v4, 0x0

    aput-object p1, v2, v4

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/mongodb/SingleServerCluster;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/mongodb/SingleServerCluster;->server:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->close()V

    .line 96
    invoke-super {p0}, Lcom/mongodb/BaseCluster;->close()V

    .line 98
    :cond_0
    return-void
.end method

.method protected connect()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mongodb/SingleServerCluster;->server:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->connect()V

    .line 71
    return-void
.end method

.method protected getServer(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 87
    const-string/jumbo v1, "open"

    invoke-virtual {p0}, Lcom/mongodb/SingleServerCluster;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 89
    iget-object v0, p0, Lcom/mongodb/SingleServerCluster;->server:Lcom/mongodb/ClusterableServer;

    return-object v0

    .line 87
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
