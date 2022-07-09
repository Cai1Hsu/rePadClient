.class public Lorg/jivesoftware/smackx/MultipleRecipientInfo;
.super Ljava/lang/Object;
.source "MultipleRecipientInfo.java"


# instance fields
.field extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/packet/MultipleAddresses;)V
    .locals 0
    .param p1, "extension"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    .line 39
    return-void
.end method


# virtual methods
.method public getCCAddresses()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    const-string/jumbo v1, "cc"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->getAddressesOfType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getReplyAddress()Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .locals 3

    .prologue
    .line 95
    iget-object v1, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    const-string/jumbo v2, "replyto"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->getAddressesOfType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 96
    .local v0, "replyTo":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    goto :goto_0
.end method

.method public getReplyRoom()Ljava/lang/String;
    .locals 3

    .prologue
    .line 71
    iget-object v1, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    const-string/jumbo v2, "replyroom"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->getAddressesOfType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 72
    .local v0, "replyRoom":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->getJid()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getTOAddresses()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    const-string/jumbo v1, "to"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->getAddressesOfType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public shouldNotReply()Z
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/jivesoftware/smackx/MultipleRecipientInfo;->extension:Lorg/jivesoftware/smackx/packet/MultipleAddresses;

    const-string/jumbo v1, "noreply"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses;->getAddressesOfType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
