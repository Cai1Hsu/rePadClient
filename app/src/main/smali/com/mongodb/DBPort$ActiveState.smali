.class Lcom/mongodb/DBPort$ActiveState;
.super Ljava/lang/Object;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ActiveState"
.end annotation


# instance fields
.field private final namespace:Ljava/lang/String;

.field private numDocuments:I

.field private final opCode:Lcom/mongodb/OutMessage$OpCode;

.field private final query:Lcom/mongodb/DBObject;

.field private final startTime:J

.field final synthetic this$0:Lcom/mongodb/DBPort;

.field private final threadName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;)V
    .locals 2
    .param p2, "outMessage"    # Lcom/mongodb/OutMessage;

    .prologue
    .line 424
    iput-object p1, p0, Lcom/mongodb/DBPort$ActiveState;->this$0:Lcom/mongodb/DBPort;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 425
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->getNamespace()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->namespace:Ljava/lang/String;

    .line 426
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->getOpCode()Lcom/mongodb/OutMessage$OpCode;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->opCode:Lcom/mongodb/OutMessage$OpCode;

    .line 427
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->query:Lcom/mongodb/DBObject;

    .line 428
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->getNumDocuments()I

    move-result v0

    iput v0, p0, Lcom/mongodb/DBPort$ActiveState;->numDocuments:I

    .line 429
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/DBPort$ActiveState;->startTime:J

    .line 430
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->threadName:Ljava/lang/String;

    .line 431
    return-void
.end method


# virtual methods
.method getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 434
    iget-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method getNumDocuments()I
    .locals 1

    .prologue
    .line 446
    iget v0, p0, Lcom/mongodb/DBPort$ActiveState;->numDocuments:I

    return v0
.end method

.method getOpCode()Lcom/mongodb/OutMessage$OpCode;
    .locals 1

    .prologue
    .line 438
    iget-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->opCode:Lcom/mongodb/OutMessage$OpCode;

    return-object v0
.end method

.method getQuery()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 442
    iget-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->query:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method getStartTime()J
    .locals 2

    .prologue
    .line 450
    iget-wide v0, p0, Lcom/mongodb/DBPort$ActiveState;->startTime:J

    return-wide v0
.end method

.method getThreadName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 454
    iget-object v0, p0, Lcom/mongodb/DBPort$ActiveState;->threadName:Ljava/lang/String;

    return-object v0
.end method
