.class Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;
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

.field final synthetic val$remoteHost:Ljava/net/InetAddress;

.field final synthetic val$remotePort:I


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;Ljava/net/InetAddress;I)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->val$remoteHost:Ljava/net/InetAddress;

    iput p3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->val$remotePort:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/16 v3, 0x400

    .line 91
    new-array v0, v3, [B

    .line 92
    .local v0, "buf":[B
    new-instance v2, Ljava/net/DatagramPacket;

    invoke-direct {v2, v0, v3}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 94
    .local v2, "p":Ljava/net/DatagramPacket;
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 96
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->val$remoteHost:Ljava/net/InetAddress;

    invoke-virtual {v2, v3}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 97
    iget v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->val$remotePort:I

    invoke-virtual {v2, v3}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 98
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver$2;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;)Ljava/net/DatagramSocket;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 101
    const-wide/16 v4, 0x3e8

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 103
    :catch_0
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 109
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 110
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 112
    .end local v1    # "e":Ljava/io/IOException;
    :cond_0
    return-void
.end method
