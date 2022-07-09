.class Lcom/mongodb/ClusterEvent;
.super Ljava/lang/Object;
.source "ClusterEvent.java"


# instance fields
.field private final clusterId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/mongodb/ClusterEvent;->clusterId:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p0, p1, :cond_1

    .line 58
    :cond_0
    :goto_0
    return v1

    .line 48
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 49
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 52
    check-cast v0, Lcom/mongodb/ClusterEvent;

    .line 54
    .local v0, "that":Lcom/mongodb/ClusterEvent;
    iget-object v3, p0, Lcom/mongodb/ClusterEvent;->clusterId:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/ClusterEvent;->clusterId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 55
    goto :goto_0
.end method

.method public getClusterId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/ClusterEvent;->clusterId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/mongodb/ClusterEvent;->clusterId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
