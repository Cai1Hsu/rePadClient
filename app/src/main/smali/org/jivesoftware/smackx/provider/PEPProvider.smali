.class public Lorg/jivesoftware/smackx/provider/PEPProvider;
.super Ljava/lang/Object;
.source "PEPProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# instance fields
.field nodeParsers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/provider/PacketExtensionProvider;",
            ">;"
        }
    .end annotation
.end field

.field pepItem:Lorg/jivesoftware/smack/packet/PacketExtension;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/provider/PEPProvider;->nodeParsers:Ljava/util/Map;

    .line 54
    return-void
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x0

    .line 71
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 72
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 73
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 74
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "event"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 75
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "items"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 77
    const-string/jumbo v4, ""

    const-string/jumbo v5, "node"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "node":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/provider/PEPProvider;->nodeParsers:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .line 80
    .local v3, "nodeParser":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    if-eqz v3, :cond_0

    .line 81
    invoke-interface {v3, p1}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/provider/PEPProvider;->pepItem:Lorg/jivesoftware/smack/packet/PacketExtension;

    goto :goto_0

    .line 84
    .end local v2    # "node":Ljava/lang/String;
    .end local v3    # "nodeParser":Lorg/jivesoftware/smack/provider/PacketExtensionProvider;
    :cond_1
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 85
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "event"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 86
    const/4 v0, 0x1

    goto :goto_0

    .line 91
    .end local v1    # "eventType":I
    :cond_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/provider/PEPProvider;->pepItem:Lorg/jivesoftware/smack/packet/PacketExtension;

    return-object v4
.end method

.method public registerPEPParserExtension(Ljava/lang/String;Lorg/jivesoftware/smack/provider/PacketExtensionProvider;)V
    .locals 1
    .param p1, "node"    # Ljava/lang/String;
    .param p2, "pepItemParser"    # Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/PEPProvider;->nodeParsers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    return-void
.end method
