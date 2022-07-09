.class Lcom/mongodb/DBCollectionImpl;
.super Lcom/mongodb/DBCollection;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBCollectionImpl$Run;,
        Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;,
        Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;
    }
.end annotation


# static fields
.field private static final QUERY_DOCUMENT_HEADROOM:I = 0x4000

.field private static final TRACE_LEVEL:Ljava/util/logging/Level;

.field private static final TRACE_LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final db:Lcom/mongodb/DBApiLayer;

.field private final namespace:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 545
    const-string/jumbo v0, "com.mongodb.TRACE"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    .line 546
    const-string/jumbo v0, "DB.TRACE"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    :goto_0
    sput-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    return-void

    :cond_0
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    goto :goto_0
.end method

.method constructor <init>(Lcom/mongodb/DBApiLayer;Ljava/lang/String;)V
    .locals 2
    .param p1, "db"    # Lcom/mongodb/DBApiLayer;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollection;-><init>(Lcom/mongodb/DB;Ljava/lang/String;)V

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/mongodb/DBApiLayer;->_root:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    .line 60
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/DBApiLayer;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/DBCollectionImpl;->updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/DBCollectionImpl;->removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;
    .param p5, "x5"    # Z

    .prologue
    .line 48
    invoke-direct/range {p0 .. p5}, Lcom/mongodb/DBCollectionImpl;->insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/WriteConcern;
    .param p2, "x2"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->getMaxWriteBatchSize(Lcom/mongodb/DBPort;)I

    move-result v0

    return v0
.end method

