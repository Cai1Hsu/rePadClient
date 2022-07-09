.class abstract Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBCollectionImpl$Run;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "RunExecutor"
.end annotation


# instance fields
.field private final port:Lcom/mongodb/DBPort;

.field final synthetic this$1:Lcom/mongodb/DBCollectionImpl$Run;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;)V
    .locals 0
    .param p2, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 834
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 835
    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->port:Lcom/mongodb/DBPort;

    .line 836
    return-void
.end method

.method private executeWriteProtocol()Lcom/mongodb/BulkWriteResult;
    .locals 8

    .prologue
    .line 860
    new-instance v0, Lcom/mongodb/BulkWriteBatchCombiner;

    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->port:Lcom/mongodb/DBPort;

    invoke-virtual {v5}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v5

    iget-object v6, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v6}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v6

    invoke-direct {v0, v5, v6}, Lcom/mongodb/BulkWriteBatchCombiner;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V

    .line 861
    .local v0, "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v5}, Lcom/mongodb/DBCollectionImpl$Run;->access$1800(Lcom/mongodb/DBCollectionImpl$Run;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_1

    .line 862
    const/4 v5, 0x1

    invoke-static {v1, v5}, Lcom/mongodb/IndexMap;->create(II)Lcom/mongodb/IndexMap;

    move-result-object v2

    .line 864
    .local v2, "indexMap":Lcom/mongodb/IndexMap;
    :try_start_0
    invoke-virtual {p0, v1}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->executeWriteProtocol(I)Lcom/mongodb/WriteResult;

    move-result-object v4

    .line 865
    .local v4, "writeResult":Lcom/mongodb/WriteResult;
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v5}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 866
    invoke-virtual {p0, v4}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getResult(Lcom/mongodb/WriteResult;)Lcom/mongodb/BulkWriteResult;

    move-result-object v5

    invoke-virtual {v0, v5, v2}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V
    :try_end_0
    .catch Lcom/mongodb/WriteConcernException; {:try_start_0 .. :try_end_0} :catch_0

    .line 861
    .end local v4    # "writeResult":Lcom/mongodb/WriteResult;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 868
    :catch_0
    move-exception v3

    .line 869
    .local v3, "writeException":Lcom/mongodb/WriteConcernException;
    invoke-virtual {v3}, Lcom/mongodb/WriteConcernException;->getCommandResult()Lcom/mongodb/CommandResult;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->isWriteConcernError(Lcom/mongodb/CommandResult;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 870
    new-instance v5, Lcom/mongodb/WriteResult;

    invoke-virtual {v3}, Lcom/mongodb/WriteConcernException;->getCommandResult()Lcom/mongodb/CommandResult;

    move-result-object v6

    iget-object v7, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v7}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    invoke-virtual {p0, v5}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getResult(Lcom/mongodb/WriteResult;)Lcom/mongodb/BulkWriteResult;

    move-result-object v5

    invoke-virtual {v0, v5, v2}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V

    .line 872
    invoke-virtual {v3}, Lcom/mongodb/WriteConcernException;->getCommandResult()Lcom/mongodb/CommandResult;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getWriteConcernError(Lcom/mongodb/CommandResult;)Lcom/mongodb/WriteConcernError;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/mongodb/BulkWriteBatchCombiner;->addWriteConcernErrorResult(Lcom/mongodb/WriteConcernError;)V

    .line 876
    :goto_1
    invoke-virtual {v0}, Lcom/mongodb/BulkWriteBatchCombiner;->shouldStopSendingMoreBatches()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 881
    .end local v2    # "indexMap":Lcom/mongodb/IndexMap;
    .end local v3    # "writeException":Lcom/mongodb/WriteConcernException;
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/BulkWriteBatchCombiner;->getResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v5

    return-object v5

    .line 874
    .restart local v2    # "indexMap":Lcom/mongodb/IndexMap;
    .restart local v3    # "writeException":Lcom/mongodb/WriteConcernException;
    :cond_2
    invoke-direct {p0, v3}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getBulkWriteError(Lcom/mongodb/WriteConcernException;)Lcom/mongodb/BulkWriteError;

    move-result-object v5

    invoke-virtual {v0, v5, v2}, Lcom/mongodb/BulkWriteBatchCombiner;->addWriteErrorResult(Lcom/mongodb/BulkWriteError;Lcom/mongodb/IndexMap;)V

    goto :goto_1
