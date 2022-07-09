.class Lcom/mongodb/DBCollectionImpl$Run$1;
.super Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl$Run;->executeUpdates(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mongodb/DBCollectionImpl$Run;

.field final synthetic val$port:Lcom/mongodb/DBPort;

.field final synthetic val$updateRequests:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V
    .locals 0
    .param p2, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 739
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->val$updateRequests:Ljava/util/List;

    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->val$port:Lcom/mongodb/DBPort;

    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;)V

    return-void
.end method


# virtual methods
.method executeWriteCommandProtocol()Lcom/mongodb/BulkWriteResult;
    .locals 5

    .prologue
    .line 742
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v0, v0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->val$updateRequests:Ljava/util/List;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$Run;->access$1300(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/DBEncoder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->val$port:Lcom/mongodb/DBPort;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/mongodb/DBCollectionImpl;->access$1400(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method executeWriteProtocol(I)Lcom/mongodb/WriteResult;
    .locals 9
    .param p1, "i"    # I

    .prologue
    .line 747
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->val$updateRequests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mongodb/ModifyRequest;

    .line 748
    .local v7, "update":Lcom/mongodb/ModifyRequest;
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v0, v0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-virtual {v7}, Lcom/mongodb/ModifyRequest;->getQuery()Lcom/mongodb/DBObject;

    move-result-object v1

    invoke-virtual {v7}, Lcom/mongodb/ModifyRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v7}, Lcom/mongodb/ModifyRequest;->isUpsert()Z

    move-result v3

    invoke-virtual {v7}, Lcom/mongodb/ModifyRequest;->isMulti()Z

    move-result v4

    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v5}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v5

    iget-object v6, p0, Lcom/mongodb/DBCollectionImpl$Run$1;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v6}, Lcom/mongodb/DBCollectionImpl$Run;->access$1300(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/DBEncoder;

    move-result-object v6

    invoke-virtual/range {v0 .. v6}, Lcom/mongodb/DBCollectionImpl;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v8

    .line 750
    .local v8, "writeResult":Lcom/mongodb/WriteResult;
    invoke-virtual {p0, v7, v8}, Lcom/mongodb/DBCollectionImpl$Run$1;->addMissingUpserted(Lcom/mongodb/ModifyRequest;Lcom/mongodb/WriteResult;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 755
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method
