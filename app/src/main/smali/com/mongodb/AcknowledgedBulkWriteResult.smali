.class Lcom/mongodb/AcknowledgedBulkWriteResult;
.super Lcom/mongodb/BulkWriteResult;
.source "AcknowledgedBulkWriteResult.java"


# instance fields
.field private insertedCount:I

.field private matchedCount:I

.field private modifiedCount:Ljava/lang/Integer;

.field private removedCount:I

.field private final upserts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IIILjava/lang/Integer;Ljava/util/List;)V
    .locals 1
    .param p1, "insertedCount"    # I
    .param p2, "matchedCount"    # I
    .param p3, "removedCount"    # I
    .param p4, "modifiedCount"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p5, "upserts":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    invoke-direct {p0}, Lcom/mongodb/BulkWriteResult;-><init>()V

    .line 33
    iput p1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    .line 34
    iput p2, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    .line 35
    iput p3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    .line 36
    iput-object p4, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    .line 37
    const-string/jumbo v0, "upserts"

    invoke-static {v0, p5}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    .line 38
    return-void
.end method

.method constructor <init>(Lcom/mongodb/WriteRequest$Type;ILjava/lang/Integer;Ljava/util/List;)V
    .locals 6
    .param p1, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p2, "count"    # I
    .param p3, "modifiedCount"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/WriteRequest$Type;",
            "I",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "upserts":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    const/4 v0, 0x0

    .line 46
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    if-ne p1, v1, :cond_1

    move v1, p2

    :goto_0
    sget-object v2, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-eq p1, v2, :cond_0

    sget-object v2, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-ne p1, v2, :cond_2

    :cond_0
    move v2, p2

    :goto_1
    sget-object v3, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    if-ne p1, v3, :cond_3

    move v3, p2

    :goto_2
    move-object v0, p0

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/AcknowledgedBulkWriteResult;-><init>(IIILjava/lang/Integer;Ljava/util/List;)V

    .line 50
    return-void

    :cond_1
    move v1, v0

    .line 46
    goto :goto_0

    :cond_2
    move v2, v0

    goto :goto_1

    :cond_3
    move v3, v0

    goto :goto_2
.end method

.method constructor <init>(Lcom/mongodb/WriteRequest$Type;ILjava/util/List;)V
    .locals 1
    .param p1, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/WriteRequest$Type;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p3, "upserts":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/mongodb/AcknowledgedBulkWriteResult;-><init>(Lcom/mongodb/WriteRequest$Type;ILjava/lang/Integer;Ljava/util/List;)V

    .line 42
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 95
    if-ne p0, p1, :cond_1

    .line 120
    :cond_0
    :goto_0
    return v1

    .line 98
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 99
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 102
    check-cast v0, Lcom/mongodb/AcknowledgedBulkWriteResult;

    .line 104
    .local v0, "that":Lcom/mongodb/AcknowledgedBulkWriteResult;
    iget v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    iget v4, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 105
    goto :goto_0

    .line 107
    :cond_4
    iget v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    iget v4, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 108
    goto :goto_0

    .line 110
    :cond_5
    iget v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    iget v4, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 111
    goto :goto_0

    .line 113
    :cond_6
    iget-object v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    iget-object v4, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    :cond_7
    move v1, v2

    .line 114
    goto :goto_0

    .line 113
    :cond_8
    iget-object v3, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    if-nez v3, :cond_7

    .line 116
    :cond_9
    iget-object v3, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    iget-object v4, v0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 117
    goto :goto_0
.end method

.method public getInsertedCount()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    return v0
.end method

.method public getMatchedCount()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    return v0
.end method

.method public getModifiedCount()I
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 80
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "The modifiedCount is not available because at least one of the servers that was updated was not able to provide this information (the server is must be at least version 2.6"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getRemovedCount()I
    .locals 1

    .prologue
    .line 69
    iget v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    return v0
.end method

.method public getUpserts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 125
    iget v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    .line 126
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    add-int v0, v1, v2

    .line 127
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    add-int v0, v1, v2

    .line 128
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 129
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 130
    return v0

    .line 128
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isAcknowledged()Z
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x1

    return v0
.end method

.method public isModifiedCountAvailable()Z
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AcknowledgedBulkWriteResult{insertedCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->insertedCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", matchedCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->matchedCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", removedCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->removedCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", modifiedCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->modifiedCount:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", upserts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/AcknowledgedBulkWriteResult;->upserts:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
