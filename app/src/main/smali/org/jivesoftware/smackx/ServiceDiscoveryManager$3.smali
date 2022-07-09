.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V
    .locals 0

    .prologue
    .line 214
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 216
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    .line 218
    .local v0, "discoverItems":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_1

    .line 219
    new-instance v2, Lorg/jivesoftware/smackx/packet/DiscoverItems;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/DiscoverItems;-><init>()V

    .line 220
    .local v2, "response":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 221
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setTo(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setPacketID(Ljava/lang/String;)V

    .line 223
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setNode(Ljava/lang/String;)V

    .line 227
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v1

    .line 229
    .local v1, "nodeInformationProvider":Lorg/jivesoftware/smackx/NodeInformationProvider;
    if-eqz v1, :cond_2

    .line 231
    invoke-interface {v1}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodeItems()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->addItems(Ljava/util/Collection;)V

    .line 233
    invoke-interface {v1}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodePacketExtensions()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->addExtensions(Ljava/util/Collection;)V

    .line 240
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$3;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 242
    .end local v1    # "nodeInformationProvider":Lorg/jivesoftware/smackx/NodeInformationProvider;
    .end local v2    # "response":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :cond_1
    return-void

    .line 234
    .restart local v1    # "nodeInformationProvider":Lorg/jivesoftware/smackx/NodeInformationProvider;
    .restart local v2    # "response":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    :cond_2
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getNode()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 237
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 238
    new-instance v3, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->item_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto :goto_0
.end method
