.class public Lorg/jivesoftware/smackx/packet/LastActivity$Provider;
.super Ljava/lang/Object;
.source "LastActivity.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/LastActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_0

    .line 109
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 112
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/packet/LastActivity;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/LastActivity;-><init>()V

    .line 113
    .local v0, "lastActivity":Lorg/jivesoftware/smackx/packet/LastActivity;
    const-string/jumbo v3, ""

    const-string/jumbo v4, "seconds"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "seconds":Ljava/lang/String;
    const/4 v1, 0x0

    .line 116
    .local v1, "message":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 120
    :goto_0
    if-eqz v2, :cond_1

    .line 122
    :try_start_1
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smackx/packet/LastActivity;->setLastActivity(J)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 128
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 129
    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/packet/LastActivity;->access$000(Lorg/jivesoftware/smackx/packet/LastActivity;Ljava/lang/String;)V

    .line 131
    :cond_2
    return-object v0

    .line 117
    :catch_0
    move-exception v3

    goto :goto_0

    .line 123
    :catch_1
    move-exception v3

    goto :goto_1
.end method
