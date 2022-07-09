.class interface abstract Lcom/mongodb/Cluster;
.super Ljava/lang/Object;
.source "Cluster.java"


# virtual methods
.method public abstract close()V
.end method

.method public abstract getDescription(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ClusterDescription;
.end method

.method public abstract getServer(Lcom/mongodb/ServerSelector;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Server;
.end method

.method public abstract isClosed()Z
.end method