.method private addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V
    .locals 5
    .param p1, "bulkWriteResult"    # Lcom/mongodb/BulkWriteResult;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 319
    const-string/jumbo v0, "ok"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_1

    .line 321
    const-string/jumbo v0, "n"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    :cond_0
    :goto_0
    return-void

    .line 322
    :cond_1
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_2

    .line 323
    const-string/jumbo v0, "n"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getRemovedCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 324
    :cond_2
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-eq p2, v0, :cond_3

    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_0

    .line 325
    :cond_3
    const-string/jumbo v0, "n"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getMatchedCount()I

    move-result v1

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getMatchedCount()I

    move-result v0

    if-lez v0, :cond_4

    .line 327
    const-string/jumbo v0, "updatedExisting"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    :goto_1
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 332
    const-string/jumbo v1, "upserted"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BulkWriteUpsert;

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteUpsert;->getId()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p3, v1, v0}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 329
    :cond_4
    const-string/jumbo v0, "updatedExisting"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private applyRulesForInsert(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const/4 v4, 0x0

    .line 391
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/DBObject;

    .line 392
    .local v2, "o":Lcom/mongodb/DBObject;
    invoke-virtual {p0, v2, v4, v4}, Lcom/mongodb/DBCollectionImpl;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 393
    invoke-virtual {p0, v2}, Lcom/mongodb/DBCollectionImpl;->apply(Lcom/mongodb/DBObject;)Ljava/lang/Object;

    .line 394
    const-string/jumbo v3, "_id"

    invoke-interface {v2, v3}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 395
    .local v1, "id":Ljava/lang/Object;
    instance-of v3, v1, Lorg/bson/types/ObjectId;

    if-eqz v3, :cond_0

    .line 396
    check-cast v1, Lorg/bson/types/ObjectId;

    .end local v1    # "id":Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/bson/types/ObjectId;->notNew()V

    goto :goto_0

    .line 399
    .end local v2    # "o":Lcom/mongodb/DBObject;
    :cond_1
    return-void
.end method

.method private getLogger()Ljava/util/logging/Logger;
    .locals 1

    .prologue
    .line 557
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private getMaxWriteBatchSize(Lcom/mongodb/DBPort;)I
    .locals 2
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 462
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxWriteBatchSize()I

    move-result v0

    return v0
.end method

.method private getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;
    .locals 3
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 453
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    .line 454
    .local v0, "serverDescription":Lcom/mongodb/ServerDescription;
    invoke-static {}, Lcom/mongodb/MessageSettings;->builder()Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxDocumentSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxDocumentSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxMessageSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxMessageSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxWriteBatchSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxWriteBatchSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings$Builder;->build()Lcom/mongodb/MessageSettings;

    move-result-object v1

    return-object v1
.end method

.method private getNamespace()Lcom/mongodb/MongoNamespace;
    .locals 3

    .prologue
    .line 466
    new-instance v0, Lcom/mongodb/MongoNamespace;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MongoNamespace;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private getRunGenerator(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Ljava/lang/Iterable;
    .locals 6
    .param p1, "ordered"    # Z
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p5, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBCollectionImpl$Run;",
            ">;"
        }
    .end annotation

    .prologue
    .line 538
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    if-eqz p1, :cond_0

    .line 539
    new-instance v0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;-><init>(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)V

    .line 541
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;-><init>(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)V

    goto :goto_0
.end method

.method private insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;
    .locals 7
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .param p5, "shouldApply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            "Z)",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 380
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz p5, :cond_0

    .line 381
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->applyRulesForInsert(Ljava/util/List;)V

    .line 384
    :cond_0
    new-instance v0, Lcom/mongodb/InsertCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/InsertCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 387
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    .locals 7
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .param p5, "shouldApply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            "Z)",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 507
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz p5, :cond_0

    .line 508
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->applyRulesForInsert(Ljava/util/List;)V

    .line 511
    :cond_0
    const/4 v1, 0x0

    .line 513
    .local v1, "last":Lcom/mongodb/WriteResult;
    const/4 v0, 0x0

    .line 514
    .local v0, "cur":I
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    iget-object v5, v5, Lcom/mongodb/DBApiLayer;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v5}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v2

    .line 515
    .local v2, "maxsize":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_3

    .line 517
    invoke-static {p0, p3, p2}, Lcom/mongodb/OutMessage;->insert(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/WriteConcern;)Lcom/mongodb/OutMessage;

    move-result-object v4

    .line 519
    .local v4, "om":Lcom/mongodb/OutMessage;
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_1

    .line 520
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/DBObject;

    .line 521
    .local v3, "o":Lcom/mongodb/DBObject;
    invoke-virtual {v4, v3}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 524
    invoke-virtual {v4}, Lcom/mongodb/OutMessage;->size()I

    move-result v5

    mul-int/lit8 v6, v2, 0x2

    if-le v5, v6, :cond_2

    .line 525
    add-int/lit8 v0, v0, 0x1

    .line 530
    .end local v3    # "o":Lcom/mongodb/DBObject;
    :cond_1
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    iget-object v6, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {v5, v6, v4, p2, p4}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;

    move-result-object v1

    .line 531
    goto :goto_0

    .line 519
    .restart local v3    # "o":Lcom/mongodb/DBObject;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 533
    .end local v3    # "o":Lcom/mongodb/DBObject;
    .end local v4    # "om":Lcom/mongodb/OutMessage;
    :cond_3
    return-object v1
.end method

