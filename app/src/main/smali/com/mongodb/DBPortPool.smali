.class public Lcom/mongodb/DBPortPool;
.super Lcom/mongodb/util/SimplePool;
.source "DBPortPool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBPortPool$ConnectionWaitTimeOut;,
        Lcom/mongodb/DBPortPool$SemaphoresOut;,
        Lcom/mongodb/DBPortPool$NoMoreConnection;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mongodb/util/SimplePool",
        "<",
        "Lcom/mongodb/DBPort;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final _addr:Lcom/mongodb/ServerAddress;

.field final _options:Lcom/mongodb/MongoOptions;

.field private final _waitingSem:Ljava/util/concurrent/Semaphore;


# direct methods
.method constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoOptions;)V
    .locals 3
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p2, "options"    # Lcom/mongodb/MongoOptions;

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "DBPortPool-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", options = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/mongodb/MongoOptions;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p2, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    invoke-direct {p0, v0, v1}, Lcom/mongodb/util/SimplePool;-><init>(Ljava/lang/String;I)V

    .line 99
    iput-object p2, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    .line 100
    iput-object p1, p0, Lcom/mongodb/DBPortPool;->_addr:Lcom/mongodb/ServerAddress;

    .line 101
    new-instance v0, Ljava/util/concurrent/Semaphore;

    iget-object v1, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v1, v1, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    iget-object v2, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v2, v2, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    mul-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/mongodb/DBPortPool;->_waitingSem:Ljava/util/concurrent/Semaphore;

    .line 102
    return-void
.end method


# virtual methods
.method public cleanup(Lcom/mongodb/DBPort;)V
    .locals 0
    .param p1, "p"    # Lcom/mongodb/DBPort;

    .prologue
    .line 130
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->close()V

    .line 131
    return-void
.end method

.method public bridge synthetic cleanup(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 30
    check-cast p1, Lcom/mongodb/DBPort;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/mongodb/DBPortPool;->cleanup(Lcom/mongodb/DBPort;)V

    return-void
.end method

.method protected createNew()Lcom/mongodb/DBPort;
    .locals 2

    .prologue
    .line 135
    new-instance v0, Lcom/mongodb/DBPort;

    iget-object v1, p0, Lcom/mongodb/DBPortPool;->_addr:Lcom/mongodb/ServerAddress;

    invoke-direct {v0, v1}, Lcom/mongodb/DBPort;-><init>(Lcom/mongodb/ServerAddress;)V

    return-object v0
.end method

.method protected bridge synthetic createNew()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/mongodb/DBPortPool;->createNew()Lcom/mongodb/DBPort;

    move-result-object v0

    return-object v0
.end method

.method public get()Lcom/mongodb/DBPort;
    .locals 5

    .prologue
    .line 110
    const/4 v1, 0x0

    .line 111
    .local v1, "port":Lcom/mongodb/DBPort;
    iget-object v2, p0, Lcom/mongodb/DBPortPool;->_waitingSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->tryAcquire()Z

    move-result v2

    if-nez v2, :cond_0

    .line 112
    new-instance v2, Lcom/mongodb/DBPortPool$SemaphoresOut;

    iget-object v3, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v3, v3, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    iget-object v4, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v4, v4, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    mul-int/2addr v3, v4

    invoke-direct {v2, v3}, Lcom/mongodb/DBPortPool$SemaphoresOut;-><init>(I)V

    throw v2

    .line 115
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v2, v2, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    int-to-long v2, v2

    invoke-virtual {p0, v2, v3}, Lcom/mongodb/DBPortPool;->get(J)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "port":Lcom/mongodb/DBPort;
    check-cast v1, Lcom/mongodb/DBPort;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    .restart local v1    # "port":Lcom/mongodb/DBPort;
    iget-object v2, p0, Lcom/mongodb/DBPortPool;->_waitingSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 122
    if-nez v1, :cond_1

    .line 123
    new-instance v2, Lcom/mongodb/DBPortPool$ConnectionWaitTimeOut;

    iget-object v3, p0, Lcom/mongodb/DBPortPool;->_options:Lcom/mongodb/MongoOptions;

    iget v3, v3, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    invoke-direct {v2, v3}, Lcom/mongodb/DBPortPool$ConnectionWaitTimeOut;-><init>(I)V

    throw v2

    .line 116
    .end local v1    # "port":Lcom/mongodb/DBPort;
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_1
    new-instance v2, Lcom/mongodb/MongoInterruptedException;

    invoke-direct {v2, v0}, Lcom/mongodb/MongoInterruptedException;-><init>(Ljava/lang/InterruptedException;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/DBPortPool;->_waitingSem:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    throw v2

    .line 125
    .restart local v1    # "port":Lcom/mongodb/DBPort;
    :cond_1
    return-object v1
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/mongodb/DBPortPool;->get()Lcom/mongodb/DBPort;

    move-result-object v0

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mongodb/DBPortPool;->_addr:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/mongodb/DBPortPool;->_addr:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getPort()I

    move-result v0

    return v0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/mongodb/DBPortPool;->_addr:Lcom/mongodb/ServerAddress;

    return-object v0
.end method
