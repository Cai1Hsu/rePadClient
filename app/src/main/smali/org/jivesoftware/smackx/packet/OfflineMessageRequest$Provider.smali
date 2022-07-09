.class public Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Provider;
.super Ljava/lang/Object;
.source "OfflineMessageRequest.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "done":Z
    new-instance v2, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    const-string/jumbo v3, ""

    const-string/jumbo v4, "node"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;-><init>(Ljava/lang/String;)V

    .line 224
    .local v2, "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    const-string/jumbo v3, ""

    const-string/jumbo v4, "action"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;->setAction(Ljava/lang/String;)V

    .line 225
    const-string/jumbo v3, ""

    const-string/jumbo v4, "jid"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;->setJid(Ljava/lang/String;)V

    .line 226
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 227
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 228
    .local v1, "eventType":I
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 229
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "item"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 230
    const/4 v0, 0x1

    goto :goto_0

    .line 234
    .end local v1    # "eventType":I
    :cond_1
    return-object v2
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 197
    new-instance v2, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;-><init>()V

    .line 198
    .local v2, "request":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
    const/4 v0, 0x0

    .line 199
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_4

    .line 200
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 201
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_3

    .line 202
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "item"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 203
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Provider;->parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->addItem(Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;)V

    goto :goto_0

    .line 205
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "purge"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 206
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->setPurge(Z)V

    goto :goto_0

    .line 208
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "fetch"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 209
    invoke-virtual {v2, v5}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->setFetch(Z)V

    goto :goto_0

    .line 211
    :cond_3
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 212
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "offline"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 213
    const/4 v0, 0x1

    goto :goto_0

    .line 218
    .end local v1    # "eventType":I
    :cond_4
    return-object v2
.end method
