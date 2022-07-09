.class Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;
.super Ljava/lang/Object;
.source "ImageReceiver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;-><init>(Ljava/net/InetAddress;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const/16 v7, 0x400

    .line 62
    new-array v0, v7, [B

    .line 63
    .local v0, "buf":[B
    new-instance v4, Ljava/net/DatagramPacket;

    invoke-direct {v4, v0, v7}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 65
    .local v4, "p":Ljava/net/DatagramPacket;
    :cond_0
    :goto_0
    :try_start_0
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-static {v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 66
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-static {v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Ljava/net/DatagramSocket;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 68
    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getLength()I

    move-result v3

    .line 70
    .local v3, "length":I
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-static {v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->access$200(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    move-result-object v7

    new-instance v8, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v9

    const/4 v10, 0x0

    add-int/lit8 v11, v3, -0x2

    invoke-direct {v8, v9, v10, v11}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-interface {v7, v8}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;->decode(Ljava/io/ByteArrayInputStream;)Ljava/awt/image/BufferedImage;

    move-result-object v1

    .line 72
    .local v1, "bufferedImage":Ljava/awt/image/BufferedImage;
    if-eqz v1, :cond_0

    .line 74
    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v7

    add-int/lit8 v8, v3, -0x2

    aget-byte v5, v7, v8

    .line 75
    .local v5, "x":I
    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v7

    add-int/lit8 v8, v3, -0x1

    aget-byte v6, v7, v8

    .line 77
    .local v6, "y":I
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-virtual {v7, v5, v6, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->drawTile(IILjava/awt/image/BufferedImage;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    .end local v1    # "bufferedImage":Ljava/awt/image/BufferedImage;
    .end local v3    # "length":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :catch_0
    move-exception v2

    .line 84
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 86
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    return-void
.end method
