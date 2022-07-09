.class Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;
.super Ljava/lang/Object;
.source "TcpUdpBridgeServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->startBridge()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

.field final synthetic val$process:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;Ljava/lang/Thread;)V
    .locals 0

    .prologue
    .line 99
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->val$process:Ljava/lang/Thread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 104
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    invoke-static {v7}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$300(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;)Ljava/net/ServerSocket;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$002(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;Ljava/net/Socket;)Ljava/net/Socket;

    .line 105
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->val$process:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 106
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    invoke-static {v6}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;)Ljava/net/Socket;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 107
    .local v2, "in":Ljava/io/InputStream;
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    invoke-static {v6}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$400(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v3

    .line 110
    .local v3, "remoteHost":Ljava/net/InetAddress;
    :goto_0
    const/16 v6, 0x1f4

    new-array v0, v6, [B

    .line 112
    .local v0, "b":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 115
    .local v4, "s":I
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$200()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "TCP Server:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    const-string/jumbo v10, "UTF-8"

    invoke-direct {v8, v0, v9, v4, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 117
    new-instance v5, Ljava/net/DatagramPacket;

    invoke-direct {v5, v0, v4}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 119
    .local v5, "udpPacket":Ljava/net/DatagramPacket;
    invoke-virtual {v5, v3}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 120
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    invoke-static {v6}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$500(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 122
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;

    invoke-static {v6}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeServer;)Ljava/net/DatagramSocket;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 127
    .end local v0    # "b":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "remoteHost":Ljava/net/InetAddress;
    .end local v4    # "s":I
    .end local v5    # "udpPacket":Ljava/net/DatagramPacket;
    :catch_0
    move-exception v1

    .line 128
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 130
    return-void
.end method
