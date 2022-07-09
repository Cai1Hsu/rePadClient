.class public Lorg/jivesoftware/smackx/bookmark/Bookmarks;
.super Ljava/lang/Object;
.source "Bookmarks.java"

# interfaces
.implements Lorg/jivesoftware/smackx/packet/PrivateData;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/bookmark/Bookmarks$Provider;
    }
.end annotation


# instance fields
.field private bookmarkedConferences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;",
            ">;"
        }
    .end annotation
.end field

.field private bookmarkedURLS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedURLS:Ljava/util/List;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedConferences:Ljava/util/List;

    .line 74
    return-void
.end method

.method static synthetic access$000(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    .locals 1
    .param p0, "x0"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {p0}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->getURLStorage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    .locals 1
    .param p0, "x0"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {p0}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->getConferenceStorage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    move-result-object v0

    return-object v0
.end method

.method private static getConferenceStorage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    .locals 9
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    .line 280
    const-string/jumbo v6, ""

    const-string/jumbo v7, "name"

    invoke-interface {p0, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 281
    .local v5, "name":Ljava/lang/String;
    const-string/jumbo v6, ""

    const-string/jumbo v7, "autojoin"

    invoke-interface {p0, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "autojoin":Ljava/lang/String;
    const-string/jumbo v6, ""

    const-string/jumbo v7, "jid"

    invoke-interface {p0, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 284
    .local v4, "jid":Ljava/lang/String;
    new-instance v1, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    invoke-direct {v1, v4}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;-><init>(Ljava/lang/String;)V

    .line 285
    .local v1, "conf":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    invoke-virtual {v1, v5}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->setName(Ljava/lang/String;)V

    .line 286
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->setAutoJoin(Z)V

    .line 289
    const/4 v2, 0x0

    .line 290
    .local v2, "done":Z
    :cond_0
    :goto_0
    if-nez v2, :cond_4

    .line 291
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 292
    .local v3, "eventType":I
    if-ne v3, v8, :cond_1

    const-string/jumbo v6, "nick"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 293
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->setNickname(Ljava/lang/String;)V

    goto :goto_0

    .line 295
    :cond_1
    if-ne v3, v8, :cond_2

    const-string/jumbo v6, "password"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 296
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->setPassword(Ljava/lang/String;)V

    goto :goto_0

    .line 298
    :cond_2
    if-ne v3, v8, :cond_3

    const-string/jumbo v6, "shared_bookmark"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 300
    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->setShared(Z)V

    goto :goto_0

    .line 302
    :cond_3
    const/4 v6, 0x3

    if-ne v3, v6, :cond_0

    const-string/jumbo v6, "conference"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 303
    const/4 v2, 0x1

    goto :goto_0

    .line 308
    .end local v3    # "eventType":I
    :cond_4
    return-object v1
.end method

.method private static getURLStorage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    .locals 10
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 259
    const-string/jumbo v8, ""

    const-string/jumbo v9, "name"

    invoke-interface {p0, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 260
    .local v2, "name":Ljava/lang/String;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "url"

    invoke-interface {p0, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 261
    .local v5, "url":Ljava/lang/String;
    const-string/jumbo v8, ""

    const-string/jumbo v9, "rss"

    invoke-interface {p0, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 262
    .local v4, "rssString":Ljava/lang/String;
    if-eqz v4, :cond_1

    const-string/jumbo v8, "true"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    move v3, v7

    .line 264
    .local v3, "rss":Z
    :goto_0
    new-instance v6, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    invoke-direct {v6, v5, v2, v3}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 265
    .local v6, "urlStore":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    const/4 v0, 0x0

    .line 266
    .local v0, "done":Z
    :cond_0
    :goto_1
    if-nez v0, :cond_3

    .line 267
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 268
    .local v1, "eventType":I
    const/4 v8, 0x2

    if-ne v1, v8, :cond_2

    const-string/jumbo v8, "shared_bookmark"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 270
    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;->setShared(Z)V

    goto :goto_1

    .line 262
    .end local v0    # "done":Z
    .end local v1    # "eventType":I
    .end local v3    # "rss":Z
    .end local v6    # "urlStore":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 272
    .restart local v0    # "done":Z
    .restart local v1    # "eventType":I
    .restart local v3    # "rss":Z
    .restart local v6    # "urlStore":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    :cond_2
    const/4 v8, 0x3

    if-ne v1, v8, :cond_0

    const-string/jumbo v8, "url"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 273
    const/4 v0, 0x1

    goto :goto_1

    .line 276
    .end local v1    # "eventType":I
    :cond_3
    return-object v6
.end method


# virtual methods
.method public addBookmarkedConference(Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;)V
    .locals 1
    .param p1, "bookmarkedConference"    # Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedConferences:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    return-void
.end method

.method public addBookmarkedURL(Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;)V
    .locals 1
    .param p1, "bookmarkedURL"    # Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedURLS:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    return-void
.end method

.method public clearBookmarkedConferences()V
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedConferences:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 124
    return-void
.end method

.method public clearBookmarkedURLS()V
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedURLS:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 99
    return-void
.end method

.method public getBookmarkedConferences()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedConferences:Ljava/util/List;

    return-object v0
.end method

.method public getBookmarkedURLS()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedURLS:Ljava/util/List;

    return-object v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    const-string/jumbo v0, "storage"

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    const-string/jumbo v0, "storage:bookmarks"

    return-object v0
.end method

.method public removeBookmarkedConference(Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;)V
    .locals 1
    .param p1, "bookmarkedConference"    # Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedConferences:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    return-void
.end method

.method public removeBookmarkedURL(Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;)V
    .locals 1
    .param p1, "bookmarkedURL"    # Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->bookmarkedURLS:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 7

    .prologue
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v5, "<storage xmlns=\"storage:bookmarks\">"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->getBookmarkedURLS()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 173
    .local v4, "urls":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 174
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    .line 175
    .local v3, "urlStorage":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;->isShared()Z

    move-result v5

    if-nez v5, :cond_0

    .line 178
    const-string/jumbo v5, "<url name=\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\" url=\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;->getURL()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;->isRss()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 181
    const-string/jumbo v5, " rss=\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    :cond_1
    const-string/jumbo v5, " />"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 187
    .end local v3    # "urlStorage":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->getBookmarkedConferences()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 188
    .local v2, "conferences":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;>;"
    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 189
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    .line 190
    .local v1, "conference":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->isShared()Z

    move-result v5

    if-nez v5, :cond_3

    .line 193
    const-string/jumbo v5, "<conference "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    const-string/jumbo v5, "name=\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\" "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    const-string/jumbo v5, "autojoin=\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->isAutoJoin()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\" "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    const-string/jumbo v5, "jid=\""

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getJid()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\" "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    const-string/jumbo v5, ">"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getNickname()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 200
    const-string/jumbo v5, "<nick>"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getNickname()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "</nick>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    :cond_4
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getPassword()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 205
    const-string/jumbo v5, "<password>"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "</password>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    :cond_5
    const-string/jumbo v5, "</conference>"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1

    .line 211
    .end local v1    # "conference":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    :cond_6
    const-string/jumbo v5, "</storage>"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
