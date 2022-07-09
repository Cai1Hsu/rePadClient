.class public Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$Provider;
.super Ljava/lang/Object;
.source "QueueDetails.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 11
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x3

    .line 146
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v8, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 147
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    new-instance v4, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;

    const/4 v8, 0x0

    invoke-direct {v4, v8}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;-><init>(Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$1;)V

    .line 149
    .local v4, "queueDetails":Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 150
    .local v1, "eventType":I
    :cond_0
    if-eq v1, v10, :cond_9

    const-string/jumbo v8, "notify-queue-details"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 153
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 154
    :goto_0
    const/4 v8, 0x2

    if-ne v1, v8, :cond_0

    const-string/jumbo v8, "user"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 155
    const/4 v6, 0x0

    .line 156
    .local v6, "uid":Ljava/lang/String;
    const/4 v3, -0x1

    .line 157
    .local v3, "position":I
    const/4 v5, -0x1

    .line 158
    .local v5, "time":I
    const/4 v2, 0x0

    .line 160
    .local v2, "joinTime":Ljava/util/Date;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "jid"

    invoke-interface {p1, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 162
    if-nez v6, :cond_1

    .line 166
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 168
    :cond_2
    :goto_1
    if-ne v1, v10, :cond_3

    const-string/jumbo v8, "user"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    .line 170
    :cond_3
    const-string/jumbo v8, "position"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 171
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 184
    :cond_4
    :goto_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 186
    if-eq v1, v10, :cond_2

    goto :goto_1

    .line 173
    :cond_5
    const-string/jumbo v8, "time"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 174
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    goto :goto_2

    .line 176
    :cond_6
    const-string/jumbo v8, "join-time"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 177
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    goto :goto_2

    .line 179
    :cond_7
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "waitTime"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 180
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    .line 181
    .local v7, "wait":Ljava/util/Date;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v8, v7}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_2

    .line 191
    .end local v7    # "wait":Ljava/util/Date;
    :cond_8
    new-instance v8, Lorg/jivesoftware/smackx/workgroup/QueueUser;

    invoke-direct {v8, v6, v3, v5, v2}, Lorg/jivesoftware/smackx/workgroup/QueueUser;-><init>(Ljava/lang/String;IILjava/util/Date;)V

    invoke-static {v4, v8}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->access$100(Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;Lorg/jivesoftware/smackx/workgroup/QueueUser;)V

    .line 193
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 194
    goto/16 :goto_0

    .line 196
    .end local v2    # "joinTime":Ljava/util/Date;
    .end local v3    # "position":I
    .end local v5    # "time":I
    .end local v6    # "uid":Ljava/lang/String;
    :cond_9
    return-object v4
.end method
