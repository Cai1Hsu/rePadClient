.class final Lcom/mongodb/MultiServerCluster;
.super Lcom/mongodb/BaseCluster;
.source "MultiServerCluster.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MultiServerCluster$1;,
        Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;,
        Lcom/mongodb/MultiServerCluster$ServerTuple;
    }
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lcom/mongodb/ServerAddress;",
            "Lcom/mongodb/MultiServerCluster$ServerTuple;",
            ">;"
        }
    .end annotation
.end field

.field private clusterType:Lcom/mongodb/ClusterType;

.field private replicaSetName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string/jumbo v0, "cluster"

    invoke-static {v0}, Lcom/mongodb/Loggers;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V
    .locals 7
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "settings"    # Lcom/mongodb/ClusterSettings;
    .param p3, "serverFactory"    # Lcom/mongodb/ClusterableServerFactory;
    .param p4, "clusterListener"    # Lcom/mongodb/ClusterListener;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 60
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/BaseCluster;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V

    .line 45
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    .line 61
    const-string/jumbo v5, "connection mode is multiple"

    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v2

    sget-object v6, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v2, v6, :cond_0

    move v2, v3

    :goto_0
    invoke-static {v5, v2}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 62
    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getRequiredClusterType()Lcom/mongodb/ClusterType;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    .line 63
    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/MultiServerCluster;->replicaSetName:Ljava/lang/String;

    .line 65
    sget-object v2, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v5, "Cluster created with settings %s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getShortDescription()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v4

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 69
    monitor-enter p0

    .line 70
    :try_start_0
    invoke-virtual {p2}, Lcom/mongodb/ClusterSettings;->getHosts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerAddress;

    .line 71
    .local v1, "serverAddress":Lcom/mongodb/ServerAddress;
    invoke-direct {p0, v1}, Lcom/mongodb/MultiServerCluster;->addServer(Lcom/mongodb/ServerAddress;)V

    goto :goto_1

    .line 74
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "serverAddress":Lcom/mongodb/ServerAddress;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_0
    move v2, v4

    .line 61
    goto :goto_0

    .line 73
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lcom/mongodb/MultiServerCluster;->updateDescription()V

    .line 74
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->fireChangeEvent()V

    .line 76
    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/MultiServerCluster;Lcom/mongodb/ChangeEvent;)V
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/MultiServerCluster;
    .param p1, "x1"    # Lcom/mongodb/ChangeEvent;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster;->onChange(Lcom/mongodb/ChangeEvent;)V

    return-void
.end method

