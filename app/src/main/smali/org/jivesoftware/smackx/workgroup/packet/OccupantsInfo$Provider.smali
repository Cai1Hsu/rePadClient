.class public Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$Provider;
.super Ljava/lang/Object;
.source "OccupantsInfo.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseOccupantInfo(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$OccupantInfo;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 151
    const/4 v0, 0x0

    .line 152
    .local v0, "done":Z
    const/4 v2, 0x0

    .line 153
    .local v2, "jid":Ljava/lang/String;
    const/4 v4, 0x0

    .line 154
    .local v4, "nickname":Ljava/lang/String;
    const/4 v3, 0x0

    .line 155
    .local v3, "joined":Ljava/util/Date;
    :cond_0
    :goto_0
    if-nez v0, :cond_4

    .line 156
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 157
    .local v1, "eventType":I
    if-ne v1, v7, :cond_1

    const-string/jumbo v5, "jid"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 158
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 159
    :cond_1
    if-ne v1, v7, :cond_2

    const-string/jumbo v5, "nickname"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 161
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 162
    :cond_2
    if-ne v1, v7, :cond_3

    const-string/jumbo v5, "joined"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 164
    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->access$100()Ljava/text/SimpleDateFormat;

    move-result-object v5

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    goto :goto_0

    .line 165
    :cond_3
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    const-string/jumbo v5, "occupant"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 167
    const/4 v0, 0x1

    goto :goto_0

    .line 170
    .end local v1    # "eventType":I
    :cond_4
    new-instance v5, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$OccupantInfo;

    invoke-direct {v5, v2, v4, v3}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$OccupantInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    return-object v5
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
    const/4 v5, 0x2

    .line 130
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 131
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 133
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;

    const-string/jumbo v3, ""

    const-string/jumbo v4, "roomID"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;-><init>(Ljava/lang/String;)V

    .line 135
    .local v2, "occupantsInfo":Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;
    const/4 v0, 0x0

    .line 136
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 137
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 138
    .local v1, "eventType":I
    if-ne v1, v5, :cond_2

    const-string/jumbo v3, "occupant"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 140
    invoke-static {v2}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;->access$000(Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo;)Ljava/util/Set;

    move-result-object v3

    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$Provider;->parseOccupantInfo(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/OccupantsInfo$OccupantInfo;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 141
    :cond_2
    const/4 v3, 0x3

    if-ne v1, v3, :cond_1

    const-string/jumbo v3, "occupants-info"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 143
    const/4 v0, 0x1

    goto :goto_0

    .line 146
    .end local v1    # "eventType":I
    :cond_3
    return-object v2
.end method
