.class public Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings$InternalProvider;
.super Ljava/lang/Object;
.source "GenericSettings.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 85
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    if-eq v5, v7, :cond_0

    .line 86
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "Parser not in proper position, or bad XML."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 89
    :cond_0
    new-instance v3, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;-><init>()V

    .line 91
    .local v3, "setting":Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;
    const/4 v0, 0x0

    .line 94
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 95
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 96
    .local v1, "eventType":I
    if-ne v1, v7, :cond_2

    const-string/jumbo v5, "entry"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 97
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 98
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "name":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 100
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    .line 101
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/workgroup/settings/GenericSettings;->getMap()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 103
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_2
    const/4 v5, 0x3

    if-ne v1, v5, :cond_1

    const-string/jumbo v5, "generic-metadata"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 104
    const/4 v0, 0x1

    goto :goto_0

    .line 108
    .end local v1    # "eventType":I
    :cond_3
    return-object v3
.end method
