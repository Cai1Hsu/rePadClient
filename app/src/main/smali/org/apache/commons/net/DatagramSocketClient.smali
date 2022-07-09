.class public abstract Lorg/apache/commons/net/DatagramSocketClient;
.super Ljava/lang/Object;
.source "DatagramSocketClient.java"


# static fields
.field private static final __DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;


# instance fields
.field protected _isOpen_:Z

.field protected _socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

.field protected _socket_:Ljava/net/DatagramSocket;

.field protected _timeout_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    new-instance v0, Lorg/apache/commons/net/DefaultDatagramSocketFactory;

    invoke-direct {v0}, Lorg/apache/commons/net/DefaultDatagramSocketFactory;-><init>()V

    sput-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 79
    iput v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    .line 80
    iput-boolean v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 81
    sget-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    .line 82
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 160
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 162
    return-void
.end method

.method public getDefaultTimeout()I
    .locals 1

    .prologue
    .line 202
    iget v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    return v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getSoTimeout()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getSoTimeout()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    return v0
.end method

.method public open()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 99
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 101
    return-void
.end method

.method public open(I)V
    .locals 2
    .param p1, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(I)Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 119
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 121
    return-void
.end method

.method public open(ILjava/net/InetAddress;)V
    .locals 2
    .param p1, "port"    # I
    .param p2, "laddr"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/net/DatagramSocketFactory;->createDatagramSocket(ILjava/net/InetAddress;)Ljava/net/DatagramSocket;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    .line 141
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    iget v1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    invoke-virtual {v0, v1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_isOpen_:Z

    .line 143
    return-void
.end method

.method public setDatagramSocketFactory(Lorg/apache/commons/net/DatagramSocketFactory;)V
    .locals 1
    .param p1, "factory"    # Lorg/apache/commons/net/DatagramSocketFactory;

    .prologue
    .line 271
    if-nez p1, :cond_0

    .line 272
    sget-object v0, Lorg/apache/commons/net/DatagramSocketClient;->__DEFAULT_SOCKET_FACTORY:Lorg/apache/commons/net/DatagramSocketFactory;

    iput-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    .line 276
    :goto_0
    return-void

    .line 274
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socketFactory_:Lorg/apache/commons/net/DatagramSocketFactory;

    goto :goto_0
.end method

.method public setDefaultTimeout(I)V
    .locals 0
    .param p1, "timeout"    # I

    .prologue
    .line 189
    iput p1, p0, Lorg/apache/commons/net/DatagramSocketClient;->_timeout_:I

    .line 190
    return-void
.end method

.method public setSoTimeout(I)V
    .locals 1
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lorg/apache/commons/net/DatagramSocketClient;->_socket_:Ljava/net/DatagramSocket;

    invoke-virtual {v0, p1}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 217
    return-void
.end method
