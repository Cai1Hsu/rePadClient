.class public Lorg/jivesoftware/smackx/bookmark/Bookmarks$Provider;
.super Ljava/lang/Object;
.source "Bookmarks.java"

# interfaces
.implements Lorg/jivesoftware/smackx/provider/PrivateDataProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/bookmark/Bookmarks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Provider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    return-void
.end method


# virtual methods
.method public parsePrivateData(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/PrivateData;
    .locals 8
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 230
    new-instance v3, Lorg/jivesoftware/smackx/bookmark/Bookmarks;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;-><init>()V

    .line 232
    .local v3, "storage":Lorg/jivesoftware/smackx/bookmark/Bookmarks;
    const/4 v1, 0x0

    .line 233
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 234
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 235
    .local v2, "eventType":I
    if-ne v2, v7, :cond_1

    const-string/jumbo v5, "url"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 236
    invoke-static {p1}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->access$000(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;

    move-result-object v4

    .line 237
    .local v4, "urlStorage":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    if-eqz v4, :cond_0

    .line 238
    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->addBookmarkedURL(Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;)V

    goto :goto_0

    .line 241
    .end local v4    # "urlStorage":Lorg/jivesoftware/smackx/bookmark/BookmarkedURL;
    :cond_1
    if-ne v2, v7, :cond_2

    const-string/jumbo v5, "conference"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 244
    invoke-static {p1}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->access$100(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;

    move-result-object v0

    .line 245
    .local v0, "conference":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smackx/bookmark/Bookmarks;->addBookmarkedConference(Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;)V

    goto :goto_0

    .line 247
    .end local v0    # "conference":Lorg/jivesoftware/smackx/bookmark/BookmarkedConference;
    :cond_2
    const/4 v5, 0x3

    if-ne v2, v5, :cond_0

    const-string/jumbo v5, "storage"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 249
    const/4 v1, 0x1

    goto :goto_0

    .line 254
    .end local v2    # "eventType":I
    :cond_3
    return-object v3
.end method
