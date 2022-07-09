.class Lcom/mongodb/ServerMonitor;
.super Ljava/lang/Object;
.source "ServerMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/ThreadSafe;
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final condition:Ljava/util/concurrent/locks/Condition;

.field private final connectionProvider:Lcom/mongodb/PooledConnectionProvider;

.field private count:I

.field private elapsedNanosSum:J

.field private volatile isClosed:Z

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final mongo:Lcom/mongodb/Mongo;

.field private final monitorThread:Ljava/lang/Thread;

.field private serverAddress:Lcom/mongodb/ServerAddress;

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

.field private final settings:Lcom/mongodb/ServerSettings;

.field private final socketSettings:Lcom/mongodb/SocketSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string/jumbo v0, "cluster"

    invoke-static {v0}, Lcom/mongodb/Loggers;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/ChangeListener;Lcom/mongodb/SocketSettings;Lcom/mongodb/ServerSettings;Ljava/lang/String;Lcom/mongodb/Mongo;Lcom/mongodb/PooledConnectionProvider;)V
    .locals 4
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p3, "socketSettings"    # Lcom/mongodb/SocketSettings;
    .param p4, "settings"    # Lcom/mongodb/ServerSettings;
    .param p5, "clusterId"    # Ljava/lang/String;
    .param p6, "mongo"    # Lcom/mongodb/Mongo;
    .param p7, "connectionProvider"    # Lcom/mongodb/PooledConnectionProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerAddress;",
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;",
            "Lcom/mongodb/SocketSettings;",
            "Lcom/mongodb/ServerSettings;",
            "Ljava/lang/String;",
            "Lcom/mongodb/Mongo;",
            "Lcom/mongodb/PooledConnectionProvider;",
            ")V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "serverStateListener":Lcom/mongodb/ChangeListener;, "Lcom/mongodb/ChangeListener<Lcom/mongodb/ServerDescription;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    .line 54
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerMonitor;->condition:Ljava/util/concurrent/locks/Condition;

    .line 60
    iput-object p1, p0, Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 61
    iput-object p2, p0, Lcom/mongodb/ServerMonitor;->serverStateListener:Lcom/mongodb/ChangeListener;

    .line 62
    iput-object p3, p0, Lcom/mongodb/ServerMonitor;->socketSettings:Lcom/mongodb/SocketSettings;

    .line 63
    iput-object p4, p0, Lcom/mongodb/ServerMonitor;->settings:Lcom/mongodb/ServerSettings;

    .line 64
    iput-object p6, p0, Lcom/mongodb/ServerMonitor;->mongo:Lcom/mongodb/Mongo;

    .line 65
    iput-object p7, p0, Lcom/mongodb/ServerMonitor;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    .line 66
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;

    invoke-direct {v1, p0}, Lcom/mongodb/ServerMonitor$ServerMonitorRunnable;-><init>(Lcom/mongodb/ServerMonitor;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "cluster-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mongodb/ServerMonitor;->monitorThread:Ljava/lang/Thread;

    .line 67
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->monitorThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/ServerMonitor;Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;
    .param p1, "x1"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/ServerMonitor;->getConnectingServerDescription(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/ServerMonitor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/mongodb/ServerMonitor;->isClosed:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerSettings;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->settings:Lcom/mongodb/ServerSettings;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Lock;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mongodb/ServerMonitor;)Ljava/util/concurrent/locks/Condition;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->condition:Ljava/util/concurrent/locks/Condition;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ServerAddress;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/MongoOptions;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/mongodb/ServerMonitor;->getOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/ServerMonitor;Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;
    .param p1, "x1"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/ServerMonitor;->lookupServerDescription(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$502(Lcom/mongodb/ServerMonitor;I)I
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;
    .param p1, "x1"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/mongodb/ServerMonitor;->count:I

    return p1
.end method

.method static synthetic access$602(Lcom/mongodb/ServerMonitor;J)J
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;
    .param p1, "x1"    # J

    .prologue
    .line 39
    iput-wide p1, p0, Lcom/mongodb/ServerMonitor;->elapsedNanosSum:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/PooledConnectionProvider;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->connectionProvider:Lcom/mongodb/PooledConnectionProvider;

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mongodb/ServerMonitor;)Lcom/mongodb/ChangeListener;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerMonitor;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->serverStateListener:Lcom/mongodb/ChangeListener;

    return-object v0
.end method

.method private createDescription(Lcom/mongodb/CommandResult;Lcom/mongodb/CommandResult;J)Lcom/mongodb/ServerDescription;
    .locals 3
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;
    .param p2, "buildInfoResult"    # Lcom/mongodb/CommandResult;
    .param p3, "averageLatencyNanos"    # J

    .prologue
    .line 243
    invoke-static {}, Lcom/mongodb/ServerDescription;->builder()Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connected:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-static {p2}, Lcom/mongodb/ServerMonitor;->getVersion(Lcom/mongodb/CommandResult;)Lcom/mongodb/ServerVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->version(Lcom/mongodb/ServerVersion;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-static {p1}, Lcom/mongodb/ServerMonitor;->getServerType(Lcom/mongodb/BasicDBObject;)Lcom/mongodb/ServerType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->type(Lcom/mongodb/ServerType;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v1

    const-string/jumbo v0, "hosts"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/mongodb/ServerMonitor;->listToSet(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mongodb/ServerDescription$Builder;->hosts(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v1

    const-string/jumbo v0, "passives"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/mongodb/ServerMonitor;->listToSet(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mongodb/ServerDescription$Builder;->passives(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v1

    const-string/jumbo v0, "arbiters"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/mongodb/ServerMonitor;->listToSet(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mongodb/ServerDescription$Builder;->arbiters(Ljava/util/Set;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "primary"

    invoke-virtual {p1, v1}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->primary(Ljava/lang/String;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "maxBsonObjectSize"

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMaxDocumentSize()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->maxDocumentSize(I)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "maxMessageSizeBytes"

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMaxMessageSize()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->maxMessageSize(I)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "maxWriteBatchSize"

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMaxWriteBatchSize()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->maxWriteBatchSize(I)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v1

    const-string/jumbo v0, "tags"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    invoke-static {v0}, Lcom/mongodb/ServerMonitor;->getTagsFromDocument(Lcom/mongodb/DBObject;)Lcom/mongodb/Tags;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/mongodb/ServerDescription$Builder;->tags(Lcom/mongodb/Tags;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "setName"

    invoke-virtual {p1, v1}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->setName(Ljava/lang/String;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "minWireVersion"

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMinWireVersion()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->minWireVersion(I)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    const-string/jumbo v1, "maxWireVersion"

    invoke-static {}, Lcom/mongodb/ServerDescription;->getDefaultMaxWireVersion()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->maxWireVersion(I)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p3, p4, v1}, Lcom/mongodb/ServerDescription$Builder;->averageLatency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->ok(Z)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription$Builder;->build()Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method static descriptionHasChanged(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)Z
    .locals 1
    .param p0, "previousServerDescription"    # Lcom/mongodb/ServerDescription;
    .param p1, "currentServerDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 207
    invoke-virtual {p0, p1}, Lcom/mongodb/ServerDescription;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static exceptionHasChanged(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z
    .locals 4
    .param p0, "previousException"    # Ljava/lang/Throwable;
    .param p1, "currentException"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 216
    if-nez p1, :cond_2

    .line 217
    if-eqz p0, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 217
    goto :goto_0

    .line 218
    :cond_2
    if-eqz p0, :cond_0

    .line 220
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 222
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    .line 223
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 225
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method private getConnectingServerDescription(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription;
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 321
    invoke-static {}, Lcom/mongodb/ServerDescription;->builder()Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerType;->Unknown:Lcom/mongodb/ServerType;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->type(Lcom/mongodb/ServerType;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->state(Lcom/mongodb/ServerConnectionState;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerDescription$Builder;->address(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ServerDescription$Builder;->exception(Ljava/lang/Throwable;)Lcom/mongodb/ServerDescription$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription$Builder;->build()Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0
.end method

.method private getOptions()Lcom/mongodb/MongoOptions;
    .locals 3

    .prologue
    .line 198
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-direct {v0}, Lcom/mongodb/MongoOptions;-><init>()V

    .line 199
    .local v0, "options":Lcom/mongodb/MongoOptions;
    iget-object v1, p0, Lcom/mongodb/ServerMonitor;->socketSettings:Lcom/mongodb/SocketSettings;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2}, Lcom/mongodb/SocketSettings;->getConnectTimeout(Ljava/util/concurrent/TimeUnit;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/MongoOptions;->setConnectTimeout(I)V

    .line 200
    iget-object v1, p0, Lcom/mongodb/ServerMonitor;->socketSettings:Lcom/mongodb/SocketSettings;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2}, Lcom/mongodb/SocketSettings;->getReadTimeout(Ljava/util/concurrent/TimeUnit;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mongodb/MongoOptions;->setSocketTimeout(I)V

    .line 201
    iget-object v1, p0, Lcom/mongodb/ServerMonitor;->socketSettings:Lcom/mongodb/SocketSettings;

    invoke-virtual {v1}, Lcom/mongodb/SocketSettings;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/MongoOptions;->setSocketFactory(Ljavax/net/SocketFactory;)V

    .line 202
    return-object v0
.end method

.method private static getServerType(Lcom/mongodb/BasicDBObject;)Lcom/mongodb/ServerType;
    .locals 2
    .param p0, "isMasterResult"    # Lcom/mongodb/BasicDBObject;

    .prologue
    const/4 v1, 0x0

    .line 278
    invoke-static {p0}, Lcom/mongodb/ServerMonitor;->isReplicaSetMember(Lcom/mongodb/BasicDBObject;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 279
    const-string/jumbo v0, "ismaster"

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BasicDBObject;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    sget-object v0, Lcom/mongodb/ServerType;->ReplicaSetPrimary:Lcom/mongodb/ServerType;

    .line 302
    :goto_0
    return-object v0

    .line 283
    :cond_0
    const-string/jumbo v0, "secondary"

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BasicDBObject;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 284
    sget-object v0, Lcom/mongodb/ServerType;->ReplicaSetSecondary:Lcom/mongodb/ServerType;

    goto :goto_0

    .line 287
    :cond_1
    const-string/jumbo v0, "arbiterOnly"

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BasicDBObject;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 288
    sget-object v0, Lcom/mongodb/ServerType;->ReplicaSetArbiter:Lcom/mongodb/ServerType;

    goto :goto_0

    .line 291
    :cond_2
    const-string/jumbo v0, "setName"

    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBObject;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "hosts"

    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 292
    sget-object v0, Lcom/mongodb/ServerType;->ReplicaSetOther:Lcom/mongodb/ServerType;

    goto :goto_0

    .line 295
    :cond_3
    sget-object v0, Lcom/mongodb/ServerType;->ReplicaSetGhost:Lcom/mongodb/ServerType;

    goto :goto_0

    .line 298
    :cond_4
    const-string/jumbo v0, "msg"

    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBObject;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "msg"

    invoke-virtual {p0, v0}, Lcom/mongodb/BasicDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "isdbgrid"

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 299
    sget-object v0, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    goto :goto_0

    .line 302
    :cond_5
    sget-object v0, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    goto :goto_0
.end method

.method private static getTagsFromDocument(Lcom/mongodb/DBObject;)Lcom/mongodb/Tags;
    .locals 4
    .param p0, "tagsDocuments"    # Lcom/mongodb/DBObject;

    .prologue
    .line 310
    if-nez p0, :cond_1

    .line 311
    new-instance v2, Lcom/mongodb/Tags;

    invoke-direct {v2}, Lcom/mongodb/Tags;-><init>()V

    .line 317
    :cond_0
    return-object v2

    .line 313
    :cond_1
    new-instance v2, Lcom/mongodb/Tags;

    invoke-direct {v2}, Lcom/mongodb/Tags;-><init>()V

    .line 314
    .local v2, "tags":Lcom/mongodb/Tags;
    invoke-interface {p0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 315
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/mongodb/Tags;->put(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method private static getVersion(Lcom/mongodb/CommandResult;)Lcom/mongodb/ServerVersion;
    .locals 4
    .param p0, "buildInfoResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 266
    new-instance v1, Lcom/mongodb/ServerVersion;

    const-string/jumbo v0, "versionArray"

    invoke-virtual {p0, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-interface {v0, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/mongodb/ServerVersion;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method private static isReplicaSetMember(Lcom/mongodb/BasicDBObject;)Z
    .locals 2
    .param p0, "isMasterResult"    # Lcom/mongodb/BasicDBObject;

    .prologue
    const/4 v0, 0x0

    .line 306
    const-string/jumbo v1, "setName"

    invoke-virtual {p0, v1}, Lcom/mongodb/BasicDBObject;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "isreplicaset"

    invoke-virtual {p0, v1, v0}, Lcom/mongodb/BasicDBObject;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method private listToSet(Ljava/util/List;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 270
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 271
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    .line 273
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method private lookupServerDescription(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerDescription;
    .locals 10
    .param p1, "connection"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 230
    sget-object v4, Lcom/mongodb/ServerMonitor;->LOGGER:Ljava/util/logging/Logger;

    const-string/jumbo v5, "Checking status of %s"

    new-array v6, v9, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/mongodb/ServerMonitor;->serverAddress:Lcom/mongodb/ServerAddress;

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 231
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    .line 232
    .local v2, "startNanoTime":J
    iget-object v4, p0, Lcom/mongodb/ServerMonitor;->mongo:Lcom/mongodb/Mongo;

    const-string/jumbo v5, "admin"

    invoke-virtual {v4, v5}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v4

    new-instance v5, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v6, "ismaster"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1, v4, v5}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 233
    .local v1, "isMasterResult":Lcom/mongodb/CommandResult;
    iget v4, p0, Lcom/mongodb/ServerMonitor;->count:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/mongodb/ServerMonitor;->count:I

    .line 234
    iget-wide v4, p0, Lcom/mongodb/ServerMonitor;->elapsedNanosSum:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    sub-long/2addr v6, v2

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/mongodb/ServerMonitor;->elapsedNanosSum:J

    .line 236
    iget-object v4, p0, Lcom/mongodb/ServerMonitor;->mongo:Lcom/mongodb/Mongo;

    const-string/jumbo v5, "admin"

    invoke-virtual {v4, v5}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v4

    new-instance v5, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v6, "buildinfo"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1, v4, v5}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 237
    .local v0, "buildInfoResult":Lcom/mongodb/CommandResult;
    iget-wide v4, p0, Lcom/mongodb/ServerMonitor;->elapsedNanosSum:J

    iget v6, p0, Lcom/mongodb/ServerMonitor;->count:I

    int-to-long v6, v6

    div-long/2addr v4, v6

    invoke-direct {p0, v1, v0, v4, v5}, Lcom/mongodb/ServerMonitor;->createDescription(Lcom/mongodb/CommandResult;Lcom/mongodb/CommandResult;J)Lcom/mongodb/ServerDescription;

    move-result-object v4

    return-object v4
.end method

.method static stateHasChanged(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)Z
    .locals 4
    .param p0, "previousServerDescription"    # Lcom/mongodb/ServerDescription;
    .param p1, "currentServerDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 211
    invoke-static {p0, p1}, Lcom/mongodb/ServerMonitor;->descriptionHasChanged(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAverageLatencyNanos()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/ServerMonitor;->isClosed:Z

    .line 194
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 195
    return-void
.end method

.method public connect()V
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 186
    :try_start_0
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->condition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 190
    return-void

    .line 188
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/ServerMonitor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method start()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/ServerMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 72
    return-void
.end method
