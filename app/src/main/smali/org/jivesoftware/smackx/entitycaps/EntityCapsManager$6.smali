.class Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketInterceptor;


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
    .line 315
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 317
    iget-object v1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$600(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 322
    :goto_0
    return-void

    .line 320
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;

    const-string/jumbo v1, "http://www.igniterealtime.org/projects/smack"

    iget-object v2, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getCapsVersion()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "sha-1"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .local v0, "caps":Lorg/jivesoftware/smackx/entitycaps/packet/CapsExtension;
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/packet/Packet;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0
.end method
