.class public Lcom/mongodb/WriteResult;
.super Ljava/lang/Object;
.source "WriteResult.java"


# instance fields
.field private final _db:Lcom/mongodb/DB;

.field private _lastCall:J

.field private _lastConcern:Lcom/mongodb/WriteConcern;

.field private _lastErrorResult:Lcom/mongodb/CommandResult;

.field private final _lazy:Z

.field private final _port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    .locals 2
    .param p1, "o"    # Lcom/mongodb/CommandResult;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    .line 35
    iput-object p2, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    .line 37
    iput-object v1, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    .line 38
    iput-object v1, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    .line 39
    return-void
.end method

.method constructor <init>(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)V
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "p"    # Lcom/mongodb/DBPort;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    .line 43
    iput-object p2, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    .line 44
    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getUsageCount()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    .line 45
    iput-object p3, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    .line 47
    return-void
.end method


# virtual methods
.method public getCachedLastError()Lcom/mongodb/CommandResult;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method public getError()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 143
    const-string/jumbo v1, "err"

    invoke-virtual {p0, v1}, Lcom/mongodb/WriteResult;->getField(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 145
    const/4 v1, 0x0

    .line 146
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 196
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLastConcern()Lcom/mongodb/WriteConcern;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method public declared-synchronized getLastError()Lcom/mongodb/CommandResult;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 88
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/mongodb/WriteResult;->getLastError(Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLastError(Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    .locals 6
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    if-eqz v1, :cond_1

    .line 108
    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v1}, Lcom/mongodb/WriteConcern;->getW()I

    move-result v1

    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->getW()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 109
    :cond_0
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    :goto_0
    monitor-exit p0

    return-object v1

    .line 113
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_4

    .line 115
    :try_start_2
    iget-object v2, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    iget-wide v4, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    if-nez p1, :cond_2

    new-instance v1, Lcom/mongodb/WriteConcern;

    invoke-direct {v1}, Lcom/mongodb/WriteConcern;-><init>()V

    :goto_1
    invoke-virtual {v2, v3, v4, v5, v1}, Lcom/mongodb/DBPort;->tryGetLastError(Lcom/mongodb/DB;JLcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    :try_start_3
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    if-nez v1, :cond_3

    .line 121
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "The connection may have been used since this write, cannot obtain a result"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_2
    move-object v1, p1

    .line 115
    goto :goto_1

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_4
    new-instance v1, Lcom/mongodb/MongoException$Network;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v1

    .line 122
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_3
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 123
    iget-wide v2, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    .line 129
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    goto :goto_0

    .line 126
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Don\'t have a port to obtain a write result, and existing one is not good enough."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public getN()I
    .locals 2

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string/jumbo v1, "n"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getUpsertedId()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string/jumbo v1, "upserted"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isLazy()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    return v0
.end method

.method public isUpdateOfExisting()Z
    .locals 2

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string/jumbo v1, "updatedExisting"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getCachedLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 212
    .local v0, "res":Lcom/mongodb/CommandResult;
    if-eqz v0, :cond_0

    .line 213
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->toString()Ljava/lang/String;

    move-result-object v1

    .line 214
    :goto_0
    return-object v1

    :cond_0
    const-string/jumbo v1, "N/A"

    goto :goto_0
.end method
