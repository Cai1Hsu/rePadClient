.class public Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/pubsub/Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ItemEventTranslator"
.end annotation


# instance fields
.field private listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

.field final synthetic this$0:Lorg/jivesoftware/smackx/pubsub/Node;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/pubsub/Node;Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;)V
    .locals 0
    .param p2, "eventListener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

    .prologue
    .line 397
    iput-object p1, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;->this$0:Lorg/jivesoftware/smackx/pubsub/Node;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 398
    iput-object p2, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;->listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

    .line 399
    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 8
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 403
    const-string/jumbo v4, "event"

    sget-object v5, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->getXmlns()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/pubsub/EventElement;

    .line 404
    .local v1, "event":Lorg/jivesoftware/smackx/pubsub/EventElement;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/pubsub/EventElement;->getEvent()Lorg/jivesoftware/smackx/pubsub/NodeExtension;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;

    .line 405
    .local v3, "itemsElem":Lorg/jivesoftware/smackx/pubsub/ItemsExtension;
    const-string/jumbo v4, "delay"

    const-string/jumbo v5, "urn:xmpp:delay"

    invoke-virtual {p1, v4, v5}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DelayInformation;

    .line 408
    .local v0, "delay":Lorg/jivesoftware/smackx/packet/DelayInformation;
    if-nez v0, :cond_0

    .line 410
    const-string/jumbo v4, "x"

    const-string/jumbo v5, "jabber:x:delay"

    invoke-virtual {p1, v4, v5}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    .end local v0    # "delay":Lorg/jivesoftware/smackx/packet/DelayInformation;
    check-cast v0, Lorg/jivesoftware/smackx/packet/DelayInformation;

    .line 412
    .restart local v0    # "delay":Lorg/jivesoftware/smackx/packet/DelayInformation;
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/pubsub/ItemPublishEvent;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;->getNode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;->getItems()Ljava/util/List;

    move-result-object v6

    invoke-static {p1}, Lorg/jivesoftware/smackx/pubsub/Node;->access$000(Lorg/jivesoftware/smack/packet/Packet;)Ljava/util/List;

    move-result-object v7

    if-nez v0, :cond_1

    const/4 v4, 0x0

    :goto_0
    invoke-direct {v2, v5, v6, v7, v4}, Lorg/jivesoftware/smackx/pubsub/ItemPublishEvent;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/Date;)V

    .line 413
    .local v2, "eventItems":Lorg/jivesoftware/smackx/pubsub/ItemPublishEvent;
    iget-object v4, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;->listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

    invoke-interface {v4, v2}, Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;->handlePublishedItems(Lorg/jivesoftware/smackx/pubsub/ItemPublishEvent;)V

    .line 414
    return-void

    .line 412
    .end local v2    # "eventItems":Lorg/jivesoftware/smackx/pubsub/ItemPublishEvent;
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DelayInformation;->getStamp()Ljava/util/Date;

    move-result-object v4

    goto :goto_0
.end method