.method private receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;
    .locals 3
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 491
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v1

    new-instance v2, Lcom/mongodb/DBCollectionImpl$3;

    invoke-direct {v2, p0, p1}, Lcom/mongodb/DBCollectionImpl$3;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)V

    invoke-virtual {v0, v1, p1, v2}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method private removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 7
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 404
    .local p1, "removeList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/RemoveRequest;>;"
    new-instance v0, Lcom/mongodb/DeleteCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/DeleteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 407
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;
    .locals 7
    .param p1, "message"    # Lcom/mongodb/BaseWriteCommandMessage;
    .param p2, "batchNum"    # I
    .param p3, "port"    # Lcom/mongodb/DBPort;

    .prologue
    const/4 v2, 0x1

    .line 471
    new-instance v0, Lorg/bson/io/PoolOutputBuffer;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer;-><init>()V

    .line 473
    .local v0, "buffer":Lorg/bson/io/PoolOutputBuffer;
    :try_start_0
    invoke-virtual {p1, v0}, Lcom/mongodb/BaseWriteCommandMessage;->encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v1

    .line 474
    .local v1, "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    if-nez v1, :cond_0

    if-le p2, v2, :cond_1

    .line 475
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getLogger()Ljava/util/logging/Logger;

    move-result-object v2

    const-string/jumbo v3, "Sending batch %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 477
    :cond_1
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v3

    new-instance v4, Lcom/mongodb/DBCollectionImpl$2;

    invoke-direct {v4, p0, v0, p3}, Lcom/mongodb/DBCollectionImpl$2;-><init>(Lcom/mongodb/DBCollectionImpl;Lorg/bson/io/PoolOutputBuffer;Lcom/mongodb/DBPort;)V

    invoke-virtual {v2, v3, p3, v4}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 486
    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    return-object v1

    .end local v1    # "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    throw v2
.end method

