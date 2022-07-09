.class public Lorg/jivesoftware/smackx/pubsub/provider/PubSubProvider;
.super Ljava/lang/Object;
.source "PubSubProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v4, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;-><init>()V

    .line 35
    .local v4, "pubsub":Lorg/jivesoftware/smackx/pubsub/packet/PubSub;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v3

    .line 36
    .local v3, "namespace":Ljava/lang/String;
    invoke-static {v3}, Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;->valueOfFromXmlns(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->setPubSubNamespace(Lorg/jivesoftware/smackx/pubsub/packet/PubSubNamespace;)V

    .line 37
    const/4 v0, 0x0

    .line 39
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 41
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 43
    .local v1, "eventType":I
    const/4 v5, 0x2

    if-ne v1, v5, :cond_1

    .line 45
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3, p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v2

    .line 47
    .local v2, "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v2, :cond_0

    .line 49
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smackx/pubsub/packet/PubSub;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 52
    .end local v2    # "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_1
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    .line 54
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "pubsub"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 56
    const/4 v0, 0x1

    goto :goto_0

    .line 60
    .end local v1    # "eventType":I
    :cond_2
    return-object v4
.end method
