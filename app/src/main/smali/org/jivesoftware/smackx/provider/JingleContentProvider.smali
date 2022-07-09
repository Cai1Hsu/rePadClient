.class public Lorg/jivesoftware/smackx/provider/JingleContentProvider;
.super Ljava/lang/Object;
.source "JingleContentProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
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
    .line 46
    const/4 v3, 0x0

    .line 48
    .local v3, "result":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "elementName":Ljava/lang/String;
    const-string/jumbo v4, ""

    const-string/jumbo v5, "creator"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "creator":Ljava/lang/String;
    const-string/jumbo v4, ""

    const-string/jumbo v5, "name"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "name":Ljava/lang/String;
    new-instance v3, Lorg/jivesoftware/smackx/packet/JingleContent;

    .end local v3    # "result":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-direct {v3, v0, v2}, Lorg/jivesoftware/smackx/packet/JingleContent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .restart local v3    # "result":Lorg/jivesoftware/smack/packet/PacketExtension;
    return-object v3
.end method
