.class Lcom/mongodb/BSONBinaryWriter;
.super Lcom/mongodb/BSONWriter;
.source "BSONBinaryWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/BSONBinaryWriter$Mark;,
        Lcom/mongodb/BSONBinaryWriter$Context;
    }
.end annotation


# instance fields
.field private final binaryWriterSettings:Lcom/mongodb/BSONBinaryWriterSettings;

.field private final buffer:Lorg/bson/io/OutputBuffer;

.field private mark:Lcom/mongodb/BSONBinaryWriter$Mark;

.field private final maxDocumentSizeStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/BSONWriterSettings;Lcom/mongodb/BSONBinaryWriterSettings;Lorg/bson/io/OutputBuffer;)V
    .locals 2
    .param p1, "settings"    # Lcom/mongodb/BSONWriterSettings;
    .param p2, "binaryWriterSettings"    # Lcom/mongodb/BSONBinaryWriterSettings;
    .param p3, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/mongodb/BSONWriter;-><init>(Lcom/mongodb/BSONWriterSettings;)V

    .line 32
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->maxDocumentSizeStack:Ljava/util/Stack;

    .line 42
    iput-object p2, p0, Lcom/mongodb/BSONBinaryWriter;->binaryWriterSettings:Lcom/mongodb/BSONBinaryWriterSettings;

    .line 43
    iput-object p3, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    .line 44
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->maxDocumentSizeStack:Ljava/util/Stack;

    invoke-virtual {p2}, Lcom/mongodb/BSONBinaryWriterSettings;->getMaxDocumentSize()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/OutputBuffer;)V
    .locals 2
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 36
    new-instance v0, Lcom/mongodb/BSONWriterSettings;

    invoke-direct {v0}, Lcom/mongodb/BSONWriterSettings;-><init>()V

    new-instance v1, Lcom/mongodb/BSONBinaryWriterSettings;

    invoke-direct {v1}, Lcom/mongodb/BSONBinaryWriterSettings;-><init>()V

    invoke-direct {p0, v0, v1, p1}, Lcom/mongodb/BSONBinaryWriter;-><init>(Lcom/mongodb/BSONWriterSettings;Lcom/mongodb/BSONBinaryWriterSettings;Lorg/bson/io/OutputBuffer;)V

    .line 37
    return-void
.end method

.method static synthetic access$200(Lcom/mongodb/BSONBinaryWriter;)Lorg/bson/io/OutputBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BSONBinaryWriter$Mark;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->mark:Lcom/mongodb/BSONBinaryWriter$Mark;

    return-object v0
.end method

.method private backpatchSize()V
    .locals 3

    .prologue
    .line 376
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v2

    invoke-static {v2}, Lcom/mongodb/BSONBinaryWriter$Context;->access$100(Lcom/mongodb/BSONBinaryWriter$Context;)I

    move-result v2

    sub-int v0, v1, v2

    .line 377
    .local v0, "size":I
    invoke-direct {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->throwIfSizeExceedsLimit(I)V

    .line 378
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1, v0}, Lorg/bson/io/OutputBuffer;->backpatchSize(I)V

    .line 379
    return-void
.end method

