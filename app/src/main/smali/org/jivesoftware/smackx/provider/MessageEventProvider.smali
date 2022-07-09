.class public Lorg/jivesoftware/smackx/provider/MessageEventProvider;
.super Ljava/lang/Object;
.source "MessageEventProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
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
    const/4 v5, 0x1

    .line 52
    new-instance v2, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 53
    .local v2, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    const/4 v0, 0x0

    .line 54
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_6

    .line 55
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 56
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_5

    .line 57
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "id"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 58
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setPacketID(Ljava/lang/String;)V

    .line 59
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "composing"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 60
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setComposing(Z)V

    .line 61
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "delivered"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 62
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDelivered(Z)V

    .line 63
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "displayed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 64
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDisplayed(Z)V

    .line 65
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "offline"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 66
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setOffline(Z)V

    goto :goto_0

    .line 67
    :cond_5
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 68
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    const/4 v0, 0x1

    goto :goto_0

    .line 74
    .end local v1    # "eventType":I
    :cond_6
    return-object v2
.end method
