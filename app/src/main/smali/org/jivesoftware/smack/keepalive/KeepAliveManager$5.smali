.class Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->schedulePingServerTask()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V
    .locals 0

    .prologue
    .line 274
    iput-object p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 277
    new-instance v0, Lorg/jivesoftware/smack/ping/packet/Ping;

    invoke-direct {v0}, Lorg/jivesoftware/smack/ping/packet/Ping;-><init>()V

    .line 278
    .local v0, "ping":Lorg/jivesoftware/smack/ping/packet/Ping;
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/ping/packet/Ping;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    .line 279
    .local v2, "responseFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$400(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 280
    .local v1, "response":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$400(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 282
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$700(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 284
    invoke-static {}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$800()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    new-instance v4, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;

    invoke-direct {v4, p0, v1}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;-><init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;Lorg/jivesoftware/smack/PacketCollector;)V

    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v3, v4, v6, v7, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 301
    :cond_0
    return-void
.end method