.method private addHostsToSet(Ljava/util/Set;Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 302
    .local p1, "hosts":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p2, "retVal":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerAddress;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 304
    .local v0, "host":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lcom/mongodb/ServerAddress;

    invoke-direct {v2, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 305
    :catch_0
    move-exception v2

    goto :goto_0

    .line 309
    .end local v0    # "host":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private addNewHosts(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 273
    .local p1, "hosts":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 275
    .local v0, "cur":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lcom/mongodb/ServerAddress;

    invoke-direct {v2, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lcom/mongodb/MultiServerCluster;->addServer(Lcom/mongodb/ServerAddress;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 276
    :catch_0
    move-exception v2

    goto :goto_0

    .line 280
    .end local v0    # "cur":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private addServer(Lcom/mongodb/ServerAddress;)V
    .locals 6
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    const/4 v5, 0x0

    .line 213
    iget-object v1, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 214
    sget-object v1, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v2, "Adding discovered server %s to client view of cluster"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 215
    new-instance v1, Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;

    invoke-direct {v1, p0, v5}, Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;-><init>(Lcom/mongodb/MultiServerCluster;Lcom/mongodb/MultiServerCluster$1;)V

    invoke-virtual {p0, p1, v1}, Lcom/mongodb/MultiServerCluster;->createServer(Lcom/mongodb/ServerAddress;Lcom/mongodb/ChangeListener;)Lcom/mongodb/ClusterableServer;

    move-result-object v0

    .line 216
    .local v0, "server":Lcom/mongodb/ClusterableServer;
    iget-object v1, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v2, Lcom/mongodb/MultiServerCluster$ServerTuple;

    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster;->getConnectingServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v3

    invoke-direct {v2, v0, v3, v5}, Lcom/mongodb/MultiServerCluster$ServerTuple;-><init>(Lcom/mongodb/ClusterableServer;Lcom/mongodb/ServerDescription;Lcom/mongodb/MultiServerCluster$1;)V

    invoke-interface {v1, p1, v2}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    .end local v0    # "server":Lcom/mongodb/ClusterableServer;
    :cond_0
    return-void
.end method

.method private ensureServers(Lcom/mongodb/ServerDescription;)V
    .locals 1
    .param p1, "description"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 252
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/mongodb/MultiServerCluster;->hasPrimary()Z

    move-result v0

    if-nez v0, :cond_1

    .line 253
    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getHosts()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->addNewHosts(Ljava/util/Set;)V

    .line 254
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getPassives()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->addNewHosts(Ljava/util/Set;)V

    .line 255
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getArbiters()Ljava/util/Set;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->addNewHosts(Ljava/util/Set;)V

    .line 258
    :cond_1
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 259
    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster;->removeExtraHosts(Lcom/mongodb/ServerDescription;)V

    .line 261
    :cond_2
    return-void
.end method

.method private getAllServerAddresses(Lcom/mongodb/ServerDescription;)Ljava/util/Set;
    .locals 2
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerDescription;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 294
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 295
    .local v0, "retVal":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerAddress;>;"
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getHosts()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/mongodb/MultiServerCluster;->addHostsToSet(Ljava/util/Set;Ljava/util/Set;)V

    .line 296
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getPassives()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/mongodb/MultiServerCluster;->addHostsToSet(Ljava/util/Set;Ljava/util/Set;)V

    .line 297
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getArbiters()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/mongodb/MultiServerCluster;->addHostsToSet(Ljava/util/Set;Ljava/util/Set;)V

    .line 298
    return-object v0
.end method

.method private getConnectingServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 235
    invoke-static {}, Lcom/mongodb/ServerDescription;->builder()Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ServerDescription$Builder;->address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription$Builder;->build()Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method private getNewServerDescriptionList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 244
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 245
    .local v2, "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    iget-object v3, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 246
    .local v0, "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 248
    .end local v0    # "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_0
    return-object v2
.end method

.method private handleReplicaSetMemberChanged(Lcom/mongodb/ServerDescription;)V
    .locals 7
    .param p1, "newDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 155
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isReplicaSetMember()Z

    move-result v0

    if-nez v0, :cond_1

    .line 156
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Expecting replica set member, but found a %s.  Removing %s from client view of cluster."

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getType()Lcom/mongodb/ServerType;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 158
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->removeServer(Lcom/mongodb/ServerAddress;)V

    .line 188
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getType()Lcom/mongodb/ServerType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetGhost:Lcom/mongodb/ServerType;

    if-ne v0, v1, :cond_2

    .line 163
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Server %s does not appear to be a member of an initiated replica set."

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    goto :goto_0

    .line 167
    :cond_2
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster;->replicaSetName:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 168
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getSetName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MultiServerCluster;->replicaSetName:Ljava/lang/String;

    .line 171
    :cond_3
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster;->replicaSetName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getSetName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 172
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Expecting replica set member from set \'%s\', but found one from set \'%s\'.  Removing %s from client view of cluster."

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/mongodb/MultiServerCluster;->replicaSetName:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getSetName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 176
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->removeServer(Lcom/mongodb/ServerAddress;)V

    goto :goto_0

    .line 180
    :cond_4
    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster;->ensureServers(Lcom/mongodb/ServerDescription;)V

    .line 182
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->isNotAlreadyPrimary(Lcom/mongodb/ServerAddress;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 184
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Discovered replica set primary %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 186
    :cond_5
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->invalidateOldPrimaries(Lcom/mongodb/ServerAddress;)V

    goto/16 :goto_0
.end method

.method private handleShardRouterChanged(Lcom/mongodb/ServerDescription;)V
    .locals 5
    .param p1, "newDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 196
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getClusterType()Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-eq v0, v1, :cond_0

    .line 197
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Expecting a %s, but found a %s.  Removing %s from client view of cluster."

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getType()Lcom/mongodb/ServerType;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 199
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->removeServer(Lcom/mongodb/ServerAddress;)V

    .line 201
    :cond_0
    return-void
.end method

.method private handleStandAloneChanged(Lcom/mongodb/ServerDescription;)V
    .locals 6
    .param p1, "newDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    const/4 v5, 0x1

    .line 204
    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ClusterSettings;->getHosts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v5, :cond_0

    .line 205
    sget-object v0, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v1, "Expecting a single %s, but found more than one.  Removing %s from client view of cluster."

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    sget-object v4, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    aput-object v4, v2, v3

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 207
    sget-object v0, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    iput-object v0, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    .line 208
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->removeServer(Lcom/mongodb/ServerAddress;)V

    .line 210
    :cond_0
    return-void
.end method

.method private hasPrimary()Z
    .locals 3

    .prologue
    .line 264
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 265
    .local v1, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    const/4 v2, 0x1

    .line 269
    .end local v1    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private invalidateOldPrimaries(Lcom/mongodb/ServerAddress;)V
    .locals 7
    .param p1, "newPrimary"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 226
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 227
    .local v1, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 228
    sget-object v2, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v3, "Rediscovering type of existing primary %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 229
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;

    move-result-object v2

    invoke-interface {v2}, Lcom/mongodb/ClusterableServer;->invalidate()V

    goto :goto_0

    .line 232
    .end local v1    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_1
    return-void
.end method

.method private isNotAlreadyPrimary(Lcom/mongodb/ServerAddress;)Z
    .locals 2
    .param p1, "address"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 191
    iget-object v1, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 192
    .local v0, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->isPrimary()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private onChange(Lcom/mongodb/ChangeEvent;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ChangeEvent",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p1, "event":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<Lcom/mongodb/ServerDescription;>;"
    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    :goto_0
    return-void

    .line 120
    :cond_0
    monitor-enter p0

    .line 121
    :try_start_0
    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 122
    .local v0, "newDescription":Lcom/mongodb/ServerDescription;
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 123
    .local v1, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    if-nez v1, :cond_1

    .line 124
    monitor-exit p0

    goto :goto_0

    .line 150
    .end local v0    # "newDescription":Lcom/mongodb/ServerDescription;
    .end local v1    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 127
    .restart local v0    # "newDescription":Lcom/mongodb/ServerDescription;
    .restart local v1    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/ServerDescription;

    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->isOk()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 128
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    sget-object v3, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v2, v3, :cond_2

    .line 129
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getClusterType()Lcom/mongodb/ClusterType;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    .line 130
    sget-object v2, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v3, "Discovered cluster type of %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 133
    :cond_2
    sget-object v2, Lcom/mongodb/MultiServerCluster$1;->$SwitchMap$com$mongodb$ClusterType:[I

    iget-object v3, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    invoke-virtual {v3}, Lcom/mongodb/ClusterType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 148
    :cond_3
    :goto_1
    invoke-static {v1, v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$202(Lcom/mongodb/MultiServerCluster$ServerTuple;Lcom/mongodb/ServerDescription;)Lcom/mongodb/ServerDescription;

    .line 149
    invoke-direct {p0}, Lcom/mongodb/MultiServerCluster;->updateDescription()V

    .line 150
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->fireChangeEvent()V

    goto :goto_0

    .line 135
    :pswitch_0
    :try_start_2
    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->handleReplicaSetMemberChanged(Lcom/mongodb/ServerDescription;)V

    goto :goto_1

    .line 138
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->handleShardRouterChanged(Lcom/mongodb/ServerDescription;)V

    goto :goto_1

    .line 141
    :pswitch_2
    invoke-direct {p0, v0}, Lcom/mongodb/MultiServerCluster;->handleStandAloneChanged(Lcom/mongodb/ServerDescription;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 133
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private removeExtraHosts(Lcom/mongodb/ServerDescription;)V
    .locals 8
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 283
    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster;->getAllServerAddresses(Lcom/mongodb/ServerDescription;)Ljava/util/Set;

    move-result-object v0

    .line 284
    .local v0, "allServerAddresses":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerAddress;>;"
    iget-object v3, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 285
    .local v1, "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 286
    sget-object v3, Lcom/mongodb/MultiServerCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v4, "Server %s is no longer a member of the replica set.  Removing from client view of cluster."

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 288
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mongodb/MultiServerCluster;->removeServer(Lcom/mongodb/ServerAddress;)V

    goto :goto_0

    .line 291
    .end local v1    # "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_1
    return-void
.end method

.method private removeServer(Lcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MultiServerCluster$ServerTuple;

    invoke-static {v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;

    move-result-object v0

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->close()V

    .line 223
    return-void
.end method

.method private updateDescription()V
    .locals 4

    .prologue
    .line 239
    invoke-direct {p0}, Lcom/mongodb/MultiServerCluster;->getNewServerDescriptionList()Ljava/util/List;

    move-result-object v0

    .line 240
    .local v0, "newServerDescriptionList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    new-instance v1, Lcom/mongodb/ClusterDescription;

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    iget-object v3, p0, Lcom/mongodb/MultiServerCluster;->clusterType:Lcom/mongodb/ClusterType;

    invoke-direct {v1, v2, v3, v0}, Lcom/mongodb/ClusterDescription;-><init>(Lcom/mongodb/ClusterConnectionMode;Lcom/mongodb/ClusterType;Ljava/util/List;)V

    invoke-virtual {p0, v1}, Lcom/mongodb/MultiServerCluster;->updateDescription(Lcom/mongodb/ClusterDescription;)V

    .line 241
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 87
    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->isClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 88
    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 90
    .local v1, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v1}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;

    move-result-object v2

    invoke-interface {v2}, Lcom/mongodb/ClusterableServer;->close()V

    goto :goto_0

    .line 92
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    invoke-super {p0}, Lcom/mongodb/BaseCluster;->close()V

    .line 95
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method protected connect()V
    .locals 3

    .prologue
    .line 80
    iget-object v2, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 81
    .local v0, "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    invoke-static {v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;

    move-result-object v2

    invoke-interface {v2}, Lcom/mongodb/ClusterableServer;->connect()V

    goto :goto_0

    .line 83
    .end local v0    # "cur":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_0
    return-void
.end method

.method protected getServer(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;
    .locals 3
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 99
    const-string/jumbo v2, "is open"

    invoke-virtual {p0}, Lcom/mongodb/MultiServerCluster;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 101
    iget-object v1, p0, Lcom/mongodb/MultiServerCluster;->addressToServerTupleMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MultiServerCluster$ServerTuple;

    .line 102
    .local v0, "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    if-nez v0, :cond_1

    .line 103
    const/4 v1, 0x0

    .line 105
    :goto_1
    return-object v1

    .line 99
    .end local v0    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 105
    .restart local v0    # "serverTuple":Lcom/mongodb/MultiServerCluster$ServerTuple;
    :cond_1
    invoke-static {v0}, Lcom/mongodb/MultiServerCluster$ServerTuple;->access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;

    move-result-object v1

    goto :goto_1
.end method
