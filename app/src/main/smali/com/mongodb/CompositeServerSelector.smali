.class Lcom/mongodb/CompositeServerSelector;
.super Ljava/lang/Object;
.source "CompositeServerSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# instance fields
.field private final serverSelectors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerSelector;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerSelector;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "serverSelectors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Server selectors can not be an empty list"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/mongodb/CompositeServerSelector;->serverSelectors:Ljava/util/List;

    .line 30
    return-void
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 6
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    move-object v2, p1

    .line 35
    .local v2, "curClusterDescription":Lcom/mongodb/ClusterDescription;
    const/4 v0, 0x0

    .line 36
    .local v0, "choices":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    iget-object v4, p0, Lcom/mongodb/CompositeServerSelector;->serverSelectors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerSelector;

    .line 37
    .local v1, "cur":Lcom/mongodb/ServerSelector;
    invoke-interface {v1, v2}, Lcom/mongodb/ServerSelector;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v0

    .line 38
    new-instance v2, Lcom/mongodb/ClusterDescription;

    .end local v2    # "curClusterDescription":Lcom/mongodb/ClusterDescription;
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getConnectionMode()Lcom/mongodb/ClusterConnectionMode;

    move-result-object v4

    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v5

    invoke-direct {v2, v4, v5, v0}, Lcom/mongodb/ClusterDescription;-><init>(Lcom/mongodb/ClusterConnectionMode;Lcom/mongodb/ClusterType;Ljava/util/List;)V

    .line 39
    .restart local v2    # "curClusterDescription":Lcom/mongodb/ClusterDescription;
    goto :goto_0

    .line 41
    .end local v1    # "cur":Lcom/mongodb/ServerSelector;
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{serverSelectors="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/CompositeServerSelector;->serverSelectors:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
