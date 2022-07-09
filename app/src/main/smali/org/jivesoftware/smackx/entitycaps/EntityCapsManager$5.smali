.class Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$5;
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
    .line 304
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$5;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 307
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$5;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$202(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;Z)Z

    .line 308
    return-void
.end method
