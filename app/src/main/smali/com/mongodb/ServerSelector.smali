.class interface abstract Lcom/mongodb/ServerSelector;
.super Ljava/lang/Object;
.source "ServerSelector.java"


# virtual methods
.method public abstract choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
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
.end method
