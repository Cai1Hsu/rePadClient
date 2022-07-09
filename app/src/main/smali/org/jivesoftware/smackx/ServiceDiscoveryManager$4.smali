.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;
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
    .line 249
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 251
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .line 253
    .local v0, "discoverInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v3, v4, :cond_0

    .line 254
    new-instance v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 255
    .local v2, "response":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 256
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setTo(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getPacketID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setPacketID(Ljava/lang/String;)V

    .line 258
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 263
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    .line 264
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addDiscoverInfoTo(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    .line 285
    :goto_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v3}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 287
    .end local v2    # "response":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_0
    return-void

    .line 269
    .restart local v2    # "response":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_1
    iget-object v3, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$4;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$200(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;Ljava/lang/String;)Lorg/jivesoftware/smackx/NodeInformationProvider;

    move-result-object v1

    .line 271
    .local v1, "nodeInformationProvider":Lorg/jivesoftware/smackx/NodeInformationProvider;
    if-eqz v1, :cond_2

    .line 273
    invoke-interface {v1}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodeFeatures()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeatures(Ljava/util/Collection;)V

    .line 275
    invoke-interface {v1}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodeIdentities()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addIdentities(Ljava/util/Collection;)V

    .line 277
    invoke-interface {v1}, Lorg/jivesoftware/smackx/NodeInformationProvider;->getNodePacketExtensions()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addExtensions(Ljava/util/Collection;)V

    goto :goto_0

    .line 281
    :cond_2
    sget-object v3, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 282
    new-instance v3, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v4, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->item_not_found:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto :goto_0
.end method
