.class final Lcom/mongodb/BaseCluster$WrappedServer;
.super Ljava/lang/Object;
.source "BaseCluster.java"

# interfaces
.implements Lcom/mongodb/Server;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BaseCluster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WrappedServer"
.end annotation


# instance fields
.field private final wrapped:Lcom/mongodb/ClusterableServer;


# direct methods
.method public constructor <init>(Lcom/mongodb/ClusterableServer;)V
    .locals 0
    .param p1, "server"    # Lcom/mongodb/ClusterableServer;

    .prologue
    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    iput-object p1, p0, Lcom/mongodb/BaseCluster$WrappedServer;->wrapped:Lcom/mongodb/ClusterableServer;

    .line 245
    return-void
.end method


# virtual methods
.method public getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;
    .locals 1
    .param p1, "maxWaitTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/mongodb/BaseCluster$WrappedServer;->wrapped:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0, p1, p2, p3}, Lcom/mongodb/ClusterableServer;->getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;

    move-result-object v0

    return-object v0
.end method

.method public getDescription()Lcom/mongodb/ServerDescription;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mongodb/BaseCluster$WrappedServer;->wrapped:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->getDescription()Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method public invalidate()V
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lcom/mongodb/BaseCluster$WrappedServer;->wrapped:Lcom/mongodb/ClusterableServer;

    invoke-interface {v0}, Lcom/mongodb/ClusterableServer;->invalidate()V

    .line 260
    return-void
.end method
