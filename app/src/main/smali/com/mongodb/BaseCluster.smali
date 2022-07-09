.class abstract Lcom/mongodb/BaseCluster;
.super Ljava/lang/Object;
.source "BaseCluster.java"

# interfaces
.implements Lcom/mongodb/Cluster;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/BaseCluster$WrappedServer;
    }
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final clusterId:Ljava/lang/String;

.field private final clusterListener:Lcom/mongodb/ClusterListener;

.field private volatile description:Lcom/mongodb/ClusterDescription;

.field private volatile isClosed:Z

.field private final phase:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/util/concurrent/CountDownLatch;",
            ">;"
        }
    .end annotation
.end field

.field private final random:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Random;",
            ">;"
        }
    .end annotation
.end field

.field private final serverFactory:Lcom/mongodb/ClusterableServerFactory;

.field private final settings:Lcom/mongodb/ClusterSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "cluster"

    invoke-static {v0}, Lcom/mongodb/Loggers;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/BaseCluster;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V
    .locals 3
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "settings"    # Lcom/mongodb/ClusterSettings;
    .param p3, "serverFactory"    # Lcom/mongodb/ClusterableServerFactory;
    .param p4, "clusterListener"    # Lcom/mongodb/ClusterListener;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    .line 39
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->random:Ljava/lang/ThreadLocal;

    .line 49
    const-string/jumbo v0, "clusterId"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->clusterId:Ljava/lang/String;

    .line 50
    const-string/jumbo v0, "settings"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterSettings;

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->settings:Lcom/mongodb/ClusterSettings;

    .line 51
    const-string/jumbo v0, "serverFactory"

    invoke-static {v0, p3}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterableServerFactory;

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->serverFactory:Lcom/mongodb/ClusterableServerFactory;

    .line 52
    const-string/jumbo v0, "clusterListener"

    invoke-static {v0, p4}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterListener;

    iput-object v0, p0, Lcom/mongodb/BaseCluster;->clusterListener:Lcom/mongodb/ClusterListener;

    .line 53
    new-instance v0, Lcom/mongodb/ClusterEvent;

    invoke-direct {v0, p1}, Lcom/mongodb/ClusterEvent;-><init>(Ljava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/mongodb/ClusterListener;->clusterOpened(Lcom/mongodb/ClusterEvent;)V

    .line 54
    return-void
.end method

.method private getRandom()Ljava/util/Random;
    .locals 2

    .prologue
    .line 225
    iget-object v1, p0, Lcom/mongodb/BaseCluster;->random:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Random;

    .line 226
    .local v0, "result":Ljava/util/Random;
    if-nez v0, :cond_0

    .line 227
    new-instance v0, Ljava/util/Random;

    .end local v0    # "result":Ljava/util/Random;
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 228
    .restart local v0    # "result":Ljava/util/Random;
    iget-object v1, p0, Lcom/mongodb/BaseCluster;->random:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 230
    :cond_0
    return-object v0
.end method

.method private getRandomServer(Ljava/util/List;)Lcom/mongodb/ClusterableServer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)",
            "Lcom/mongodb/ClusterableServer;"
        }
    .end annotation

    .prologue
    .line 202
    .local p1, "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 203
    invoke-direct {p0}, Lcom/mongodb/BaseCluster;->getRandom()Ljava/util/Random;

    move-result-object v2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    .line 204
    .local v1, "serverPos":I
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/ServerDescription;

    invoke-virtual {v2}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mongodb/BaseCluster;->getServer(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;

    move-result-object v0

    .line 205
    .local v0, "server":Lcom/mongodb/ClusterableServer;
    if-eqz v0, :cond_0

    .line 212
    .end local v0    # "server":Lcom/mongodb/ClusterableServer;
    .end local v1    # "serverPos":I
    :goto_1
    return-object v0

    .line 209
    .restart local v0    # "server":Lcom/mongodb/ClusterableServer;
    .restart local v1    # "serverPos":I
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 212
    .end local v0    # "server":Lcom/mongodb/ClusterableServer;
    .end local v1    # "serverPos":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private throwIfIncompatible(Lcom/mongodb/ClusterDescription;)V
    .locals 4
    .param p1, "curDescription"    # Lcom/mongodb/ClusterDescription;

    .prologue
    .line 216
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->isCompatibleWithDriver()Z

    move-result v0

    if-nez v0, :cond_0

    .line 217
    new-instance v0, Lcom/mongodb/MongoIncompatibleDriverException;

    const-string/jumbo v1, "This version of the driver is not compatible with one or more of the servers to which it is connected: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/MongoIncompatibleDriverException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    .line 163
    invoke-virtual {p0}, Lcom/mongodb/BaseCluster;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 164
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/BaseCluster;->isClosed:Z

    .line 165
    iget-object v0, p0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 166
    iget-object v0, p0, Lcom/mongodb/BaseCluster;->clusterListener:Lcom/mongodb/ClusterListener;

    new-instance v1, Lcom/mongodb/ClusterEvent;

    iget-object v2, p0, Lcom/mongodb/BaseCluster;->clusterId:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/mongodb/ClusterEvent;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ClusterListener;->clusterClosed(Lcom/mongodb/ClusterEvent;)V

    .line 168
    :cond_0
    return-void
.end method

.method protected abstract connect()V
.end method

.method protected createServer(Lcom/mongodb/ServerAddress;Lcom/mongodb/ChangeListener;)Lcom/mongodb/ClusterableServer;
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerAddress;",
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)",
            "Lcom/mongodb/ClusterableServer;"
        }
    .end annotation

    .prologue
    .line 235
    .local p2, "serverStateListener":Lcom/mongodb/ChangeListener;, "Lcom/mongodb/ChangeListener<Lcom/mongodb/ServerDescription;>;"
    iget-object v1, p0, Lcom/mongodb/BaseCluster;->serverFactory:Lcom/mongodb/ClusterableServerFactory;

    invoke-interface {v1, p1}, Lcom/mongodb/ClusterableServerFactory;->create(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;

    move-result-object v0

    .line 236
    .local v0, "server":Lcom/mongodb/ClusterableServer;
    invoke-interface {v0, p2}, Lcom/mongodb/ClusterableServer;->addChangeListener(Lcom/mongodb/ChangeListener;)V

    .line 237
    return-object v0
.end method

.method protected fireChangeEvent()V
    .locals 4

    .prologue
    .line 197
    iget-object v0, p0, Lcom/mongodb/BaseCluster;->clusterListener:Lcom/mongodb/ClusterListener;

    new-instance v1, Lcom/mongodb/ClusterDescriptionChangedEvent;

    iget-object v2, p0, Lcom/mongodb/BaseCluster;->clusterId:Ljava/lang/String;

    iget-object v3, p0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ClusterDescriptionChangedEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterDescription;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ClusterListener;->clusterDescriptionChanged(Lcom/mongodb/ClusterDescriptionChangedEvent;)V

    .line 198
    return-void
.end method

.method public getDescription(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ClusterDescription;
    .locals 21
    .param p1, "maxWaitTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 113
    const-string/jumbo v15, "open"

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/BaseCluster;->isClosed()Z

    move-result v14

    if-nez v14, :cond_0

    const/4 v14, 0x1

    :goto_0
    invoke-static {v15, v14}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 116
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/CountDownLatch;

    .line 117
    .local v5, "currentPhase":Ljava/util/concurrent/CountDownLatch;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;

    .line 119
    .local v4, "curDescription":Lcom/mongodb/ClusterDescription;
    const/4 v9, 0x0

    .line 121
    .local v9, "selectionFailureLogged":Z
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 122
    .local v12, "startTimeNanos":J
    sget-object v14, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, p1

    move-object/from16 v2, p3

    invoke-virtual {v14, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v14

    add-long v10, v12, v14

    .line 123
    .local v10, "endTimeNanos":J
    move-wide v6, v12

    .line 125
    .local v6, "curTimeNanos":J
    :goto_1
    invoke-virtual {v4}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v14

    sget-object v15, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v14, v15, :cond_3

    .line 127
    cmp-long v14, v6, v10

    if-lez v14, :cond_1

    .line 128
    new-instance v14, Lcom/mongodb/MongoTimeoutException;

    const-string/jumbo v15, "Timed out after %d ms while waiting to connect. Client view of cluster state is %s"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget-object v18, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-virtual {v4}, Lcom/mongodb/ClusterDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lcom/mongodb/MongoTimeoutException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .end local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .end local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .end local v6    # "curTimeNanos":J
    .end local v9    # "selectionFailureLogged":Z
    .end local v10    # "endTimeNanos":J
    .end local v12    # "startTimeNanos":J
    :catch_0
    move-exception v8

    .line 153
    .local v8, "e":Ljava/lang/InterruptedException;
    new-instance v14, Lcom/mongodb/MongoInterruptedException;

    const-string/jumbo v15, "Interrupted while waiting to connect"

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v8}, Lcom/mongodb/MongoInterruptedException;-><init>(Ljava/lang/String;Ljava/lang/InterruptedException;)V

    throw v14

    .line 113
    .end local v8    # "e":Ljava/lang/InterruptedException;
    :cond_0
    const/4 v14, 0x0

    goto :goto_0

    .line 134
    .restart local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .restart local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .restart local v6    # "curTimeNanos":J
    .restart local v9    # "selectionFailureLogged":Z
    .restart local v10    # "endTimeNanos":J
    .restart local v12    # "startTimeNanos":J
    :cond_1
    if-nez v9, :cond_2

    .line 135
    :try_start_1
    sget-object v14, Lcom/mongodb/BaseCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v15, "Cluster description not yet available. Waiting for %d ms before timing out"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget-object v18, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v18

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 137
    const/4 v9, 0x1

    .line 140
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/BaseCluster;->connect()V

    .line 142
    sub-long v14, v10, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mongodb/BaseCluster;->serverFactory:Lcom/mongodb/ClusterableServerFactory;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lcom/mongodb/ClusterableServerFactory;->getSettings()Lcom/mongodb/ServerSettings;

    move-result-object v16

    sget-object v17, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v16 .. v17}, Lcom/mongodb/ServerSettings;->getHeartbeatConnectRetryFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v16

    invoke-static/range {v14 .. v17}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v14

    sget-object v16, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v16

    invoke-virtual {v5, v14, v15, v0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 146
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 148
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v14}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    check-cast v5, Ljava/util/concurrent/CountDownLatch;

    .line 149
    .restart local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 151
    :cond_3
    return-object v4
.end method

.method protected abstract getServer(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ClusterableServer;
.end method

.method public getServer(Lcom/mongodb/ServerSelector;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Server;
    .locals 22
    .param p1, "serverSelector"    # Lcom/mongodb/ServerSelector;
    .param p2, "maxWaitTime"    # J
    .param p4, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 58
    const-string/jumbo v17, "open"

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/BaseCluster;->isClosed()Z

    move-result v16

    if-nez v16, :cond_0

    const/16 v16, 0x1

    :goto_0
    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 61
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/concurrent/CountDownLatch;

    .line 62
    .local v5, "currentPhase":Ljava/util/concurrent/CountDownLatch;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;

    .line 63
    .local v4, "curDescription":Lcom/mongodb/ClusterDescription;
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcom/mongodb/ServerSelector;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v13

    .line 65
    .local v13, "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    const/4 v9, 0x0

    .line 67
    .local v9, "selectionFailureLogged":Z
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 68
    .local v14, "startTimeNanos":J
    sget-object v16, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v16

    move-wide/from16 v1, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v16

    add-long v10, v14, v16

    .line 69
    .local v10, "endTimeNanos":J
    move-wide v6, v14

    .line 72
    .local v6, "curTimeNanos":J
    :goto_1
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/mongodb/BaseCluster;->throwIfIncompatible(Lcom/mongodb/ClusterDescription;)V

    .line 74
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_1

    .line 75
    new-instance v16, Ljava/util/ArrayList;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/mongodb/BaseCluster;->getRandomServer(Ljava/util/List;)Lcom/mongodb/ClusterableServer;

    move-result-object v12

    .line 76
    .local v12, "server":Lcom/mongodb/ClusterableServer;
    if-eqz v12, :cond_1

    .line 77
    new-instance v16, Lcom/mongodb/BaseCluster$WrappedServer;

    move-object/from16 v0, v16

    invoke-direct {v0, v12}, Lcom/mongodb/BaseCluster$WrappedServer;-><init>(Lcom/mongodb/ClusterableServer;)V

    return-object v16

    .line 58
    .end local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .end local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .end local v6    # "curTimeNanos":J
    .end local v9    # "selectionFailureLogged":Z
    .end local v10    # "endTimeNanos":J
    .end local v12    # "server":Lcom/mongodb/ClusterableServer;
    .end local v13    # "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    .end local v14    # "startTimeNanos":J
    :cond_0
    const/16 v16, 0x0

    goto :goto_0

    .line 81
    .restart local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .restart local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .restart local v6    # "curTimeNanos":J
    .restart local v9    # "selectionFailureLogged":Z
    .restart local v10    # "endTimeNanos":J
    .restart local v13    # "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    .restart local v14    # "startTimeNanos":J
    :cond_1
    cmp-long v16, v6, v10

    if-lez v16, :cond_2

    .line 82
    new-instance v16, Lcom/mongodb/MongoTimeoutException;

    const-string/jumbo v17, "Timed out after %d ms while waiting for a server that matches %s. Client view of cluster state is %s"

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    sget-object v20, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v20

    move-wide/from16 v1, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    aput-object p1, v18, v19

    const/16 v19, 0x2

    invoke-virtual {v4}, Lcom/mongodb/ClusterDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lcom/mongodb/MongoTimeoutException;-><init>(Ljava/lang/String;)V

    throw v16
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .end local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .end local v6    # "curTimeNanos":J
    .end local v9    # "selectionFailureLogged":Z
    .end local v10    # "endTimeNanos":J
    .end local v13    # "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    .end local v14    # "startTimeNanos":J
    :catch_0
    move-exception v8

    .line 107
    .local v8, "e":Ljava/lang/InterruptedException;
    new-instance v16, Lcom/mongodb/MongoInterruptedException;

    const-string/jumbo v17, "Interrupted while waiting for a server that matches %s "

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object p1, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v8}, Lcom/mongodb/MongoInterruptedException;-><init>(Ljava/lang/String;Ljava/lang/InterruptedException;)V

    throw v16

    .line 88
    .end local v8    # "e":Ljava/lang/InterruptedException;
    .restart local v4    # "curDescription":Lcom/mongodb/ClusterDescription;
    .restart local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    .restart local v6    # "curTimeNanos":J
    .restart local v9    # "selectionFailureLogged":Z
    .restart local v10    # "endTimeNanos":J
    .restart local v13    # "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    .restart local v14    # "startTimeNanos":J
    :cond_2
    if-nez v9, :cond_3

    .line 89
    :try_start_1
    sget-object v16, Lcom/mongodb/BaseCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v17, "No server chosen by %s from cluster description %s. Waiting for %d ms before timing out"

    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object p1, v18, v19

    const/16 v19, 0x1

    aput-object v4, v18, v19

    const/16 v19, 0x2

    sget-object v20, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v20

    move-wide/from16 v1, p2

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v20

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    .line 91
    const/4 v9, 0x1

    .line 94
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/BaseCluster;->connect()V

    .line 96
    sub-long v16, v10, v6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mongodb/BaseCluster;->serverFactory:Lcom/mongodb/ClusterableServerFactory;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Lcom/mongodb/ClusterableServerFactory;->getSettings()Lcom/mongodb/ServerSettings;

    move-result-object v18

    sget-object v19, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v18 .. v19}, Lcom/mongodb/ServerSettings;->getHeartbeatConnectRetryFrequency(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v18

    invoke-static/range {v16 .. v19}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v16

    sget-object v18, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v16

    move-object/from16 v2, v18

    invoke-virtual {v5, v0, v1, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    .line 100
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    check-cast v5, Ljava/util/concurrent/CountDownLatch;

    .line 103
    .restart local v5    # "currentPhase":Ljava/util/concurrent/CountDownLatch;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;

    .line 104
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcom/mongodb/ServerSelector;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v13

    goto/16 :goto_1
.end method

.method public getSettings()Lcom/mongodb/ClusterSettings;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/mongodb/BaseCluster;->settings:Lcom/mongodb/ClusterSettings;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/mongodb/BaseCluster;->isClosed:Z

    return v0
.end method

.method protected declared-synchronized updateDescription(Lcom/mongodb/ClusterDescription;)V
    .locals 6
    .param p1, "newDescription"    # Lcom/mongodb/ClusterDescription;

    .prologue
    .line 189
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/mongodb/BaseCluster;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v2, "Updating cluster description to  %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 191
    iput-object p1, p0, Lcom/mongodb/BaseCluster;->description:Lcom/mongodb/ClusterDescription;

    .line 192
    iget-object v1, p0, Lcom/mongodb/BaseCluster;->phase:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Ljava/util/concurrent/CountDownLatch;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    .line 193
    .local v0, "current":Ljava/util/concurrent/CountDownLatch;
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 194
    monitor-exit p0

    return-void

    .line 189
    .end local v0    # "current":Ljava/util/concurrent/CountDownLatch;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
