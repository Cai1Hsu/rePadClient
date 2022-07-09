.class public Lorg/jivesoftware/smack/packet/PrivacyItem;
.super Ljava/lang/Object;
.source "PrivacyItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/PrivacyItem$Type;,
        Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    }
.end annotation


# instance fields
.field private allow:Z

.field private filterIQ:Z

.field private filterMessage:Z

.field private filterPresence_in:Z

.field private filterPresence_out:Z

.field private order:I

.field private rule:Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZI)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "allow"    # Z
    .param p3, "order"    # I

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterIQ:Z

    .line 50
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterMessage:Z

    .line 52
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_in:Z

    .line 54
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_out:Z

    .line 62
    invoke-static {p1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setRule(Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;)V

    .line 63
    invoke-direct {p0, p2}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setAllow(Z)V

    .line 64
    invoke-virtual {p0, p3}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setOrder(I)V

    .line 65
    return-void
.end method

.method private getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->rule:Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    return-object v0
.end method

.method private setAllow(Z)V
    .locals 0
    .param p1, "allow"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->allow:Z

    .line 84
    return-void
.end method

.method private setRule(Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;)V
    .locals 0
    .param p1, "rule"    # Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    .prologue
    .line 263
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->rule:Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    .line 264
    return-void
.end method


# virtual methods
.method public getOrder()I
    .locals 1

    .prologue
    .line 177
    iget v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->order:I

    return v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;
    .locals 1

    .prologue
    .line 217
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    if-nez v0, :cond_0

    .line 218
    const/4 v0, 0x0

    .line 220
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 236
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    if-nez v0, :cond_0

    .line 237
    const/4 v0, 0x0

    .line 239
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public isAllow()Z
    .locals 1

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->allow:Z

    return v0
.end method

.method public isFilterEverything()Z
    .locals 1

    .prologue
    .line 253
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterIQ()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterMessage()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterPresence_in()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterPresence_out()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFilterIQ()Z
    .locals 1

    .prologue
    .line 93
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterIQ:Z

    return v0
.end method

.method public isFilterMessage()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterMessage:Z

    return v0
.end method

.method public isFilterPresence_in()Z
    .locals 1

    .prologue
    .line 133
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_in:Z

    return v0
.end method

.method public isFilterPresence_out()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_out:Z

    return v0
.end method

.method public setFilterIQ(Z)V
    .locals 0
    .param p1, "filterIQ"    # Z

    .prologue
    .line 103
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterIQ:Z

    .line 104
    return-void
.end method

.method public setFilterMessage(Z)V
    .locals 0
    .param p1, "filterMessage"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterMessage:Z

    .line 124
    return-void
.end method

.method public setFilterPresence_in(Z)V
    .locals 0
    .param p1, "filterPresence_in"    # Z

    .prologue
    .line 143
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_in:Z

    .line 144
    return-void
.end method

.method public setFilterPresence_out(Z)V
    .locals 0
    .param p1, "filterPresence_out"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->filterPresence_out:Z

    .line 164
    return-void
.end method

.method public setOrder(I)V
    .locals 0
    .param p1, "order"    # I

    .prologue
    .line 190
    iput p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem;->order:I

    .line 191
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 206
    :cond_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getRule()Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->setValue(Ljava/lang/String;)V

    .line 208
    :cond_1
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<item"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isAllow()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 274
    const-string/jumbo v1, " action=\"allow\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    :goto_0
    const-string/jumbo v1, " order=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getOrder()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 280
    const-string/jumbo v1, " type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getValue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 283
    const-string/jumbo v1, " value=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterEverything()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 286
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 276
    :cond_2
    const-string/jumbo v1, " action=\"deny\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 288
    :cond_3
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterIQ()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 290
    const-string/jumbo v1, "<iq/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterMessage()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 293
    const-string/jumbo v1, "<message/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    :cond_5
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterPresence_in()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 296
    const-string/jumbo v1, "<presence-in/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->isFilterPresence_out()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 299
    const-string/jumbo v1, "<presence-out/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    :cond_7
    const-string/jumbo v1, "</item>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method
