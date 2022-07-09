.class public abstract Lorg/jivesoftware/smackx/pubsub/Node;
.super Ljava/lang/Object;
.source "Node.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;,
        Lorg/jivesoftware/smackx/pubsub/Node$NodeConfigTranslator;,
        Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;,
        Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;
    }
.end annotation


# instance fields
.field protected con:Lorg/jivesoftware/smack/Connection;

.field protected configEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;",
            "Lorg/jivesoftware/smack/PacketListener;",
            ">;"
        }
    .end annotation
.end field

.field protected id:Ljava/lang/String;

.field protected itemDeleteToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;",
            "Lorg/jivesoftware/smack/PacketListener;",
            ">;"
        }
    .end annotation
.end field

.field protected itemEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener",
            "<",
            "Lorg/jivesoftware/smackx/pubsub/Item;",
            ">;",
            "Lorg/jivesoftware/smack/PacketListener;",
            ">;"
        }
    .end annotation
.end field

.field protected to:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "nodeName"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 57
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemDeleteToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 58
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->configEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 69
    iput-object p1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    .line 70
    iput-object p2, p0, Lorg/jivesoftware/smackx/pubsub/Node;->id:Ljava/lang/String;

    .line 71
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/packet/Packet;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 50
    invoke-static {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getSubscriptionIds(Lorg/jivesoftware/smack/packet/Packet;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static getSubscriptionIds(Lorg/jivesoftware/smack/packet/Packet;)Ljava/util/List;
    .locals 6
    .param p0, "packet"    # Lorg/jivesoftware/smack/packet/Packet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/Packet;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 371
    const-string/jumbo v4, "headers"

    const-string/jumbo v5, "http://jabber.org/protocol/shim"

    invoke-virtual {p0, v4, v5}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/HeadersExtension;

    .line 372
    .local v1, "headers":Lorg/jivesoftware/smackx/packet/HeadersExtension;
    const/4 v3, 0x0

    .line 374
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 376
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/HeadersExtension;->getHeaders()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 378
    .restart local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/HeadersExtension;->getHeaders()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/Header;

    .line 380
    .local v0, "header":Lorg/jivesoftware/smackx/packet/Header;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 383
    .end local v0    # "header":Lorg/jivesoftware/smackx/packet/Header;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object v3
.end method


# virtual methods
.method public addConfigurationListener(Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;)V
    .locals 4
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;

    .prologue
    .line 293
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/Node$NodeConfigTranslator;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/pubsub/Node$NodeConfigTranslator;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;)V

    .line 294
    .local v0, "conListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->configEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    new-instance v2, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/EventElementType;->configuration:Lorg/jivesoftware/smackx/pubsub/EventElementType;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/EventElementType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 296
    return-void
.end method

.method public addItemDeleteListener(Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;)V
    .locals 5
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    .prologue
    .line 319
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/pubsub/Node$ItemDeleteTranslator;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;)V

    .line 320
    .local v0, "delListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v3, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemDeleteToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    new-instance v1, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/EventElementType;->items:Lorg/jivesoftware/smackx/pubsub/EventElementType;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/EventElementType;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "retract"

    invoke-direct {v1, p0, v3, v4}, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .local v1, "deleteItem":Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;
    new-instance v2, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/EventElementType;->purge:Lorg/jivesoftware/smackx/pubsub/EventElementType;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/EventElementType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Ljava/lang/String;)V

    .line 324
    .local v2, "purge":Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;
    iget-object v3, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    new-instance v4, Lorg/jivesoftware/smack/filter/OrFilter;

    invoke-direct {v4, v1, v2}, Lorg/jivesoftware/smack/filter/OrFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v3, v0, v4}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 325
    return-void
.end method

