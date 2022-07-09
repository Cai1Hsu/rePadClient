.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
.source "AudioMediaSession.java"

# interfaces
.implements Lmil/jfcom/cie/media/session/MediaSessionListener;


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private mediaSession:Lmil/jfcom/cie/media/session/MediaSession;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

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
    .line 111
    if-nez p4, :cond_0

    const-string/jumbo v4, "dsound://"

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 112
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->initialize()V

    .line 113
    return-void

    :cond_0
    move-object v4, p4

    .line 111
    goto :goto_0
.end method

.method public static createSession(Ljava/lang/String;ILjava/lang/String;ILmil/jfcom/cie/media/session/MediaSessionListener;IZZ)Lmil/jfcom/cie/media/session/MediaSession;
    .locals 11
    .param p0, "localhost"    # Ljava/lang/String;
    .param p1, "localPort"    # I
    .param p2, "remoteHost"    # Ljava/lang/String;
    .param p3, "remotePort"    # I
    .param p4, "eventHandler"    # Lmil/jfcom/cie/media/session/MediaSessionListener;
    .param p5, "quality"    # I
    .param p6, "secure"    # Z
    .param p7, "micOn"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/media/NoProcessorException;,
            Ljavax/media/format/UnsupportedFormatException;,
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 81
    const/4 v0, 0x1

    invoke-static {v0}, Lmil/jfcom/cie/media/srtp/packetizer/SpeexFormat;->setFramesPerPacket(I)V

    .line 85
    const/16 v0, 0x10

    new-array v5, v0, [B

    fill-array-data v5, :array_0

    .line 90
    .local v5, "masterKey":[B
    const/16 v0, 0xe

    new-array v6, v0, [B

    fill-array-data v6, :array_1

    .line 92
    .local v6, "masterSalt":[B
    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    invoke-static {v0, p1}, Lmil/jfcom/cie/media/session/MediaSession;->getLocalPorts(Ljava/net/InetAddress;I)[Ljava/net/DatagramSocket;

    move-result-object v2

    .local v2, "localPorts":[Ljava/net/DatagramSocket;
    move-object v0, p2

    move v1, p3

    move/from16 v3, p5

    move/from16 v4, p6

    .line 93
    invoke-static/range {v0 .. v6}, Lmil/jfcom/cie/media/session/MediaSession;->createInstance(Ljava/lang/String;I[Ljava/net/DatagramSocket;IZ[B[B)Lmil/jfcom/cie/media/session/MediaSession;

    move-result-object v7

    .line 94
    .local v7, "session":Lmil/jfcom/cie/media/session/MediaSession;
    invoke-virtual {v7, p4}, Lmil/jfcom/cie/media/session/MediaSession;->setListener(Lmil/jfcom/cie/media/session/MediaSessionListener;)V

    .line 96
    const/4 v0, 0x4

    new-array v0, v0, [Ljavax/media/rtp/rtcp/SourceDescription;

    const/4 v1, 0x0

    new-instance v3, Ljavax/media/rtp/rtcp/SourceDescription;

    const/4 v4, 0x2

    const-string/jumbo v8, "Superman"

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct {v3, v4, v8, v9, v10}, Ljavax/media/rtp/rtcp/SourceDescription;-><init>(ILjava/lang/String;IZ)V

    aput-object v3, v0, v1

    const/4 v1, 0x1

    new-instance v3, Ljavax/media/rtp/rtcp/SourceDescription;

    const/4 v4, 0x3

    const-string/jumbo v8, "cdcie.tester@je.jfcom.mil"

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct {v3, v4, v8, v9, v10}, Ljavax/media/rtp/rtcp/SourceDescription;-><init>(ILjava/lang/String;IZ)V

    aput-object v3, v0, v1

    const/4 v1, 0x2

    new-instance v3, Ljavax/media/rtp/rtcp/SourceDescription;

    const/4 v4, 0x5

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " Port "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v7}, Lmil/jfcom/cie/media/session/MediaSession;->getLocalDataPort()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct {v3, v4, v8, v9, v10}, Ljavax/media/rtp/rtcp/SourceDescription;-><init>(ILjava/lang/String;IZ)V

    aput-object v3, v0, v1

    const/4 v1, 0x3

    new-instance v3, Ljavax/media/rtp/rtcp/SourceDescription;

    const/4 v4, 0x6

    const-string/jumbo v8, "JFCOM CDCIE Audio Chat"

    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-direct {v3, v4, v8, v9, v10}, Ljavax/media/rtp/rtcp/SourceDescription;-><init>(ILjava/lang/String;IZ)V

    aput-object v3, v0, v1

    invoke-virtual {v7, v0}, Lmil/jfcom/cie/media/session/MediaSession;->setSourceDescription([Ljavax/media/rtp/rtcp/SourceDescription;)V

    .line 97
    return-object v7

    .line 85
    nop

    :array_0
    .array-data 1
        -0x1ft
        -0x7t
        0x7at
        0xdt
        0x3et
        0x1t
        -0x75t
        -0x20t
        -0x2at
        0x4ft
        -0x5dt
        0x2ct
        0x6t
        -0x22t
        0x41t
        0x39t
    .end array-data

    .line 90
    :array_1
    .array-data 1
        0xet
        -0x3at
        0x75t
        -0x53t
        0x49t
        -0x76t
        -0x2t
        -0x15t
        -0x4at
        -0x6at
        0xbt
        0x3at
        -0x55t
        -0x1at
    .end array-data
.end method


# virtual methods
.method protected getFreePort()I
    .locals 12

    .prologue
    .line 220
    const/4 v1, 0x0

    .line 222
    .local v1, "freePort":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v5, 0xa

    if-ge v3, v5, :cond_1

    .line 223
    const-wide/16 v6, 0x2710

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    const-wide v10, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v1, v6

    .line 224
    rem-int/lit8 v5, v1, 0x2

    if-nez v5, :cond_0

    .line 226
    :goto_1
    :try_start_0
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4, v1}, Ljava/net/ServerSocket;-><init>(I)V

    .line 227
    .local v4, "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 228
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v1

    .line 243
    .end local v1    # "freePort":I
    .end local v4    # "ss":Ljava/net/ServerSocket;
    .local v2, "freePort":I
    :goto_2
    return v2

    .line 224
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 231
    :catch_0
    move-exception v0

    .line 232
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 222
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 236
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/ServerSocket;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/net/ServerSocket;-><init>(I)V

    .line 237
    .restart local v4    # "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 238
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v4    # "ss":Ljava/net/ServerSocket;
    :goto_3
    move v2, v1

    .line 243
    .end local v1    # "freePort":I
    .restart local v2    # "freePort":I
    goto :goto_2

    .line 240
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :catch_1
    move-exception v0

    .line 241
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public initialize()V
    .locals 9

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSymmetric()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 126
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v2

    .line 127
    .local v2, "ip":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, "localIp":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getFreePort()I

    move-result v1

    .line 129
    .local v1, "localPort":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSymmetric()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    .line 131
    .local v3, "remotePort":I
    sget-object v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "->"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 142
    :goto_0
    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v4, p0

    :try_start_0
    invoke-static/range {v0 .. v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->createSession(Ljava/lang/String;ILjava/lang/String;ILmil/jfcom/cie/media/session/MediaSessionListener;IZZ)Lmil/jfcom/cie/media/session/MediaSession;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->mediaSession:Lmil/jfcom/cie/media/session/MediaSession;
    :try_end_0
    .catch Ljavax/media/NoProcessorException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/media/format/UnsupportedFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_3

    .line 156
    :goto_1
    return-void

    .line 135
    .end local v0    # "localIp":Ljava/lang/String;
    .end local v1    # "localPort":I
    .end local v2    # "ip":Ljava/lang/String;
    .end local v3    # "remotePort":I
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v2

    .line 136
    .restart local v2    # "ip":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v0

    .line 137
    .restart local v0    # "localIp":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v1

    .line 138
    .restart local v1    # "localPort":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    .restart local v3    # "remotePort":I
    goto :goto_0

    .line 144
    :catch_0
    move-exception v8

    .line 145
    .local v8, "e":Ljavax/media/NoProcessorException;
    invoke-virtual {v8}, Ljavax/media/NoProcessorException;->printStackTrace()V

    goto :goto_1

    .line 147
    .end local v8    # "e":Ljavax/media/NoProcessorException;
    :catch_1
    move-exception v8

    .line 148
    .local v8, "e":Ljavax/media/format/UnsupportedFormatException;
    invoke-virtual {v8}, Ljavax/media/format/UnsupportedFormatException;->printStackTrace()V

    goto :goto_1

    .line 150
    .end local v8    # "e":Ljavax/media/format/UnsupportedFormatException;
    :catch_2
    move-exception v8

    .line 151
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 153
    .end local v8    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v8

    .line 154
    .local v8, "e":Ljava/security/GeneralSecurityException;
    invoke-virtual {v8}, Ljava/security/GeneralSecurityException;->printStackTrace()V

    goto :goto_1
.end method

.method public newStreamIdentified(Lmil/jfcom/cie/media/session/StreamPlayer;)V
    .locals 0
    .param p1, "streamPlayer"    # Lmil/jfcom/cie/media/session/StreamPlayer;

    .prologue
    .line 205
    return-void
.end method

.method public senderReportReceived(Ljavax/media/rtp/rtcp/SenderReport;)V
    .locals 0
    .param p1, "report"    # Ljavax/media/rtp/rtcp/SenderReport;

    .prologue
    .line 208
    return-void
.end method

.method public setTrasmit(Z)V
    .locals 0
    .param p1, "active"    # Z

    .prologue
    .line 180
    return-void
.end method

.method public startReceive()V
    .locals 0

    .prologue
    .line 187
    return-void
.end method

.method public startTrasmit()V
    .locals 3

    .prologue
    .line 163
    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "start"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 164
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->mediaSession:Lmil/jfcom/cie/media/session/MediaSession;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lmil/jfcom/cie/media/session/MediaSession;->start(Z)V

    .line 165
    const-string/jumbo v1, ""

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->mediaReceived(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :goto_0
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public stopReceive()V
    .locals 0

    .prologue
    .line 202
    return-void
.end method

.method public stopTrasmit()V
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->mediaSession:Lmil/jfcom/cie/media/session/MediaSession;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/AudioMediaSession;->mediaSession:Lmil/jfcom/cie/media/session/MediaSession;

    invoke-virtual {v0}, Lmil/jfcom/cie/media/session/MediaSession;->close()V

    .line 195
    :cond_0
    return-void
.end method

.method public streamClosed(Lmil/jfcom/cie/media/session/StreamPlayer;Z)V
    .locals 0
    .param p1, "stream"    # Lmil/jfcom/cie/media/session/StreamPlayer;
    .param p2, "timeout"    # Z

    .prologue
    .line 211
    return-void
.end method
