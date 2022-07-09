.class public Lorg/jivesoftware/smackx/muc/Affiliate;
.super Ljava/lang/Object;
.source "Affiliate.java"


# instance fields
.field private affiliation:Ljava/lang/String;

.field private jid:Ljava/lang/String;

.field private nick:Ljava/lang/String;

.field private role:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;)V
    .locals 1
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getJid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->jid:Ljava/lang/String;

    .line 53
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->affiliation:Ljava/lang/String;

    .line 54
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getRole()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->role:Ljava/lang/String;

    .line 55
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCAdmin$Item;->getNick()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->nick:Ljava/lang/String;

    .line 56
    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V
    .locals 1
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->getJid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->jid:Ljava/lang/String;

    .line 45
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->affiliation:Ljava/lang/String;

    .line 46
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->getRole()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->role:Ljava/lang/String;

    .line 47
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->getNick()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->nick:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public getAffiliation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->affiliation:Ljava/lang/String;

    return-object v0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getNick()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->nick:Ljava/lang/String;

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/Affiliate;->role:Ljava/lang/String;

    return-object v0
.end method
