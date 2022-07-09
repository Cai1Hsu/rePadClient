.class Lcom/mongodb/ConnectionEvent;
.super Lcom/mongodb/ClusterEvent;
.source "ConnectionEvent.java"


# instance fields
.field private final serverAddress:Lcom/mongodb/ServerAddress;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/mongodb/ClusterEvent;-><init>(Ljava/lang/String;)V

    .line 33
    iput-object p2, p0, Lcom/mongodb/ConnectionEvent;->serverAddress:Lcom/mongodb/ServerAddress;

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

    .line 69
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

    .line 53
    :cond_3
    invoke-super {p0, p1}, Lcom/mongodb/ClusterEvent;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 54
    goto :goto_0

    :cond_4
    move-object v0, p1

    .line 57
    check-cast v0, Lcom/mongodb/ConnectionEvent;

    .line 59
    .local v0, "that":Lcom/mongodb/ConnectionEvent;
    invoke-virtual {p0}, Lcom/mongodb/ConnectionEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionEvent;->getClusterId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 60
    goto :goto_0

    .line 62
    :cond_5
    invoke-virtual {p0}, Lcom/mongodb/ConnectionEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    .line 63
    goto :goto_0

    .line 65
    :cond_6
    iget-object v3, p0, Lcom/mongodb/ConnectionEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    iget-object v4, v0, Lcom/mongodb/ConnectionEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 66
    goto :goto_0
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/ConnectionEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 74
    invoke-super {p0}, Lcom/mongodb/ClusterEvent;->hashCode()I

    move-result v0

    .line 75
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ConnectionEvent;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v2}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 76
    return v0
.end method
