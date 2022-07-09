.class Lorg/jivesoftware/smack/NonSASLAuthentication;
.super Ljava/lang/Object;
.source "NonSASLAuthentication.java"

# interfaces
.implements Lorg/jivesoftware/smack/UserAuthentication;


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    .line 45
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v3, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 63
    .local v3, "discoveryAuth":Lorg/jivesoftware/smack/packet/Authentication;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Authentication;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 64
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Authentication;->setUsername(Ljava/lang/String;)V

    .line 66
    iget-object v5, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Authentication;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 69
    .local v2, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 71
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 72
    .local v4, "response":Lorg/jivesoftware/smack/packet/IQ;
    if-nez v4, :cond_0

    .line 73
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from the server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 76
    :cond_0
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v5

    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v5, v6, :cond_1

    .line 77
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    :cond_1
    move-object v1, v4

    .line 80
    check-cast v1, Lorg/jivesoftware/smack/packet/Authentication;

    .line 81
    .local v1, "authTypes":Lorg/jivesoftware/smack/packet/Authentication;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 84
    new-instance v0, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 85
    .local v0, "auth":Lorg/jivesoftware/smack/packet/Authentication;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/Authentication;->setUsername(Ljava/lang/String;)V

    .line 88
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Authentication;->getDigest()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 89
    iget-object v5, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/Connection;->getConnectionID()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, p2}, Lorg/jivesoftware/smack/packet/Authentication;->setDigest(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    :goto_0
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smack/packet/Authentication;->setResource(Ljava/lang/String;)V

    .line 100
    iget-object v5, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Authentication;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 102
    iget-object v5, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 104
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    .end local v4    # "response":Lorg/jivesoftware/smack/packet/IQ;
    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 105
    .restart local v4    # "response":Lorg/jivesoftware/smack/packet/IQ;
    if-nez v4, :cond_4

    .line 106
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "Authentication failed."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 91
    :cond_2
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Authentication;->getPassword()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 92
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/packet/Authentication;->setPassword(Ljava/lang/String;)V

    goto :goto_0

    .line 95
    :cond_3
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "Server does not support compatible authentication mechanism."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 108
    :cond_4
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v5

    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v5, v6, :cond_5

    .line 109
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 112
    :cond_5
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 114
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)Ljava/lang/String;
    .locals 4
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "resource"    # Ljava/lang/String;
    .param p3, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 49
    new-instance v1, Ljavax/security/auth/callback/PasswordCallback;

    const-string/jumbo v2, "Password: "

    invoke-direct {v1, v2, v3}, Ljavax/security/auth/callback/PasswordCallback;-><init>(Ljava/lang/String;Z)V

    .line 51
    .local v1, "pcb":Ljavax/security/auth/callback/PasswordCallback;
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljavax/security/auth/callback/Callback;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    invoke-interface {p3, v2}, Ljavax/security/auth/callback/CallbackHandler;->handle([Ljavax/security/auth/callback/Callback;)V

    .line 52
    invoke-virtual {v1}, Ljavax/security/auth/callback/PasswordCallback;->getPassword()[C

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1, v2, p2}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v3, "Unable to determine password."

    invoke-direct {v2, v3, v0}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public authenticateAnonymously()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 121
    .local v0, "auth":Lorg/jivesoftware/smack/packet/Authentication;
    iget-object v3, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Authentication;->getPacketID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 124
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 126
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v1, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/IQ;

    .line 127
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    if-nez v2, :cond_0

    .line 128
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "Anonymous login failed."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 130
    :cond_0
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 131
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v3

    .line 134
    :cond_1
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 136
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 137
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getTo()Ljava/lang/String;

    move-result-object v3

    .line 140
    .end local v2    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :goto_0
    return-object v3

    .restart local v2    # "response":Lorg/jivesoftware/smack/packet/IQ;
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/jivesoftware/smack/NonSASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    check-cast v2, Lorg/jivesoftware/smack/packet/Authentication;

    .end local v2    # "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Authentication;->getResource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method
