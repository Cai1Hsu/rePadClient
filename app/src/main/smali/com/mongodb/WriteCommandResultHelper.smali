.class final Lcom/mongodb/WriteCommandResultHelper;
.super Ljava/lang/Object;
.source "WriteCommandResultHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    return-void
.end method

.method static getBulkWriteException(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteException;
    .locals 5
    .param p0, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 39
    invoke-static {p1}, Lcom/mongodb/WriteCommandResultHelper;->hasError(Lcom/mongodb/CommandResult;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v1, "This method should not have been called"

    invoke-direct {v0, v1}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    new-instance v0, Lcom/mongodb/BulkWriteException;

    invoke-static {p0, p1}, Lcom/mongodb/WriteCommandResultHelper;->getBulkWriteResult(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    invoke-static {p1}, Lcom/mongodb/WriteCommandResultHelper;->getWriteErrors(Lcom/mongodb/CommandResult;)Ljava/util/List;

    move-result-object v2

    invoke-static {p1}, Lcom/mongodb/WriteCommandResultHelper;->getWriteConcernError(Lcom/mongodb/CommandResult;)Lcom/mongodb/WriteConcernError;

    move-result-object v3

    invoke-virtual {p1}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mongodb/BulkWriteException;-><init>(Lcom/mongodb/BulkWriteResult;Ljava/util/List;Lcom/mongodb/WriteConcernError;Lcom/mongodb/ServerAddress;)V

    return-object v0
.end method

.method static getBulkWriteResult(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteResult;
    .locals 5
    .param p0, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 33
    invoke-static {p1}, Lcom/mongodb/WriteCommandResultHelper;->getCount(Lcom/mongodb/CommandResult;)I

    move-result v0

    .line 34
    .local v0, "count":I
    invoke-static {p1}, Lcom/mongodb/WriteCommandResultHelper;->getUpsertedItems(Lcom/mongodb/CommandResult;)Ljava/util/List;

    move-result-object v1

    .line 35
    .local v1, "upsertedItems":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    new-instance v2, Lcom/mongodb/AcknowledgedBulkWriteResult;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    sub-int v3, v0, v3

    invoke-static {p0, p1}, Lcom/mongodb/WriteCommandResultHelper;->getModifiedCount(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lcom/mongodb/AcknowledgedBulkWriteResult;-><init>(Lcom/mongodb/WriteRequest$Type;ILjava/lang/Integer;Ljava/util/List;)V

    return-object v2
.end method

.method private static getCount(Lcom/mongodb/CommandResult;)I
    .locals 1
    .param p0, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 87
    const-string/jumbo v0, "n"

    invoke-virtual {p0, v0}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private static getErrInfo(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 2
    .param p0, "response"    # Lcom/mongodb/DBObject;

    .prologue
    .line 99
    const-string/jumbo v1, "errInfo"

    invoke-interface {p0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    .line 100
    .local v0, "errInfo":Lcom/mongodb/DBObject;
    if-eqz v0, :cond_0

    .end local v0    # "errInfo":Lcom/mongodb/DBObject;
    :goto_0
    return-object v0

    .restart local v0    # "errInfo":Lcom/mongodb/DBObject;
    :cond_0
    new-instance v0, Lcom/mongodb/BasicDBObject;

    .end local v0    # "errInfo":Lcom/mongodb/DBObject;
    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    goto :goto_0
.end method

.method private static getModifiedCount(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Ljava/lang/Integer;
    .locals 2
    .param p0, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 91
    const-string/jumbo v1, "nModified"

    invoke-virtual {p1, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 92
    .local v0, "modifiedCount":Ljava/lang/Integer;
    if-nez v0, :cond_0

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-eq p0, v1, :cond_0

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-eq p0, v1, :cond_0

    .line 93
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 95
    :cond_0
    return-object v0
.end method

.method private static getUpsertedItems(Lcom/mongodb/CommandResult;)Ljava/util/List;
    .locals 7
    .param p0, "commandResult"    # Lcom/mongodb/CommandResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/CommandResult;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    const-string/jumbo v4, "upserted"

    invoke-virtual {p0, v4}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 74
    .local v3, "upsertedValue":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-nez v3, :cond_1

    .line 75
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 82
    :cond_0
    return-object v0

    .line 77
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v0, "bulkWriteUpsertList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteUpsert;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/DBObject;

    .line 79
    .local v2, "upsertedItem":Lcom/mongodb/DBObject;
    new-instance v5, Lcom/mongodb/BulkWriteUpsert;

    const-string/jumbo v4, "index"

    invoke-interface {v2, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    const-string/jumbo v6, "_id"

    invoke-interface {v2, v6}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lcom/mongodb/BulkWriteUpsert;-><init>(ILjava/lang/Object;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static getWriteConcernError(Lcom/mongodb/CommandResult;)Lcom/mongodb/WriteConcernError;
    .locals 5
    .param p0, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 60
    const-string/jumbo v1, "writeConcernError"

    invoke-virtual {p0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    .line 61
    .local v0, "writeConcernErrorDocument":Lcom/mongodb/DBObject;
    if-nez v0, :cond_0

    .line 62
    const/4 v1, 0x0

    .line 65
    :goto_0
    return-object v1

    :cond_0
    new-instance v2, Lcom/mongodb/WriteConcernError;

    const-string/jumbo v1, "code"

    invoke-interface {v0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string/jumbo v1, "errmsg"

    invoke-interface {v0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v0}, Lcom/mongodb/WriteCommandResultHelper;->getErrInfo(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcom/mongodb/WriteConcernError;-><init>(ILjava/lang/String;Lcom/mongodb/DBObject;)V

    move-object v1, v2

    goto :goto_0
.end method

.method private static getWriteErrors(Lcom/mongodb/CommandResult;)Ljava/util/List;
    .locals 9
    .param p0, "commandResult"    # Lcom/mongodb/CommandResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/CommandResult;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v2, "writeErrors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteError;>;"
    const-string/jumbo v4, "writeErrors"

    invoke-virtual {p0, v4}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 50
    .local v3, "writeErrorsDocuments":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz v3, :cond_0

    .line 51
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    .line 52
    .local v0, "cur":Lcom/mongodb/DBObject;
    new-instance v6, Lcom/mongodb/BulkWriteError;

    const-string/jumbo v4, "code"

    invoke-interface {v0, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const-string/jumbo v4, "errmsg"

    invoke-interface {v0, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v0}, Lcom/mongodb/WriteCommandResultHelper;->getErrInfo(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v8

    const-string/jumbo v5, "index"

    invoke-interface {v0, v5}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-direct {v6, v7, v4, v8, v5}, Lcom/mongodb/BulkWriteError;-><init>(ILjava/lang/String;Lcom/mongodb/DBObject;I)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 56
    .end local v0    # "cur":Lcom/mongodb/DBObject;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object v2
.end method

.method static hasError(Lcom/mongodb/CommandResult;)Z
    .locals 1
    .param p0, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 29
    const-string/jumbo v0, "writeErrors"

    invoke-virtual {p0, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "writeConcernError"

    invoke-virtual {p0, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
