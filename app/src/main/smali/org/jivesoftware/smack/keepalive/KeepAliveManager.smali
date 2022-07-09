.class public Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"


# static fields
.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smack/keepalive/KeepAliveManager;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private volatile lastSuccessfulContact:J

.field private volatile periodicPingTask:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private pingFailedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smack/ping/PingFailedListener;",
            ">;"
        }
    .end annotation
.end field

.field private pingInterval:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    .line 59
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getKeepAliveInterval()I

    move-result v0

    if-lez v0, :cond_0

    .line 60
    new-instance v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 66
    :cond_0
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getKeepAliveInterval()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    .line 70
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingFailedListeners:Ljava/util/Set;

    .line 72
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->lastSuccessfulContact:J

    .line 123
    iput-object p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 124
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->init()V

    .line 125
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->handleConnect()V

    .line 126
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$102(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;J)J
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    .param p1, "x1"    # J

    .prologue
    .line 54
    iput-wide p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->lastSuccessfulContact:J

    return-wide p1
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->schedulePingServerTask()V

    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->stopPingServerTask()V

    return-void
.end method

.method static synthetic access$400(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 54
    invoke-static {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->handleDisconnect(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$600(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->handleConnect()V

    return-void
.end method

.method static synthetic access$700(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingFailedListeners:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    .prologue
    .line 54
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method private static declared-synchronized enableExecutorService()V
    .locals 4

    .prologue
    .line 96
    const-class v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v2, 0x1

    new-instance v3, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$2;

    invoke-direct {v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$2;-><init>()V

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    sput-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    :cond_0
    monitor-exit v1

    return-void

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 83
    const-class v2, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .line 85
    .local v0, "pingManager":Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    if-nez v0, :cond_0

    .line 86
    new-instance v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    .end local v0    # "pingManager":Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    .line 87
    .restart local v0    # "pingManager":Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    sget-object v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    :cond_0
    monitor-exit v2

    return-object v0

    .line 83
    .end local v0    # "pingManager":Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private handleConnect()V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;-><init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 143
    return-void
.end method

.method private static declared-synchronized handleDisconnect(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p0, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 112
    const-class v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    .line 113
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 117
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    :cond_0
    monitor-exit v1

    return-void

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;-><init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 175
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->instances:Ljava/util/Map;

    iget-object v1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->schedulePingServerTask()V

    .line 177
    return-void
.end method

.method private declared-synchronized schedulePingServerTask()V
    .locals 5

    .prologue
    .line 270
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->enableExecutorService()V

    .line 271
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->stopPingServerTask()V

    .line 273
    iget-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 274
    sget-object v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;-><init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    invoke-virtual {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->getPingInterval()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingTask:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 304
    :cond_0
    monitor-exit p0

    return-void

    .line 270
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private stopPingServerTask()V
    .locals 2

    .prologue
    .line 307
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingTask:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingTask:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 309
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->periodicPingTask:Ljava/util/concurrent/ScheduledFuture;

    .line 311
    :cond_0
    return-void
.end method


# virtual methods
.method public addPingFailedListener(Lorg/jivesoftware/smack/ping/PingFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smack/ping/PingFailedListener;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingFailedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 234
    return-void
.end method

.method public getPingInterval()J
    .locals 2

    .prologue
    .line 219
    iget-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    return-wide v0
.end method

.method public getTimeSinceLastContact()J
    .locals 8

    .prologue
    const-wide/16 v2, 0x0

    .line 256
    iget-wide v4, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->lastSuccessfulContact:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_1

    .line 257
    iget-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->lastSuccessfulContact:J

    .line 260
    :cond_0
    :goto_0
    return-wide v0

    .line 258
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->lastSuccessfulContact:J

    sub-long v0, v4, v6

    .line 260
    .local v0, "delta":J
    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    move-wide v0, v2

    goto :goto_0
.end method

.method public removePingFailedListener(Lorg/jivesoftware/smack/ping/PingFailedListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smack/ping/PingFailedListener;

    .prologue
    .line 243
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingFailedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 244
    return-void
.end method

.method public setPingInterval(J)V
    .locals 5
    .param p1, "newPingInterval"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 186
    iget-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    .line 201
    :goto_0
    return-void

    .line 190
    :cond_0
    cmp-long v0, p1, v2

    if-lez v0, :cond_1

    .line 191
    invoke-static {}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->enableExecutorService()V

    .line 193
    :cond_1
    iput-wide p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    .line 195
    iget-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 196
    invoke-virtual {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->stopPinging()V

    goto :goto_0

    .line 199
    :cond_2
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->schedulePingServerTask()V

    goto :goto_0
.end method

.method public stopPinging()V
    .locals 2

    .prologue
    .line 209
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->pingInterval:J

    .line 210
    invoke-direct {p0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->stopPingServerTask()V

    .line 211
    return-void
.end method
