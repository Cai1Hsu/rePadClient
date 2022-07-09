.class public Lcom/mongodb/BulkWriteOperation;
.super Ljava/lang/Object;
.source "BulkWriteOperation.java"


# instance fields
.field private closed:Z

.field private final collection:Lcom/mongodb/DBCollection;

.field private final ordered:Z

.field private final requests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(ZLcom/mongodb/DBCollection;)V
    .locals 1
    .param p1, "ordered"    # Z
    .param p2, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/BulkWriteOperation;->requests:Ljava/util/List;

    .line 40
    iput-boolean p1, p0, Lcom/mongodb/BulkWriteOperation;->ordered:Z

    .line 41
    iput-object p2, p0, Lcom/mongodb/BulkWriteOperation;->collection:Lcom/mongodb/DBCollection;

    .line 42
    return-void
.end method


# virtual methods
.method addRequest(Lcom/mongodb/WriteRequest;)V
    .locals 2
    .param p1, "request"    # Lcom/mongodb/WriteRequest;

    .prologue
    .line 111
    const-string/jumbo v1, "already executed"

    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 112
    iget-object v0, p0, Lcom/mongodb/BulkWriteOperation;->requests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    return-void

    .line 111
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public execute()Lcom/mongodb/BulkWriteResult;
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 87
    const-string/jumbo v2, "already executed"

    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 89
    iput-boolean v1, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    .line 90
    iget-object v0, p0, Lcom/mongodb/BulkWriteOperation;->collection:Lcom/mongodb/DBCollection;

    iget-boolean v1, p0, Lcom/mongodb/BulkWriteOperation;->ordered:Z

    iget-object v2, p0, Lcom/mongodb/BulkWriteOperation;->requests:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/DBCollection;->executeBulkWriteOperation(ZLjava/util/List;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0

    .line 87
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public execute(Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;
    .locals 3
    .param p1, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    const/4 v1, 0x1

    .line 104
    const-string/jumbo v2, "already executed"

    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 106
    iput-boolean v1, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    .line 107
    iget-object v0, p0, Lcom/mongodb/BulkWriteOperation;->collection:Lcom/mongodb/DBCollection;

    iget-boolean v1, p0, Lcom/mongodb/BulkWriteOperation;->ordered:Z

    iget-object v2, p0, Lcom/mongodb/BulkWriteOperation;->requests:Ljava/util/List;

    invoke-virtual {v0, v1, v2, p1}, Lcom/mongodb/DBCollection;->executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0

    .line 104
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public find(Lcom/mongodb/DBObject;)Lcom/mongodb/BulkWriteRequestBuilder;
    .locals 2
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 74
    const-string/jumbo v1, "already executed"

    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 75
    new-instance v0, Lcom/mongodb/BulkWriteRequestBuilder;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/BulkWriteRequestBuilder;-><init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;)V

    return-object v0

    .line 74
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public insert(Lcom/mongodb/DBObject;)V
    .locals 2
    .param p1, "document"    # Lcom/mongodb/DBObject;

    .prologue
    .line 62
    const-string/jumbo v1, "already executed"

    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 63
    new-instance v0, Lcom/mongodb/InsertRequest;

    invoke-direct {v0, p1}, Lcom/mongodb/InsertRequest;-><init>(Lcom/mongodb/DBObject;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 64
    return-void

    .line 62
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOrdered()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/mongodb/BulkWriteOperation;->ordered:Z

    return v0
.end method
