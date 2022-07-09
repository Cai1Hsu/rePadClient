.class Lcom/mongodb/DBCollectionImpl$Run;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBCollectionImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Run"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBCollectionImpl$Run$RunExecutor;
    }
.end annotation


# instance fields
.field private final encoder:Lcom/mongodb/DBEncoder;

.field private indexMap:Lcom/mongodb/IndexMap;

.field final synthetic this$0:Lcom/mongodb/DBCollectionImpl;

.field private final type:Lcom/mongodb/WriteRequest$Type;

.field private final writeConcern:Lcom/mongodb/WriteConcern;

.field private final writeRequests:Ljava/util/List;
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
.method constructor <init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)V
    .locals 1
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 679
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 673
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    .line 680
    iput-object p2, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    .line 681
    invoke-static {}, Lcom/mongodb/IndexMap;->create()Lcom/mongodb/IndexMap;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;

    .line 682
    iput-object p3, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 683
    iput-object p4, p0, Lcom/mongodb/DBCollectionImpl$Run;->encoder:Lcom/mongodb/DBEncoder;

    .line 684
    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/IndexMap;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$Run;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteRequest$Type;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$Run;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteConcern;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$Run;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/DBEncoder;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$Run;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->encoder:Lcom/mongodb/DBEncoder;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mongodb/DBCollectionImpl$Run;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl$Run;

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    return-object v0
.end method

.method private getWriteRequestsAsInsertRequests()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/InsertRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 722
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsRaw()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private getWriteRequestsAsModifyRequests()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 727
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsRaw()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private getWriteRequestsAsRaw()Ljava/util/List;
    .locals 1

    .prologue
    .line 712
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    return-object v0
.end method

.method private getWriteRequestsAsRemoveRequests()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;"
        }
    .end annotation

    .prologue
    .line 717
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsRaw()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method add(Lcom/mongodb/WriteRequest;I)V
    .locals 2
    .param p1, "writeRequest"    # Lcom/mongodb/WriteRequest;
    .param p2, "originalIndex"    # I

    .prologue
    .line 688
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1, p2}, Lcom/mongodb/IndexMap;->add(II)Lcom/mongodb/IndexMap;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;

    .line 689
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 690
    return-void
.end method

.method execute(Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 5
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 698
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-ne v0, v1, :cond_0

    .line 699
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsModifyRequests()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCollectionImpl$Run;->executeUpdates(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    .line 705
    :goto_0
    return-object v0

    .line 700
    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-ne v0, v1, :cond_1

    .line 701
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsModifyRequests()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCollectionImpl$Run;->executeReplaces(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    goto :goto_0

    .line 702
    :cond_1
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    if-ne v0, v1, :cond_2

    .line 703
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsInsertRequests()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCollectionImpl$Run;->executeInserts(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    goto :goto_0

    .line 704
    :cond_2
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    if-ne v0, v1, :cond_3

    .line 705
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl$Run;->getWriteRequestsAsRemoveRequests()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/mongodb/DBCollectionImpl$Run;->executeRemoves(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    goto :goto_0

    .line 707
    :cond_3
    new-instance v0, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v1, "Unsupported write of type %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mongodb/DBCollectionImpl$Run;->type:Lcom/mongodb/WriteRequest$Type;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method executeInserts(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/InsertRequest;",
            ">;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 807
    .local p1, "insertRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/InsertRequest;>;"
    new-instance v0, Lcom/mongodb/DBCollectionImpl$Run$4;

    invoke-direct {v0, p0, p2, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$4;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V

    invoke-virtual {v0}, Lcom/mongodb/DBCollectionImpl$Run$4;->execute()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method executeRemoves(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 787
    .local p1, "removeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/RemoveRequest;>;"
    new-instance v0, Lcom/mongodb/DBCollectionImpl$Run$3;

    invoke-direct {v0, p0, p2, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$3;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V

    invoke-virtual {v0}, Lcom/mongodb/DBCollectionImpl$Run$3;->execute()Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method executeReplaces(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 5
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .local p1, "replaceRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ModifyRequest;>;"
    const/4 v4, 0x0

    .line 761
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ModifyRequest;

    .line 762
    .local v1, "request":Lcom/mongodb/ModifyRequest;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$Run;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-virtual {v1}, Lcom/mongodb/ModifyRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-virtual {v2, v3, v4, v4}, Lcom/mongodb/DBCollectionImpl;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    goto :goto_0

    .line 765
    .end local v1    # "request":Lcom/mongodb/ModifyRequest;
    :cond_0
    new-instance v2, Lcom/mongodb/DBCollectionImpl$Run$2;

    invoke-direct {v2, p0, p2, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$2;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V

    invoke-virtual {v2}, Lcom/mongodb/DBCollectionImpl$Run$2;->execute()Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    return-object v2
.end method

.method executeUpdates(Ljava/util/List;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .locals 7
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 731
    .local p1, "updateRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ModifyRequest;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/ModifyRequest;

    .line 732
    .local v3, "request":Lcom/mongodb/ModifyRequest;
    invoke-virtual {v3}, Lcom/mongodb/ModifyRequest;->getUpdateDocument()Lcom/mongodb/DBObject;

    move-result-object v4

    invoke-interface {v4}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 733
    .local v2, "key":Ljava/lang/String;
    const-string/jumbo v4, "$"

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 734
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Update document keys must start with $: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 739
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "request":Lcom/mongodb/ModifyRequest;
    :cond_2
    new-instance v4, Lcom/mongodb/DBCollectionImpl$Run$1;

    invoke-direct {v4, p0, p2, p1, p2}, Lcom/mongodb/DBCollectionImpl$Run$1;-><init>(Lcom/mongodb/DBCollectionImpl$Run;Lcom/mongodb/DBPort;Ljava/util/List;Lcom/mongodb/DBPort;)V

    invoke-virtual {v4}, Lcom/mongodb/DBCollectionImpl$Run$1;->execute()Lcom/mongodb/BulkWriteResult;

    move-result-object v4

    return-object v4
.end method

.method public size()I
    .locals 1

    .prologue
    .line 693
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$Run;->writeRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
