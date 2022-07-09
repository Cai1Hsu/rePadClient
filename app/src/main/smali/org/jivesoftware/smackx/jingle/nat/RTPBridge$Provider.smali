.class public Lorg/jivesoftware/smackx/jingle/nat/RTPBridge$Provider;
.super Ljava/lang/Object;
.source "RTPBridge.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 326
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 327
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
    .line 331
    const/4 v0, 0x0

    .line 337
    .local v0, "done":Z
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "http://www.jivesoftware.com/protocol/rtpbridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 338
    new-instance v7, Ljava/lang/Exception;

    const-string/jumbo v8, "Not a RTP Bridge packet"

    invoke-direct {v7, v8}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7

    .line 340
    :cond_0
    new-instance v4, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;-><init>()V

    .line 342
    .local v4, "iq":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v7

    if-ge v3, v7, :cond_3

    .line 343
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "sid"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 344
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setSid(Ljava/lang/String;)V

    .line 342
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 377
    .local v1, "elementName":Ljava/lang/String;
    .local v2, "eventType":I
    .local v5, "namespace":Ljava/lang/String;
    :cond_2
    const/4 v7, 0x3

    if-ne v2, v7, :cond_3

    .line 378
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "rtpbridge"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 379
    const/4 v0, 0x1

    .line 348
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v2    # "eventType":I
    .end local v5    # "namespace":Ljava/lang/String;
    :cond_3
    if-nez v0, :cond_b

    .line 349
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 350
    .restart local v2    # "eventType":I
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 351
    .restart local v1    # "elementName":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v5

    .line 353
    .restart local v5    # "namespace":Ljava/lang/String;
    const/4 v7, 0x2

    if-ne v2, v7, :cond_2

    .line 354
    const-string/jumbo v7, "candidate"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 355
    const/4 v3, 0x0

    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v7

    if-ge v3, v7, :cond_3

    .line 356
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "ip"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 357
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setIp(Ljava/lang/String;)V

    .line 355
    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 358
    :cond_5
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "pass"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 359
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPass(Ljava/lang/String;)V

    goto :goto_2

    .line 360
    :cond_6
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "name"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 361
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setName(Ljava/lang/String;)V

    goto :goto_2

    .line 362
    :cond_7
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "porta"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 363
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPortA(I)V

    goto :goto_2

    .line 364
    :cond_8
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "portb"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 365
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setPortB(I)V

    goto :goto_2

    .line 368
    :cond_9
    const-string/jumbo v7, "publicip"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 370
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v6

    .line 371
    .local v6, "x":I
    const/4 v3, 0x0

    :goto_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v7

    if-ge v3, v7, :cond_3

    .line 372
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "ip"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 373
    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->setIp(Ljava/lang/String;)V

    .line 371
    :cond_a
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 383
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v2    # "eventType":I
    .end local v5    # "namespace":Ljava/lang/String;
    .end local v6    # "x":I
    :cond_b
    return-object v4
.end method
