.class public Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "DepartQueuePacket.java"


# instance fields
.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "workgroup"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "workgroup"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 56
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->user:Ljava/lang/String;

    .line 58
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->setTo(Ljava/lang/String;)V

    .line 59
    sget-object v0, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 60
    invoke-virtual {p0, p2}, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->setFrom(Ljava/lang/String;)V

    .line 61
    return-void
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "<depart-queue xmlns=\"http://jabber.org/protocol/workgroup\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->user:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 67
    const-string/jumbo v1, "><jid>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/DepartQueuePacket;->user:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</jid></depart-queue>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 70
    :cond_0
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
