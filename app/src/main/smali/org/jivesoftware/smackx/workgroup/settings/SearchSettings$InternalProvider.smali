.class public Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings$InternalProvider;
.super Ljava/lang/Object;
.source "SearchSettings.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 81
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

    .line 84
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    if-eq v5, v7, :cond_0

    .line 85
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "Parser not in proper position, or bad XML."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 88
    :cond_0
    new-instance v4, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;

    invoke-direct {v4}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;-><init>()V

    .line 90
    .local v4, "settings":Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;
    const/4 v0, 0x0

    .line 91
    .local v0, "done":Z
    const/4 v3, 0x0

    .line 92
    .local v3, "kb":Ljava/lang/String;
    const/4 v2, 0x0

    .line 94
    .local v2, "forums":Ljava/lang/String;
    :cond_1
    :goto_0
    if-nez v0, :cond_4

    .line 95
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 96
    .local v1, "eventType":I
    if-ne v1, v7, :cond_2

    const-string/jumbo v5, "forums"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 97
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 99
    :cond_2
    if-ne v1, v7, :cond_3

    const-string/jumbo v5, "kb"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 100
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 102
    :cond_3
    const/4 v5, 0x3

    if-ne v1, v5, :cond_1

    const-string/jumbo v5, "search-settings"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 103
    const/4 v0, 0x1

    goto :goto_0

    .line 107
    .end local v1    # "eventType":I
    :cond_4
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->setForumsLocation(Ljava/lang/String;)V

    .line 108
    invoke-virtual {v4, v3}, Lorg/jivesoftware/smackx/workgroup/settings/SearchSettings;->setKbLocation(Ljava/lang/String;)V

    .line 109
    return-object v4
.end method