.method private trace(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 553
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 554
    return-void
.end method

.method private translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;
    .locals 4
    .param p1, "e"    # Lcom/mongodb/BulkWriteException;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;

    .prologue
    .line 299
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v1, 0x0

    .line 300
    .local v1, "lastError":Lcom/mongodb/BulkWriteError;
    :goto_0
    new-instance v0, Lcom/mongodb/CommandResult;

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 301
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    invoke-direct {p0, v2, p2, v0}, Lcom/mongodb/DBCollectionImpl;->addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V

    .line 302
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 303
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/WriteConcernError;->getDetails()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 306
    :cond_0
    if-eqz v1, :cond_3

    .line 307
    const-string/jumbo v2, "err"

    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string/jumbo v2, "code"

    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getDetails()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 314
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->getException()Lcom/mongodb/MongoException;

    move-result-object v2

    return-object v2

    .line 299
    .end local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v1    # "lastError":Lcom/mongodb/BulkWriteError;
    :cond_2
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/BulkWriteError;

    move-object v1, v2

    goto :goto_0

    .line 310
    .restart local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v1    # "lastError":Lcom/mongodb/BulkWriteError;
    :cond_3
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 311
    const-string/jumbo v2, "err"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/WriteConcernError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const-string/jumbo v2, "code"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/WriteConcernError;->getCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    .locals 2
    .param p1, "bulkWriteResult"    # Lcom/mongodb/BulkWriteResult;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 293
    new-instance v0, Lcom/mongodb/CommandResult;

    invoke-direct {v0, p4}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 294
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/DBCollectionImpl;->addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V

    .line 295
    new-instance v1, Lcom/mongodb/WriteResult;

    invoke-direct {v1, v0, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    return-object v1
.end method

.method private updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 7
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 414
    .local p1, "updates":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ModifyRequest;>;"
    new-instance v0, Lcom/mongodb/UpdateCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/UpdateCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 417
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    .locals 4
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .param p2, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 448
    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getVersion()Lcom/mongodb/ServerVersion;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ServerVersion;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ServerVersion;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerVersion;->compareTo(Lcom/mongodb/ServerVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private willTrace()Z
    .locals 2

    .prologue
    .line 549
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method private writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;
    .locals 13
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "message"    # Lcom/mongodb/BaseWriteCommandMessage;
    .param p4, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 422
    const/4 v1, 0x0

    .line 423
    .local v1, "batchNum":I
    const/4 v4, 0x0

    .line 424
    .local v4, "currentRangeStartIndex":I
    new-instance v2, Lcom/mongodb/BulkWriteBatchCombiner;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v8

    move-object/from16 v0, p4

    invoke-direct {v2, v8, v0}, Lcom/mongodb/BulkWriteBatchCombiner;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V

    .line 426
    .local v2, "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 427
    move-object/from16 v0, p3

    invoke-direct {p0, v0, v1, p1}, Lcom/mongodb/DBCollectionImpl;->sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v7

    .line 428
    .local v7, "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    if-eqz v7, :cond_5

    invoke-virtual/range {p3 .. p3}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v8

    invoke-virtual {v7}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v9

    sub-int v6, v8, v9

    .line 429
    .local v6, "itemCount":I
    :goto_0
    invoke-static {v4, v6}, Lcom/mongodb/IndexMap;->create(II)Lcom/mongodb/IndexMap;

    move-result-object v5

    .line 430
    .local v5, "indexMap":Lcom/mongodb/IndexMap;
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;

    move-result-object v3

    .line 431
    .local v3, "commandResult":Lcom/mongodb/CommandResult;
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v8

    if-eqz v8, :cond_1

    if-nez v7, :cond_2

    :cond_1
    const/4 v8, 0x1

    if-le v1, v8, :cond_3

    .line 432
    :cond_2
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getLogger()Ljava/util/logging/Logger;

    move-result-object v8

    const-string/jumbo v9, "Received response for batch %d"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 435
    :cond_3
    invoke-static {v3}, Lcom/mongodb/WriteCommandResultHelper;->hasError(Lcom/mongodb/CommandResult;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 436
    invoke-static {p2, v3}, Lcom/mongodb/WriteCommandResultHelper;->getBulkWriteException(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteException;

    move-result-object v8

    invoke-virtual {v2, v8, v5}, Lcom/mongodb/BulkWriteBatchCombiner;->addErrorResult(Lcom/mongodb/BulkWriteException;Lcom/mongodb/IndexMap;)V

    .line 440
    :goto_1
    add-int/2addr v4, v6

    .line 441
    move-object/from16 p3, v7

    .line 442
    if-eqz p3, :cond_4

    invoke-virtual {v2}, Lcom/mongodb/BulkWriteBatchCombiner;->shouldStopSendingMoreBatches()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 444
    :cond_4
    invoke-virtual {v2}, Lcom/mongodb/BulkWriteBatchCombiner;->getResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v8

    return-object v8

    .line 428
    .end local v3    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v5    # "indexMap":Lcom/mongodb/IndexMap;
    .end local v6    # "itemCount":I
    :cond_5
    invoke-virtual/range {p3 .. p3}, Lcom/mongodb/BaseWriteCommandMessage;->getItemCount()I

    move-result v6

    goto :goto_0

    .line 438
    .restart local v3    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v5    # "indexMap":Lcom/mongodb/IndexMap;
    .restart local v6    # "itemCount":I
    :cond_6
    invoke-static {p2, v3}, Lcom/mongodb/WriteCommandResultHelper;->getBulkWriteResult(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)Lcom/mongodb/BulkWriteResult;

    move-result-object v8

    invoke-virtual {v2, v8, v5}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V

    goto :goto_1
.end method


# virtual methods
.method public aggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;Lcom/mongodb/ReadPreference;)Lcom/mongodb/Cursor;
    .locals 12
    .param p2, "options"    # Lcom/mongodb/AggregationOptions;
    .param p3, "readPreference"    # Lcom/mongodb/ReadPreference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            "Lcom/mongodb/ReadPreference;",
            ")",
            "Lcom/mongodb/Cursor;"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-nez p2, :cond_0

    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "options can not be null"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBObject;

    .line 97
    .local v10, "last":Lcom/mongodb/DBObject;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl;->prepareCommand(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/DBObject;

    move-result-object v9

    .line 99
    .local v9, "command":Lcom/mongodb/DBObject;
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getOptions()I

    move-result v2

    invoke-virtual {v0, v9, v2, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 100
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 102
    const-string/jumbo v0, "$out"

    invoke-interface {v10, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 103
    .local v11, "outCollection":Ljava/lang/String;
    if-eqz v11, :cond_1

    .line 104
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {v0, v11}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v8

    .line 105
    .local v8, "collection":Lcom/mongodb/DBCollection;
    new-instance v0, Lcom/mongodb/DBCursor;

    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v3, 0x0

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v4

    invoke-direct {v0, v8, v2, v3, v4}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    .line 108
    .end local v8    # "collection":Lcom/mongodb/DBCollection;
    :goto_0
    return-object v0

    .line 107
    :cond_1
    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getBatchSize()Ljava/lang/Integer;

    move-result-object v7

    .line 108
    .local v7, "batchSize":Ljava/lang/Integer;
    new-instance v0, Lcom/mongodb/QueryResultIterator;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    if-nez v7, :cond_2

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v6

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;ILcom/mongodb/DBDecoder;Lcom/mongodb/ServerAddress;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_1
.end method

.method public createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)V
    .locals 12
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # Lcom/mongodb/DBObject;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 338
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v7

    .line 339
    .local v7, "connector":Lcom/mongodb/DBTCPConnector;
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v4

    .line 342
    .local v4, "port":Lcom/mongodb/DBPort;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollectionImpl;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v10

    .line 343
    .local v10, "index":Lcom/mongodb/DBObject;
    invoke-interface {v10, p2}, Lcom/mongodb/DBObject;->putAll(Lorg/bson/BSONObject;)V

    .line 344
    const-string/jumbo v0, "key"

    invoke-interface {v10, v0, p1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    invoke-virtual {v4}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getVersion()Lcom/mongodb/ServerVersion;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ServerVersion;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ServerVersion;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerVersion;->compareTo(Lcom/mongodb/ServerVersion;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 347
    new-instance v8, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v0, "createIndexes"

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 349
    .local v8, "createIndexes":Lcom/mongodb/BasicDBObject;
    new-instance v11, Lcom/mongodb/BasicDBList;

    invoke-direct {v11}, Lcom/mongodb/BasicDBList;-><init>()V

    .line 350
    .local v11, "list":Lcom/mongodb/BasicDBList;
    invoke-virtual {v11, v10}, Lcom/mongodb/BasicDBList;->add(Ljava/lang/Object;)Z

    .line 351
    const-string/jumbo v0, "indexes"

    invoke-virtual {v8, v0, v11}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    new-instance v1, Lcom/mongodb/DBCollectionImpl$1;

    invoke-direct {v1, p0, v4, v8}, Lcom/mongodb/DBCollectionImpl$1;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;Lcom/mongodb/BasicDBObject;)V

    invoke-virtual {v7, v0, v4, v1}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mongodb/CommandResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    .local v6, "commandResult":Lcom/mongodb/CommandResult;
    :try_start_1
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_1
    .catch Lcom/mongodb/CommandFailureException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 373
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :goto_0
    invoke-virtual {v7, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    .line 375
    return-void

    .line 361
    .restart local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .restart local v11    # "list":Lcom/mongodb/BasicDBList;
    :catch_0
    move-exception v9

    .line 362
    .local v9, "e":Lcom/mongodb/CommandFailureException;
    :try_start_2
    invoke-virtual {v9}, Lcom/mongodb/CommandFailureException;->getCode()I

    move-result v0

    const/16 v1, 0x2af8

    if-ne v0, v1, :cond_0

    .line 363
    new-instance v0, Lcom/mongodb/MongoException$DuplicateKey;

    invoke-direct {v0, v6}, Lcom/mongodb/MongoException$DuplicateKey;-><init>(Lcom/mongodb/CommandResult;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 373
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v9    # "e":Lcom/mongodb/CommandFailureException;
    .end local v10    # "index":Lcom/mongodb/DBObject;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :catchall_0
    move-exception v0

    invoke-virtual {v7, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0

    .line 365
    .restart local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .restart local v9    # "e":Lcom/mongodb/CommandFailureException;
    .restart local v10    # "index":Lcom/mongodb/DBObject;
    .restart local v11    # "list":Lcom/mongodb/BasicDBList;
    :cond_0
    :try_start_3
    throw v9

    .line 369
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v9    # "e":Lcom/mongodb/CommandFailureException;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :cond_1
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    const-string/jumbo v1, "system.indexes"

    invoke-virtual {v0, v1}, Lcom/mongodb/DBApiLayer;->doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollectionImpl;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/DBObject;

    const/4 v2, 0x0

    aput-object v10, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/mongodb/WriteConcern;->SAFE:Lcom/mongodb/WriteConcern;

    sget-object v3, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v3}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v3

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public doapply(Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 289
    return-void
.end method

.method public drop()V
    .locals 2

    .prologue
    .line 284
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    iget-object v0, v0, Lcom/mongodb/DBApiLayer;->_collections:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    invoke-super {p0}, Lcom/mongodb/DBCollection;->drop()V

    .line 286
    return-void
.end method

.method executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/BulkWriteResult;
    .locals 11
    .param p1, "ordered"    # Z
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 132
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    const-string/jumbo v1, "no operations"

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 134
    if-nez p3, :cond_1

    .line 135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Write concern can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 138
    :cond_1
    if-nez p4, :cond_2

    .line 139
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 142
    :cond_2
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v5

    .line 144
    .local v5, "port":Lcom/mongodb/DBPort;
    :try_start_0
    new-instance v6, Lcom/mongodb/BulkWriteBatchCombiner;

    invoke-virtual {v5}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {v6, v0, p3}, Lcom/mongodb/BulkWriteBatchCombiner;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V

    .local v6, "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 145
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->getRunGenerator(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBCollectionImpl$Run;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    .local v10, "run":Lcom/mongodb/DBCollectionImpl$Run;
    :try_start_1
    invoke-virtual {v10, v5}, Lcom/mongodb/DBCollectionImpl$Run;->execute(Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v9

    .line 148
    .local v9, "result":Lcom/mongodb/BulkWriteResult;
    invoke-virtual {v9}, Lcom/mongodb/BulkWriteResult;->isAcknowledged()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 149
    invoke-static {v10}, Lcom/mongodb/DBCollectionImpl$Run;->access$000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/IndexMap;

    move-result-object v0

    invoke-virtual {v6, v9, v0}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V
    :try_end_1
    .catch Lcom/mongodb/BulkWriteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 151
    .end local v9    # "result":Lcom/mongodb/BulkWriteResult;
    :catch_0
    move-exception v7

    .line 152
    .local v7, "e":Lcom/mongodb/BulkWriteException;
    :try_start_2
    invoke-static {v10}, Lcom/mongodb/DBCollectionImpl$Run;->access$000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/IndexMap;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Lcom/mongodb/BulkWriteBatchCombiner;->addErrorResult(Lcom/mongodb/BulkWriteException;Lcom/mongodb/IndexMap;)V

    .line 153
    invoke-virtual {v6}, Lcom/mongodb/BulkWriteBatchCombiner;->shouldStopSendingMoreBatches()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    .end local v7    # "e":Lcom/mongodb/BulkWriteException;
    .end local v10    # "run":Lcom/mongodb/DBCollectionImpl$Run;
    :cond_4
    invoke-virtual {v6}, Lcom/mongodb/BulkWriteBatchCombiner;->getResult()Lcom/mongodb/BulkWriteResult;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 160
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    return-object v0

    .end local v6    # "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    .end local v8    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0
.end method

.method find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;
    .locals 10
    .param p1, "ref"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .param p5, "limit"    # I
    .param p6, "options"    # I
    .param p7, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p8, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 66
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v9

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-virtual/range {v0 .. v9}, Lcom/mongodb/DBCollectionImpl;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v0

    return-object v0
.end method

.method find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;
    .locals 14
    .param p1, "ref"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .param p5, "limit"    # I
    .param p6, "options"    # I
    .param p7, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p8, "decoder"    # Lcom/mongodb/DBDecoder;
    .param p9, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 73
    if-nez p1, :cond_0

    .line 74
    new-instance p1, Lcom/mongodb/BasicDBObject;

    .end local p1    # "ref":Lcom/mongodb/DBObject;
    invoke-direct {p1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 77
    .restart local p1    # "ref":Lcom/mongodb/DBObject;
    :cond_0
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "find: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 81
    :cond_1
    const/4 v2, 0x0

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v2}, Lcom/mongodb/QueryResultIterator;->chooseBatchSize(III)I

    move-result v5

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v2

    add-int/lit16 v10, v2, 0x4000

    move-object v2, p0

    move/from16 v3, p6

    move/from16 v4, p3

    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p7

    move-object/from16 v9, p9

    invoke-static/range {v2 .. v10}, Lcom/mongodb/OutMessage;->query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;I)Lcom/mongodb/OutMessage;

    move-result-object v5

    .line 84
    .local v5, "query":Lcom/mongodb/OutMessage;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    const/4 v6, 0x0

    const/4 v7, 0x2

    move-object v4, p0

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v2 .. v9}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v9

    .line 86
    .local v9, "res":Lcom/mongodb/Response;
    new-instance v6, Lcom/mongodb/QueryResultIterator;

    iget-object v7, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    move-object v8, p0

    move/from16 v10, p4

    move/from16 v11, p5

    move/from16 v12, p6

    move-object/from16 v13, p8

    invoke-direct/range {v6 .. v13}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/Response;IIILcom/mongodb/DBDecoder;)V

    return-object v6
.end method

.method public insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/mongodb/DBCollectionImpl;->insert(Ljava/util/List;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method protected insert(Ljava/util/List;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 9
    .param p2, "shouldApply"    # Z
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;Z",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-nez p3, :cond_0

    .line 170
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Write concern can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_0
    if-nez p4, :cond_1

    .line 174
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 176
    :cond_1
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 177
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mongodb/DBObject;

    .line 178
    .local v8, "o":Lcom/mongodb/DBObject;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "save:  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v8}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    goto :goto_0

    .line 182
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "o":Lcom/mongodb/DBObject;
    :cond_2
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v4

    .line 184
    .local v4, "port":Lcom/mongodb/DBPort;
    :try_start_0
    invoke-direct {p0, p3, v4}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move v5, p2

    .line 186
    :try_start_1
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v4}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_1
    .catch Lcom/mongodb/BulkWriteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 196
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    :goto_1
    return-object v0

    .line 188
    :catch_0
    move-exception v6

    .line 189
    .local v6, "e":Lcom/mongodb/BulkWriteException;
    :try_start_2
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, v6, v0}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v0

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 196
    .end local v6    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0

    :cond_3
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move v5, p2

    .line 193
    :try_start_3
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v0

    .line 196
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_1
.end method

.method public parallelScan(Lcom/mongodb/ParallelScanOptions;)Ljava/util/List;
    .locals 10
    .param p1, "options"    # Lcom/mongodb/ParallelScanOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ParallelScanOptions;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v3, "parallelCollectionScan"

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "numCursors"

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getNumCursors()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v9

    .line 118
    .local v9, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v9}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 120
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v7, "cursors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/Cursor;>;"
    const-string/jumbo v0, "cursors"

    invoke-virtual {v9, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    .line 122
    .local v1, "cursorDocument":Lcom/mongodb/DBObject;
    new-instance v0, Lcom/mongodb/QueryResultIterator;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getBatchSize()I

    move-result v4

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-virtual {v9}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v6

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;ILcom/mongodb/DBDecoder;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 125
    .end local v1    # "cursorDocument":Lcom/mongodb/DBObject;
    :cond_0
    return-object v7
.end method

.method public remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 201
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/mongodb/DBCollectionImpl;->remove(Lcom/mongodb/DBObject;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lcom/mongodb/DBObject;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 5
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "multi"    # Z
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 205
    if-nez p3, :cond_0

    .line 206
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Write concern can not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 209
    :cond_0
    if-nez p4, :cond_1

    .line 210
    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 213
    :cond_1
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 214
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "remove: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 217
    :cond_2
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v1

    .line 219
    .local v1, "port":Lcom/mongodb/DBPort;
    :try_start_0
    invoke-direct {p0, p3, v1}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_3

    .line 221
    const/4 v2, 0x1

    :try_start_1
    new-array v2, v2, [Lcom/mongodb/RemoveRequest;

    const/4 v3, 0x0

    new-instance v4, Lcom/mongodb/RemoveRequest;

    invoke-direct {v4, p1, p2}, Lcom/mongodb/RemoveRequest;-><init>(Lcom/mongodb/DBObject;Z)V

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v2, p3, p4, v1}, Lcom/mongodb/DBCollectionImpl;->removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    sget-object v3, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {p0, v2, v3, p3, v4}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_1
    .catch Lcom/mongodb/BulkWriteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 233
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    :goto_0
    return-object v2

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Lcom/mongodb/BulkWriteException;
    :try_start_2
    sget-object v2, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, v0, v2}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v2

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 233
    .end local v0    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v2

    .line 230
    :cond_3
    :try_start_3
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-static {p0, p4, p1, p2}, Lcom/mongodb/OutMessage;->remove(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;Z)Lcom/mongodb/OutMessage;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p3, v1}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v2

    .line 233
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_0
.end method

.method public update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 16
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;
    .param p3, "upsert"    # Z
    .param p4, "multi"    # Z
    .param p5, "concern"    # Lcom/mongodb/WriteConcern;
    .param p6, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 241
    if-nez p2, :cond_0

    .line 242
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "update can not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 245
    :cond_0
    if-nez p5, :cond_1

    .line 246
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "Write concern can not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 249
    :cond_1
    if-nez p6, :cond_2

    .line 250
    sget-object v4, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v4}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p6

    .line 252
    :cond_2
    invoke-interface/range {p2 .. p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 254
    invoke-interface/range {p2 .. p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 255
    .local v12, "key":Ljava/lang/String;
    const-string/jumbo v4, "$"

    invoke-virtual {v12, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 256
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4, v5}, Lcom/mongodb/DBCollectionImpl;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 259
    .end local v12    # "key":Ljava/lang/String;
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 260
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "update: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p1 .. p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p2 .. p2}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 263
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v4}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v13

    .line 265
    .local v13, "port":Lcom/mongodb/DBPort;
    :try_start_0
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v13}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-eqz v4, :cond_5

    .line 267
    const/4 v4, 0x1

    :try_start_1
    new-array v4, v4, [Lcom/mongodb/ModifyRequest;

    const/4 v5, 0x0

    new-instance v6, Lcom/mongodb/UpdateRequest;

    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p2

    move/from16 v3, p4

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/mongodb/UpdateRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;Z)V

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-direct {v0, v4, v1, v2, v13}, Lcom/mongodb/DBCollectionImpl;->updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v10

    .line 270
    .local v10, "bulkWriteResult":Lcom/mongodb/BulkWriteResult;
    sget-object v4, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v13}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v10, v4, v1, v5}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_1
    .catch Lcom/mongodb/BulkWriteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 278
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    .end local v10    # "bulkWriteResult":Lcom/mongodb/BulkWriteResult;
    :goto_0
    return-object v4

    .line 271
    :catch_0
    move-exception v11

    .line 272
    .local v11, "e":Lcom/mongodb/BulkWriteException;
    :try_start_2
    sget-object v4, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v4}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v4

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 278
    .end local v11    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_0
    move-exception v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v4

    .line 275
    :cond_5
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v4}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    move-object/from16 v4, p0

    move-object/from16 v5, p6

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    invoke-static/range {v4 .. v9}, Lcom/mongodb/OutMessage;->update(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;ZZLcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/OutMessage;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-virtual {v14, v15, v4, v0, v13}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v4

    .line 278
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_0
.end method
