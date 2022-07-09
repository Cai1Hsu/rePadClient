.class Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$3;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V
    .locals 0

    .prologue
    .line 267
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$3;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 7
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 272
    iget-object v5, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$3;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled()Z

    move-result v5

    if-nez v5, :cond_1

    .line 287
    :cond_0
    :goto_0
    return-void

    .line 275
    :cond_1
    const-string/jumbo v5, "c"

    const-string/jumbo v6, "http://jabber.org/protocol/caps"

    invoke-virtual {p1, v5, v6}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;

    .line 278
    .local v0, "ext":Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;->getHash()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 279
    .local v2, "hash":Ljava/lang/String;
    invoke-static {}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$500()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v1

    .line 283
    .local v1, "from":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;->getNode()Ljava/lang/String;

    move-result-object v3

    .line 284
    .local v3, "node":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;->getVer()Ljava/lang/String;

    move-result-object v4

    .line 286
    .local v4, "ver":Ljava/lang/String;
    sget-object v5, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    new-instance v6, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    invoke-direct {v6, v3, v4, v2}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
