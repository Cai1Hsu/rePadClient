.class Lcom/mongodb/DefaultServer;
.super Ljava/lang/Object;
.source "DefaultServer.java"

# interfaces
.implements Lcom/mongodb/ClusterableServer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DefaultServer$1;,
        Lcom/mongodb/DefaultServer$DefaultServerStateListener;
    }
.end annotation


# instance fields
.field private final changeListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionProvider:Lcom/mongodb/PooledConnectionProvider;

.field private volatile description:Lcom/mongodb/ServerDescription;

.field private volatile isClosed:Z

.field private final serverAddress:Lcom/mongodb/ServerAddress;

.field private final serverMonitor:Lcom/mongodb/ServerMonitor;

.field private final serverStateListener:Lcom/mongodb/ChangeListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ServerSettings;Ljava/lang/String;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Mongo;)V
    .locals 8
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p2, "settings"    # Lcom/mongodb/ServerSettings;
    .param p3, "clusterId"    # Ljava/lang/String;
    .param p4, "connectionProvider"    # Lcom/mongodb/PooledConnectionProvider;
    .param p5, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DefaultServer;->changeListeners:Ljava/util/Map;

    .line 41
    const-string/jumbo v0, "serverAddress"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerAddress;

    iput-object v0, p0, Lcom/mongodb/DefaultServer;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 42
    invoke-static {}, Lcom/mongodb/ServerDescription;->builder()Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ServerDescription$Builder;->address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription$Builder;->build()Lcom/mongodb/ServerDescription;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DefaultServer;->description:Lcom/mongodb/ServerDescription;

    .line 43
    new-instance v0, Lcom/mongodb/DefaultServer$DefaultServerStateListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mongodb/DefaultServer$DefaultServerStateListener;-><init>(Lcom/mongodb/DefaultServer;Lcom/mongodb/DefaultServer$1;)V

    iput-object v0, p0, Lcom/mongodb/DefaultServer;->serverStateListener:Lcom/mongodb/ChangeListener;

    .line 44
    iput-object p4, p0, Lcom/mongodb/DefaultServer;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    .line 45
    new-instance v0, Lcom/mongodb/ServerMonitor;

    iget-object v2, p0, Lcom/mongodb/DefaultServer;->serverStateListener:Lcom/mongodb/ChangeListener;

    invoke-virtual {p2}, Lcom/mongodb/ServerSettings;->getHeartbeatSocketSettings()Lcom/mongodb/SocketSettings;

    move-result-object v3

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p5

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/mongodb/ServerMonitor;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ChangeListener;Lcom/mongodb/SocketSettings;Lcom/mongodb/ServerSettings;Ljava/lang/String;Lcom/mongodb/Mongo;Lcom/mongodb/PooledConnectionProvider;)V

    iput-object v0, p0, Lcom/mongodb/DefaultServer;->serverMonitor:Lcom/mongodb/ServerMonitor;

    .line 48
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->serverMonitor:Lcom/mongodb/ServerMonitor;

    invoke-virtual {v0}, Lcom/mongodb/ServerMonitor;->start()V

    .line 49
    return-void
.end method

.method static synthetic access$102(Lcom/mongodb/DefaultServer;Lcom/mongodb/ServerDescription;)Lcom/mongodb/ServerDescription;
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/DefaultServer;
    .param p1, "x1"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/mongodb/DefaultServer;->description:Lcom/mongodb/ServerDescription;

    return-object p1
.end method

.method static synthetic access$200(Lcom/mongodb/DefaultServer;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DefaultServer;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->changeListeners:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public addChangeListener(Lcom/mongodb/ChangeListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "changeListener":Lcom/mongodb/ChangeListener;, "Lcom/mongodb/ChangeListener<Lcom/mongodb/ServerDescription;>;"
    const/4 v1, 0x1

    .line 66
    const-string/jumbo v2, "open"

    invoke-virtual {p0}, Lcom/mongodb/DefaultServer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 68
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->changeListeners:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void

    .line 66
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/mongodb/DefaultServer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->serverMonitor:Lcom/mongodb/ServerMonitor;

    invoke-virtual {v0}, Lcom/mongodb/ServerMonitor;->close()V

    .line 85
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    invoke-virtual {v0}, Lcom/mongodb/PooledConnectionProvider;->close()V

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/DefaultServer;->isClosed:Z

    .line 88
    :cond_0
    return-void
.end method

.method public connect()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->serverMonitor:Lcom/mongodb/ServerMonitor;

    invoke-virtual {v0}, Lcom/mongodb/ServerMonitor;->connect()V

    .line 98
    return-void
.end method

.method public getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;
    .locals 1
    .param p1, "maxWaitTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mongodb/PooledConnectionProvider;->get(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;

    move-result-object v0

    return-object v0
.end method

.method public getDescription()Lcom/mongodb/ServerDescription;
    .locals 2

    .prologue
    .line 54
    const-string/jumbo v1, "open"

    invoke-virtual {p0}, Lcom/mongodb/DefaultServer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 56
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->description:Lcom/mongodb/ServerDescription;

    return-object v0

    .line 54
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public invalidate()V
    .locals 5

    .prologue
    .line 73
    const-string/jumbo v1, "open"

    invoke-virtual {p0}, Lcom/mongodb/DefaultServer;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 75
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->serverStateListener:Lcom/mongodb/ChangeListener;

    new-instance v1, Lcom/mongodb/ChangeEvent;

    iget-object v2, p0, Lcom/mongodb/DefaultServer;->description:Lcom/mongodb/ServerDescription;

    invoke-static {}, Lcom/mongodb/ServerDescription;->builder()Lcom/mongodb/ServerDescription$Builder;

    move-result-object v3

    sget-object v4, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerDescription$Builder;->state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/DefaultServer;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerDescription$Builder;->address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerDescription$Builder;->build()Lcom/mongodb/ServerDescription;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ChangeEvent;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lcom/mongodb/ChangeListener;->stateChanged(Lcom/mongodb/ChangeEvent;)V

    .line 78
    iget-object v0, p0, Lcom/mongodb/DefaultServer;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    invoke-virtual {v0}, Lcom/mongodb/PooledConnectionProvider;->invalidate()V

    .line 79
    return-void

    .line 73
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lcom/mongodb/DefaultServer;->isClosed:Z

    return v0
.end method
