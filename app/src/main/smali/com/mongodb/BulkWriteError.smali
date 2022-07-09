.class public Lcom/mongodb/BulkWriteError;
.super Ljava/lang/Object;
.source "BulkWriteError.java"


# instance fields
.field private final code:I

.field private final details:Lcom/mongodb/DBObject;

.field private final index:I

.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/mongodb/DBObject;I)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "details"    # Lcom/mongodb/DBObject;
    .param p4, "index"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/mongodb/BulkWriteError;->code:I

    .line 42
    const-string/jumbo v0, "message"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, "details"

    invoke-static {v0, p3}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    iput-object v0, p0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    .line 44
    iput p4, p0, Lcom/mongodb/BulkWriteError;->index:I

    .line 45
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 85
    if-ne p0, p1, :cond_1

    .line 107
    :cond_0
    :goto_0
    return v1

    .line 88
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 89
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 92
    check-cast v0, Lcom/mongodb/BulkWriteError;

    .line 94
    .local v0, "that":Lcom/mongodb/BulkWriteError;
    iget v3, p0, Lcom/mongodb/BulkWriteError;->code:I

    iget v4, v0, Lcom/mongodb/BulkWriteError;->code:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 95
    goto :goto_0

    .line 97
    :cond_4
    iget v3, p0, Lcom/mongodb/BulkWriteError;->index:I

    iget v4, v0, Lcom/mongodb/BulkWriteError;->index:I

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 98
    goto :goto_0

    .line 100
    :cond_5
    iget-object v3, p0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    iget-object v4, v0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    .line 101
    goto :goto_0

    .line 103
    :cond_6
    iget-object v3, p0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 104
    goto :goto_0
.end method

.method public getCode()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/mongodb/BulkWriteError;->code:I

    return v0
.end method

.method public getDetails()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/mongodb/BulkWriteError;->index:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 112
    iget v0, p0, Lcom/mongodb/BulkWriteError;->index:I

    .line 113
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/BulkWriteError;->code:I

    add-int v0, v1, v2

    .line 114
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 115
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 116
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "BulkWriteError{index="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/BulkWriteError;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/BulkWriteError;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/BulkWriteError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", details="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/BulkWriteError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
