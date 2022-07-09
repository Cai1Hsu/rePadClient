.class public Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;
.super Ljava/lang/Object;
.source "TcpUdpBridgeClient.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private localTcpSocket:Ljava/net/Socket;

.field private localUdpPort:I

.field private localUdpSocket:Ljava/net/DatagramSocket;

.field private remoteTcpHost:Ljava/lang/String;

.field private remoteTcpPort:I

.field private remoteUdpHost:Ljava/lang/String;

.field private remoteUdpPort:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 4
    .param p1, "remoteTcpHost"    # Ljava/lang/String;
    .param p2, "remoteUdpHost"    # Ljava/lang/String;
    .param p3, "remoteTcpPort"    # I
    .param p4, "remoteUdpPort"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteTcpHost:Ljava/lang/String;

    .line 40
    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpHost:Ljava/lang/String;

    .line 41
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteTcpPort:I

    .line 42
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpPort:I

    .line 43
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpPort:I

    .line 49
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteTcpHost:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpHost:Ljava/lang/String;

    .line 51
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteTcpPort:I

    .line 52
    iput p4, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpPort:I

    .line 55
    :try_start_0
    new-instance v1, Ljava/net/Socket;

    invoke-direct {v1, p1, p3}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localTcpSocket:Ljava/net/Socket;

    .line 56
    new-instance v1, Ljava/net/DatagramSocket;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/net/DatagramSocket;-><init>(I)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpSocket:Ljava/net/DatagramSocket;

    .line 57
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v1

    iput v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpPort:I

    .line 58
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "UDP: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->startBridge()V

    .line 64
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)Ljava/net/Socket;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localTcpSocket:Ljava/net/Socket;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)Ljava/net/DatagramSocket;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpSocket:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$200()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpHost:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)I
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    .prologue
    .line 35
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->remoteUdpPort:I

    return v0
.end method


# virtual methods
.method public getLocalTcpSocket()Ljava/net/Socket;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localTcpSocket:Ljava/net/Socket;

    return-object v0
.end method

.method public getLocalUdpSocket()Ljava/net/DatagramSocket;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->localUdpSocket:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method public startBridge()V
    .locals 3

    .prologue
    .line 69
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 99
    .local v0, "process":Ljava/lang/Thread;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$2;

    invoke-direct {v2, p0, v0}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$2;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;Ljava/lang/Thread;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 132
    return-void
.end method
