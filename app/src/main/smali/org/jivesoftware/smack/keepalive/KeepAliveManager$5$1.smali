.class Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;

.field final synthetic val$response:Lorg/jivesoftware/smack/PacketCollector;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;Lorg/jivesoftware/smack/PacketCollector;)V
    .locals 0

    .prologue
    .line 284
    iput-object p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;->this$1:Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;

    iput-object p2, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;->val$response:Lorg/jivesoftware/smack/PacketCollector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 287
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;->val$response:Lorg/jivesoftware/smack/PacketCollector;

    const-wide/16 v4, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v2

    .line 290
    .local v2, "result":Lorg/jivesoftware/smack/packet/Packet;
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;->val$response:Lorg/jivesoftware/smack/PacketCollector;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 293
    if-nez v2, :cond_0

    .line 294
    iget-object v3, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5$1;->this$1:Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;

    iget-object v3, v3, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$5;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$700(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ping/PingFailedListener;

    .line 295
    .local v1, "listener":Lorg/jivesoftware/smack/ping/PingFailedListener;
    invoke-interface {v1}, Lorg/jivesoftware/smack/ping/PingFailedListener;->pingFailed()V

    goto :goto_0

    .line 298
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ping/PingFailedListener;
    :cond_0
    return-void
.end method
