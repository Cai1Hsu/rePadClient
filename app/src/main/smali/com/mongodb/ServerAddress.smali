.class public Lcom/mongodb/ServerAddress;
.super Ljava/lang/Object;
.source "ServerAddress.java"


# annotations
.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field final _host:Ljava/lang/String;

.field final _port:I


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    if-nez p1, :cond_0

    .line 61
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultHost()Ljava/lang/String;

    move-result-object p1

    .line 62
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 64
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultHost()Ljava/lang/String;

    move-result-object p1

    .line 66
    :cond_1
    const-string/jumbo v2, "["

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 67
    const-string/jumbo v2, "]"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 68
    .local v0, "idx":I
    if-ne v0, v3, :cond_2

    .line 69
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "an IPV6 address must be encosed with \'[\' and \']\' according to RFC 2732."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    :cond_2
    const-string/jumbo v2, "]:"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 73
    .local v1, "portIdx":I
    if-eq v1, v3, :cond_4

    .line 74
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v2

    if-eq p2, v2, :cond_3

    .line 75
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "can\'t specify port in construct and via host"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 76
    :cond_3
    add-int/lit8 v2, v1, 0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    .line 78
    :cond_4
    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 90
    .end local v1    # "portIdx":I
    :cond_5
    :goto_0
    iput-object p1, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    .line 91
    iput p2, p0, Lcom/mongodb/ServerAddress;->_port:I

    .line 92
    return-void

    .line 81
    .end local v0    # "idx":I
    :cond_6
    const-string/jumbo v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 82
    .restart local v0    # "idx":I
    if-lez v0, :cond_5

    .line 83
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v2

    if-eq p2, v2, :cond_7

    .line 84
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "can\'t specify port in construct and via host"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    :cond_7
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    .line 86
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public constructor <init>(Ljava/net/InetAddress;)V
    .locals 2
    .param p1, "addr"    # Ljava/net/InetAddress;

    .prologue
    .line 99
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v1

    invoke-direct {v0, p1, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {p0, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/net/InetSocketAddress;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I

    .prologue
    .line 108
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, p1, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {p0, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/net/InetSocketAddress;)V

    .line 109
    return-void
.end method

.method public constructor <init>(Ljava/net/InetSocketAddress;)V
    .locals 1
    .param p1, "addr"    # Ljava/net/InetSocketAddress;

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    .line 117
    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    iput v0, p0, Lcom/mongodb/ServerAddress;->_port:I

    .line 118
    return-void
.end method

.method public static defaultHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 205
    const-string/jumbo v0, "127.0.0.1"

    return-object v0
.end method

.method public static defaultPort()I
    .locals 1

    .prologue
    .line 212
    const/16 v0, 0x6989

    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 145
    if-ne p0, p1, :cond_1

    .line 153
    :cond_0
    :goto_0
    return v1

    .line 146
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 148
    check-cast v0, Lcom/mongodb/ServerAddress;

    .line 150
    .local v0, "that":Lcom/mongodb/ServerAddress;
    iget v3, p0, Lcom/mongodb/ServerAddress;->_port:I

    iget v4, v0, Lcom/mongodb/ServerAddress;->_port:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 151
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lcom/mongodb/ServerAddress;->_port:I

    return v0
.end method

.method public getSocketAddress()Ljava/net/InetSocketAddress;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 185
    new-instance v0, Ljava/net/InetSocketAddress;

    iget-object v1, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    iget v2, p0, Lcom/mongodb/ServerAddress;->_port:I

    invoke-direct {v0, v1, v2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 158
    iget-object v1, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 159
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/ServerAddress;->_port:I

    add-int v0, v1, v2

    .line 160
    return v0
.end method

.method public sameHost(Ljava/lang/String;)Z
    .locals 4
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 131
    const-string/jumbo v3, ":"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 132
    .local v0, "idx":I
    invoke-static {}, Lcom/mongodb/ServerAddress;->defaultPort()I

    move-result v1

    .line 133
    .local v1, "port":I
    if-lez v0, :cond_0

    .line 134
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 135
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 138
    :cond_0
    iget v3, p0, Lcom/mongodb/ServerAddress;->_port:I

    if-ne v3, v1, :cond_1

    iget-object v3, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/mongodb/ServerAddress;->_host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ServerAddress;->_port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
