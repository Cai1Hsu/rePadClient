.class public Lorg/jivesoftware/smackx/provider/RosterExchangeProvider;
.super Ljava/lang/Object;
.source "RosterExchangeProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 9
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v6, Lorg/jivesoftware/smackx/packet/RosterExchange;

    invoke-direct {v6}, Lorg/jivesoftware/smackx/packet/RosterExchange;-><init>()V

    .line 56
    .local v6, "rosterExchange":Lorg/jivesoftware/smackx/packet/RosterExchange;
    const/4 v0, 0x0

    .line 57
    .local v0, "done":Z
    const/4 v5, 0x0

    .line 58
    .local v5, "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    const-string/jumbo v3, ""

    .line 59
    .local v3, "jid":Ljava/lang/String;
    const-string/jumbo v4, ""

    .line 60
    .local v4, "name":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v2, "groupsName":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    if-nez v0, :cond_4

    .line 62
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 63
    .local v1, "eventType":I
    const/4 v7, 0x2

    if-ne v1, v7, :cond_2

    .line 64
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "item"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 66
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "groupsName":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .restart local v2    # "groupsName":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v7, ""

    const-string/jumbo v8, "jid"

    invoke-interface {p1, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 69
    const-string/jumbo v7, ""

    const-string/jumbo v8, "name"

    invoke-interface {p1, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 71
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "group"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 72
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 74
    :cond_2
    const/4 v7, 0x3

    if-ne v1, v7, :cond_0

    .line 75
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "item"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 77
    new-instance v5, Lorg/jivesoftware/smackx/RemoteRosterEntry;

    .end local v5    # "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    check-cast v7, [Ljava/lang/String;

    invoke-direct {v5, v3, v4, v7}, Lorg/jivesoftware/smackx/RemoteRosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 78
    .restart local v5    # "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smackx/packet/RosterExchange;->addRosterEntry(Lorg/jivesoftware/smackx/RemoteRosterEntry;)V

    .line 80
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 81
    const/4 v0, 0x1

    goto :goto_0

    .line 86
    .end local v1    # "eventType":I
    :cond_4
    return-object v6
.end method
