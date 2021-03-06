.class public Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;
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
    name = "ItemDeleteTranslator"
.end annotation


# instance fields
.field private listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

.field final synthetic this$0:Lorg/jivesoftware/smackx/pubsub/Node;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/pubsub/Node;Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;)V
    .locals 0
    .param p2, "eventListener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    .prologue
    .line 428
    iput-object p1, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;->this$0:Lorg/jivesoftware/smackx/pubsub/Node;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 429
    iput-object p2, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;->listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    .line 430
    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 434
    const-string/jumbo v8, "event"

    sget-object v9, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->EVENT:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->getXmlns()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/EventElement;

    .line 436
    .local v0, "event":Lorg/jivesoftware/smackx/pubsub/EventElement;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/EventElement;->getExtensions()Ljava/util/List;

    move-result-object v2

    .line 438
    .local v2, "extList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    const/4 v8, 0x0

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jivesoftware/smack/packet/PacketExtension;

    invoke-interface {v8}, Lorg/jivesoftware/smack/packet/PacketExtension;->getElementName()Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->PURGE_EVENT:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->getElementName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 440
    iget-object v8, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;->listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    invoke-interface {v8}, Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;->handlePurge()V

    .line 458
    :goto_0
    return-void

    .line 444
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/EventElement;->getEvent()Lorg/jivesoftware/smackx/pubsub/NodeExtension;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;

    .line 445
    .local v6, "itemsElem":Lorg/jivesoftware/smackx/pubsub/ItemsExtension;
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;->getItems()Ljava/util/List;

    move-result-object v7

    .line 446
    .local v7, "pubItems":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 447
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/pubsub/RetractItem;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v8

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 449
    .local v5, "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 451
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/pubsub/RetractItem;

    .line 452
    .local v4, "item":Lorg/jivesoftware/smackx/pubsub/RetractItem;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/pubsub/RetractItem;->getId()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 455
    .end local v4    # "item":Lorg/jivesoftware/smackx/pubsub/RetractItem;
    :cond_1
    new-instance v1, Lorg/jivesoftware/smackx/pubsub/ItemDeleteEvent;

    invoke-virtual {v6}, Lorg/jivesoftware/smackx/pubsub/ItemsExtension;->getNode()Ljava/lang/String;

    move-result-object v8

    invoke-static {p1}, Lorg/jivesoftware/smackx/pubsub/Node;->access$000(Lorg/jivesoftware/smack/packet/Packet;)Ljava/util/List;

    move-result-object v9

    invoke-direct {v1, v8, v5, v9}, Lorg/jivesoftware/smackx/pubsub/ItemDeleteEvent;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 456
    .local v1, "eventItems":Lorg/jivesoftware/smackx/pubsub/ItemDeleteEvent;
    iget-object v8, p0, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;->listener:Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    invoke-interface {v8, v1}, Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;->handleDeletedItems(Lorg/jivesoftware/smackx/pubsub/ItemDeleteEvent;)V

    goto :goto_0
.end method
