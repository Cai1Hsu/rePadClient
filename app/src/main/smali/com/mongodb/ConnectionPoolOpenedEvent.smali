.class Lcom/mongodb/ConnectionPoolOpenedEvent;
.super Lcom/mongodb/ConnectionPoolEvent;
.source "ConnectionPoolOpenedEvent.java"


# instance fields
.field private final settings:Lcom/mongodb/ConnectionPoolSettings;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;Lcom/mongodb/ConnectionPoolSettings;)V
    .locals 0
    .param p1, "clusterId"    # Ljava/lang/String;
    .param p2, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p3, "settings"    # Lcom/mongodb/ConnectionPoolSettings;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/mongodb/ConnectionPoolEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    .line 34
    iput-object p3, p0, Lcom/mongodb/ConnectionPoolOpenedEvent;->settings:Lcom/mongodb/ConnectionPoolSettings;

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

    .line 67
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
    check-cast v0, Lcom/mongodb/ConnectionPoolOpenedEvent;

    .line 57
    .local v0, "that":Lcom/mongodb/ConnectionPoolOpenedEvent;
    invoke-virtual {p0}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getClusterId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 58
    goto :goto_0

    .line 60
    :cond_4
    invoke-virtual {p0}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 61
    goto :goto_0

    .line 63
    :cond_5
    iget-object v3, p0, Lcom/mongodb/ConnectionPoolOpenedEvent;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v0}, Lcom/mongodb/ConnectionPoolOpenedEvent;->getSettings()Lcom/mongodb/ConnectionPoolSettings;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ConnectionPoolSettings;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 64
    goto :goto_0
.end method

.method public getSettings()Lcom/mongodb/ConnectionPoolSettings;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mongodb/ConnectionPoolOpenedEvent;->settings:Lcom/mongodb/ConnectionPoolSettings;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 72
    invoke-super {p0}, Lcom/mongodb/ConnectionPoolEvent;->hashCode()I

    move-result v0

    .line 73
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ConnectionPoolOpenedEvent;->settings:Lcom/mongodb/ConnectionPoolSettings;

    invoke-virtual {v2}, Lcom/mongodb/ConnectionPoolSettings;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 74
    return v0
.end method
