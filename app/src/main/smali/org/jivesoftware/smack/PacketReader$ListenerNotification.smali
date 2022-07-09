.class Lorg/jivesoftware/smack/PacketReader$ListenerNotification;
.super Ljava/lang/Object;
.source "PacketReader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListenerNotification"
.end annotation


# instance fields
.field private packet:Lorg/jivesoftware/smack/packet/Packet;

.field final synthetic this$0:Lorg/jivesoftware/smack/PacketReader;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketReader;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0
    .param p2, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 416
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 417
    iput-object p2, p0, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;->packet:Lorg/jivesoftware/smack/packet/Packet;

    .line 418
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 421
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-static {v2}, Lorg/jivesoftware/smack/PacketReader;->access$100(Lorg/jivesoftware/smack/PacketReader;)Lorg/jivesoftware/smack/XMPPConnection;

    move-result-object v2

    iget-object v2, v2, Lorg/jivesoftware/smack/XMPPConnection;->recvListeners:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/Connection$ListenerWrapper;

    .line 422
    .local v1, "listenerWrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    iget-object v2, p0, Lorg/jivesoftware/smack/PacketReader$ListenerNotification;->packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/Connection$ListenerWrapper;->notifyListener(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0

    .line 424
    .end local v1    # "listenerWrapper":Lorg/jivesoftware/smack/Connection$ListenerWrapper;
    :cond_0
    return-void
.end method
