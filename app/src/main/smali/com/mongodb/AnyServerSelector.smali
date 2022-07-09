.class Lcom/mongodb/AnyServerSelector;
.super Ljava/lang/Object;
.source "AnyServerSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 1
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
    .line 8
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAny()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    const-string/jumbo v0, "AnyServerSelector{}"

    return-object v0
.end method
