.class public Lorg/jivesoftware/smackx/provider/JingleTransportProvider$Ice;
.super Lorg/jivesoftware/smackx/provider/JingleTransportProvider;
.source "JingleTransportProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/provider/JingleTransportProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Ice"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/JingleTransportProvider;-><init>()V

    .line 101
    return-void
.end method


# virtual methods
.method protected getInstance()Lorg/jivesoftware/smackx/packet/JingleTransport;
    .locals 1

    .prologue
    .line 109
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;-><init>()V

    return-object v0
.end method

.method protected parseCandidate(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    .locals 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 120
    new-instance v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;-><init>()V

    .line 122
    .local v3, "mt":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "channel"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "channel":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "generation"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "generation":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "ip"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 125
    .local v2, "ip":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "name"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "name":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "network"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 127
    .local v5, "network":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "username"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 128
    .local v11, "username":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "password"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 129
    .local v6, "password":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "port"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 130
    .local v7, "port":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "preference"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 131
    .local v8, "preference":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "proto"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 132
    .local v9, "proto":Ljava/lang/String;
    const-string/jumbo v12, ""

    const-string/jumbo v13, "type"

    invoke-interface {p1, v12, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 134
    .local v10, "type":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 135
    new-instance v12, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    invoke-direct {v12, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setChannel(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;)V

    .line 138
    :cond_0
    if-eqz v1, :cond_1

    .line 140
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setGeneration(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 146
    :cond_1
    :goto_0
    if-eqz v2, :cond_a

    .line 147
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setIp(Ljava/lang/String;)V

    .line 153
    if-eqz v4, :cond_2

    .line 154
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setName(Ljava/lang/String;)V

    .line 157
    :cond_2
    if-eqz v5, :cond_3

    .line 159
    :try_start_1
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setNetwork(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 165
    :cond_3
    :goto_1
    if-eqz v11, :cond_4

    .line 166
    invoke-virtual {v3, v11}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setUsername(Ljava/lang/String;)V

    .line 169
    :cond_4
    if-eqz v6, :cond_5

    .line 170
    invoke-virtual {v3, v6}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setPassword(Ljava/lang/String;)V

    .line 173
    :cond_5
    if-eqz v7, :cond_6

    .line 175
    :try_start_2
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setPort(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 181
    :cond_6
    :goto_2
    if-eqz v8, :cond_7

    .line 183
    :try_start_3
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setPreference(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 189
    :cond_7
    :goto_3
    if-eqz v9, :cond_8

    .line 190
    new-instance v12, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    invoke-direct {v12, v9}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setProto(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;)V

    .line 193
    :cond_8
    if-eqz v10, :cond_9

    .line 194
    invoke-static {v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v12

    invoke-virtual {v3, v12}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->setType(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V

    .line 197
    :cond_9
    new-instance v12, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice$Candidate;

    invoke-direct {v12, v3}, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice$Candidate;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    :goto_4
    return-object v12

    .line 150
    :cond_a
    const/4 v12, 0x0

    goto :goto_4

    .line 185
    :catch_0
    move-exception v12

    goto :goto_3

    .line 177
    :catch_1
    move-exception v12

    goto :goto_2

    .line 161
    :catch_2
    move-exception v12

    goto :goto_1

    .line 142
    :catch_3
    move-exception v12

    goto :goto_0
.end method
