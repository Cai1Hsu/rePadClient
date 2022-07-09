.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;
.super Ljava/awt/Canvas;
.source "ImageReceiver.java"


# static fields
.field private static final serialVersionUID:J = -0x6125650db18fb321L

.field private static final tileWidth:I = 0x19


# instance fields
.field private decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

.field private localHost:Ljava/net/InetAddress;

.field private localPort:I

.field private on:Z

.field private remoteHost:Ljava/net/InetAddress;

.field private remotePort:I

.field private socket:Ljava/net/DatagramSocket;

.field private tiles:[[Ljava/awt/image/BufferedImage;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;IIII)V
    .locals 3
    .param p1, "remoteHost"    # Ljava/net/InetAddress;
    .param p2, "remotePort"    # I
    .param p3, "localPort"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/awt/Canvas;-><init>()V

    .line 38
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->on:Z

    .line 49
    filled-new-array {p4, p5}, [I

    move-result-object v1

    const-class v2, Ljava/awt/image/BufferedImage;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Ljava/awt/image/BufferedImage;

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->tiles:[[Ljava/awt/image/BufferedImage;

    .line 53
    :try_start_0
    new-instance v1, Ljava/net/DatagramSocket;

    invoke-direct {v1, p3}, Ljava/net/DatagramSocket;-><init>(I)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->socket:Ljava/net/DatagramSocket;

    .line 54
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->localHost:Ljava/net/InetAddress;

    .line 55
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->remoteHost:Ljava/net/InetAddress;

    .line 56
    iput p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->remotePort:I

    .line 57
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->localPort:I

    .line 58
    new-instance v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultDecoder;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultDecoder;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .line 60
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 89
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;

    invoke-direct {v2, p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;Ljava/net/InetAddress;I)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    invoke-virtual {p0, p4, p5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->setSize(II)V

    .line 120
    return-void

    .line 116
    :catch_0
    move-exception v0

    .line 117
    .local v0, "e":Ljava/net/SocketException;
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    .prologue
    .line 35
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->on:Z

    return v0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Ljava/net/DatagramSocket;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->socket:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    return-object v0
.end method


# virtual methods
.method public drawTile(IILjava/awt/image/BufferedImage;)V
    .locals 3
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "bufferedImage"    # Ljava/awt/image/BufferedImage;

    .prologue
    .line 143
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->tiles:[[Ljava/awt/image/BufferedImage;

    aget-object v0, v0, p1

    aput-object p3, v0, p2

    .line 145
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->getGraphics()Ljava/awt/Graphics;

    move-result-object v0

    mul-int/lit8 v1, p1, 0x19

    mul-int/lit8 v2, p2, 0x19

    invoke-virtual {v0, p3, v1, v2, p0}, Ljava/awt/Graphics;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 146
    return-void
.end method

.method public getDatagramSocket()Ljava/net/DatagramSocket;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->socket:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method public getDecoder()Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    return-object v0
.end method

.method public getLocalHost()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->localHost:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->localPort:I

    return v0
.end method

.method public getRemoteHost()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->remoteHost:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->remotePort:I

    return v0
.end method

.method public paint(Ljava/awt/Graphics;)V
    .locals 5
    .param p1, "g"    # Ljava/awt/Graphics;

    .prologue
    .line 149
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->tiles:[[Ljava/awt/image/BufferedImage;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 150
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->tiles:[[Ljava/awt/image/BufferedImage;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 151
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->tiles:[[Ljava/awt/image/BufferedImage;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    mul-int/lit8 v3, v0, 0x19

    mul-int/lit8 v4, v1, 0x19

    invoke-virtual {p1, v2, v3, v4, p0}, Ljava/awt/Graphics;->drawImage(Ljava/awt/Image;IILjava/awt/image/ImageObserver;)Z

    .line 150
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 149
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 154
    .end local v1    # "j":I
    :cond_1
    return-void
.end method

.method public setDecoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;)V
    .locals 0
    .param p1, "decoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .line 162
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 165
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->on:Z

    .line 166
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 167
    return-void
.end method
