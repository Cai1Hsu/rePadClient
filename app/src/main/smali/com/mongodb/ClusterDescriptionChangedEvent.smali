.class Lcom/mongodb/ClusterDescriptionChangedEvent;
.super Lcom/mongodb/ClusterEvent;
.source "ClusterDescriptionChangedEvent.java"


# instance fields
.field private final clusterDescription:Lcom/mongodb/ClusterDescription;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ClusterDescription;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "clusterDescription"    # Lcom/mongodb/ClusterDescription;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/mongodb/ClusterEvent;-><init>(Ljava/lang/String;)V

    .line 33
    iput-object p2, p0, Lcom/mongodb/ClusterDescriptionChangedEvent;->clusterDescription:Lcom/mongodb/ClusterDescription;

    .line 34
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 47
    if-ne p0, p1, :cond_1

    .line 63
    :cond_0
    :goto_0
    return v1

    .line 50
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 51
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 54
    check-cast v0, Lcom/mongodb/ClusterDescriptionChangedEvent;

    .line 56
    .local v0, "that":Lcom/mongodb/ClusterDescriptionChangedEvent;
    invoke-virtual {p0}, Lcom/mongodb/ClusterDescriptionChangedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescriptionChangedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 57
    goto :goto_0

    .line 59
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ClusterDescriptionChangedEvent;->clusterDescription:Lcom/mongodb/ClusterDescription;

    iget-object v4, v0, Lcom/mongodb/ClusterDescriptionChangedEvent;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v3, v4}, Lcom/mongodb/ClusterDescription;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 60
    goto :goto_0
.end method

.method public getClusterDescription()Lcom/mongodb/ClusterDescription;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/ClusterDescriptionChangedEvent;->clusterDescription:Lcom/mongodb/ClusterDescription;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mongodb/ClusterDescriptionChangedEvent;->clusterDescription:Lcom/mongodb/ClusterDescription;

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->hashCode()I

    move-result v0

    return v0
.end method
