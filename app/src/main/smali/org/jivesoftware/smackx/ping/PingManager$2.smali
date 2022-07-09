.class Lorg/jivesoftware/smackx/ping/PingManager$2;
.super Ljava/lang/Object;
.source "PingManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/ping/PingManager;-><init>(Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ping/PingManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/ping/PingManager;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lorg/jivesoftware/smackx/ping/PingManager$2;->this$0:Lorg/jivesoftware/smackx/ping/PingManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 105
    check-cast p1, Lorg/jivesoftware/smack/ping/packet/Ping;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-static {p1}, Lorg/jivesoftware/smack/packet/IQ;->createResultIQ(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 106
    .local v0, "pong":Lorg/jivesoftware/smack/packet/IQ;
    iget-object v1, p0, Lorg/jivesoftware/smackx/ping/PingManager$2;->this$0:Lorg/jivesoftware/smackx/ping/PingManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ping/PingManager;->access$100(Lorg/jivesoftware/smackx/ping/PingManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 107
    return-void
.end method
