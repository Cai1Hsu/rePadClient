.class public Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "RTPBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$Provider;,
        Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "rtpbridge"

.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field public static final NAME:Ljava/lang/String; = "rtpbridge"

.field public static final NAMESPACE:Ljava/lang/String; = "http://www.jivesoftware.com/protocol/rtpbridge"


# instance fields
.field private bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

.field private hostA:Ljava/lang/String;

.field private hostB:Ljava/lang/String;

.field private ip:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private pass:Ljava/lang/String;

.field private portA:I

.field private portB:I

.field private sid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 55
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    .line 88
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v0

    const-string/jumbo v1, "rtpbridge"

    const-string/jumbo v2, "http://www.jivesoftware.com/protocol/rtpbridge"

    new-instance v3, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$Provider;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$Provider;-><init>()V

    invoke-virtual {v0, v1, v2, v3}, Lorg/jivesoftware/smack/provider/ProviderManager;->addIQProvider(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 123
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 61
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    .line 62
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->create:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 124
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 96
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 61
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    .line 62
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->create:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 97
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->sid:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;)V
    .locals 1
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "bridgeAction"    # Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .prologue
    const/4 v0, -0x1

    .line 115
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 61
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    .line 62
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->create:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 116
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->sid:Ljava/lang/String;

    .line 117
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 118
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;)V
    .locals 1
    .param p1, "action"    # Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .prologue
    const/4 v0, -0x1

    .line 105
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 61
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    .line 62
    iput v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->create:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 106
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    .line 107
    return-void
.end method

.method public static getPublicIP(Lorg/jivesoftware/smack/Connection;)Ljava/lang/String;
    .locals 12
    .param p0, "xmppConnection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v8, 0x0

    .line 506
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v9

    if-nez v9, :cond_1

    .line 552
    :cond_0
    :goto_0
    return-object v8

    .line 510
    :cond_1
    new-instance v7, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    sget-object v9, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->publicip:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    invoke-direct {v7, v9}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;-><init>(Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;)V

    .line 511
    .local v7, "rtpPacket":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "rtpbridge."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setTo(Ljava/lang/String;)V

    .line 512
    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v9}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 516
    new-instance v9, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPacketID()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v9}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 519
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p0, v7}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 521
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v9

    int-to-long v10, v9

    invoke-virtual {v0, v10, v11}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    .line 525
    .local v6, "response":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 527
    if-eqz v6, :cond_0

    .line 529
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_0

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 531
    const/4 v5, 0x0

    .line 533
    .local v5, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 538
    :cond_2
    :goto_1
    if-eqz v5, :cond_4

    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 540
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/NetworkInterface;

    .line 541
    .local v4, "iface":Ljava/net/NetworkInterface;
    invoke-virtual {v4}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v3

    .line 543
    .local v3, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_3
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 544
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 545
    .local v2, "iaddress":Ljava/net/InetAddress;
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v9

    if-nez v9, :cond_3

    .line 546
    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-ltz v9, :cond_3

    goto/16 :goto_0

    .line 535
    .end local v2    # "iaddress":Ljava/net/InetAddress;
    .end local v3    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v4    # "iface":Ljava/net/NetworkInterface;
    :catch_0
    move-exception v1

    .line 536
    .local v1, "e":Ljava/net/SocketException;
    invoke-virtual {v1}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_1

    .line 552
    .end local v1    # "e":Ljava/net/SocketException;
    :cond_4
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_0
.end method

