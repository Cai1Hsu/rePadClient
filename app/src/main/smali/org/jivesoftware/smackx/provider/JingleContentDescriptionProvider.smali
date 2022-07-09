.class public abstract Lorg/jivesoftware/smackx/provider/JingleContentDescriptionProvider;
.super Ljava/lang/Object;
.source "JingleContentDescriptionProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/provider/JingleContentDescriptionProvider$Audio;
    }
.end annotation


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
.method protected abstract getInstance()Lorg/jivesoftware/smackx/packet/JingleContentDescription;
.end method

.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    const/4 v1, 0x0

    .line 80
    .local v1, "done":Z
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/provider/JingleContentDescriptionProvider;->getInstance()Lorg/jivesoftware/smackx/packet/JingleContentDescription;

    move-result-object v0

    .line 82
    .local v0, "desc":Lorg/jivesoftware/smackx/packet/JingleContentDescription;
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 83
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 84
    .local v2, "eventType":I
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "name":Ljava/lang/String;
    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    .line 87
    const-string/jumbo v4, "payload-type"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 88
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/provider/JingleContentDescriptionProvider;->parsePayload(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->addJinglePayloadType(Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;)V

    goto :goto_0

    .line 90
    :cond_1
    new-instance v4, Ljava/lang/Exception;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Unknow element \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\" in content."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v4

    .line 92
    :cond_2
    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 93
    const-string/jumbo v4, "description"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 94
    const/4 v1, 0x1

    goto :goto_0

    .line 98
    .end local v2    # "eventType":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_3
    return-object v0
.end method

.method protected parsePayload(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v1, 0x0

    .line 54
    .local v1, "ptId":I
    const/4 v0, 0x0

    .line 57
    .local v0, "ptChannels":I
    :try_start_0
    const-string/jumbo v3, ""

    const-string/jumbo v4, "id"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v1

    .line 61
    :goto_0
    const-string/jumbo v3, ""

    const-string/jumbo v4, "name"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "ptName":Ljava/lang/String;
    :try_start_1
    const-string/jumbo v3, ""

    const-string/jumbo v4, "channels"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    .line 68
    :goto_1
    new-instance v3, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;

    new-instance v4, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-direct {v4, v1, v2, v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;I)V

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    return-object v3

    .line 65
    :catch_0
    move-exception v3

    goto :goto_1

    .line 58
    .end local v2    # "ptName":Ljava/lang/String;
    :catch_1
    move-exception v3

    goto :goto_0
.end method
