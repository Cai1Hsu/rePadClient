.class abstract Lcom/mongodb/RequestMessage;
.super Ljava/lang/Object;
.source "RequestMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/RequestMessage$OpCode;
    }
.end annotation


# static fields
.field static final REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final collectionName:Ljava/lang/String;

.field private final id:I

.field private final opCode:Lcom/mongodb/RequestMessage$OpCode;

.field private settings:Lcom/mongodb/MessageSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/mongodb/RequestMessage;->REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/RequestMessage$OpCode;Lcom/mongodb/MessageSettings;)V
    .locals 1
    .param p1, "collectionName"    # Ljava/lang/String;
    .param p2, "opCode"    # Lcom/mongodb/RequestMessage$OpCode;
    .param p3, "settings"    # Lcom/mongodb/MessageSettings;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/mongodb/RequestMessage;->collectionName:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lcom/mongodb/RequestMessage;->settings:Lcom/mongodb/MessageSettings;

    .line 35
    sget-object v0, Lcom/mongodb/RequestMessage;->REQUEST_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    iput v0, p0, Lcom/mongodb/RequestMessage;->id:I

    .line 36
    iput-object p2, p0, Lcom/mongodb/RequestMessage;->opCode:Lcom/mongodb/RequestMessage$OpCode;

    .line 37
    return-void
.end method


# virtual methods
.method protected backpatchMessageLength(ILorg/bson/io/OutputBuffer;)V
    .locals 2
    .param p1, "startPosition"    # I
    .param p2, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 74
    invoke-virtual {p2}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    sub-int v0, v1, p1

    .line 75
    .local v0, "messageLength":I
    invoke-virtual {p2, v0}, Lorg/bson/io/OutputBuffer;->backpatchSize(I)V

    .line 76
    return-void
.end method

.method public encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/RequestMessage;
    .locals 2
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 64
    invoke-virtual {p1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 65
    .local v0, "messageStartPosition":I
    invoke-virtual {p0, p1}, Lcom/mongodb/RequestMessage;->writeMessagePrologue(Lorg/bson/io/OutputBuffer;)V

    .line 66
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/RequestMessage;->encodeMessageBody(Lorg/bson/io/OutputBuffer;I)Lcom/mongodb/RequestMessage;

    move-result-object v1

    .line 67
    .local v1, "nextMessage":Lcom/mongodb/RequestMessage;
    invoke-virtual {p0, v0, p1}, Lcom/mongodb/RequestMessage;->backpatchMessageLength(ILorg/bson/io/OutputBuffer;)V

    .line 68
    return-object v1
.end method

.method protected abstract encodeMessageBody(Lorg/bson/io/OutputBuffer;I)Lcom/mongodb/RequestMessage;
.end method

.method protected getCollectionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mongodb/RequestMessage;->collectionName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/mongodb/RequestMessage;->id:I

    return v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/mongodb/RequestMessage;->getCollectionName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/RequestMessage;->getCollectionName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getOpCode()Lcom/mongodb/RequestMessage$OpCode;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mongodb/RequestMessage;->opCode:Lcom/mongodb/RequestMessage$OpCode;

    return-object v0
.end method

.method public getSettings()Lcom/mongodb/MessageSettings;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/RequestMessage;->settings:Lcom/mongodb/MessageSettings;

    return-object v0
.end method

.method protected writeMessagePrologue(Lorg/bson/io/OutputBuffer;)V
    .locals 2
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-virtual {p1, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 41
    iget v0, p0, Lcom/mongodb/RequestMessage;->id:I

    invoke-virtual {p1, v0}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 42
    invoke-virtual {p1, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 43
    iget-object v0, p0, Lcom/mongodb/RequestMessage;->opCode:Lcom/mongodb/RequestMessage$OpCode;

    invoke-virtual {v0}, Lcom/mongodb/RequestMessage$OpCode;->getValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 44
    return-void
.end method
