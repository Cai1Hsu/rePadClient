.class public Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory$InternalProvider;
.super Ljava/lang/Object;
.source "AgentChatHistory.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseChatSetting(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatSession;
    .locals 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 118
    const/4 v9, 0x0

    .line 119
    .local v9, "done":Z
    const/4 v1, 0x0

    .line 120
    .local v1, "date":Ljava/util/Date;
    const-wide/16 v2, 0x0

    .line 121
    .local v2, "duration":J
    const/4 v4, 0x0

    .line 122
    .local v4, "visitorsName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 123
    .local v5, "visitorsEmail":Ljava/lang/String;
    const/4 v6, 0x0

    .line 124
    .local v6, "sessionID":Ljava/lang/String;
    const/4 v7, 0x0

    .line 126
    .local v7, "question":Ljava/lang/String;
    :cond_0
    :goto_0
    if-nez v9, :cond_7

    .line 127
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v10

    .line 128
    .local v10, "eventType":I
    const/4 v0, 0x2

    if-ne v10, v0, :cond_1

    const-string/jumbo v0, "date"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    .line 130
    .local v8, "dateStr":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 131
    .local v12, "l":J
    new-instance v1, Ljava/util/Date;

    .end local v1    # "date":Ljava/util/Date;
    invoke-direct {v1, v12, v13}, Ljava/util/Date;-><init>(J)V

    .line 132
    .restart local v1    # "date":Ljava/util/Date;
    goto :goto_0

    .line 133
    .end local v8    # "dateStr":Ljava/lang/String;
    .end local v12    # "l":J
    :cond_1
    const/4 v0, 0x2

    if-ne v10, v0, :cond_2

    const-string/jumbo v0, "duration"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 134
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_0

    .line 136
    :cond_2
    const/4 v0, 0x2

    if-ne v10, v0, :cond_3

    const-string/jumbo v0, "visitorsName"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 137
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 139
    :cond_3
    const/4 v0, 0x2

    if-ne v10, v0, :cond_4

    const-string/jumbo v0, "visitorsEmail"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 140
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 142
    :cond_4
    const/4 v0, 0x2

    if-ne v10, v0, :cond_5

    const-string/jumbo v0, "sessionID"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 143
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0

    .line 145
    :cond_5
    const/4 v0, 0x2

    if-ne v10, v0, :cond_6

    const-string/jumbo v0, "question"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 146
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0

    .line 148
    :cond_6
    const/4 v0, 0x3

    if-ne v10, v0, :cond_0

    const-string/jumbo v0, "chat-session"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 152
    .end local v10    # "eventType":I
    :cond_7
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatSession;

    invoke-direct/range {v0 .. v7}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatSession;-><init>(Ljava/util/Date;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
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

    .line 96
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 97
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 100
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;-><init>()V

    .line 102
    .local v0, "agentChatHistory":Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;
    const/4 v1, 0x0

    .line 103
    .local v1, "done":Z
    :cond_1
    :goto_0
    if-nez v1, :cond_3

    .line 104
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 105
    .local v2, "eventType":I
    if-ne v2, v5, :cond_2

    const-string/jumbo v3, "chat-session"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 106
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory$InternalProvider;->parseChatSetting(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatSession;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatHistory;->addChatSession(Lorg/jivesoftware/smackx/workgroup/ext/history/AgentChatSession;)V

    goto :goto_0

    .line 109
    :cond_2
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    const-string/jumbo v3, "chat-sessions"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 110
    const/4 v1, 0x1

    goto :goto_0

    .line 113
    .end local v2    # "eventType":I
    :cond_3
    return-object v0
.end method
