.class public Lde/javawi/jstun/test/DiscoveryInfo;
.super Ljava/lang/Object;
.source "DiscoveryInfo.java"


# instance fields
.field private blockedUDP:Z

.field private error:Z

.field private errorReason:Ljava/lang/String;

.field private errorResponseCode:I

.field private fullCone:Z

.field private openAccess:Z

.field private portRestrictedCone:Z

.field private publicIP:Ljava/net/InetAddress;

.field private restrictedCone:Z

.field private symmetric:Z

.field private symmetricUDPFirewall:Z

.field private testIP:Ljava/net/InetAddress;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "testIP"    # Ljava/net/InetAddress;

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    .line 19
    iput v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->errorResponseCode:I

    .line 21
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->openAccess:Z

    .line 22
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->blockedUDP:Z

    .line 23
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->fullCone:Z

    .line 24
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->restrictedCone:Z

    .line 25
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->portRestrictedCone:Z

    .line 26
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetric:Z

    .line 27
    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetricUDPFirewall:Z

    .line 31
    iput-object p1, p0, Lde/javawi/jstun/test/DiscoveryInfo;->testIP:Ljava/net/InetAddress;

    .line 32
    return-void
.end method


# virtual methods
.method public getLocalIP()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->testIP:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getPublicIP()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->publicIP:Ljava/net/InetAddress;

    return-object v0
.end method

.method public isBlockedUDP()Z
    .locals 1

    .prologue
    .line 54
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 55
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->blockedUDP:Z

    goto :goto_0
.end method

.method public isError()Z
    .locals 1

    .prologue
    .line 35
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    return v0
.end method

.method public isFullCone()Z
    .locals 1

    .prologue
    .line 63
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 64
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->fullCone:Z

    goto :goto_0
.end method

.method public isOpenAccess()Z
    .locals 1

    .prologue
    .line 45
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 46
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->openAccess:Z

    goto :goto_0
.end method

.method public isPortRestrictedCone()Z
    .locals 1

    .prologue
    .line 72
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 73
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->portRestrictedCone:Z

    goto :goto_0
.end method

.method public isRestrictedCone()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 82
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->restrictedCone:Z

    goto :goto_0
.end method

.method public isSymmetric()Z
    .locals 1

    .prologue
    .line 90
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 91
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetric:Z

    goto :goto_0
.end method

.method public isSymmetricUDPFirewall()Z
    .locals 1

    .prologue
    .line 99
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 100
    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetricUDPFirewall:Z

    goto :goto_0
.end method

.method public setBlockedUDP()V
    .locals 1

    .prologue
    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->blockedUDP:Z

    .line 60
    return-void
.end method

.method public setError(ILjava/lang/String;)V
    .locals 1
    .param p1, "responseCode"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    .line 40
    iput p1, p0, Lde/javawi/jstun/test/DiscoveryInfo;->errorResponseCode:I

    .line 41
    iput-object p2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->errorReason:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setFullCone()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->fullCone:Z

    .line 69
    return-void
.end method

.method public setOpenAccess()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->openAccess:Z

    .line 51
    return-void
.end method

.method public setPortRestrictedCone()V
    .locals 1

    .prologue
    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->portRestrictedCone:Z

    .line 78
    return-void
.end method

.method public setPublicIP(Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "publicIP"    # Ljava/net/InetAddress;

    .prologue
    .line 116
    iput-object p1, p0, Lde/javawi/jstun/test/DiscoveryInfo;->publicIP:Ljava/net/InetAddress;

    .line 117
    return-void
.end method

.method public setRestrictedCone()V
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->restrictedCone:Z

    .line 87
    return-void
.end method

.method public setSymmetric()V
    .locals 1

    .prologue
    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetric:Z

    .line 96
    return-void
.end method

.method public setSymmetricUDPFirewall()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetricUDPFirewall:Z

    .line 105
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 121
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v2, "Network interface: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    :try_start_0
    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->testIP:Ljava/net/InetAddress;

    invoke-static {v2}, Ljava/net/NetworkInterface;->getByInetAddress(Ljava/net/InetAddress;)Ljava/net/NetworkInterface;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_0
    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    const-string/jumbo v2, "Local IP address: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->testIP:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->error:Z

    if-eqz v2, :cond_0

    .line 132
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lde/javawi/jstun/test/DiscoveryInfo;->errorReason:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " - Responsecode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lde/javawi/jstun/test/DiscoveryInfo;->errorResponseCode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 151
    :goto_1
    return-object v2

    .line 124
    :catch_0
    move-exception v1

    .line 125
    .local v1, "se":Ljava/net/SocketException;
    const-string/jumbo v2, "unknown"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 135
    .end local v1    # "se":Ljava/net/SocketException;
    :cond_0
    const-string/jumbo v2, "Result: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->openAccess:Z

    if-eqz v2, :cond_1

    const-string/jumbo v2, "Open access to the Internet.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 137
    :cond_1
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->blockedUDP:Z

    if-eqz v2, :cond_2

    const-string/jumbo v2, "Firewall blocks UDP.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    :cond_2
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->fullCone:Z

    if-eqz v2, :cond_3

    const-string/jumbo v2, "Full Cone NAT handles connections.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    :cond_3
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->restrictedCone:Z

    if-eqz v2, :cond_4

    const-string/jumbo v2, "Restricted Cone NAT handles connections.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    :cond_4
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->portRestrictedCone:Z

    if-eqz v2, :cond_5

    const-string/jumbo v2, "Port restricted Cone NAT handles connections.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    :cond_5
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetric:Z

    if-eqz v2, :cond_6

    const-string/jumbo v2, "Symmetric Cone NAT handles connections.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    :cond_6
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetricUDPFirewall:Z

    if-eqz v2, :cond_7

    const-string/jumbo v2, "Symmetric UDP Firewall handles connections.\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    :cond_7
    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->openAccess:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->blockedUDP:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->fullCone:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->restrictedCone:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->portRestrictedCone:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetric:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->symmetricUDPFirewall:Z

    if-nez v2, :cond_8

    const-string/jumbo v2, "unkown\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 144
    :cond_8
    const-string/jumbo v2, "Public IP address: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->publicIP:Ljava/net/InetAddress;

    if-eqz v2, :cond_9

    .line 146
    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryInfo;->publicIP:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    :goto_2
    const-string/jumbo v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 148
    :cond_9
    const-string/jumbo v2, "unknown"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2
.end method
