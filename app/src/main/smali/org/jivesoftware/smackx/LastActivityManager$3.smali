.class Lorg/jivesoftware/smackx/LastActivityManager$3;
.super Ljava/lang/Object;
.source "LastActivityManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/LastActivityManager;-><init>(Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/LastActivityManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/LastActivityManager;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lorg/jivesoftware/smackx/LastActivityManager$3;->this$0:Lorg/jivesoftware/smackx/LastActivityManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 3
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 125
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    .line 127
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smack/packet/Message$Type;->error:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v1, v2, :cond_0

    .line 129
    :goto_0
    return-void

    .line 128
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/LastActivityManager$3;->this$0:Lorg/jivesoftware/smackx/LastActivityManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/LastActivityManager;->access$100(Lorg/jivesoftware/smackx/LastActivityManager;)V

    goto :goto_0
.end method
