.class public Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Provider;
.super Ljava/lang/Object;
.source "AgentStatusRequest.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseAgent(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 145
    const/4 v0, 0x0

    .line 146
    .local v0, "done":Z
    const-string/jumbo v5, ""

    const-string/jumbo v6, "jid"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "jid":Ljava/lang/String;
    const-string/jumbo v5, ""

    const-string/jumbo v6, "type"

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 148
    .local v4, "type":Ljava/lang/String;
    const/4 v3, 0x0

    .line 149
    .local v3, "name":Ljava/lang/String;
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 150
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 151
    .local v1, "eventType":I
    const/4 v5, 0x2

    if-ne v1, v5, :cond_1

    const-string/jumbo v5, "name"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 152
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 154
    :cond_1
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    const-string/jumbo v5, "agent"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 157
    const/4 v0, 0x1

    goto :goto_0

    .line 160
    .end local v1    # "eventType":I
    :cond_2
    new-instance v5, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;

    invoke-direct {v5, v2, v4, v3}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

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

    .line 122
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;-><init>()V

    .line 124
    .local v2, "statusRequest":Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 125
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    :cond_0
    const/4 v0, 0x0

    .line 129
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_3

    .line 130
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 131
    .local v1, "eventType":I
    if-ne v1, v5, :cond_2

    const-string/jumbo v3, "agent"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 132
    invoke-static {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;->access$000(Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;)Ljava/util/Set;

    move-result-object v3

    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Provider;->parseAgent(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 134
    :cond_2
    const/4 v3, 0x3

    if-ne v1, v3, :cond_1

    const-string/jumbo v3, "agent-status-request"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 137
    const/4 v0, 0x1

    goto :goto_0

    .line 140
    .end local v1    # "eventType":I
    :cond_3
    return-object v2
.end method