.method public static getRTPBridge(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    .locals 6
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "sessionID"    # Ljava/lang/String;

    .prologue
    .line 397
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    .line 398
    const/4 v1, 0x0

    .line 415
    :goto_0
    return-object v1

    .line 401
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    invoke-direct {v2, p1}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;-><init>(Ljava/lang/String;)V

    .line 402
    .local v2, "rtpPacket":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "rtpbridge."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setTo(Ljava/lang/String;)V

    .line 404
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 407
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 409
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    .line 413
    .local v1, "response":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    goto :goto_0
.end method

.method public static relaySession(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    .locals 6
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "sessionID"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;
    .param p3, "proxyCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "localCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 468
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v3

    if-nez v3, :cond_0

    .line 469
    const/4 v1, 0x0

    .line 495
    :goto_0
    return-object v1

    .line 472
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    sget-object v3, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->change:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    invoke-direct {v2, p1, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;-><init>(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;)V

    .line 473
    .local v2, "rtpPacket":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "rtpbridge."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setTo(Ljava/lang/String;)V

    .line 474
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 476
    invoke-virtual {v2, p2}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPass(Ljava/lang/String;)V

    .line 477
    invoke-virtual {p4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPortA(I)V

    .line 478
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPortB(I)V

    .line 479
    invoke-virtual {p4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setHostA(Ljava/lang/String;)V

    .line 480
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setHostB(Ljava/lang/String;)V

    .line 484
    new-instance v3, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 487
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 489
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v3

    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    .line 493
    .local v1, "response":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    goto :goto_0
.end method

.method public static serviceAvailable(Lorg/jivesoftware/smack/Connection;)Z
    .locals 8
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v5, 0x0

    .line 426
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v6

    if-nez v6, :cond_1

    .line 457
    :cond_0
    :goto_0
    return v5

    .line 430
    :cond_1
    sget-object v6, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "Service listing"

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 432
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    .line 444
    .local v0, "disco":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    .line 445
    .local v1, "discoInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getIdentities()Ljava/util/Iterator;

    move-result-object v4

    .line 446
    .local v4, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 447
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 448
    .local v3, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "rtpbridge"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_2

    .line 449
    const/4 v5, 0x1

    goto :goto_0

    .line 453
    .end local v1    # "discoInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .end local v3    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .end local v4    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    :catch_0
    move-exception v2

    .line 454
    .local v2, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getAttributes()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .local v0, "str":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getSid()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 133
    const-string/jumbo v1, " sid=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getSid()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPass()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 136
    const-string/jumbo v1, " pass=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPass()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortA()I

    move-result v1

    if-eq v1, v3, :cond_2

    .line 139
    const-string/jumbo v1, " porta=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortA()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortB()I

    move-result v1

    if-eq v1, v3, :cond_3

    .line 142
    const-string/jumbo v1, " portb=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortB()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getHostA()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 145
    const-string/jumbo v1, " hosta=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getHostA()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getHostB()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 148
    const-string/jumbo v1, " hostb=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getHostB()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 304
    .local v0, "str":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<rtpbridge xmlns=\'http://www.jivesoftware.com/protocol/rtpbridge\' sid=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->sid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    sget-object v2, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->create:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 307
    const-string/jumbo v1, "<candidate/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    :goto_0
    const-string/jumbo v1, "</rtpbridge>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 308
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->bridgeAction:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    sget-object v2, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->change:Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$BridgeAction;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 309
    const-string/jumbo v1, "<relay "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " />"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 311
    :cond_1
    const-string/jumbo v1, "<publicip "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " />"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public getHostA()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->hostA:Ljava/lang/String;

    return-object v0
.end method

.method public getHostB()Ljava/lang/String;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->hostB:Ljava/lang/String;

    return-object v0
.end method

.method public getIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->ip:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->pass:Ljava/lang/String;

    return-object v0
.end method

.method public getPortA()I
    .locals 1

    .prologue
    .line 213
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    return v0
.end method

.method public getPortB()I
    .locals 1

    .prologue
    .line 231
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    return v0
.end method

.method public getSid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->sid:Ljava/lang/String;

    return-object v0
.end method

.method public setHostA(Ljava/lang/String;)V
    .locals 0
    .param p1, "hostA"    # Ljava/lang/String;

    .prologue
    .line 186
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->hostA:Ljava/lang/String;

    .line 187
    return-void
.end method

.method public setHostB(Ljava/lang/String;)V
    .locals 0
    .param p1, "hostB"    # Ljava/lang/String;

    .prologue
    .line 204
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->hostB:Ljava/lang/String;

    .line 205
    return-void
.end method

.method public setIp(Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 258
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->ip:Ljava/lang/String;

    .line 259
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->name:Ljava/lang/String;

    .line 295
    return-void
.end method

.method public setPass(Ljava/lang/String;)V
    .locals 0
    .param p1, "pass"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->pass:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public setPortA(I)V
    .locals 0
    .param p1, "portA"    # I

    .prologue
    .line 222
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portA:I

    .line 223
    return-void
.end method

.method public setPortB(I)V
    .locals 0
    .param p1, "portB"    # I

    .prologue
    .line 240
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->portB:I

    .line 241
    return-void
.end method

.method public setSid(Ljava/lang/String;)V
    .locals 0
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->sid:Ljava/lang/String;

    .line 169
    return-void
.end method
