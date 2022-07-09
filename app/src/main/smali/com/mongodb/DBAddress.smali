.class public Lcom/mongodb/DBAddress;
.super Lcom/mongodb/ServerAddress;
.source "DBAddress.java"


# instance fields
.field final _db:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBAddress;Ljava/lang/String;)V
    .locals 2
    .param p1, "other"    # Lcom/mongodb/DBAddress;
    .param p2, "dbname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p1, Lcom/mongodb/DBAddress;->_host:Ljava/lang/String;

    iget v1, p1, Lcom/mongodb/DBAddress;->_port:I

    invoke-direct {p0, v0, v1, p2}, Lcom/mongodb/DBAddress;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "urlFormat"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-static {p1}, Lcom/mongodb/DBAddress;->_getHostSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    .line 52
    const-string/jumbo v0, "urlFormat"

    invoke-static {p1, v0}, Lcom/mongodb/DBAddress;->_check(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-static {p1}, Lcom/mongodb/DBAddress;->_getDBSection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/DBAddress;->_fixName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    .line 55
    iget-object v0, p0, Lcom/mongodb/DBAddress;->_host:Ljava/lang/String;

    const-string/jumbo v1, "host"

    invoke-static {v0, v1}, Lcom/mongodb/DBAddress;->_check(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    const-string/jumbo v1, "db"

    invoke-static {v0, v1}, Lcom/mongodb/DBAddress;->_check(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "dbname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0, p1, p2}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;I)V

    .line 111
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "dbname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 99
    const/16 v0, 0x6989

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/DBAddress;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILjava/lang/String;)V
    .locals 1
    .param p1, "addr"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "dbname"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lcom/mongodb/ServerAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 121
    const-string/jumbo v0, "name"

    invoke-static {p3, v0}, Lcom/mongodb/DBAddress;->_check(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    .line 123
    return-void
.end method

.method static _check(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p0, "thing"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 126
    if-nez p0, :cond_0

    .line 127
    new-instance v0, Ljava/lang/NullPointerException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " can\'t be null "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " can\'t be empty"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_1
    return-void
.end method

.method static _fixName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 78
    const/16 v0, 0x2e

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 79
    return-object p0
.end method

.method static _getDBSection(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "urlFormat"    # Ljava/lang/String;

    .prologue
    .line 69
    if-nez p0, :cond_0

    .line 70
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "urlFormat can\'t be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 71
    :cond_0
    const-string/jumbo v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 72
    .local v0, "idx":I
    if-ltz v0, :cond_1

    .line 73
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 74
    .end local p0    # "urlFormat":Ljava/lang/String;
    :cond_1
    return-object p0
.end method

.method static _getHostSection(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "urlFormat"    # Ljava/lang/String;

    .prologue
    .line 60
    if-nez p0, :cond_0

    .line 61
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "urlFormat can\'t be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_0
    const-string/jumbo v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 63
    .local v0, "idx":I
    if-ltz v0, :cond_1

    .line 64
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 65
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 141
    instance-of v2, p1, Lcom/mongodb/DBAddress;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 142
    check-cast v0, Lcom/mongodb/DBAddress;

    .line 143
    .local v0, "a":Lcom/mongodb/DBAddress;
    iget v2, v0, Lcom/mongodb/DBAddress;->_port:I

    iget v3, p0, Lcom/mongodb/DBAddress;->_port:I

    if-ne v2, v3, :cond_0

    iget-object v2, v0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    iget-object v3, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/mongodb/DBAddress;->_host:Ljava/lang/String;

    iget-object v3, p0, Lcom/mongodb/DBAddress;->_host:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 150
    .end local v0    # "a":Lcom/mongodb/DBAddress;
    :cond_0
    :goto_0
    return v1

    .line 147
    :cond_1
    instance-of v2, p1, Lcom/mongodb/ServerAddress;

    if-eqz v2, :cond_0

    .line 148
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getDBName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    return-object v0
.end method

.method public getSister(Ljava/lang/String;)Lcom/mongodb/DBAddress;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 162
    :try_start_0
    new-instance v1, Lcom/mongodb/DBAddress;

    iget-object v2, p0, Lcom/mongodb/DBAddress;->_host:Ljava/lang/String;

    iget v3, p0, Lcom/mongodb/DBAddress;->_port:I

    invoke-direct {v1, v2, v3, p1}, Lcom/mongodb/DBAddress;-><init>(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, "uh":Ljava/net/UnknownHostException;
    new-instance v1, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v2, "shouldn\'t be possible"

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 136
    invoke-super {p0}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v0

    iget-object v1, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBAddress;->_db:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
