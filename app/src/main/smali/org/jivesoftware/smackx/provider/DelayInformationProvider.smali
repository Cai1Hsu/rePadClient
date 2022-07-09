.class public Lorg/jivesoftware/smackx/provider/DelayInformationProvider;
.super Ljava/lang/Object;
.source "DelayInformationProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 41
    const-string/jumbo v5, ""

    const-string/jumbo v6, "stamp"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 42
    .local v4, "stampString":Ljava/lang/String;
    const/4 v3, 0x0

    .line 45
    .local v3, "stamp":Ljava/util/Date;
    :try_start_0
    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 59
    :cond_0
    :goto_0
    new-instance v0, Lorg/jivesoftware/smackx/packet/DelayInformation;

    invoke-direct {v0, v3}, Lorg/jivesoftware/smackx/packet/DelayInformation;-><init>(Ljava/util/Date;)V

    .line 60
    .local v0, "delayInformation":Lorg/jivesoftware/smackx/packet/DelayInformation;
    const-string/jumbo v5, ""

    const-string/jumbo v6, "from"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/jivesoftware/smackx/packet/DelayInformation;->setFrom(Ljava/lang/String;)V

    .line 61
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "reason":Ljava/lang/String;
    const-string/jumbo v5, ""

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v2, 0x0

    .line 69
    :cond_1
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/DelayInformation;->setReason(Ljava/lang/String;)V

    .line 71
    return-object v0

    .line 47
    .end local v0    # "delayInformation":Lorg/jivesoftware/smackx/packet/DelayInformation;
    .end local v2    # "reason":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 53
    .local v1, "parseExc":Ljava/text/ParseException;
    if-nez v3, :cond_0

    .line 54
    new-instance v3, Ljava/util/Date;

    .end local v3    # "stamp":Ljava/util/Date;
    const-wide/16 v6, 0x0

    invoke-direct {v3, v6, v7}, Ljava/util/Date;-><init>(J)V

    .restart local v3    # "stamp":Ljava/util/Date;
    goto :goto_0
.end method
