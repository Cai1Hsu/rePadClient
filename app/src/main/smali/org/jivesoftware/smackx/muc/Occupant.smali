.class public Lorg/jivesoftware/smackx/muc/Occupant;
.super Ljava/lang/Object;
.source "Occupant.java"


# instance fields
.field private affiliation:Ljava/lang/String;

.field private jid:Ljava/lang/String;

.field private nick:Ljava/lang/String;

.field private role:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 4
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const-string/jumbo v2, "x"

    const-string/jumbo v3, "http://jabber.org/protocol/muc#user"

    invoke-virtual {p1, v2, v3}, Lorg/jivesoftware/smack/packet/Presence;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/MUCUser;

    .line 54
    .local v1, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v0

    .line 55
    .local v0, "item":Lorg/jivesoftware/smackx/packet/MUCUser$Item;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getJid()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    .line 56
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->affiliation:Ljava/lang/String;

    .line 57
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getRole()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->role:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->nick:Ljava/lang/String;

    .line 60
    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V
    .locals 1
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getJid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    .line 45
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->affiliation:Ljava/lang/String;

    .line 46
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getRole()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->role:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getNick()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->nick:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 106
    instance-of v1, p1, Lorg/jivesoftware/smackx/muc/Occupant;

    if-nez v1, :cond_0

    .line 107
    const/4 v1, 0x0

    .line 110
    :goto_0
    return v1

    :cond_0
    move-object v0, p1

    .line 109
    check-cast v0, Lorg/jivesoftware/smackx/muc/Occupant;

    .line 110
    .local v0, "occupant":Lorg/jivesoftware/smackx/muc/Occupant;
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    iget-object v2, v0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getAffiliation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->affiliation:Ljava/lang/String;

    return-object v0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getNick()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->nick:Ljava/lang/String;

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Occupant;->role:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 115
    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/Occupant;->affiliation:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 116
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x11

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->role:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 117
    mul-int/lit8 v1, v0, 0x11

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/Occupant;->jid:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 118
    mul-int/lit8 v2, v0, 0x11

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/Occupant;->nick:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/Occupant;->nick:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 119
    return v0

    .line 118
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
