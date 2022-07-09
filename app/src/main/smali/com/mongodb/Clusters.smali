.class final Lcom/mongodb/Clusters;
.super Ljava/lang/Object;
.source "Clusters.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ServerSettings;Lcom/mongodb/ClusterListener;Lcom/mongodb/Mongo;)Lcom/mongodb/Cluster;
    .locals 4
    .param p0, "clusterId"    # Ljava/lang/String;
    .param p1, "settings"    # Lcom/mongodb/ClusterSettings;
    .param p2, "serverSettings"    # Lcom/mongodb/ServerSettings;
    .param p3, "clusterListener"    # Lcom/mongodb/ClusterListener;
    .param p4, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 29
    new-instance v0, Lcom/mongodb/DefaultClusterableServerFactory;

    invoke-direct {v0, p0, p2, p4}, Lcom/mongodb/DefaultClusterableServerFactory;-><init>(Ljava/lang/String;Lcom/mongodb/ServerSettings;Lcom/mongodb/Mongo;)V

    .line 31
    .local v0, "serverFactory":Lcom/mongodb/ClusterableServerFactory;
    invoke-virtual {p1}, Lcom/mongodb/ClusterSettings;->getMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_1

    .line 32
    new-instance v1, Lcom/mongodb/SingleServerCluster;

    if-eqz p3, :cond_0

    .end local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :goto_0
    invoke-direct {v1, p0, p1, v0, p3}, Lcom/mongodb/SingleServerCluster;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V

    .line 35
    :goto_1
    return-object v1

    .line 32
    .restart local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :cond_0
    new-instance p3, Lcom/mongodb/NoOpClusterListener;

    .end local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    invoke-direct {p3}, Lcom/mongodb/NoOpClusterListener;-><init>()V

    goto :goto_0

    .line 34
    .restart local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :cond_1
    invoke-virtual {p1}, Lcom/mongodb/ClusterSettings;->getMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_3

    .line 35
    new-instance v1, Lcom/mongodb/MultiServerCluster;

    if-eqz p3, :cond_2

    .end local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :goto_2
    invoke-direct {v1, p0, p1, v0, p3}, Lcom/mongodb/MultiServerCluster;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V

    goto :goto_1

    .restart local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :cond_2
    new-instance p3, Lcom/mongodb/NoOpClusterListener;

    .end local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    invoke-direct {p3}, Lcom/mongodb/NoOpClusterListener;-><init>()V

    goto :goto_2

    .line 38
    .restart local p3    # "clusterListener":Lcom/mongodb/ClusterListener;
    :cond_3
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unsupported cluster mode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ClusterSettings;->getMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
