.class public Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview$Provider;
.super Ljava/lang/Object;
.source "QueueOverview.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    const/4 v5, 0x3

    .line 121
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 122
    .local v1, "eventType":I
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;-><init>()V

    .line 123
    .local v2, "queueOverview":Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v3, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    .line 129
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 131
    :cond_1
    :goto_0
    if-ne v1, v5, :cond_2

    sget-object v3, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 133
    :cond_2
    const-string/jumbo v3, "count"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 134
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->setUserCount(I)V

    .line 146
    :cond_3
    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 148
    if-eq v1, v5, :cond_1

    goto :goto_0

    .line 136
    :cond_4
    const-string/jumbo v3, "time"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 137
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->setAverageWaitTime(I)V

    goto :goto_1

    .line 139
    :cond_5
    const-string/jumbo v3, "oldest"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 140
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->setOldestEntry(Ljava/util/Date;)V

    goto :goto_1

    .line 142
    :cond_6
    const-string/jumbo v3, "status"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 143
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->setStatus(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V

    goto :goto_1

    .line 153
    :cond_7
    if-eq v1, v5, :cond_8

    .line 157
    :cond_8
    return-object v2
.end method
