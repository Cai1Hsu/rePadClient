.class final Lcom/mongodb/ConnectionPoolStatistics;
.super Lcom/mongodb/ConnectionPoolListenerAdapter;
.source "ConnectionPoolStatistics.java"

# interfaces
.implements Lcom/mongodb/ConnectionPoolStatisticsMBean;


# instance fields
.field private final checkedOutCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final serverAddress:Lcom/mongodb/ServerAddress;

.field private final settings:Lcom/mongodb/ConnectionPoolSettings;

.field private final size:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Lcom/mongodb/ConnectionPoolOpenedEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolOpenedEvent;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mongodb/ConnectionPoolListenerAdapter;-><init>()V

    .line 27
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->size:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 28
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->checkedOutCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 29
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 33
    invoke-virtual {p1}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getSettings()Lcom/mongodb/ConnectionPoolSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->settings:Lcom/mongodb/ConnectionPoolSettings;

    .line 34
    return-void
.end method


# virtual methods
.method public connectionAdded(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 84
    return-void
.end method

.method public connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->checkedOutCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 79
    return-void
.end method

.method public connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->checkedOutCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 74
    return-void
.end method

.method public connectionRemoved(Lcom/mongodb/ConnectionEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 89
    return-void
.end method

.method public getCheckedOutCount()I
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->checkedOutCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxSize()I
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolSettings;->getMaxSize()I

    move-result v0

    return v0
.end method

.method public getMinSize()I
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolSettings;->getMinSize()I

    move-result v0

    return v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getPort()I

    move-result v0

    return v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->size:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getWaitQueueSize()I
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 94
    return-void
.end method

.method public waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 1
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolStatistics;->waitQueueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 99
    return-void
.end method
