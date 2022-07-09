.class public Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "OfferConfirmation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation$NotifyServicePacket;,
        Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation$Provider;
    }
.end annotation


# instance fields
.field private sessionID:J

.field private userJID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 98
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<offer-confirmation xmlns=\"http://jabber.org/protocol/workgroup\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string/jumbo v1, "</offer-confirmation>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getSessionID()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;->sessionID:J

    return-wide v0
.end method

.method public getUserJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;->userJID:Ljava/lang/String;

    return-object v0
.end method

.method public notifyService(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "workgroup"    # Ljava/lang/String;
    .param p3, "createdRoomName"    # Ljava/lang/String;

    .prologue
    .line 50
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation$NotifyServicePacket;

    invoke-direct {v0, p0, p2, p3}, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation$NotifyServicePacket;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .local v0, "packet":Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation$NotifyServicePacket;
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 52
    return-void
.end method

.method public setSessionID(J)V
    .locals 1
    .param p1, "sessionID"    # J

    .prologue
    .line 45
    iput-wide p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;->sessionID:J

    .line 46
    return-void
.end method

.method public setUserJID(Ljava/lang/String;)V
    .locals 0
    .param p1, "userJID"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/OfferConfirmation;->userJID:Ljava/lang/String;

    .line 38
    return-void
.end method
