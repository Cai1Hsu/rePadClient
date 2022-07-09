.class Lorg/jivesoftware/smackx/jingle/JingleSession$2;
.super Ljava/lang/Object;
.source "JingleSession.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/JingleSession;->updatePacketListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0

    .prologue
    .line 677
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$2;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 680
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$2;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    check-cast p1, Lorg/jivesoftware/smack/packet/IQ;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->receivePacketAndRespond(Lorg/jivesoftware/smack/packet/IQ;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 684
    :goto_0
    return-void

    .line 681
    :catch_0
    move-exception v0

    .line 682
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method
