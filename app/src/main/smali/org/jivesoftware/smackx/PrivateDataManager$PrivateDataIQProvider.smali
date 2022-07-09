.class public Lorg/jivesoftware/smackx/PrivateDataManager$PrivateDataIQProvider;
.super Ljava/lang/Object;
.source "PrivateDataManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/PrivateDataManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrivateDataIQProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 13
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 281
    const/4 v8, 0x0

    .line 282
    .local v8, "privateData":Lorg/jivesoftware/smackx/packet/PrivateData;
    const/4 v1, 0x0

    .line 283
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_7

    .line 284
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 285
    .local v4, "eventType":I
    const/4 v11, 0x2

    if-ne v4, v11, :cond_6

    .line 286
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 287
    .local v2, "elementName":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 289
    .local v7, "namespace":Ljava/lang/String;
    invoke-static {v2, v7}, Lorg/jivesoftware/smackx/PrivateDataManager;->getPrivateDataProvider(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smackx/provider/PrivateDataProvider;

    move-result-object v9

    .line 291
    .local v9, "provider":Lorg/jivesoftware/smackx/provider/PrivateDataProvider;
    if-eqz v9, :cond_1

    .line 292
    invoke-interface {v9, p1}, Lorg/jivesoftware/smackx/provider/PrivateDataProvider;->parsePrivateData(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/PrivateData;

    move-result-object v8

    goto :goto_0

    .line 296
    :cond_1
    new-instance v0, Lorg/jivesoftware/smackx/packet/DefaultPrivateData;

    invoke-direct {v0, v2, v7}, Lorg/jivesoftware/smackx/packet/DefaultPrivateData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .local v0, "data":Lorg/jivesoftware/smackx/packet/DefaultPrivateData;
    const/4 v5, 0x0

    .line 298
    .local v5, "finished":Z
    :cond_2
    :goto_1
    if-nez v5, :cond_5

    .line 299
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 300
    .local v3, "event":I
    const/4 v11, 0x2

    if-ne v3, v11, :cond_4

    .line 301
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 303
    .local v6, "name":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 304
    const-string/jumbo v11, ""

    invoke-virtual {v0, v6, v11}, Lorg/jivesoftware/smackx/packet/DefaultPrivateData;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 308
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 309
    const/4 v11, 0x4

    if-ne v3, v11, :cond_2

    .line 310
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v10

    .line 311
    .local v10, "value":Ljava/lang/String;
    invoke-virtual {v0, v6, v10}, Lorg/jivesoftware/smackx/packet/DefaultPrivateData;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 315
    .end local v6    # "name":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/String;
    :cond_4
    const/4 v11, 0x3

    if-ne v3, v11, :cond_2

    .line 316
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 317
    const/4 v5, 0x1

    goto :goto_1

    .line 321
    .end local v3    # "event":I
    :cond_5
    move-object v8, v0

    goto :goto_0

    .line 324
    .end local v0    # "data":Lorg/jivesoftware/smackx/packet/DefaultPrivateData;
    .end local v2    # "elementName":Ljava/lang/String;
    .end local v5    # "finished":Z
    .end local v7    # "namespace":Ljava/lang/String;
    .end local v9    # "provider":Lorg/jivesoftware/smackx/provider/PrivateDataProvider;
    :cond_6
    const/4 v11, 0x3

    if-ne v4, v11, :cond_0

    .line 325
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "query"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 326
    const/4 v1, 0x1

    goto :goto_0

    .line 330
    .end local v4    # "eventType":I
    :cond_7
    new-instance v11, Lorg/jivesoftware/smackx/PrivateDataManager$PrivateDataResult;

    invoke-direct {v11, v8}, Lorg/jivesoftware/smackx/PrivateDataManager$PrivateDataResult;-><init>(Lorg/jivesoftware/smackx/packet/PrivateData;)V

    return-object v11
.end method
