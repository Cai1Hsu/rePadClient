.class Lcom/mongodb/DBCollectionImpl$Run$4;
.super Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl$Run;->executeInserts(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mongodb/DBCollectionImpl$Run;

.field final synthetic val$insertRequests:Ljava/util/List;

.field final synthetic val$port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V
    .locals 0
    .param p2, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 807
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$insertRequests:Ljava/util/List;

    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$port:Lcom/mongodb/DBPort;

    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;)V

    return-void
.end method


# virtual methods
.method executeWriteCommandProtocol()Lcom/mongodb/BulkWriteResult;
    .locals 8

    .prologue
    .line 810
    new-instance v1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$insertRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 811
    .local v1, "documents":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$insertRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mongodb/InsertRequest;

    .line 812
    .local v6, "cur":Lcom/mongodb/InsertRequest;
    invoke-virtual {v6}, Lcom/mongodb/InsertRequest;->getDocument()Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 814
    .end local v6    # "cur":Lcom/mongodb/InsertRequest;
    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v0, v0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$Run;->access$1300(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/DBEncoder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$port:Lcom/mongodb/DBPort;

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->access$1600(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method executeWriteProtocol(I)Lcom/mongodb/WriteResult;
    .locals 4
    .param p1, "i"    # I

    .prologue
    .line 819
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    iget-object v1, v0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    const/4 v0, 0x1

    new-array v2, v0, [Lcom/mongodb/DBObject;

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->val$insertRequests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/InsertRequest;

    invoke-virtual {v0}, Lcom/mongodb/InsertRequest;->getDocument()Lcom/mongodb/DBObject;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$Run;->access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$Run$4;->this$1:Lcom/mongodb/DBCollectionImpl$Run;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$Run;->access$1300(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/DBEncoder;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/mongodb/DBCollectionImpl;->insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method getType()Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 824
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method
