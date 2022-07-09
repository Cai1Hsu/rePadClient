.class Lcom/mongodb/BulkWriteBatchCombiner;
.super Ljava/lang/Object;
.source "BulkWriteBatchCombiner.java"


# instance fields
.field private insertedCount:I

.field private matchedCount:I

.field private modifiedCount:Ljava/lang/Integer;

.field private final ordered:Z

.field private removedCount:I

.field private final serverAddress:Lcom/mongodb/ServerAddress;

.field private final writeConcern:Lcom/mongodb/WriteConcern;

.field private final writeConcernErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteConcernError;",
            ">;"
        }
    .end annotation
.end field

.field private final writeErrors:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;"
        }
    .end annotation
.end field

.field private final writeUpserts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V
    .locals 3
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    .line 37
    new-instance v0, Ljava/util/TreeSet;

    new-instance v2, Lcom/mongodb/BulkWriteBatchCombiner$1;

    invoke-direct {v2, p0}, Lcom/mongodb/BulkWriteBatchCombiner$1;-><init>(Lcom/mongodb/BulkWriteBatchCombiner;)V

    invoke-direct {v0, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeUpserts:Ljava/util/Set;

    .line 43
    new-instance v0, Ljava/util/TreeSet;

    new-instance v2, Lcom/mongodb/BulkWriteBatchCombiner$2;

    invoke-direct {v2, p0}, Lcom/mongodb/BulkWriteBatchCombiner$2;-><init>(Lcom/mongodb/BulkWriteBatchCombiner;)V

    invoke-direct {v0, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeErrors:Ljava/util/Set;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    .line 52
    const-string/jumbo v0, "writeConcern"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/WriteConcern;

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 53
    invoke-virtual {p2}, Lcom/mongodb/WriteConcern;->getContinueOnError()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->ordered:Z

    .line 54
    const-string/jumbo v0, "serverAddress"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerAddress;

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 55
    return-void

    :cond_0
    move v0, v1

    .line 53
    goto :goto_0
.end method

.method private createResult()Lcom/mongodb/BulkWriteResult;
    .locals 7

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v0}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/mongodb/AcknowledgedBulkWriteResult;

    iget v1, p0, Lcom/mongodb/BulkWriteBatchCombiner;->insertedCount:I

    iget v2, p0, Lcom/mongodb/BulkWriteBatchCombiner;->matchedCount:I

    iget v3, p0, Lcom/mongodb/BulkWriteBatchCombiner;->removedCount:I

    iget-object v4, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeUpserts:Ljava/util/Set;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/AcknowledgedBulkWriteResult;-><init>(IIILjava/lang/Integer;Ljava/util/List;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mongodb/UnacknowledgedBulkWriteResult;

    invoke-direct {v0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;-><init>()V

    goto :goto_0
.end method

.method private hasWriteErrors()Z
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeErrors:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private mergeUpserts(Ljava/util/List;Lcom/mongodb/IndexMap;)V
    .locals 6
    .param p2, "indexMap"    # Lcom/mongodb/IndexMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;",
            "Lcom/mongodb/IndexMap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "upserts":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BulkWriteUpsert;

    .line 110
    .local v0, "bulkWriteUpsert":Lcom/mongodb/BulkWriteUpsert;
    iget-object v2, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeUpserts:Ljava/util/Set;

    new-instance v3, Lcom/mongodb/BulkWriteUpsert;

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteUpsert;->getIndex()I

    move-result v4

    invoke-virtual {p2, v4}, Lcom/mongodb/IndexMap;->map(I)I

    move-result v4

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteUpsert;->getId()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/mongodb/BulkWriteUpsert;-><init>(ILjava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 112
    .end local v0    # "bulkWriteUpsert":Lcom/mongodb/BulkWriteUpsert;
    :cond_0
    return-void
.end method

.method private mergeWriteConcernError(Lcom/mongodb/WriteConcernError;)V
    .locals 2
    .param p1, "writeConcernError"    # Lcom/mongodb/WriteConcernError;

    .prologue
    .line 92
    if-eqz p1, :cond_0

    .line 93
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 94
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    iget-object v1, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/mongodb/WriteConcernError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private mergeWriteErrors(Ljava/util/List;Lcom/mongodb/IndexMap;)V
    .locals 8
    .param p2, "indexMap"    # Lcom/mongodb/IndexMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;",
            "Lcom/mongodb/IndexMap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "newWriteErrors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteError;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BulkWriteError;

    .line 103
    .local v0, "cur":Lcom/mongodb/BulkWriteError;
    iget-object v2, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeErrors:Ljava/util/Set;

    new-instance v3, Lcom/mongodb/BulkWriteError;

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteError;->getCode()I

    move-result v4

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteError;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteError;->getDetails()Lcom/mongodb/DBObject;

    move-result-object v6

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteError;->getIndex()I

    move-result v7

    invoke-virtual {p2, v7}, Lcom/mongodb/IndexMap;->map(I)I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/mongodb/BulkWriteError;-><init>(ILjava/lang/String;Lcom/mongodb/DBObject;I)V

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 106
    .end local v0    # "cur":Lcom/mongodb/BulkWriteError;
    :cond_0
    return-void
.end method

.method private throwOnError()V
    .locals 5

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeErrors:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 125
    :cond_0
    new-instance v1, Lcom/mongodb/BulkWriteException;

    invoke-direct {p0}, Lcom/mongodb/BulkWriteBatchCombiner;->createResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeErrors:Ljava/util/Set;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v4, p0, Lcom/mongodb/BulkWriteBatchCombiner;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/mongodb/BulkWriteException;-><init>(Lcom/mongodb/BulkWriteResult;Ljava/util/List;Lcom/mongodb/WriteConcernError;Lcom/mongodb/ServerAddress;)V

    throw v1

    :cond_1
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    iget-object v4, p0, Lcom/mongodb/BulkWriteBatchCombiner;->writeConcernErrors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/WriteConcernError;

    goto :goto_0

    .line 130
    :cond_2
    return-void
.end method


# virtual methods
.method public addErrorResult(Lcom/mongodb/BulkWriteException;Lcom/mongodb/IndexMap;)V
    .locals 1
    .param p1, "exception"    # Lcom/mongodb/BulkWriteException;
    .param p2, "indexMap"    # Lcom/mongodb/IndexMap;

    .prologue
    .line 70
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V

    .line 71
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteErrors(Ljava/util/List;Lcom/mongodb/IndexMap;)V

    .line 72
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteConcernError(Lcom/mongodb/WriteConcernError;)V

    .line 73
    return-void
.end method

.method public addErrorResult(Ljava/util/List;Lcom/mongodb/WriteConcernError;Lcom/mongodb/IndexMap;)V
    .locals 0
    .param p2, "writeConcernError"    # Lcom/mongodb/WriteConcernError;
    .param p3, "indexMap"    # Lcom/mongodb/IndexMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;",
            "Lcom/mongodb/WriteConcernError;",
            "Lcom/mongodb/IndexMap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "writeErrors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteError;>;"
    invoke-direct {p0, p1, p3}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteErrors(Ljava/util/List;Lcom/mongodb/IndexMap;)V

    .line 88
    invoke-direct {p0, p2}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteConcernError(Lcom/mongodb/WriteConcernError;)V

    .line 89
    return-void
.end method

.method public addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V
    .locals 2
    .param p1, "result"    # Lcom/mongodb/BulkWriteResult;
    .param p2, "indexMap"    # Lcom/mongodb/IndexMap;

    .prologue
    .line 58
    iget v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->insertedCount:I

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getInsertedCount()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->insertedCount:I

    .line 59
    iget v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->matchedCount:I

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getMatchedCount()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->matchedCount:I

    .line 60
    iget v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->removedCount:I

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getRemovedCount()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->removedCount:I

    .line 61
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->isModifiedCountAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getModifiedCount()I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    .line 66
    :goto_0
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeUpserts(Ljava/util/List;Lcom/mongodb/IndexMap;)V

    .line 67
    return-void

    .line 64
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->modifiedCount:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public addWriteConcernErrorResult(Lcom/mongodb/WriteConcernError;)V
    .locals 1
    .param p1, "writeConcernError"    # Lcom/mongodb/WriteConcernError;

    .prologue
    .line 81
    const-string/jumbo v0, "writeConcernError"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    invoke-direct {p0, p1}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteConcernError(Lcom/mongodb/WriteConcernError;)V

    .line 83
    return-void
.end method

.method public addWriteErrorResult(Lcom/mongodb/BulkWriteError;Lcom/mongodb/IndexMap;)V
    .locals 2
    .param p1, "writeError"    # Lcom/mongodb/BulkWriteError;
    .param p2, "indexMap"    # Lcom/mongodb/IndexMap;

    .prologue
    .line 76
    const-string/jumbo v0, "writeError"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mongodb/BulkWriteError;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/BulkWriteBatchCombiner;->mergeWriteErrors(Ljava/util/List;Lcom/mongodb/IndexMap;)V

    .line 78
    return-void
.end method

.method public getResult()Lcom/mongodb/BulkWriteResult;
    .locals 1

    .prologue
    .line 115
    invoke-direct {p0}, Lcom/mongodb/BulkWriteBatchCombiner;->throwOnError()V

    .line 116
    invoke-direct {p0}, Lcom/mongodb/BulkWriteBatchCombiner;->createResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method public shouldStopSendingMoreBatches()Z
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/mongodb/BulkWriteBatchCombiner;->ordered:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/mongodb/BulkWriteBatchCombiner;->hasWriteErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
