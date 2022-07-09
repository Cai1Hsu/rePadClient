.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
.source "ScreenShareSession.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private height:I

.field private receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

.field private transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 8
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "locator"    # Ljava/lang/String;
    .param p5, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x258

    .line 72
    const-string/jumbo v4, "Screen"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 57
    iput-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    .line 58
    iput-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    .line 59
    iput v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->width:I

    .line 60
    iput v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->height:I

    .line 73
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->initialize()V

    .line 74
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;)Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    return-object v0
.end method


# virtual methods
.method protected getFreePort()I
    .locals 12

    .prologue
    .line 171
    const/4 v1, 0x0

    .line 173
    .local v1, "freePort":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v5, 0xa

    if-ge v3, v5, :cond_1

    .line 174
    const-wide/16 v6, 0x2710

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    const-wide v10, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v1, v6

    .line 175
    rem-int/lit8 v5, v1, 0x2

    if-nez v5, :cond_0

    .line 177
    :goto_1
    :try_start_0
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4, v1}, Ljava/net/ServerSocket;-><init>(I)V

    .line 178
    .local v4, "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 179
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v1

    .line 192
    .end local v1    # "freePort":I
    .end local v4    # "ss":Ljava/net/ServerSocket;
    .local v2, "freePort":I
    :goto_2
    return v2

    .line 175
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 181
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 173
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 186
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/ServerSocket;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/net/ServerSocket;-><init>(I)V

    .line 187
    .restart local v4    # "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 188
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v4    # "ss":Ljava/net/ServerSocket;
    :goto_3
    move v2, v1

    .line 192
    .end local v1    # "freePort":I
    .restart local v2    # "freePort":I
    goto :goto_2

    .line 189
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :catch_1
    move-exception v0

    .line 190
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public initialize()V
    .locals 13

    .prologue
    const/16 v3, 0x258

    const/4 v11, 0x1

    const/4 v2, 0x0

    .line 81
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getJingleSession()Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v9

    .line 82
    .local v9, "session":Lorg/jivesoftware/smackx/jingle/JingleSession;
    if-eqz v9, :cond_0

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    :try_start_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v8

    .line 86
    .local v8, "remote":Ljava/net/InetAddress;
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    new-instance v1, Ljava/net/DatagramSocket;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/net/DatagramSocket;-><init>(I)V

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v2

    new-instance v3, Ljava/awt/Rectangle;

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v11, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->width:I

    iget v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->height:I

    invoke-direct {v3, v4, v5, v11, v12}, Ljava/awt/Rectangle;-><init>(IIII)V

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;-><init>(Ljava/net/DatagramSocket;Ljava/net/InetAddress;ILjava/awt/Rectangle;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v8    # "remote":Ljava/net/InetAddress;
    :goto_0
    return-void

    .line 88
    :catch_0
    move-exception v6

    .line 89
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 94
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v10, Ljavax/swing/JFrame;

    invoke-direct {v10}, Ljavax/swing/JFrame;-><init>()V

    .line 95
    .local v10, "window":Ljavax/swing/JFrame;
    new-instance v7, Ljavax/swing/JPanel;

    invoke-direct {v7}, Ljavax/swing/JPanel;-><init>()V

    .line 96
    .local v7, "jp":Ljavax/swing/JPanel;
    invoke-virtual {v10, v7}, Ljavax/swing/JFrame;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 98
    invoke-virtual {v10, v2, v2}, Ljavax/swing/JFrame;->setLocation(II)V

    .line 99
    invoke-virtual {v10, v3, v3}, Ljavax/swing/JFrame;->setSize(II)V

    .line 101
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession$1;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;)V

    invoke-virtual {v10, v0}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 108
    :try_start_1
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    const-string/jumbo v1, "0.0.0.0"

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->width:I

    iget v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->height:I

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;-><init>(Ljava/net/InetAddress;IIII)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    .line 110
    sget-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Receiving on:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->getLocalPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    .line 115
    :goto_1
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v7, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 116
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v0, v11}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->setVisible(Z)V

    .line 117
    invoke-virtual {v10, v11}, Ljavax/swing/JFrame;->setAlwaysOnTop(Z)V

    .line 118
    invoke-virtual {v10, v11}, Ljavax/swing/JFrame;->setVisible(Z)V

    goto :goto_0

    .line 111
    :catch_1
    move-exception v6

    .line 112
    .local v6, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v6}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_1
.end method

.method public setDecoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;)V
    .locals 1
    .param p1, "decoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .prologue
    .line 202
    if-eqz p1, :cond_0

    .line 203
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->setDecoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;)V

    .line 205
    :cond_0
    return-void
.end method

.method public setEncoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;)V
    .locals 1
    .param p1, "encoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .prologue
    .line 196
    if-eqz p1, :cond_0

    .line 197
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->setEncoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;)V

    .line 199
    :cond_0
    return-void
.end method

.method public setTrasmit(Z)V
    .locals 2
    .param p1, "active"    # Z

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->setTransmit(Z)V

    .line 137
    return-void
.end method

.method public startReceive()V
    .locals 0

    .prologue
    .line 144
    return-void
.end method

.method public startTrasmit()V
    .locals 2

    .prologue
    .line 126
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 127
    return-void
.end method

.method public stopReceive()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->receiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->stop()V

    .line 162
    :cond_0
    return-void
.end method

.method public stopTrasmit()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->transmitter:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->stop()V

    .line 153
    :cond_0
    return-void
.end method
