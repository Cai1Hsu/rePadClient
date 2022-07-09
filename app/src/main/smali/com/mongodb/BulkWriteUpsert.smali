.class public Lcom/mongodb/BulkWriteUpsert;
.super Ljava/lang/Object;
.source "BulkWriteUpsert.java"


# instance fields
.field private final id:Ljava/lang/Object;

.field private final index:I


# direct methods
.method public constructor <init>(ILjava/lang/Object;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lcom/mongodb/BulkWriteUpsert;->index:I

    .line 40
    iput-object p2, p0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    .line 41
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 63
    if-ne p0, p1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return v1

    .line 66
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 67
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 70
    check-cast v0, Lcom/mongodb/BulkWriteUpsert;

    .line 72
    .local v0, "that":Lcom/mongodb/BulkWriteUpsert;
    iget v3, p0, Lcom/mongodb/BulkWriteUpsert;->index:I

    iget v4, v0, Lcom/mongodb/BulkWriteUpsert;->index:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 73
    goto :goto_0

    .line 75
    :cond_4
    iget-object v3, p0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    iget-object v4, v0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 76
    goto :goto_0
.end method

.method public getId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lcom/mongodb/BulkWriteUpsert;->index:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 84
    iget v0, p0, Lcom/mongodb/BulkWriteUpsert;->index:I

    .line 85
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 86
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "BulkWriteUpsert{index="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/BulkWriteUpsert;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/BulkWriteUpsert;->id:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
