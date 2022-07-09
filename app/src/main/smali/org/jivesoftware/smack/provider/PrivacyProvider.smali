.class public Lorg/jivesoftware/smack/provider/PrivacyProvider;
.super Ljava/lang/Object;
.source "PrivacyProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 9
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 42
    new-instance v4, Lorg/jivesoftware/smack/packet/Privacy;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Privacy;-><init>()V

    .line 45
    .local v4, "privacy":Lorg/jivesoftware/smack/packet/Privacy;
    new-instance v5, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/packet/Privacy;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 46
    const/4 v2, 0x0

    .line 47
    .local v2, "done":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_6

    .line 48
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 49
    .local v3, "eventType":I
    const/4 v5, 0x2

    if-ne v3, v5, :cond_5

    .line 50
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "active"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 51
    const-string/jumbo v5, ""

    const-string/jumbo v6, "name"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "activeName":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 53
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/Privacy;->setDeclineActiveList(Z)V

    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {v4, v0}, Lorg/jivesoftware/smack/packet/Privacy;->setActiveName(Ljava/lang/String;)V

    goto :goto_0

    .line 58
    .end local v0    # "activeName":Ljava/lang/String;
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "default"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 59
    const-string/jumbo v5, ""

    const-string/jumbo v6, "name"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "defaultName":Ljava/lang/String;
    if-nez v1, :cond_3

    .line 61
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/Privacy;->setDeclineDefaultList(Z)V

    goto :goto_0

    .line 63
    :cond_3
    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/packet/Privacy;->setDefaultName(Ljava/lang/String;)V

    goto :goto_0

    .line 66
    .end local v1    # "defaultName":Ljava/lang/String;
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "list"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 67
    invoke-virtual {p0, p1, v4}, Lorg/jivesoftware/smack/provider/PrivacyProvider;->parseList(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Privacy;)V

    goto :goto_0

    .line 70
    :cond_5
    const/4 v5, 0x3

    if-ne v3, v5, :cond_0

    .line 71
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "query"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 72
    const/4 v2, 0x1

    goto :goto_0

    .line 77
    .end local v3    # "eventType":I
    :cond_6
    return-object v4
.end method

.method public parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PrivacyItem;
    .locals 11
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 104
    const/4 v2, 0x0

    .line 106
    .local v2, "done":Z
    const-string/jumbo v8, ""

    const-string/jumbo v9, "action"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "actionValue":Ljava/lang/String;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "order"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 108
    .local v6, "orderValue":Ljava/lang/String;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "type"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 114
    .local v7, "type":Ljava/lang/String;
    const/4 v1, 0x1

    .line 115
    .local v1, "allow":Z
    const-string/jumbo v8, "allow"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 116
    const/4 v1, 0x1

    .line 121
    :cond_0
    :goto_0
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 124
    .local v5, "order":I
    new-instance v4, Lorg/jivesoftware/smack/packet/PrivacyItem;

    invoke-direct {v4, v7, v1, v5}, Lorg/jivesoftware/smack/packet/PrivacyItem;-><init>(Ljava/lang/String;ZI)V

    .line 125
    .local v4, "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "value"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setValue(Ljava/lang/String;)V

    .line 127
    :cond_1
    :goto_1
    if-nez v2, :cond_7

    .line 128
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 129
    .local v3, "eventType":I
    const/4 v8, 0x2

    if-ne v3, v8, :cond_6

    .line 130
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "iq"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 131
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterIQ(Z)V

    .line 133
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "message"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterMessage(Z)V

    .line 136
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "presence-in"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 137
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterPresence_in(Z)V

    .line 139
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "presence-out"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 140
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/PrivacyItem;->setFilterPresence_out(Z)V

    goto :goto_1

    .line 117
    .end local v3    # "eventType":I
    .end local v4    # "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    .end local v5    # "order":I
    :cond_5
    const-string/jumbo v8, "deny"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 118
    const/4 v1, 0x0

    goto :goto_0

    .line 143
    .restart local v3    # "eventType":I
    .restart local v4    # "item":Lorg/jivesoftware/smack/packet/PrivacyItem;
    .restart local v5    # "order":I
    :cond_6
    const/4 v8, 0x3

    if-ne v3, v8, :cond_1

    .line 144
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "item"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 145
    const/4 v2, 0x1

    goto :goto_1

    .line 149
    .end local v3    # "eventType":I
    :cond_7
    return-object v4
.end method

.method public parseList(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/packet/Privacy;)V
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "privacy"    # Lorg/jivesoftware/smack/packet/Privacy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v0, 0x0

    .line 83
    .local v0, "done":Z
    const-string/jumbo v4, ""

    const-string/jumbo v5, "name"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 84
    .local v3, "listName":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 86
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 87
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 88
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "item"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 89
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/provider/PrivacyProvider;->parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PrivacyItem;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 92
    :cond_1
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 93
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "list"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 94
    const/4 v0, 0x1

    goto :goto_0

    .line 99
    .end local v1    # "eventType":I
    :cond_2
    invoke-virtual {p2, v3, v2}, Lorg/jivesoftware/smack/packet/Privacy;->setPrivacyList(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    .line 100
    return-void
.end method