.method public addItemEventListener(Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;)V
    .locals 5
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

    .prologue
    .line 267
    new-instance v0, Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/pubsub/Node$ItemEventTranslator;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;)V

    .line 268
    .local v0, "conListener":Lorg/jivesoftware/smack/PacketListener;
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    new-instance v2, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/EventElementType;->items:Lorg/jivesoftware/smackx/pubsub/EventElementType;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/pubsub/EventElementType;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "item"

    invoke-direct {v2, p0, v3, v4}, Lorg/jivesoftware/smackx/pubsub/Node$EventContentFilter;-><init>(Lorg/jivesoftware/smackx/pubsub/Node;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 270
    return-void
.end method

.method protected createPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    .locals 1
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;
    .param p2, "ext"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 348
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/pubsub/Node;->createPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    move-result-object v0

    return-object v0
.end method

.method protected createPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    .locals 1
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;
    .param p2, "ext"    # Lorg/jivesoftware/smack/packet/PacketExtension;
    .param p3, "ns"    # Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    .prologue
    .line 353
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->to:Ljava/lang/String;

    invoke-static {v0, p1, p2, p3}, Lorg/jivesoftware/smackx/pubsub/PubSubManager;->createPubsubPacket(Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    move-result-object v0

    return-object v0
.end method

.method public discoverInfo()Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 129
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->to:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 131
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1, v0}, Lorg/jivesoftware/smackx/pubsub/packet/SyncPacketSend;->getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    return-object v1
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getNodeConfiguration()Lorg/jivesoftware/smackx/pubsub/ConfigureForm;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 102
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v2, Lorg/jivesoftware/smackx/pubsub/NodeExtension;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smackx/pubsub/NodeExtension;-><init>(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;Ljava/lang/String;)V

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-virtual {p0, v1, v2, v3}, Lorg/jivesoftware/smackx/pubsub/Node;->sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    .line 103
    .local v0, "reply":Lorg/jivesoftware/smack/packet/Packet;
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/pubsub/util/NodeUtils;->getFormFromPacket(Lorg/jivesoftware/smack/packet/Packet;Lorg/jivesoftware/smackx/pubsub/PubSubElementType;)Lorg/jivesoftware/smackx/pubsub/ConfigureForm;

    move-result-object v1

    return-object v1
.end method

.method public getSubscriptionOptions(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/SubscribeForm;
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 236
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/pubsub/Node;->getSubscriptionOptions(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/SubscribeForm;

    move-result-object v0

    return-object v0
.end method

.method public getSubscriptionOptions(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/SubscribeForm;
    .locals 5
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "subscriptionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 253
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v3, Lorg/jivesoftware/smackx/pubsub/OptionsExtension;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p1, v4, p2}, Lorg/jivesoftware/smackx/pubsub/OptionsExtension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smackx/pubsub/Node;->sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    .line 254
    .local v1, "packet":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->OPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->getExtension(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/FormNode;

    .line 255
    .local v0, "ext":Lorg/jivesoftware/smackx/pubsub/FormNode;
    new-instance v2, Lorg/jivesoftware/smackx/pubsub/SubscribeForm;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/FormNode;->getForm()Lorg/jivesoftware/smackx/Form;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/pubsub/SubscribeForm;-><init>(Lorg/jivesoftware/smackx/Form;)V

    return-object v2
.end method

.method public getSubscriptions()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/pubsub/Subscription;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 144
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v3, Lorg/jivesoftware/smackx/pubsub/NodeExtension;

    sget-object v4, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/jivesoftware/smackx/pubsub/NodeExtension;-><init>(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smackx/pubsub/Node;->sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    .line 145
    .local v0, "reply":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTIONS:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->getExtension(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/pubsub/SubscriptionsExtension;

    .line 146
    .local v1, "subElem":Lorg/jivesoftware/smackx/pubsub/SubscriptionsExtension;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/pubsub/SubscriptionsExtension;->getSubscriptions()Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public removeConfigurationListener(Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/NodeConfigListener;

    .prologue
    .line 305
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->configEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketListener;

    .line 307
    .local v0, "conListener":Lorg/jivesoftware/smack/PacketListener;
    if-eqz v0, :cond_0

    .line 308
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 309
    :cond_0
    return-void
.end method

.method public removeItemDeleteListener(Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemDeleteListener;

    .prologue
    .line 334
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemDeleteToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketListener;

    .line 336
    .local v0, "conListener":Lorg/jivesoftware/smack/PacketListener;
    if-eqz v0, :cond_0

    .line 337
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 338
    :cond_0
    return-void
.end method

.method public removeItemEventListener(Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/pubsub/listener/ItemEventListener;

    .prologue
    .line 279
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->itemEventToListenerMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/PacketListener;

    .line 281
    .local v0, "conListener":Lorg/jivesoftware/smack/PacketListener;
    if-eqz v0, :cond_0

    .line 282
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 283
    :cond_0
    return-void
.end method

.method public sendConfigurationForm(Lorg/jivesoftware/smackx/Form;)V
    .locals 5
    .param p1, "submitForm"    # Lorg/jivesoftware/smackx/Form;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 114
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v2, Lorg/jivesoftware/smackx/pubsub/FormNode;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/FormNodeType;->CONFIGURE_OWNER:Lorg/jivesoftware/smackx/pubsub/FormNodeType;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4, p1}, Lorg/jivesoftware/smackx/pubsub/FormNode;-><init>(Lorg/jivesoftware/smackx/pubsub/FormNodeType;Ljava/lang/String;Lorg/jivesoftware/smackx/Form;)V

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->OWNER:Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    invoke-virtual {p0, v1, v2, v3}, Lorg/jivesoftware/smackx/pubsub/Node;->createPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    move-result-object v0

    .line 115
    .local v0, "packet":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    invoke-static {v1, v0}, Lorg/jivesoftware/smackx/pubsub/packet/SyncPacketSend;->getReply(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smack/packet/Packet;

    .line 116
    return-void
.end method

.method protected sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;
    .param p2, "ext"    # Lorg/jivesoftware/smackx/pubsub/NodeExtension;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 359
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->to:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Lorg/jivesoftware/smackx/pubsub/PubSubManager;->sendPubsubPacket(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    return-object v0
.end method

.method protected sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;
    .param p2, "ext"    # Lorg/jivesoftware/smackx/pubsub/NodeExtension;
    .param p3, "ns"    # Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 365
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->to:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2, p3}, Lorg/jivesoftware/smackx/pubsub/PubSubManager;->sendPubsubPacket(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    return-object v0
.end method

.method setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "toAddress"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->to:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public subscribe(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/Subscription;
    .locals 4
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 167
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v2, Lorg/jivesoftware/smackx/pubsub/SubscribeExtension;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lorg/jivesoftware/smackx/pubsub/SubscribeExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1, v2}, Lorg/jivesoftware/smackx/pubsub/Node;->sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    .line 168
    .local v0, "reply":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->getExtension(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/pubsub/Subscription;

    return-object v1
.end method

.method public subscribe(Ljava/lang/String;Lorg/jivesoftware/smackx/pubsub/SubscribeForm;)Lorg/jivesoftware/smackx/pubsub/Subscription;
    .locals 5
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "subForm"    # Lorg/jivesoftware/smackx/pubsub/SubscribeForm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 190
    sget-object v2, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v3, Lorg/jivesoftware/smackx/pubsub/SubscribeExtension;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Lorg/jivesoftware/smackx/pubsub/SubscribeExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smackx/pubsub/Node;->createPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smack/packet/PacketExtension;)Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    move-result-object v1

    .line 191
    .local v1, "request":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    new-instance v2, Lorg/jivesoftware/smackx/pubsub/FormNode;

    sget-object v3, Lorg/jivesoftware/smackx/pubsub/FormNodeType;->OPTIONS:Lorg/jivesoftware/smackx/pubsub/FormNodeType;

    invoke-direct {v2, v3, p2}, Lorg/jivesoftware/smackx/pubsub/FormNode;-><init>(Lorg/jivesoftware/smackx/pubsub/FormNodeType;Lorg/jivesoftware/smackx/Form;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 192
    iget-object v2, p0, Lorg/jivesoftware/smackx/pubsub/Node;->con:Lorg/jivesoftware/smack/Connection;

    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v2, p1, v3, v1}, Lorg/jivesoftware/smackx/pubsub/PubSubManager;->sendPubsubPacket(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/packet/PubSub;)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    .line 193
    .local v0, "reply":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    sget-object v2, Lorg/jivesoftware/smackx/pubsub/PubSubElementType;->SUBSCRIPTION:Lorg/jivesoftware/smackx/pubsub/PubSubElementType;

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->getExtension(Lorg/jivesoftware/smackx/pubsub/PubSubElementType;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/pubsub/Subscription;

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/Node;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unsubscribe(Ljava/lang/String;)V
    .locals 1
    .param p1, "jid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/pubsub/Node;->unsubscribe(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public unsubscribe(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "subscriptionId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 222
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    new-instance v1, Lorg/jivesoftware/smackx/pubsub/UnsubscribeExtension;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/Node;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p1, v2, p2}, Lorg/jivesoftware/smackx/pubsub/UnsubscribeExtension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/Node;->sendPubsubPacket(Lorg/jivesoftware/smack/packet/IQ$Type;Lorg/jivesoftware/smackx/pubsub/NodeExtension;)Lorg/jivesoftware/smack/packet/Packet;

    .line 223
    return-void
.end method
