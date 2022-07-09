.class public Lorg/jivesoftware/smackx/packet/MUCUser;
.super Ljava/lang/Object;
.source "MUCUser.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;,
        Lorg/jivesoftware/smackx/packet/MUCUser$Status;,
        Lorg/jivesoftware/smackx/packet/MUCUser$Item;,
        Lorg/jivesoftware/smackx/packet/MUCUser$Decline;,
        Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    }
.end annotation


# instance fields
.field private decline:Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

.field private destroy:Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

.field private invite:Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

.field private item:Lorg/jivesoftware/smackx/packet/MUCUser$Item;

.field private password:Ljava/lang/String;

.field private status:Lorg/jivesoftware/smackx/packet/MUCUser$Status;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 566
    return-void
.end method


# virtual methods
.method public getDecline()Lorg/jivesoftware/smackx/packet/MUCUser$Decline;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->decline:Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    return-object v0
.end method

.method public getDestroy()Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->destroy:Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

    return-object v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    const-string/jumbo v0, "x"

    return-object v0
.end method

.method public getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->invite:Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    return-object v0
.end method

.method public getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->item:Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    const-string/jumbo v0, "http://jabber.org/protocol/muc#user"

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->status:Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    return-object v0
.end method

.method public setDecline(Lorg/jivesoftware/smackx/packet/MUCUser$Decline;)V
    .locals 0
    .param p1, "decline"    # Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->decline:Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    .line 153
    return-void
.end method

.method public setDestroy(Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;)V
    .locals 0
    .param p1, "destroy"    # Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->destroy:Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

    .line 193
    return-void
.end method

.method public setInvite(Lorg/jivesoftware/smackx/packet/MUCUser$Invite;)V
    .locals 0
    .param p1, "invite"    # Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->invite:Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    .line 143
    return-void
.end method

.method public setItem(Lorg/jivesoftware/smackx/packet/MUCUser$Item;)V
    .locals 0
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->item:Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    .line 162
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 171
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->password:Ljava/lang/String;

    .line 172
    return-void
.end method

.method public setStatus(Lorg/jivesoftware/smackx/packet/MUCUser$Status;)V
    .locals 0
    .param p1, "status"    # Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    .prologue
    .line 181
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCUser;->status:Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    .line 182
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 53
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getInvite()Lorg/jivesoftware/smackx/packet/MUCUser$Invite;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Invite;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getDecline()Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 56
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getDecline()Lorg/jivesoftware/smackx/packet/MUCUser$Decline;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Decline;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 59
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getPassword()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 62
    const-string/jumbo v1, "<password>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</password>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 65
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Status;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getDestroy()Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 68
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getDestroy()Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser$Destroy;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    :cond_5
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCUser;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
