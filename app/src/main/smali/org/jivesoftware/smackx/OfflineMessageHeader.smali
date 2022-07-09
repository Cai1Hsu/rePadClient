.class public Lorg/jivesoftware/smackx/OfflineMessageHeader;
.super Ljava/lang/Object;
.source "OfflineMessageHeader.java"


# instance fields
.field private jid:Ljava/lang/String;

.field private stamp:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;)V
    .locals 1
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->user:Ljava/lang/String;

    .line 53
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->jid:Ljava/lang/String;

    .line 54
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getNode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->stamp:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getStamp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->stamp:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/jivesoftware/smackx/OfflineMessageHeader;->user:Ljava/lang/String;

    return-object v0
.end method
