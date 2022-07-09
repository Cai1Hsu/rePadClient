.class Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/mongodb/DBCollectionImpl$Run;",
        ">;"
    }
.end annotation


# instance fields
.field private curIndex:I

.field private final runs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/mongodb/WriteRequest$Type;",
            "Lcom/mongodb/DBCollectionImpl$Run;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)V
    .locals 2

    .prologue
    .line 630
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 631
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1$1;

    invoke-direct {v1, p0}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1$1;-><init>(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;)V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 642
    iget v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v1}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Lcom/mongodb/DBCollectionImpl$Run;
    .locals 6

    .prologue
    .line 647
    :cond_0
    iget v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 648
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v2}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$700(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/WriteRequest;

    .line 649
    .local v1, "writeRequest":Lcom/mongodb/WriteRequest;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/mongodb/WriteRequest;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBCollectionImpl$Run;

    .line 650
    .local v0, "run":Lcom/mongodb/DBCollectionImpl$Run;
    if-nez v0, :cond_1

    .line 651
    new-instance v0, Lcom/mongodb/DBCollectionImpl$Run;

    .end local v0    # "run":Lcom/mongodb/DBCollectionImpl$Run;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    iget-object v2, v2, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->this$0:Lcom/mongodb/DBCollectionImpl;

    invoke-virtual {v1}, Lcom/mongodb/WriteRequest;->getType()Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v4}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$800(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Lcom/mongodb/WriteConcern;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v5}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$900(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)Lcom/mongodb/DBEncoder;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/mongodb/DBCollectionImpl$Run;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)V

    .line 652
    .restart local v0    # "run":Lcom/mongodb/DBCollectionImpl$Run;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    invoke-static {v0}, Lcom/mongodb/DBCollectionImpl$Run;->access$1000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    :cond_1
    iget v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/DBCollectionImpl$Run;->add(Lcom/mongodb/WriteRequest;I)V

    .line 655
    iget v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->curIndex:I

    .line 656
    invoke-virtual {v0}, Lcom/mongodb/DBCollectionImpl$Run;->size()I

    move-result v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->this$1:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    invoke-static {v3}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;->access$1100(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 657
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    invoke-static {v0}, Lcom/mongodb/DBCollectionImpl$Run;->access$1000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/WriteRequest$Type;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/DBCollectionImpl$Run;

    .line 661
    .end local v0    # "run":Lcom/mongodb/DBCollectionImpl$Run;
    .end local v1    # "writeRequest":Lcom/mongodb/WriteRequest;
    :goto_0
    return-object v2

    :cond_2
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->runs:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/DBCollectionImpl$Run;

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 630
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;->next()Lcom/mongodb/DBCollectionImpl$Run;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 666
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
