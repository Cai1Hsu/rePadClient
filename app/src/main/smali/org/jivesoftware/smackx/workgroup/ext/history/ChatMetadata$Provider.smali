.class public Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata$Provider;
.super Ljava/lang/Object;
.source "ChatMetadata.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    return-void
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
    .line 88
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;-><init>()V

    .line 90
    .local v0, "chatM":Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;
    const/4 v1, 0x0

    .line 91
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 92
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 93
    .local v2, "eventType":I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    .line 94
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "sessionID"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 95
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->setSessionID(Ljava/lang/String;)V

    goto :goto_0

    .line 97
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "metadata"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 98
    invoke-static {p1}, Lorg/jivesoftware/smackx/workgroup/util/MetaDataUtils;->parseMetaData(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v3

    .line 99
    .local v3, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/ChatMetadata;->setMetadata(Ljava/util/Map;)V

    goto :goto_0

    .line 102
    .end local v3    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_2
    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 103
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "chat-metadata"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 104
    const/4 v1, 0x1

    goto :goto_0

    .line 109
    .end local v2    # "eventType":I
    :cond_3
    return-object v0
.end method
