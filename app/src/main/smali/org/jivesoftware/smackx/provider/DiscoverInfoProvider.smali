.class public Lorg/jivesoftware/smackx/provider/DiscoverInfoProvider;
.super Ljava/lang/Object;
.source "DiscoverInfoProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 12
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 38
    .local v1, "discoverInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const/4 v2, 0x0

    .line 39
    .local v2, "done":Z
    const/4 v4, 0x0

    .line 40
    .local v4, "feature":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    const/4 v5, 0x0

    .line 41
    .local v5, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    const-string/jumbo v0, ""

    .line 42
    .local v0, "category":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 43
    .local v7, "name":Ljava/lang/String;
    const-string/jumbo v8, ""

    .line 44
    .local v8, "type":Ljava/lang/String;
    const-string/jumbo v9, ""

    .line 45
    .local v9, "variable":Ljava/lang/String;
    const-string/jumbo v6, ""

    .line 46
    .local v6, "lang":Ljava/lang/String;
    const-string/jumbo v10, ""

    const-string/jumbo v11, "node"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 47
    :cond_0
    :goto_0
    if-nez v2, :cond_7

    .line 48
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 49
    .local v3, "eventType":I
    const/4 v10, 0x2

    if-ne v3, v10, :cond_3

    .line 50
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "identity"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 52
    const-string/jumbo v10, ""

    const-string/jumbo v11, "category"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    const-string/jumbo v10, ""

    const-string/jumbo v11, "name"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 54
    const-string/jumbo v10, ""

    const-string/jumbo v11, "type"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 55
    const-string/jumbo v10, "xml"

    invoke-interface {p1, v10}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "lang"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 57
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "feature"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 59
    const-string/jumbo v10, ""

    const-string/jumbo v11, "var"

    invoke-interface {p1, v10, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 66
    :cond_3
    const/4 v10, 0x3

    if-ne v3, v10, :cond_0

    .line 67
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "identity"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 69
    new-instance v5, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .end local v5    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-direct {v5, v0, v7, v8}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .restart local v5    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    if-eqz v6, :cond_4

    .line 71
    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->setLanguage(Ljava/lang/String;)V

    .line 72
    :cond_4
    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addIdentity(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)V

    .line 74
    :cond_5
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "feature"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 76
    invoke-virtual {v1, v9}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Ljava/lang/String;)V

    .line 78
    :cond_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "query"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 79
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 84
    .end local v3    # "eventType":I
    :cond_7
    return-object v1
.end method