.method private throwIfSizeExceedsLimit(I)V
    .locals 6
    .param p1, "size"    # I

    .prologue
    .line 382
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->maxDocumentSizeStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le p1, v1, :cond_0

    .line 383
    const-string/jumbo v1, "Size %d is larger than MaxDocumentSize %d."

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v4

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v5

    invoke-static {v5}, Lcom/mongodb/BSONBinaryWriter$Context;->access$100(Lcom/mongodb/BSONBinaryWriter$Context;)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/mongodb/BSONBinaryWriter;->binaryWriterSettings:Lcom/mongodb/BSONBinaryWriterSettings;

    invoke-virtual {v4}, Lcom/mongodb/BSONBinaryWriterSettings;->getMaxDocumentSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 386
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lcom/mongodb/MongoInternalException;

    invoke-direct {v1, v0}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 388
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private writeCurrentName()V
    .locals 2

    .prologue
    .line 367
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    if-ne v0, v1, :cond_0

    .line 368
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-static {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->access$008(Lcom/mongodb/BSONBinaryWriter$Context;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 373
    :goto_0
    return-void

    .line 371
    :cond_0
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 49
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->close()V

    .line 50
    return-void
.end method

.method public encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V
    .locals 7
    .param p1, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p2, "dbObject"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 330
    const-string/jumbo v1, "writeStartDocument"

    const/4 v4, 0x4

    new-array v4, v4, [Lcom/mongodb/BSONWriter$State;

    sget-object v5, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    aput-object v5, v4, v3

    sget-object v5, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v5, v4, v2

    const/4 v5, 0x2

    sget-object v6, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    aput-object v6, v4, v5

    invoke-virtual {p0, v1, v4}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 331
    const-string/jumbo v4, "state is VALUE"

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getState()Lcom/mongodb/BSONWriter$State;

    move-result-object v1

    sget-object v5, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    if-ne v1, v5, :cond_0

    move v1, v2

    :goto_0
    invoke-static {v4, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 332
    const-string/jumbo v4, "context not null"

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    invoke-static {v4, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 333
    const-string/jumbo v1, "context is not JAVASCRIPT_WITH_SCOPE"

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v4

    sget-object v5, Lcom/mongodb/BSONContextType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

    if-eq v4, v5, :cond_2

    :goto_2
    invoke-static {v1, v2}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 335
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v2, Lcom/mongodb/BSONType;->DOCUMENT:Lcom/mongodb/BSONType;

    invoke-virtual {v2}, Lcom/mongodb/BSONType;->getValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 336
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 338
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 339
    .local v0, "startPos":I
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-interface {p1, v1, p2}, Lcom/mongodb/DBEncoder;->writeObject(Lorg/bson/io/OutputBuffer;Lorg/bson/BSONObject;)I

    .line 340
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->throwIfSizeExceedsLimit(I)V

    .line 342
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 343
    return-void

    .end local v0    # "startPos":I
    :cond_0
    move v1, v3

    .line 331
    goto :goto_0

    :cond_1
    move v1, v3

    .line 332
    goto :goto_1

    :cond_2
    move v2, v3

    .line 333
    goto :goto_2
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method public getBuffer()Lorg/bson/io/OutputBuffer;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    return-object v0
.end method

.method protected getContext()Lcom/mongodb/BSONBinaryWriter$Context;
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->getContext()Lcom/mongodb/BSONWriter$Context;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONBinaryWriter$Context;

    return-object v0
.end method

.method protected bridge synthetic getContext()Lcom/mongodb/BSONWriter$Context;
    .locals 1

    .prologue
    .line 28
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    return-object v0
.end method

.method public mark()V
    .locals 1

    .prologue
    .line 354
    new-instance v0, Lcom/mongodb/BSONBinaryWriter$Mark;

    invoke-direct {v0, p0}, Lcom/mongodb/BSONBinaryWriter$Mark;-><init>(Lcom/mongodb/BSONBinaryWriter;)V

    iput-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->mark:Lcom/mongodb/BSONBinaryWriter$Mark;

    .line 355
    return-void
.end method

.method public popMaxDocumentSize()V
    .locals 1

    .prologue
    .line 350
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->maxDocumentSizeStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 351
    return-void
.end method

.method public pushMaxDocumentSize(I)V
    .locals 2
    .param p1, "maxDocumentSize"    # I

    .prologue
    .line 346
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->maxDocumentSizeStack:Ljava/util/Stack;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 358
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->mark:Lcom/mongodb/BSONBinaryWriter$Mark;

    if-nez v0, :cond_0

    .line 359
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Can not reset without first marking"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 362
    :cond_0
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->mark:Lcom/mongodb/BSONBinaryWriter$Mark;

    invoke-virtual {v0}, Lcom/mongodb/BSONBinaryWriter$Mark;->reset()V

    .line 363
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->mark:Lcom/mongodb/BSONBinaryWriter$Mark;

    .line 364
    return-void
.end method

.method public writeBinaryData(Lorg/bson/types/Binary;)V
    .locals 5
    .param p1, "binary"    # Lorg/bson/types/Binary;

    .prologue
    .line 72
    const-string/jumbo v1, "writeBinaryData"

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/mongodb/BSONWriter$State;

    const/4 v3, 0x0

    sget-object v4, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 74
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v2, Lcom/mongodb/BSONType;->BINARY:Lcom/mongodb/BSONType;

    invoke-virtual {v2}, Lcom/mongodb/BSONType;->getValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 75
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 77
    invoke-virtual {p1}, Lorg/bson/types/Binary;->length()I

    move-result v0

    .line 79
    .local v0, "totalLen":I
    invoke-virtual {p1}, Lorg/bson/types/Binary;->getType()B

    move-result v1

    sget-object v2, Lcom/mongodb/BSONBinarySubType;->OldBinary:Lcom/mongodb/BSONBinarySubType;

    invoke-virtual {v2}, Lcom/mongodb/BSONBinarySubType;->getValue()B

    move-result v2

    if-ne v1, v2, :cond_0

    .line 80
    add-int/lit8 v0, v0, 0x4

    .line 83
    :cond_0
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1, v0}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 84
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p1}, Lorg/bson/types/Binary;->getType()B

    move-result v2

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 85
    invoke-virtual {p1}, Lorg/bson/types/Binary;->getType()B

    move-result v1

    sget-object v2, Lcom/mongodb/BSONBinarySubType;->OldBinary:Lcom/mongodb/BSONBinarySubType;

    invoke-virtual {v2}, Lcom/mongodb/BSONBinarySubType;->getValue()B

    move-result v2

    if-ne v1, v2, :cond_1

    .line 86
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    add-int/lit8 v2, v0, -0x4

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 88
    :cond_1
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p1}, Lorg/bson/types/Binary;->getData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->write([B)V

    .line 90
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 91
    return-void
.end method

.method public writeBoolean(Z)V
    .locals 5
    .param p1, "value"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 95
    const-string/jumbo v2, "writeBoolean"

    new-array v3, v0, [Lcom/mongodb/BSONWriter$State;

    sget-object v4, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v4, v3, v1

    invoke-virtual {p0, v2, v3}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 97
    iget-object v2, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v3, Lcom/mongodb/BSONType;->BOOLEAN:Lcom/mongodb/BSONType;

    invoke-virtual {v3}, Lcom/mongodb/BSONType;->getValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 98
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 99
    iget-object v2, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    if-eqz p1, :cond_0

    :goto_0
    invoke-virtual {v2, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 101
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 102
    return-void

    :cond_0
    move v0, v1

    .line 99
    goto :goto_0
.end method

.method public writeDateTime(J)V
    .locals 5
    .param p1, "value"    # J

    .prologue
    .line 106
    const-string/jumbo v0, "writeDateTime"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 108
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->DATE_TIME:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 109
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 110
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1, p2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 112
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 113
    return-void
.end method

.method public writeDouble(D)V
    .locals 5
    .param p1, "value"    # D

    .prologue
    .line 117
    const-string/jumbo v0, "writeDouble"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 119
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->DOUBLE:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 120
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 121
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1, p2}, Lorg/bson/io/OutputBuffer;->writeDouble(D)V

    .line 123
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 124
    return-void
.end method

.method public writeEndArray()V
    .locals 5

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 288
    const-string/jumbo v0, "writeEndArray"

    new-array v1, v3, [Lcom/mongodb/BSONWriter$State;

    sget-object v2, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 290
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    if-eq v0, v1, :cond_0

    .line 291
    const-string/jumbo v0, "WriteEndArray"

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v1

    new-array v2, v3, [Lcom/mongodb/BSONContextType;

    sget-object v3, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    aput-object v3, v2, v4

    invoke-virtual {p0, v0, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->throwInvalidContextType(Ljava/lang/String;Lcom/mongodb/BSONContextType;[Lcom/mongodb/BSONContextType;)V

    .line 294
    :cond_0
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->writeEndArray()V

    .line 295
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 296
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->backpatchSize()V

    .line 298
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BSONBinaryWriter$Context;->getParentContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 299
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 300
    return-void
.end method

.method public writeEndDocument()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 304
    const-string/jumbo v1, "writeEndDocument"

    new-array v2, v5, [Lcom/mongodb/BSONWriter$State;

    sget-object v3, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 306
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v0

    .line 308
    .local v0, "contextType":Lcom/mongodb/BSONContextType;
    sget-object v1, Lcom/mongodb/BSONContextType;->DOCUMENT:Lcom/mongodb/BSONContextType;

    if-eq v0, v1, :cond_0

    sget-object v1, Lcom/mongodb/BSONContextType;->SCOPE_DOCUMENT:Lcom/mongodb/BSONContextType;

    if-eq v0, v1, :cond_0

    .line 309
    const-string/jumbo v1, "WriteEndDocument"

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/mongodb/BSONContextType;

    sget-object v3, Lcom/mongodb/BSONContextType;->DOCUMENT:Lcom/mongodb/BSONContextType;

    aput-object v3, v2, v4

    sget-object v3, Lcom/mongodb/BSONContextType;->SCOPE_DOCUMENT:Lcom/mongodb/BSONContextType;

    aput-object v3, v2, v5

    invoke-virtual {p0, v1, v0, v2}, Lcom/mongodb/BSONBinaryWriter;->throwInvalidContextType(Ljava/lang/String;Lcom/mongodb/BSONContextType;[Lcom/mongodb/BSONContextType;)V

    .line 312
    :cond_0
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->writeEndDocument()V

    .line 313
    iget-object v1, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 314
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->backpatchSize()V

    .line 316
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->getParentContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 317
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    if-nez v1, :cond_1

    .line 318
    sget-object v1, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 327
    :goto_0
    return-void

    .line 321
    :cond_1
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/BSONContextType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

    if-ne v1, v2, :cond_2

    .line 322
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->backpatchSize()V

    .line 323
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/BSONBinaryWriter$Context;->getParentContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 325
    :cond_2
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    goto :goto_0
.end method

.method public writeInt32(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 128
    const-string/jumbo v0, "writeInt32"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 130
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->INT32:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 131
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 132
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 134
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 135
    return-void
.end method

.method public writeInt64(J)V
    .locals 5
    .param p1, "value"    # J

    .prologue
    .line 139
    const-string/jumbo v0, "writeInt64"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 141
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->INT64:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 142
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 143
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1, p2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 145
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 146
    return-void
.end method

.method public writeJavaScript(Ljava/lang/String;)V
    .locals 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 150
    const-string/jumbo v0, "writeJavaScript"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 152
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->JAVASCRIPT:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 153
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 154
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeString(Ljava/lang/String;)V

    .line 156
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 157
    return-void
.end method

.method public writeJavaScriptWithScope(Ljava/lang/String;)V
    .locals 5
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 161
    const-string/jumbo v0, "writeJavaScriptWithScope"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    sget-object v2, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 163
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 164
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 165
    new-instance v0, Lcom/mongodb/BSONBinaryWriter$Context;

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    sget-object v2, Lcom/mongodb/BSONContextType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

    iget-object v3, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mongodb/BSONBinaryWriter$Context;-><init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;Lcom/mongodb/BSONContextType;I)V

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 166
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, v4}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 167
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeString(Ljava/lang/String;)V

    .line 169
    sget-object v0, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 170
    return-void
.end method

.method public writeMaxKey()V
    .locals 4

    .prologue
    .line 174
    const-string/jumbo v0, "writeMaxKey"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 176
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->MAX_KEY:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 177
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 179
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 180
    return-void
.end method

.method public writeMinKey()V
    .locals 4

    .prologue
    .line 184
    const-string/jumbo v0, "writeMinKey"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 186
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->MIN_KEY:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 187
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 189
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 190
    return-void
.end method

.method public writeNull()V
    .locals 4

    .prologue
    .line 194
    const-string/jumbo v0, "writeNull"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 196
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->NULL:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 197
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 199
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 200
    return-void
.end method

.method public writeObjectId(Lorg/bson/types/ObjectId;)V
    .locals 4
    .param p1, "objectId"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 204
    const-string/jumbo v0, "writeObjectId"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 206
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->OBJECT_ID:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 207
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 209
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p1}, Lorg/bson/types/ObjectId;->toByteArray()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write([B)V

    .line 210
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 211
    return-void
.end method

.method public writeStartArray()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 260
    const-string/jumbo v0, "writeStartArray"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    sget-object v2, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v2, v1, v4

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 262
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->writeStartArray()V

    .line 263
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->ARRAY:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 264
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 265
    new-instance v0, Lcom/mongodb/BSONBinaryWriter$Context;

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    sget-object v2, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    iget-object v3, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mongodb/BSONBinaryWriter$Context;-><init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;Lcom/mongodb/BSONContextType;I)V

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 266
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, v4}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 268
    sget-object v0, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 269
    return-void
.end method

.method public writeStartDocument()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 273
    const-string/jumbo v0, "writeStartDocument"

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    sget-object v2, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    aput-object v2, v1, v4

    const/4 v2, 0x1

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 275
    invoke-super {p0}, Lcom/mongodb/BSONWriter;->writeStartDocument()V

    .line 276
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    sget-object v1, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    if-ne v0, v1, :cond_0

    .line 277
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->DOCUMENT:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 278
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 280
    :cond_0
    new-instance v0, Lcom/mongodb/BSONBinaryWriter$Context;

    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getContext()Lcom/mongodb/BSONBinaryWriter$Context;

    move-result-object v1

    sget-object v2, Lcom/mongodb/BSONContextType;->DOCUMENT:Lcom/mongodb/BSONContextType;

    iget-object v3, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mongodb/BSONBinaryWriter$Context;-><init>(Lcom/mongodb/BSONBinaryWriter;Lcom/mongodb/BSONBinaryWriter$Context;Lcom/mongodb/BSONContextType;I)V

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setContext(Lcom/mongodb/BSONWriter$Context;)V

    .line 281
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, v4}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 283
    sget-object v0, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 284
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 215
    const-string/jumbo v0, "writeString"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 217
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->STRING:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 218
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 219
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeString(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 222
    return-void
.end method

.method public writeSymbol(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 226
    const-string/jumbo v0, "writeSymbol"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 228
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->SYMBOL:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 229
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 230
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeString(Ljava/lang/String;)V

    .line 232
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 234
    return-void
.end method

.method public writeTimestamp(Lorg/bson/types/BSONTimestamp;)V
    .locals 4
    .param p1, "value"    # Lorg/bson/types/BSONTimestamp;

    .prologue
    .line 238
    const-string/jumbo v0, "writeTimestamp"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 240
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->TIMESTAMP:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 241
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 242
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p1}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 243
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p1}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 245
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 246
    return-void
.end method

.method public writeUndefined()V
    .locals 4

    .prologue
    .line 250
    const-string/jumbo v0, "writeUndefined"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 252
    iget-object v0, p0, Lcom/mongodb/BSONBinaryWriter;->buffer:Lorg/bson/io/OutputBuffer;

    sget-object v1, Lcom/mongodb/BSONType;->UNDEFINED:Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 253
    invoke-direct {p0}, Lcom/mongodb/BSONBinaryWriter;->writeCurrentName()V

    .line 255
    invoke-virtual {p0}, Lcom/mongodb/BSONBinaryWriter;->getNextState()Lcom/mongodb/BSONWriter$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/BSONBinaryWriter;->setState(Lcom/mongodb/BSONWriter$State;)V

    .line 256
    return-void
.end method
