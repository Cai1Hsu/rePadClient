.class abstract Lcom/mongodb/BSONWriter;
.super Ljava/lang/Object;
.source "BSONWriter.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/BSONWriter$Mark;,
        Lcom/mongodb/BSONWriter$Context;,
        Lcom/mongodb/BSONWriter$State;
    }
.end annotation


# instance fields
.field private closed:Z

.field private context:Lcom/mongodb/BSONWriter$Context;

.field private currentName:Ljava/lang/String;

.field private serializationDepth:I

.field private final settings:Lcom/mongodb/BSONWriterSettings;

.field private state:Lcom/mongodb/BSONWriter$State;


# direct methods
.method protected constructor <init>(Lcom/mongodb/BSONWriterSettings;)V
    .locals 1
    .param p1, "settings"    # Lcom/mongodb/BSONWriterSettings;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/mongodb/BSONWriter;->settings:Lcom/mongodb/BSONWriterSettings;

    .line 44
    sget-object v0, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    iput-object v0, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    .line 45
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/BSONWriter;)Lcom/mongodb/BSONWriter$Context;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->context:Lcom/mongodb/BSONWriter$Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/BSONWriter;)Lcom/mongodb/BSONWriter$State;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/BSONWriter;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->currentName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mongodb/BSONWriter;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/mongodb/BSONWriter;->currentName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$300(Lcom/mongodb/BSONWriter;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;

    .prologue
    .line 29
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    return v0
.end method

.method static synthetic access$302(Lcom/mongodb/BSONWriter;I)I
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/BSONWriter;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    return p1
.end method


# virtual methods
.method protected varargs checkPreconditions(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "validStates"    # [Lcom/mongodb/BSONWriter$State;

    .prologue
    .line 457
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 458
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "BSONWriter"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 461
    :cond_0
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->checkState([Lcom/mongodb/BSONWriter$State;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 462
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BSONWriter;->throwInvalidState(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 464
    :cond_1
    return-void
.end method

.method protected checkState([Lcom/mongodb/BSONWriter$State;)Z
    .locals 5
    .param p1, "validStates"    # [Lcom/mongodb/BSONWriter$State;

    .prologue
    .line 448
    move-object v0, p1

    .local v0, "arr$":[Lcom/mongodb/BSONWriter$State;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 449
    .local v1, "cur":Lcom/mongodb/BSONWriter$State;
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->getState()Lcom/mongodb/BSONWriter$State;

    move-result-object v4

    if-ne v1, v4, :cond_0

    .line 450
    const/4 v4, 0x1

    .line 453
    .end local v1    # "cur":Lcom/mongodb/BSONWriter$State;
    :goto_1
    return v4

    .line 448
    .restart local v1    # "cur":Lcom/mongodb/BSONWriter$State;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 453
    .end local v1    # "cur":Lcom/mongodb/BSONWriter$State;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public close()V
    .locals 1

    .prologue
    .line 519
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/BSONWriter;->closed:Z

    .line 520
    return-void
.end method

.method public abstract flush()V
.end method

.method protected getContext()Lcom/mongodb/BSONWriter$Context;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->context:Lcom/mongodb/BSONWriter$Context;

    return-object v0
.end method

.method protected getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->currentName:Ljava/lang/String;

    return-object v0
.end method

.method protected getNextState()Lcom/mongodb/BSONWriter$State;
    .locals 2

    .prologue
    .line 440
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->getContext()Lcom/mongodb/BSONWriter$Context;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/BSONWriter$Context;->getContextType()Lcom/mongodb/BSONContextType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    if-ne v0, v1, :cond_0

    .line 441
    sget-object v0, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    .line 443
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    goto :goto_0
.end method

.method protected getState()Lcom/mongodb/BSONWriter$State;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    return-object v0
.end method

.method protected isClosed()Z
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/mongodb/BSONWriter;->closed:Z

    return v0
.end method

.method protected setContext(Lcom/mongodb/BSONWriter$Context;)V
    .locals 0
    .param p1, "context"    # Lcom/mongodb/BSONWriter$Context;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/mongodb/BSONWriter;->context:Lcom/mongodb/BSONWriter$Context;

    .line 69
    return-void
.end method

.method protected setState(Lcom/mongodb/BSONWriter$State;)V
    .locals 0
    .param p1, "state"    # Lcom/mongodb/BSONWriter$State;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    .line 57
    return-void
.end method

.method protected varargs throwInvalidContextType(Ljava/lang/String;Lcom/mongodb/BSONContextType;[Lcom/mongodb/BSONContextType;)V
    .locals 5
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "actualContextType"    # Lcom/mongodb/BSONContextType;
    .param p3, "validContextTypes"    # [Lcom/mongodb/BSONContextType;

    .prologue
    .line 476
    const-string/jumbo v2, " or "

    invoke-static {p3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mongodb/StringUtils;->join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v1

    .line 477
    .local v1, "validContextTypesString":Ljava/lang/String;
    const-string/jumbo v2, "%s can only be called when ContextType is %s, not when ContextType is %s."

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 480
    .local v0, "message":Ljava/lang/String;
    new-instance v2, Lorg/bson/BSONException;

    invoke-direct {v2, v0}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected varargs throwInvalidState(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V
    .locals 11
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "validStates"    # [Lcom/mongodb/BSONWriter$State;

    .prologue
    const/4 v10, 0x3

    const/4 v6, 0x5

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 492
    iget-object v4, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    sget-object v5, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    if-eq v4, v5, :cond_0

    iget-object v4, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    sget-object v5, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    if-eq v4, v5, :cond_0

    iget-object v4, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    sget-object v5, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    if-ne v4, v5, :cond_3

    .line 493
    :cond_0
    const-string/jumbo v4, "end"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string/jumbo v4, "writeName"

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 495
    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 496
    .local v2, "typeName":Ljava/lang/String;
    const-string/jumbo v4, "start"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 497
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 499
    :cond_1
    const-string/jumbo v0, "A"

    .line 500
    .local v0, "article":Ljava/lang/String;
    new-array v4, v6, [Ljava/lang/Character;

    const/16 v5, 0x41

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v7

    const/16 v5, 0x45

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v8

    const/16 v5, 0x49

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v9

    const/16 v5, 0x4f

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    aput-object v5, v4, v10

    const/4 v5, 0x4

    const/16 v6, 0x55

    invoke-static {v6}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 501
    const-string/jumbo v0, "An"

    .line 503
    :cond_2
    const-string/jumbo v4, "%s %s value cannot be written to the root level of a BSON document."

    new-array v5, v9, [Ljava/lang/Object;

    aput-object v0, v5, v7

    aput-object v2, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 505
    .local v1, "message":Ljava/lang/String;
    new-instance v4, Lorg/bson/BSONException;

    invoke-direct {v4, v1}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 509
    .end local v0    # "article":Ljava/lang/String;
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "typeName":Ljava/lang/String;
    :cond_3
    const-string/jumbo v4, " or "

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mongodb/StringUtils;->join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v3

    .line 510
    .local v3, "validStatesString":Ljava/lang/String;
    const-string/jumbo v4, "%s can only be called when State is %s, not when State is %s"

    new-array v5, v10, [Ljava/lang/Object;

    aput-object p1, v5, v7

    aput-object v3, v5, v8

    iget-object v6, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    aput-object v6, v5, v9

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 512
    .restart local v1    # "message":Ljava/lang/String;
    new-instance v4, Lorg/bson/BSONException;

    invoke-direct {v4, v1}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public writeBinaryData(Ljava/lang/String;Lorg/bson/types/Binary;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "binary"    # Lorg/bson/types/Binary;

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeBinaryData(Lorg/bson/types/Binary;)V

    .line 92
    return-void
.end method

.method public abstract writeBinaryData(Lorg/bson/types/Binary;)V
.end method

.method public writeBoolean(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeBoolean(Z)V

    .line 110
    return-void
.end method

.method public abstract writeBoolean(Z)V
.end method

.method public abstract writeDateTime(J)V
.end method

.method public writeDateTime(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 126
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 127
    invoke-virtual {p0, p2, p3}, Lcom/mongodb/BSONWriter;->writeDateTime(J)V

    .line 128
    return-void
.end method

.method public abstract writeDouble(D)V
.end method

.method public writeDouble(Ljava/lang/String;D)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 144
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 145
    invoke-virtual {p0, p2, p3}, Lcom/mongodb/BSONWriter;->writeDouble(D)V

    .line 146
    return-void
.end method

.method public writeEndArray()V
    .locals 1

    .prologue
    .line 152
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    .line 153
    return-void
.end method

.method public writeEndDocument()V
    .locals 1

    .prologue
    .line 159
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    .line 160
    return-void
.end method

.method public abstract writeInt32(I)V
.end method

.method public writeInt32(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 176
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeInt32(I)V

    .line 178
    return-void
.end method

.method public abstract writeInt64(J)V
.end method

.method public writeInt64(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 194
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 195
    invoke-virtual {p0, p2, p3}, Lcom/mongodb/BSONWriter;->writeInt64(J)V

    .line 196
    return-void
.end method

.method public abstract writeJavaScript(Ljava/lang/String;)V
.end method

.method public writeJavaScript(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;

    .prologue
    .line 212
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 213
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeJavaScript(Ljava/lang/String;)V

    .line 214
    return-void
.end method

.method public abstract writeJavaScriptWithScope(Ljava/lang/String;)V
.end method

.method public writeJavaScriptWithScope(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 231
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeJavaScriptWithScope(Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method public abstract writeMaxKey()V
.end method

.method public writeMaxKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 245
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 246
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeMaxKey()V

    .line 247
    return-void
.end method

.method public abstract writeMinKey()V
.end method

.method public writeMinKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 261
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeMinKey()V

    .line 262
    return-void
.end method

.method public writeName(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v0, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    sget-object v1, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    if-eq v0, v1, :cond_0

    .line 271
    const-string/jumbo v0, "WriteName"

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/BSONWriter$State;

    const/4 v2, 0x0

    sget-object v3, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/BSONWriter;->throwInvalidState(Ljava/lang/String;[Lcom/mongodb/BSONWriter$State;)V

    .line 273
    :cond_0
    iput-object p1, p0, Lcom/mongodb/BSONWriter;->currentName:Ljava/lang/String;

    .line 274
    sget-object v0, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    iput-object v0, p0, Lcom/mongodb/BSONWriter;->state:Lcom/mongodb/BSONWriter$State;

    .line 275
    return-void
.end method

.method public abstract writeNull()V
.end method

.method public writeNull(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 288
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 289
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeNull()V

    .line 290
    return-void
.end method

.method public writeObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "objectId"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 306
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 307
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeObjectId(Lorg/bson/types/ObjectId;)V

    .line 308
    return-void
.end method

.method public abstract writeObjectId(Lorg/bson/types/ObjectId;)V
.end method

.method public writeStartArray()V
    .locals 2

    .prologue
    .line 332
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    .line 333
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    iget-object v1, p0, Lcom/mongodb/BSONWriter;->settings:Lcom/mongodb/BSONWriterSettings;

    invoke-virtual {v1}, Lcom/mongodb/BSONWriterSettings;->getMaxSerializationDepth()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 334
    new-instance v0, Lorg/bson/BSONException;

    const-string/jumbo v1, "Maximum serialization depth exceeded (does the object being serialized have a circular reference?)."

    invoke-direct {v0, v1}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_0
    return-void
.end method

.method public writeStartArray(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 344
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 345
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeStartArray()V

    .line 346
    return-void
.end method

.method public writeStartDocument()V
    .locals 2

    .prologue
    .line 354
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    .line 355
    iget v0, p0, Lcom/mongodb/BSONWriter;->serializationDepth:I

    iget-object v1, p0, Lcom/mongodb/BSONWriter;->settings:Lcom/mongodb/BSONWriterSettings;

    invoke-virtual {v1}, Lcom/mongodb/BSONWriterSettings;->getMaxSerializationDepth()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 356
    new-instance v0, Lorg/bson/BSONException;

    const-string/jumbo v1, "Maximum serialization depth exceeded (does the object being serialized have a circular reference?)."

    invoke-direct {v0, v1}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_0
    return-void
.end method

.method public writeStartDocument(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 366
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 367
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeStartDocument()V

    .line 368
    return-void
.end method

.method public abstract writeString(Ljava/lang/String;)V
.end method

.method public writeString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 384
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 385
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeString(Ljava/lang/String;)V

    .line 386
    return-void
.end method

.method public abstract writeSymbol(Ljava/lang/String;)V
.end method

.method public writeSymbol(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 402
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 403
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeSymbol(Ljava/lang/String;)V

    .line 404
    return-void
.end method

.method public writeTimestamp(Ljava/lang/String;Lorg/bson/types/BSONTimestamp;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/bson/types/BSONTimestamp;

    .prologue
    .line 420
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 421
    invoke-virtual {p0, p2}, Lcom/mongodb/BSONWriter;->writeTimestamp(Lorg/bson/types/BSONTimestamp;)V

    .line 422
    return-void
.end method

.method public abstract writeTimestamp(Lorg/bson/types/BSONTimestamp;)V
.end method

.method public abstract writeUndefined()V
.end method

.method public writeUndefined(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 435
    invoke-virtual {p0, p1}, Lcom/mongodb/BSONWriter;->writeName(Ljava/lang/String;)V

    .line 436
    invoke-virtual {p0}, Lcom/mongodb/BSONWriter;->writeUndefined()V

    .line 437
    return-void
.end method
