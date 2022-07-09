.class public Lcom/mongodb/BulkUpdateRequestBuilder;
.super Ljava/lang/Object;
.source "BulkUpdateRequestBuilder.java"


# instance fields
.field private final bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

.field private final query:Lcom/mongodb/DBObject;

.field private final upsert:Z


# direct methods
.method constructor <init>(Lcom/mongodb/BulkWriteOperation;Lcom/mongodb/DBObject;Z)V
    .locals 0
    .param p1, "bulkWriteOperation"    # Lcom/mongodb/BulkWriteOperation;
    .param p2, "query"    # Lcom/mongodb/DBObject;
    .param p3, "upsert"    # Z

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    .line 31
    iput-object p2, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->query:Lcom/mongodb/DBObject;

    .line 32
    iput-boolean p3, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->upsert:Z

    .line 33
    return-void
.end method


# virtual methods
.method public replaceOne(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "document"    # Lcom/mongodb/DBObject;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    new-instance v1, Lcom/mongodb/ReplaceRequest;

    iget-object v2, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->query:Lcom/mongodb/DBObject;

    iget-boolean v3, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->upsert:Z

    invoke-direct {v1, v2, v3, p1}, Lcom/mongodb/ReplaceRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;)V

    invoke-virtual {v0, v1}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 43
    return-void
.end method

.method public update(Lcom/mongodb/DBObject;)V
    .locals 5
    .param p1, "update"    # Lcom/mongodb/DBObject;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    new-instance v1, Lcom/mongodb/UpdateRequest;

    iget-object v2, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->query:Lcom/mongodb/DBObject;

    iget-boolean v3, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->upsert:Z

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, p1, v4}, Lcom/mongodb/UpdateRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, v1}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 52
    return-void
.end method

.method public updateOne(Lcom/mongodb/DBObject;)V
    .locals 5
    .param p1, "update"    # Lcom/mongodb/DBObject;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->bulkWriteOperation:Lcom/mongodb/BulkWriteOperation;

    new-instance v1, Lcom/mongodb/UpdateRequest;

    iget-object v2, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->query:Lcom/mongodb/DBObject;

    iget-boolean v3, p0, Lcom/mongodb/BulkUpdateRequestBuilder;->upsert:Z

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, p1, v4}, Lcom/mongodb/UpdateRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;Z)V

    invoke-virtual {v0, v1}, Lcom/mongodb/BulkWriteOperation;->addRequest(Lcom/mongodb/WriteRequest;)V

    .line 61
    return-void
.end method
