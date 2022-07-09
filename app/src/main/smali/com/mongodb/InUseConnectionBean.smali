.class public Lcom/mongodb/InUseConnectionBean;
.super Ljava/lang/Object;
.source "InUseConnectionBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final durationMS:J

.field private final localPort:I

.field private final namespace:Ljava/lang/String;

.field private final numDocuments:I

.field private final opCode:Lcom/mongodb/OutMessage$OpCode;

.field private final query:Ljava/lang/String;

.field private final threadName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;J)V
    .locals 4
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .param p2, "currentNanoTime"    # J

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getActiveState()Lcom/mongodb/DBPort$ActiveState;

    move-result-object v0

    .line 32
    .local v0, "activeState":Lcom/mongodb/DBPort$ActiveState;
    if-nez v0, :cond_0

    .line 33
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/mongodb/InUseConnectionBean;->durationMS:J

    .line 34
    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->namespace:Ljava/lang/String;

    .line 35
    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->opCode:Lcom/mongodb/OutMessage$OpCode;

    .line 36
    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->query:Ljava/lang/String;

    .line 37
    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->threadName:Ljava/lang/String;

    .line 38
    const/4 v1, 0x0

    iput v1, p0, Lcom/mongodb/InUseConnectionBean;->numDocuments:I

    .line 48
    :goto_0
    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getLocalPort()I

    move-result v1

    iput v1, p0, Lcom/mongodb/InUseConnectionBean;->localPort:I

    .line 49
    return-void

    .line 41
    :cond_0
    sget-object v1, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getStartTime()J

    move-result-wide v2

    sub-long v2, p2, v2

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mongodb/InUseConnectionBean;->durationMS:J

    .line 42
    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getNamespace()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->namespace:Ljava/lang/String;

    .line 43
    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getOpCode()Lcom/mongodb/OutMessage$OpCode;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->opCode:Lcom/mongodb/OutMessage$OpCode;

    .line 44
    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->query:Ljava/lang/String;

    .line 45
    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getThreadName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/InUseConnectionBean;->threadName:Ljava/lang/String;

    .line 46
    invoke-virtual {v0}, Lcom/mongodb/DBPort$ActiveState;->getNumDocuments()I

    move-result v1

    iput v1, p0, Lcom/mongodb/InUseConnectionBean;->numDocuments:I

    goto :goto_0
.end method


# virtual methods
.method public getDurationMS()J
    .locals 2

    .prologue
    .line 68
    iget-wide v0, p0, Lcom/mongodb/InUseConnectionBean;->durationMS:J

    return-wide v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lcom/mongodb/InUseConnectionBean;->localPort:I

    return v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mongodb/InUseConnectionBean;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method public getNumDocuments()I
    .locals 1

    .prologue
    .line 76
    iget v0, p0, Lcom/mongodb/InUseConnectionBean;->numDocuments:I

    return v0
.end method

.method public getOpCode()Lcom/mongodb/OutMessage$OpCode;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mongodb/InUseConnectionBean;->opCode:Lcom/mongodb/OutMessage$OpCode;

    return-object v0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/InUseConnectionBean;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getThreadName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/mongodb/InUseConnectionBean;->threadName:Ljava/lang/String;

    return-object v0
.end method
