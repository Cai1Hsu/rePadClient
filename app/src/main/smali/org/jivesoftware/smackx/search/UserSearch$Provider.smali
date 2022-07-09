.class public Lorg/jivesoftware/smackx/search/UserSearch$Provider;
.super Ljava/lang/Object;
.source "UserSearch.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/search/UserSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 174
    const/4 v2, 0x0

    .line 175
    .local v2, "search":Lorg/jivesoftware/smackx/search/UserSearch;
    new-instance v3, Lorg/jivesoftware/smackx/search/SimpleUserSearch;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;-><init>()V

    .line 177
    .local v3, "simpleUserSearch":Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    const/4 v0, 0x0

    .line 178
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_5

    .line 179
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 180
    .local v1, "eventType":I
    if-ne v1, v6, :cond_2

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "instructions"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 181
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, p1}, Lorg/jivesoftware/smackx/search/UserSearch;->access$000(Lorg/jivesoftware/smackx/search/SimpleUserSearch;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V

    .line 205
    .end local v1    # "eventType":I
    .end local v3    # "simpleUserSearch":Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    :cond_1
    :goto_1
    return-object v3

    .line 184
    .restart local v1    # "eventType":I
    .restart local v3    # "simpleUserSearch":Lorg/jivesoftware/smackx/search/SimpleUserSearch;
    :cond_2
    if-ne v1, v6, :cond_3

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "item"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 185
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smackx/search/SimpleUserSearch;->parseItems(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 188
    :cond_3
    if-ne v1, v6, :cond_4

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "jabber:x:data"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 190
    new-instance v2, Lorg/jivesoftware/smackx/search/UserSearch;

    .end local v2    # "search":Lorg/jivesoftware/smackx/search/UserSearch;
    invoke-direct {v2}, Lorg/jivesoftware/smackx/search/UserSearch;-><init>()V

    .line 191
    .restart local v2    # "search":Lorg/jivesoftware/smackx/search/UserSearch;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/search/UserSearch;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 195
    :cond_4
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 196
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "query"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 197
    const/4 v0, 0x1

    goto :goto_0

    .line 202
    .end local v1    # "eventType":I
    :cond_5
    if-eqz v2, :cond_1

    move-object v3, v2

    .line 203
    goto :goto_1
.end method
