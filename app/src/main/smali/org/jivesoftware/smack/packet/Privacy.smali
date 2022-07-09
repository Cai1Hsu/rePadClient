.class public Lorg/jivesoftware/smack/packet/Privacy;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Privacy.java"


# instance fields
.field private activeName:Ljava/lang/String;

.field private declineActiveList:Z

.field private declineDefaultList:Z

.field private defaultName:Ljava/lang/String;

.field private itemLists:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 43
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineActiveList:Z

    .line 47
    iput-boolean v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineDefaultList:Z

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->itemLists:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public changeDefaultList(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newDefault"    # Ljava/lang/String;

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Privacy;->setDefaultName(Ljava/lang/String;)V

    .line 160
    const/4 v0, 0x1

    .line 162
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public deleteList(Ljava/lang/String;)V
    .locals 1
    .param p1, "listName"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    return-void
.end method

.method public deletePrivacyList(Ljava/lang/String;)V
    .locals 1
    .param p1, "listName"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Privacy;->setDefaultName(Ljava/lang/String;)V

    .line 92
    :cond_0
    return-void
.end method

.method public getActiveName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->activeName:Ljava/lang/String;

    return-object v0
.end method

.method public getActivePrivacyList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getActiveName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 102
    const/4 v0, 0x0

    .line 104
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getActiveName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 9

    .prologue
    .line 277
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 278
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v7, "<query xmlns=\"jabber:iq:privacy\">"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->isDeclineActiveList()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 282
    const-string/jumbo v7, "<active/>"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->isDeclineDefaultList()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 290
    const-string/jumbo v7, "<default/>"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 299
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 300
    .local v6, "listName":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 302
    .local v5, "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 303
    const-string/jumbo v7, "<list name=\""

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\"/>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    :goto_3
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/PrivacyItem;

    .line 309
    .local v4, "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/PrivacyItem;->toXML()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 284
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    .end local v5    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .end local v6    # "listName":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getActiveName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 285
    const-string/jumbo v7, "<active name=\""

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getActiveName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\"/>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 292
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_1

    .line 293
    const-string/jumbo v7, "<default name=\""

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\"/>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 305
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .restart local v5    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .restart local v6    # "listName":Ljava/lang/String;
    :cond_5
    const-string/jumbo v7, "<list name=\""

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 312
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 313
    const-string/jumbo v7, "</list>"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 318
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .end local v6    # "listName":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getExtensionsXML()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    const-string/jumbo v7, "</query>"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public getDefaultName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->defaultName:Ljava/lang/String;

    return-object v0
.end method

.method public getDefaultPrivacyList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 116
    const/4 v0, 0x0

    .line 118
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    goto :goto_0
.end method

.method public getItem(Ljava/lang/String;I)Lorg/jivesoftware/smack/packet/PrivacyItem;
    .locals 4
    .param p1, "listName"    # Ljava/lang/String;
    .param p2, "order"    # I

    .prologue
    .line 140
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Privacy;->getPrivacyList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 141
    .local v2, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    const/4 v1, 0x0

    .line 142
    .local v1, "itemFound":Lorg/jivesoftware/smack/packet/PrivacyItem;
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 143
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/PrivacyItem;

    .line 144
    .local v0, "element":Lorg/jivesoftware/smack/packet/PrivacyItem;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/PrivacyItem;->getOrder()I

    move-result v3

    if-ne v3, p2, :cond_0

    .line 145
    move-object v1, v0

    goto :goto_0

    .line 148
    .end local v0    # "element":Lorg/jivesoftware/smack/packet/PrivacyItem;
    :cond_1
    return-object v1
.end method

.method public getItemLists()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 228
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->itemLists:Ljava/util/Map;

    return-object v0
.end method

.method public getPrivacyList(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "listName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getPrivacyListNames()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 273
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->itemLists:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isDeclineActiveList()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineActiveList:Z

    return v0
.end method

.method public isDeclineDefaultList()Z
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineDefaultList:Z

    return v0
.end method

.method public setActiveName(Ljava/lang/String;)V
    .locals 0
    .param p1, "activeName"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Privacy;->activeName:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setActivePrivacyList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getDefaultName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Privacy;->setActiveName(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getActiveName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public setDeclineActiveList(Z)V
    .locals 0
    .param p1, "declineActiveList"    # Z

    .prologue
    .line 246
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineActiveList:Z

    .line 247
    return-void
.end method

.method public setDeclineDefaultList(Z)V
    .locals 0
    .param p1, "declineDefaultList"    # Z

    .prologue
    .line 264
    iput-boolean p1, p0, Lorg/jivesoftware/smack/packet/Privacy;->declineDefaultList:Z

    .line 265
    return-void
.end method

.method public setDefaultName(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultName"    # Ljava/lang/String;

    .prologue
    .line 216
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Privacy;->defaultName:Ljava/lang/String;

    .line 217
    return-void
.end method

.method public setPrivacyList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .param p1, "listName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PrivacyItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, "listItem":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-object p2
.end method
