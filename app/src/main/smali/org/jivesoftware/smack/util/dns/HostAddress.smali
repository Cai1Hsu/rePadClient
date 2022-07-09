.class public Lorg/jivesoftware/smack/util/dns/HostAddress;
.super Ljava/lang/Object;
.source "HostAddress.java"


# instance fields
.field private exception:Ljava/lang/Exception;

.field private fqdn:Ljava/lang/String;

.field private port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "fqdn"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "FQDN is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2e

    if-ne v0, v1, :cond_1

    .line 33
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    .line 39
    :goto_0
    const/16 v0, 0x1466

    iput v0, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    .line 40
    return-void

    .line 36
    :cond_1
    iput-object p1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .param p1, "fqdn"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/util/dns/HostAddress;-><init>(Ljava/lang/String;)V

    .line 51
    if-ltz p2, :cond_0

    const v0, 0xffff

    if-le p2, v0, :cond_1

    .line 52
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "DNS SRV records weight must be a 16-bit unsiged integer (i.e. between 0-65535. Port was: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    iput p2, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    .line 56
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 77
    if-ne p0, p1, :cond_1

    .line 89
    :cond_0
    :goto_0
    return v1

    .line 80
    :cond_1
    instance-of v3, p1, Lorg/jivesoftware/smack/util/dns/HostAddress;

    if-nez v3, :cond_2

    move v1, v2

    .line 81
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 84
    check-cast v0, Lorg/jivesoftware/smack/util/dns/HostAddress;

    .line 86
    .local v0, "address":Lorg/jivesoftware/smack/util/dns/HostAddress;
    iget-object v3, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    move v1, v2

    .line 87
    goto :goto_0

    .line 89
    :cond_3
    iget v3, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    iget v4, v0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 3

    .prologue
    .line 101
    iget-object v1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->exception:Ljava/lang/Exception;

    if-nez v1, :cond_0

    .line 102
    const-string/jumbo v0, "No error logged"

    .line 107
    .local v0, "error":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/dns/HostAddress;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 105
    .end local v0    # "error":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->exception:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "error":Ljava/lang/String;
    goto :goto_0
.end method

.method public getFQDN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 94
    const/4 v0, 0x1

    .line 95
    .local v0, "result":I
    iget-object v1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x25

    .line 96
    mul-int/lit8 v1, v0, 0x25

    iget v2, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    add-int/2addr v1, v2

    return v1
.end method

.method public setException(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->exception:Ljava/lang/Exception;

    .line 68
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->fqdn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/jivesoftware/smack/util/dns/HostAddress;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
