.class public Lcom/mongodb/BulkWriteRequestBuilder;
.super Ljava/lang/Object;
.source "BulkWriteRequestBuilder.java"


# instance fields
.field private final bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

.field private final query:Lcom/mongodb/DBObject;


# direct methods
.method constructor <init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "bulkWriteOperation"    # Lcom/mongodb/BulkWriteOperation;
    .param p2, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    .line 30
    iput-object p2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    .line 31
    return-void
.end method


# virtual methods
.method public remove()V
    .locals 4

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    new-instance v1, Lcom/mongodb/RemoveRequest;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/mongodb/RemoveRequest;-><init>(Lcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, v1}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 38
    return-void
.end method

.method public removeOne()V
    .locals 4

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    new-instance v1, Lcom/mongodb/RemoveRequest;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/mongodb/RemoveRequest;-><init>(Lcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, v1}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 45
    return-void
.end method

.method public replaceOne(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "document"    # Lcom/mongodb/DBObject;

    .prologue
    .line 54
    new-instance v0, Lcom/mongodb/BulkUpdateRequestBuilder;

    iget-object v1, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BulkUpdateRequestBuilder;-><init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, p1}, Lcom/mongodb/BulkUpdateRequestBuilder;->replaceOne(Lcom/mongodb/DBObject;)V

    .line 55
    return-void
.end method

.method public update(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "update"    # Lcom/mongodb/DBObject;

    .prologue
    .line 63
    new-instance v0, Lcom/mongodb/BulkUpdateRequestBuilder;

    iget-object v1, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BulkUpdateRequestBuilder;-><init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, p1}, Lcom/mongodb/BulkUpdateRequestBuilder;->update(Lcom/mongodb/DBObject;)V

    .line 64
    return-void
.end method

.method public updateOne(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "update"    # Lcom/mongodb/DBObject;

    .prologue
    .line 72
    new-instance v0, Lcom/mongodb/BulkUpdateRequestBuilder;

    iget-object v1, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BulkUpdateRequestBuilder;-><init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, p1}, Lcom/mongodb/BulkUpdateRequestBuilder;->updateOne(Lcom/mongodb/DBObject;)V

    .line 73
    return-void
.end method

.method public upsert()Lcom/mongodb/BulkUpdateRequestBuilder;
    .locals 4

    .prologue
    .line 83
    new-instance v0, Lcom/mongodb/BulkUpdateRequestBuilder;

    iget-object v1, p0, Lcom/mongodb/BulkWriteRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    iget-object v2, p0, Lcom/mongodb/BulkWriteRequestBuilder;->query:Lcom/mongodb/DBObject;

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BulkUpdateRequestBuilder;-><init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;Z)V

    return-object v0
.end method
