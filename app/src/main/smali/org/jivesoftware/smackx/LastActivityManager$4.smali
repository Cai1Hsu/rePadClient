.class Lorg/jivesoftware/smackx/LastActivityManager$4;
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
    .line 133
    iput-object p1, p0, Lorg/jivesoftware/smackx/LastActivityManager$4;->this$0:Lorg/jivesoftware/smackx/LastActivityManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 136
    new-instance v0, Lorg/jivesoftware/smackx/packet/LastActivity;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/LastActivity;-><init>()V

    .line 137
    .local v0, "message":Lorg/jivesoftware/smackx/packet/LastActivity;
    sget-object v1, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/LastActivity;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 138
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/LastActivity;->setTo(Ljava/lang/String;)V

    .line 139
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getTo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/LastActivity;->setFrom(Ljava/lang/String;)V

    .line 140
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/LastActivity;->setPacketID(Ljava/lang/String;)V

    .line 141
    iget-object v1, p0, Lorg/jivesoftware/smackx/LastActivityManager$4;->this$0:Lorg/jivesoftware/smackx/LastActivityManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/LastActivityManager;->access$200(Lorg/jivesoftware/smackx/LastActivityManager;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smackx/packet/LastActivity;->setLastActivity(J)V

    .line 143
    iget-object v1, p0, Lorg/jivesoftware/smackx/LastActivityManager$4;->this$0:Lorg/jivesoftware/smackx/LastActivityManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/LastActivityManager;->access$300(Lorg/jivesoftware/smackx/LastActivityManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 144
    return-void
.end method
