.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
.source "AudioMediaSession.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 6
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "locator"    # Ljava/lang/String;
    .param p5, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 60
    if-nez p4, :cond_0

    const-string/jumbo v4, "dsound://"

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 61
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->initialize()V

    .line 62
    return-void

    :cond_0
    move-object v4, p4

    .line 60
    goto :goto_0
.end method


# virtual methods
.method protected getFreePort()I
    .locals 12

    .prologue
    .line 139
    const/4 v1, 0x0

    .line 141
    .local v1, "freePort":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v5, 0xa

    if-ge v3, v5, :cond_1

    .line 142
    const-wide/16 v6, 0x2710

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    const-wide v10, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v1, v6

    .line 143
    rem-int/lit8 v5, v1, 0x2

    if-nez v5, :cond_0

    .line 145
    :goto_1
    :try_start_0
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4, v1}, Ljava/net/ServerSocket;-><init>(I)V

    .line 146
    .local v4, "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 147
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v1

    .line 162
    .end local v1    # "freePort":I
    .end local v4    # "ss":Ljava/net/ServerSocket;
    .local v2, "freePort":I
    :goto_2
    return v2

    .line 143
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 141
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 155
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/ServerSocket;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/net/ServerSocket;-><init>(I)V

    .line 156
    .restart local v4    # "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 157
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v4    # "ss":Ljava/net/ServerSocket;
    :goto_3
    move v2, v1

    .line 162
    .end local v1    # "freePort":I
    .restart local v2    # "freePort":I
    goto :goto_2

    .line 159
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :catch_1
    move-exception v0

    .line 160
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public initialize()V
    .locals 8

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSymmetric()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    .line 76
    .local v3, "ip":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, "localIp":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getFreePort()I

    move-result v4

    .line 78
    .local v4, "localPort":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSymmetric()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v5

    .line 80
    .local v5, "remotePort":I
    sget-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v6, " "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v6, ": "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v6, "->"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 90
    :goto_0
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    new-instance v1, Ljavax/media/MediaLocator;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getMediaLocator()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljavax/media/MediaLocator;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v6

    invoke-static {v6}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioFormatUtils;->getAudioFormat(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)Ljavax/media/format/AudioFormat;

    move-result-object v6

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;-><init>(Ljavax/media/MediaLocator;Ljava/lang/String;Ljava/lang/String;IILjavax/media/Format;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    .line 91
    return-void

    .line 84
    .end local v2    # "localIp":Ljava/lang/String;
    .end local v3    # "ip":Ljava/lang/String;
    .end local v4    # "localPort":I
    .end local v5    # "remotePort":I
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    .line 85
    .restart local v3    # "ip":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v2

    .line 86
    .restart local v2    # "localIp":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v4

    .line 87
    .restart local v4    # "localPort":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v5

    .restart local v5    # "remotePort":I
    goto :goto_0
.end method

.method public setTrasmit(Z)V
    .locals 1
    .param p1, "active"    # Z

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setTrasmit(Z)V

    .line 108
    return-void
.end method

.method public startReceive()V
    .locals 0

    .prologue
    .line 115
    return-void
.end method

.method public startTrasmit()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->start()Ljava/lang/String;

    .line 98
    return-void
.end method

.method public stopReceive()V
    .locals 0

    .prologue
    .line 130
    return-void
.end method

.method public stopTrasmit()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;->audioChannel:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->stop()V

    .line 123
    :cond_0
    return-void
.end method
