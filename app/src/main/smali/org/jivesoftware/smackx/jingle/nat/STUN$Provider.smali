.class public Lorg/jivesoftware/smackx/jingle/nat/STUN$Provider;
.super Ljava/lang/Object;
.source "STUN.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/STUN;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 10
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 134
    const/4 v0, 0x0

    .line 140
    .local v0, "done":Z
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "google:jingleinfo"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 141
    new-instance v8, Ljava/lang/Exception;

    const-string/jumbo v9, "Not a STUN packet"

    invoke-direct {v8, v9}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v8

    .line 143
    :cond_0
    new-instance v5, Lorg/jivesoftware/smackx/jingle/nat/STUN;

    invoke-direct {v5}, Lorg/jivesoftware/smackx/jingle/nat/STUN;-><init>()V

    .line 146
    .local v5, "iq":Lorg/jivesoftware/smackx/jingle/nat/STUN;
    :cond_1
    :goto_0
    if-nez v0, :cond_9

    .line 147
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 148
    .local v2, "eventType":I
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "elementName":Ljava/lang/String;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    .line 151
    .local v6, "namespace":Ljava/lang/String;
    const/4 v8, 0x2

    if-ne v2, v8, :cond_8

    .line 152
    const-string/jumbo v8, "server"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 153
    const/4 v3, 0x0

    .line 154
    .local v3, "host":Ljava/lang/String;
    const/4 v7, 0x0

    .line 155
    .local v7, "port":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v8

    if-ge v4, v8, :cond_4

    .line 156
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "host"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 157
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    .line 155
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 158
    :cond_3
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "udp"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 159
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 161
    :cond_4
    if-eqz v3, :cond_1

    if-eqz v7, :cond_1

    .line 162
    invoke-static {v5}, Lorg/jivesoftware/smackx/jingle/nat/STUN;->access$000(Lorg/jivesoftware/smackx/jingle/nat/STUN;)Ljava/util/List;

    move-result-object v8

    new-instance v9, Lorg/jivesoftware/smackx/jingle/nat/STUN$StunServerAddress;

    invoke-direct {v9, v3, v7}, Lorg/jivesoftware/smackx/jingle/nat/STUN$StunServerAddress;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 164
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v7    # "port":Ljava/lang/String;
    :cond_5
    const-string/jumbo v8, "publicip"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 165
    const/4 v3, 0x0

    .line 166
    .restart local v3    # "host":Ljava/lang/String;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v8

    if-ge v4, v8, :cond_7

    .line 167
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "ip"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 168
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    .line 166
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 170
    :cond_7
    if-eqz v3, :cond_1

    const-string/jumbo v8, ""

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 171
    invoke-static {v5, v3}, Lorg/jivesoftware/smackx/jingle/nat/STUN;->access$100(Lorg/jivesoftware/smackx/jingle/nat/STUN;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 174
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "i":I
    :cond_8
    const/4 v8, 0x3

    if-ne v2, v8, :cond_1

    .line 175
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "query"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 176
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 180
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v2    # "eventType":I
    .end local v6    # "namespace":Ljava/lang/String;
    :cond_9
    return-object v5
.end method
