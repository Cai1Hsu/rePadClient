.class Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;
.super Ljava/lang/Object;
.source "TcpUdpBridgeClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->startBridge()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 73
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    invoke-static {v4}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    .line 77
    .local v2, "out":Ljava/io/OutputStream;
    :cond_0
    :goto_0
    const/16 v4, 0x1f4

    new-array v0, v4, [B

    .line 78
    .local v0, "b":[B
    new-instance v3, Ljava/net/DatagramPacket;

    const/16 v4, 0x1f4

    invoke-direct {v3, v0, v4}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 80
    .local v3, "p":Ljava/net/DatagramPacket;
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;

    invoke-static {v4}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;)Ljava/net/DatagramSocket;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 81
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v4

    if-eqz v4, :cond_0

    .line 83
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->access$200()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UDP Client Received and Sending to TCP Server:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v6, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v9

    const-string/jumbo v10, "UTF-8"

    invoke-direct {v6, v7, v8, v9, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getLength()I

    move-result v6

    invoke-virtual {v2, v4, v5, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 86
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    .line 87
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/TcpUdpBridgeClient;->access$200()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v4

    const-string/jumbo v5, "Client Flush"

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 92
    .end local v0    # "b":[B
    .end local v2    # "out":Ljava/io/OutputStream;
    .end local v3    # "p":Ljava/net/DatagramPacket;
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 95
    return-void
.end method
