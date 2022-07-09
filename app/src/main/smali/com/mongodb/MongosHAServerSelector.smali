.class Lcom/mongodb/MongosHAServerSelector;
.super Ljava/lang/Object;
.source "MongosHAServerSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# instance fields
.field private consideredServers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation
.end field

.field private stickTo:Lcom/mongodb/ServerAddress;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mongodb/MongosHAServerSelector;->consideredServers:Ljava/util/Set;

    return-void
.end method

.method private getOkServers(Lcom/mongodb/ClusterDescription;)Ljava/util/Set;
    .locals 4
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 72
    .local v2, "okServers":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerAddress;>;"
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAny()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 73
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 75
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :cond_0
    return-object v2
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 8
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getConnectionMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v4

    sget-object v5, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v4, v5, :cond_0

    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v4

    sget-object v5, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-eq v4, v5, :cond_1

    .line 33
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "This is not a sharded cluster with multiple mongos servers"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 36
    :cond_1
    invoke-direct {p0, p1}, Lcom/mongodb/MongosHAServerSelector;->getOkServers(Lcom/mongodb/ClusterDescription;)Ljava/util/Set;

    move-result-object v3

    .line 38
    .local v3, "okServers":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerAddress;>;"
    monitor-enter p0

    .line 39
    :try_start_0
    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->consideredServers:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 40
    :cond_2
    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 41
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    .line 42
    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->consideredServers:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 44
    :cond_3
    const/4 v1, 0x0

    .line 45
    .local v1, "fastestServer":Lcom/mongodb/ServerDescription;
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAny()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 46
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    if-eqz v1, :cond_5

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v4

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_4

    .line 47
    :cond_5
    move-object v1, v0

    goto :goto_0

    .line 50
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :cond_6
    if-eqz v1, :cond_7

    .line 51
    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    iput-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    .line 52
    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->consideredServers:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 55
    .end local v1    # "fastestServer":Lcom/mongodb/ServerDescription;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_7
    iget-object v4, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    if-nez v4, :cond_8

    .line 56
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    monitor-exit p0

    .line 58
    :goto_1
    return-object v4

    :cond_8
    const/4 v4, 0x1

    new-array v4, v4, [Lcom/mongodb/ServerDescription;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    invoke-virtual {p1, v6}, Lcom/mongodb/ClusterDescription;->getByServerAddress(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    monitor-exit p0

    goto :goto_1

    .line 60
    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongosHAServerSelector{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "stickTo="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/mongodb/MongosHAServerSelector;->stickTo:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
