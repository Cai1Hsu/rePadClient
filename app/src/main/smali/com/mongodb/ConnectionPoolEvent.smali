.class Lcom/mongodb/ConnectionPoolEvent;
.super Lcom/mongodb/ClusterEvent;
.source "ConnectionPoolEvent.java"


# instance fields
.field private final serverAddress:Lcom/mongodb/ServerAddress;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/mongodb/ClusterEvent;-><init>(Ljava/lang/String;)V

    .line 34
    iput-object p2, p0, Lcom/mongodb/ConnectionPoolEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 48
    if-ne p0, p1, :cond_1

    .line 64
    :cond_0
    :goto_0
    return v1

    .line 51
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 52
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 55
    check-cast v0, Lcom/mongodb/ConnectionPoolEvent;

    .line 57
    .local v0, "that":Lcom/mongodb/ConnectionPoolEvent;
    invoke-virtual {p0}, Lcom/mongodb/ConnectionPoolEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolEvent;->getClusterId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 58
    goto :goto_0

    .line 60
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ConnectionPoolEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    iget-object v4, v0, Lcom/mongodb/ConnectionPoolEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 61
    goto :goto_0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 69
    invoke-super {p0}, Lcom/mongodb/ClusterEvent;->hashCode()I

    move-result v0

    .line 70
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ConnectionPoolEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v2}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method
