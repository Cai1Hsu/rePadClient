.class Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Offer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/agent/Offer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RejectPacket"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/workgroup/agent/Offer;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/workgroup/agent/Offer;Ljava/lang/String;)V
    .locals 1
    .param p2, "workgroup"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/Offer;

    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 197
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;->setTo(Ljava/lang/String;)V

    .line 198
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 199
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "<offer-reject id=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/Offer;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->getSessionID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\" xmlns=\"http://jabber.org/protocol/workgroup"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\"/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
