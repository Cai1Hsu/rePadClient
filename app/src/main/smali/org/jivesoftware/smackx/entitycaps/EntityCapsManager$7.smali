.class Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"

# interfaces
.implements Lorg/jivesoftware/smackx/NodeInformationProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->updateLocalEntityCaps()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field identities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation
.end field

.field packetExtensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V
    .locals 2

    .prologue
    .line 460
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 461
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-static {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$700(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getFeaturesList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->features:Ljava/util/List;

    .line 462
    new-instance v0, Ljava/util/LinkedList;

    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getIdentities()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->identities:Ljava/util/List;

    .line 463
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-static {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$700(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getExtendedInfoAsList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->packetExtensions:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getNodeFeatures()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 472
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->features:Ljava/util/List;

    return-object v0
.end method

.method public getNodeIdentities()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 477
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->identities:Ljava/util/List;

    return-object v0
.end method

.method public getNodeItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 467
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNodePacketExtensions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation

    .prologue
    .line 482
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;->packetExtensions:Ljava/util/List;

    return-object v0
.end method