.end method

.method private getBulkWriteError(Lcom/mongodb/WriteConcernException;)Lcom/mongodb/BulkWriteError;
    .locals 5
    .param p1, "writeException"    # Lcom/mongodb/WriteConcernException;

    .prologue
    .line 896
    new-instance v0, Lcom/mongodb/BulkWriteError;

    invoke-virtual {p1}, Lcom/mongodb/WriteConcernException;->getCode()I

    move-result v1

    invoke-virtual {p1}, Lcom/mongodb/WriteConcernException;->getCommandResult()Lcom/mongodb/CommandResult;

    move-result-object v2

    const-string/jumbo v3, "err"

    invoke-virtual {v2, v3}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/WriteConcernException;->getCommandResult()Lcom/mongodb/CommandResult;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getErrorResponseDetails(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mongodb/BulkWriteError;-><init>(ILjava/lang/String;Lcom/mongodb/DBObject;I)V

    return-object v0
.end method

.method private getCount(Lcom/mongodb/WriteResult;)I
    .locals 2
    .param p1, "writeResult"    # Lcom/mongodb/WriteResult;

    .prologue
    .line 886
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v0

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/WriteResult;->getN()I

    move-result v0

    goto :goto_0
.end method

.method private getErrorResponseDetails(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 6
    .param p1, "response"    # Lcom/mongodb/DBObject;

    .prologue
    .line 917
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 918
    .local v0, "details":Lcom/mongodb/DBObject;
    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 919
    .local v2, "key":Ljava/lang/String;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "ok"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "err"

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "code"

    aput-object v5, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 920
    invoke-interface {p1, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 923
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method private getWriteConcernError(Lcom/mongodb/CommandResult;)Lcom/mongodb/WriteConcernError;
    .locals 4
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 908
    new-instance v0, Lcom/mongodb/WriteConcernError;

    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->getCode()I

    move-result v1

    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getWriteConcernErrorMessage(Lcom/mongodb/CommandResult;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getErrorResponseDetails(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/WriteConcernError;-><init>(ILjava/lang/String;Lcom/mongodb/DBObject;)V

    return-object v0
.end method

.method private getWriteConcernErrorMessage(Lcom/mongodb/CommandResult;)Ljava/lang/String;
    .locals 1
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 913
    const-string/jumbo v0, "err"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isWriteConcernError(Lcom/mongodb/CommandResult;)Z
    .locals 1
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 904
    const-string/jumbo v0, "wtimeout"

    invoke-virtual {p1, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method addMissingUpserted(Lcom/mongodb/ModifyRequest;Lcom/mongodb/WriteResult;)Lcom/mongodb/WriteResult;
    .locals 5
    .param p1, "update"    # Lcom/mongodb/ModifyRequest;
    .param p2, "writeResult"    # Lcom/mongodb/WriteResult;

    .prologue
    .line 929
    invoke-virtual {p1}, Lcom/mongodb/ModifyRequest;->isUpsert()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->isUpdateOfExisting()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->getUpsertedId()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 931
    invoke-virtual {p1}, Lcom/mongodb/ModifyRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v2

    .line 932
    .local v2, "updateDocument":Lcom/mongodb/DBObject;
    invoke-virtual {p1}, Lcom/mongodb/ModifyRequest;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v1

    .line 933
    .local v1, "query":Lcom/mongodb/DBObject;
    const-string/jumbo v3, "_id"

    invoke-interface {v2, v3}, Lcom/mongodb/DBObject;->containsField(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 934
    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 935
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    const-string/jumbo v3, "upserted"

    const-string/jumbo v4, "_id"

    invoke-interface {v2, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    new-instance v3, Lcom/mongodb/WriteResult;

    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->getLastConcern()Lcom/mongodb/WriteConcern;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    move-object p2, v3

    .line 943
    .end local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v1    # "query":Lcom/mongodb/DBObject;
    .end local v2    # "updateDocument":Lcom/mongodb/DBObject;
    .end local p2    # "writeResult":Lcom/mongodb/WriteResult;
    :cond_0
    :goto_0
    return-object p2

    .line 937
    .restart local v1    # "query":Lcom/mongodb/DBObject;
    .restart local v2    # "updateDocument":Lcom/mongodb/DBObject;
    .restart local p2    # "writeResult":Lcom/mongodb/WriteResult;
    :cond_1
    const-string/jumbo v3, "_id"

    invoke-interface {v1, v3}, Lcom/mongodb/DBObject;->containsField(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 938
    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 939
    .restart local v0    # "commandResult":Lcom/mongodb/CommandResult;
    const-string/jumbo v3, "upserted"

    const-string/jumbo v4, "_id"

    invoke-interface {v1, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    new-instance v3, Lcom/mongodb/WriteResult;

    invoke-virtual {p2}, Lcom/mongodb/WriteResult;->getLastConcern()Lcom/mongodb/WriteConcern;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    move-object p2, v3

    goto :goto_0
.end method

.method execute()Lcom/mongodb/BulkWriteResult;
    .locals 3

    .prologue
    .line 852
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v0, v0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v1}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->port:Lcom/mongodb/DBPort;

    invoke-static {v0, v1, v2}, Lcom/mongodb/DBCollectionImpl;->access$1700(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 853
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->executeWriteCommandProtocol()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    .line 855
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->executeWriteProtocol()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    goto :goto_0
.end method

.method abstract executeWriteCommandProtocol()Lcom/mongodb/BulkWriteResult;
.end method

.method abstract executeWriteProtocol(I)Lcom/mongodb/WriteResult;
.end method

.method getResult(Lcom/mongodb/WriteResult;)Lcom/mongodb/BulkWriteResult;
    .locals 6
    .param p1, "writeResult"    # Lcom/mongodb/WriteResult;

    .prologue
    .line 845
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getCount(Lcom/mongodb/WriteResult;)I

    move-result v0

    .line 846
    .local v0, "count":I
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getUpsertedItems(Lcom/mongodb/WriteResult;)Ljava/util/List;

    move-result-object v2

    .line 847
    .local v2, "upsertedItems":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    sget-object v4, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-eq v3, v4, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    sget-object v4, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-ne v3, v4, :cond_1

    :cond_0
    const/4 v1, 0x0

    .line 848
    .local v1, "modifiedCount":Ljava/lang/Integer;
    :goto_0
    new-instance v3, Lcom/mongodb/AcknowledgedBulkWriteResult;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    sub-int v5, v0, v5

    invoke-direct {v3, v4, v5, v1, v2}, Lcom/mongodb/AcknowledgedBulkWriteResult;-><init>(Lcom/mongodb/WriteRequest$Type;ILjava/lang/Integer;Ljava/util/List;)V

    return-object v3

    .line 847
    .end local v1    # "modifiedCount":Ljava/lang/Integer;
    :cond_1
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method abstract getType()Lcom/mongodb/WriteRequest$Type;
.end method

.method getUpsertedItems(Lcom/mongodb/WriteResult;)Ljava/util/List;
    .locals 4
    .param p1, "writeResult"    # Lcom/mongodb/WriteResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/WriteResult;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 890
    invoke-virtual {p1}, Lcom/mongodb/WriteResult;->getUpsertedId()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mongodb/BulkWriteUpsert;

    new-instance v1, Lcom/mongodb/BulkWriteUpsert;

    invoke-virtual {p1}, Lcom/mongodb/WriteResult;->getUpsertedId()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lcom/mongodb/BulkWriteUpsert;-><init>(ILjava/lang/Object;)V

    aput-object v1, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method
