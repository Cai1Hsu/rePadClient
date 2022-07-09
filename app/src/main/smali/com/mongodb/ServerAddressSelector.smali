.class Lcom/mongodb/ServerAddressSelector;
.super Ljava/lang/Object;
.source "ServerAddressSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# instance fields
.field private final address:Lcom/mongodb/ServerAddress;


# direct methods
.method public constructor <init>(Lcom/mongodb/ServerAddress;)V
    .locals 0
    .param p1, "address"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/mongodb/ServerAddressSelector;->address:Lcom/mongodb/ServerAddress;

    .line 27
    return-void
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 3
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
    .line 31
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mongodb/ServerDescription;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mongodb/ServerAddressSelector;->address:Lcom/mongodb/ServerAddress;

    invoke-virtual {p1, v2}, Lcom/mongodb/ClusterDescription;->getByServerAddress(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
