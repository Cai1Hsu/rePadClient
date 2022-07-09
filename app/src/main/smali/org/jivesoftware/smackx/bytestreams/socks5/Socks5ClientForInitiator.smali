.class Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;
.super Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Client;
.source "Socks5ClientForInitiator.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private sessionID:Ljava/lang/String;

.field private target:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;Ljava/lang/String;Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "streamHost"    # Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;
    .param p2, "digest"    # Ljava/lang/String;
    .param p3, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p4, "sessionID"    # Ljava/lang/String;
    .param p5, "target"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Client;-><init>(Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;Ljava/lang/String;)V

    .line 58
    iput-object p3, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->connection:Lorg/jivesoftware/smack/Connection;

    .line 59
    iput-object p4, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->sessionID:Ljava/lang/String;

    .line 60
    iput-object p5, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->target:Ljava/lang/String;

    .line 61
    return-void
.end method

.method private activate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-direct {p0}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->createStreamHostActivation()Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;

    move-result-object v0

    .line 98
    .local v0, "activate":Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;
    iget-object v1, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1, v0}, Lorg/jivesoftware/smack/util/SyncPacketSend;->getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smack/packet/Packet;

    .line 99
    return-void
.end method

.method private createStreamHostActivation()Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;
    .locals 2

    .prologue
    .line 107
    new-instance v0, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;

    iget-object v1, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->sessionID:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;-><init>(Ljava/lang/String;)V

    .line 108
    .local v0, "activate":Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;->setMode(Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$Mode;)V

    .line 109
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 110
    iget-object v1, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->streamHost:Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;->getJID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;->setTo(Ljava/lang/String;)V

    .line 112
    iget-object v1, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->target:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream;->setToActivate(Ljava/lang/String;)V

    .line 114
    return-object v0
.end method


# virtual methods
.method public getSocket(I)Ljava/net/Socket;
    .locals 5
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/jivesoftware/smack/XMPPException;,
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v1, 0x0

    .line 68
    .local v1, "socket":Ljava/net/Socket;
    iget-object v3, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->streamHost:Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/bytestreams/socks5/packet/Bytestream$StreamHost;->getJID()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    invoke-static {}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Proxy;->getSocks5Proxy()Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Proxy;

    move-result-object v2

    .line 70
    .local v2, "socks5Server":Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Proxy;
    iget-object v3, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->digest:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Proxy;->getSocket(Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v1

    .line 71
    if-nez v1, :cond_1

    .line 72
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "target is not connected to SOCKS5 proxy"

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 76
    .end local v2    # "socks5Server":Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Proxy;
    :cond_0
    invoke-super {p0, p1}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5Client;->getSocket(I)Ljava/net/Socket;

    move-result-object v1

    .line 79
    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5ClientForInitiator;->activate()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :cond_1
    return-object v1

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 83
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "activating SOCKS5 Bytestream failed"

    invoke-direct {v3, v4, v0}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
