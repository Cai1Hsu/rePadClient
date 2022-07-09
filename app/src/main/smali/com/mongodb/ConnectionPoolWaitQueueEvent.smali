.class Lcom/mongodb/ConnectionPoolWaitQueueEvent;
.super Lcom/mongodb/ConnectionPoolEvent;
.source "ConnectionPoolWaitQueueEvent.java"


# instance fields
.field private final threadId:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;J)V
    .locals 1
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p3, "threadId"    # J

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/mongodb/ConnectionPoolEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    .line 34
    iput-wide p3, p0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 48
    if-ne p0, p1, :cond_1

    .line 67
    :cond_0
    :goto_0
    return v1

    .line 51
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 52
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 55
    check-cast v0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .line 57
    .local v0, "that":Lcom/mongodb/ConnectionPoolWaitQueueEvent;
    invoke-virtual {p0}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->getClusterId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 58
    goto :goto_0

    .line 60
    :cond_4
    invoke-virtual {p0}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 61
    goto :goto_0

    .line 63
    :cond_5
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    move v1, v2

    .line 64
    goto :goto_0
.end method

.method public getThreadId()J
    .locals 2

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    .line 72
    invoke-super {p0}, Lcom/mongodb/ConnectionPoolEvent;->hashCode()I

    move-result v0

    .line 73
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolWaitQueueEvent;->threadId:J

    const/16 v6, 0x20

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 74
    return v0
.end method
