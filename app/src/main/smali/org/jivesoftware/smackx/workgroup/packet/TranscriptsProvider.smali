.class public Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;
.super Ljava/lang/Object;
.source "TranscriptsProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# static fields
.field private static final UTC_FORMAT:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    .line 44
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "GMT+0"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method private parseAgents(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 109
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v1, "agents":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;>;"
    const/4 v0, 0x0

    .line 111
    .local v0, "agentJID":Ljava/lang/String;
    const/4 v4, 0x0

    .line 112
    .local v4, "joinTime":Ljava/util/Date;
    const/4 v5, 0x0

    .line 114
    .local v5, "leftTime":Ljava/util/Date;
    const/4 v2, 0x0

    .line 115
    .local v2, "done":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_6

    .line 116
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 117
    .local v3, "eventType":I
    const/4 v6, 0x2

    if-ne v3, v6, :cond_4

    .line 118
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "agentJID"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 119
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 121
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "joinTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 123
    :try_start_0
    sget-object v6, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    goto :goto_0

    .line 126
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "leftTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 128
    :try_start_1
    sget-object v6, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_0

    .line 131
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "agent"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 132
    const/4 v0, 0x0

    .line 133
    const/4 v4, 0x0

    .line 134
    const/4 v5, 0x0

    goto :goto_0

    .line 137
    :cond_4
    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    .line 138
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "agents"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 139
    const/4 v2, 0x1

    goto :goto_0

    .line 141
    :cond_5
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "agent"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 142
    new-instance v6, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;

    invoke-direct {v6, v0, v4, v5}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 146
    .end local v3    # "eventType":I
    :cond_6
    return-object v1

    .line 129
    .restart local v3    # "eventType":I
    :catch_0
    move-exception v6

    goto/16 :goto_0

    .line 124
    :catch_1
    move-exception v6

    goto/16 :goto_0
.end method

.method private parseSummary(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 75
    const-string/jumbo v6, ""

    const-string/jumbo v7, "sessionID"

    invoke-interface {p1, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 76
    .local v5, "sessionID":Ljava/lang/String;
    const/4 v3, 0x0

    .line 77
    .local v3, "joinTime":Ljava/util/Date;
    const/4 v4, 0x0

    .line 78
    .local v4, "leftTime":Ljava/util/Date;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v0, "agents":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;>;"
    const/4 v1, 0x0

    .line 81
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_4

    .line 82
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 83
    .local v2, "eventType":I
    const/4 v6, 0x2

    if-ne v2, v6, :cond_3

    .line 84
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "joinTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 86
    :try_start_0
    sget-object v6, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    goto :goto_0

    .line 89
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "leftTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 91
    :try_start_1
    sget-object v6, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_0

    .line 94
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "agents"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 95
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->parseAgents(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 98
    :cond_3
    const/4 v6, 0x3

    if-ne v2, v6, :cond_0

    .line 99
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "transcript"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 100
    const/4 v1, 0x1

    goto :goto_0

    .line 105
    .end local v2    # "eventType":I
    :cond_4
    new-instance v6, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;

    invoke-direct {v6, v5, v3, v4, v0}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;-><init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/util/List;)V

    return-object v6

    .line 92
    .restart local v2    # "eventType":I
    :catch_0
    move-exception v6

    goto :goto_0

    .line 87
    :catch_1
    move-exception v6

    goto :goto_0
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
    .line 52
    const-string/jumbo v4, ""

    const-string/jumbo v5, "userID"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 53
    .local v3, "userID":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v2, "summaries":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;>;"
    const/4 v0, 0x0

    .line 56
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 57
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 58
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 59
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "transcript"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 60
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/TranscriptsProvider;->parseSummary(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 63
    :cond_1
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 64
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "transcripts"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 65
    const/4 v0, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "eventType":I
    :cond_2
    new-instance v4, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;

    invoke-direct {v4, v3, v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v4
.end method
