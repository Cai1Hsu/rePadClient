.class public Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings$InternalProvider;
.super Ljava/lang/Object;
.source "ChatSettings.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseChatSetting(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 155
    const/4 v0, 0x0

    .line 156
    .local v0, "done":Z
    const/4 v2, 0x0

    .line 157
    .local v2, "key":Ljava/lang/String;
    const/4 v4, 0x0

    .line 158
    .local v4, "value":Ljava/lang/String;
    const/4 v3, 0x0

    .line 160
    .local v3, "type":I
    :cond_0
    :goto_0
    if-nez v0, :cond_4

    .line 161
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 162
    .local v1, "eventType":I
    if-ne v1, v7, :cond_1

    const-string/jumbo v5, "key"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 163
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 165
    :cond_1
    if-ne v1, v7, :cond_2

    const-string/jumbo v5, "value"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 166
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 168
    :cond_2
    if-ne v1, v7, :cond_3

    const-string/jumbo v5, "type"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 169
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 171
    :cond_3
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    const-string/jumbo v5, "chat-setting"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 172
    const/4 v0, 0x1

    goto :goto_0

    .line 175
    .end local v1    # "eventType":I
    :cond_4
    new-instance v5, Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    invoke-direct {v5, v2, v4, v3}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

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

    .line 133
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 134
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 137
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;-><init>()V

    .line 139
    .local v0, "chatSettings":Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;
    const/4 v1, 0x0

    .line 140
    .local v1, "done":Z
    :cond_1
    :goto_0
    if-nez v1, :cond_3

    .line 141
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 142
    .local v2, "eventType":I
    if-ne v2, v5, :cond_2

    const-string/jumbo v3, "chat-setting"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 143
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings$InternalProvider;->parseChatSetting(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/workgroup/settings/ChatSettings;->addSetting(Lorg/jivesoftware/smackx/workgroup/settings/ChatSetting;)V

    goto :goto_0

    .line 146
    :cond_2
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    const-string/jumbo v3, "chat-settings"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    const/4 v1, 0x1

    goto :goto_0

    .line 150
    .end local v2    # "eventType":I
    :cond_3
    return-object v0
.end method
