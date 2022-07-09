.class public Lcom/edutech/json/BookJsonHelper;
.super Ljava/lang/Object;
.source "BookJsonHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addBookToBooksJson(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V
    .locals 8
    .param p0, "book_id"    # Ljava/lang/String;
    .param p1, "book_name"    # Ljava/lang/String;
    .param p2, "book_downloadsize"    # J
    .param p4, "book_size"    # J
    .param p6, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 15
    const-string/jumbo v4, ""

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .local v0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    new-instance v3, Lcom/edutech/json/Books;

    invoke-direct {v3}, Lcom/edutech/json/Books;-><init>()V

    .line 19
    .local v3, "newbook":Lcom/edutech/json/Books;
    invoke-virtual {v3, p0}, Lcom/edutech/json/Books;->setbook_id(Ljava/lang/String;)V

    .line 20
    invoke-virtual {v3, p1}, Lcom/edutech/json/Books;->setbook_name(Ljava/lang/String;)V

    .line 22
    invoke-virtual {v3, p2, p3}, Lcom/edutech/json/Books;->setBookdownloadsize(J)V

    .line 23
    invoke-virtual {v3, p4, p5}, Lcom/edutech/json/Books;->setBooksize(J)V

    .line 24
    const-string/jumbo v4, "0"

    invoke-virtual {v3, v4}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "../offlinedownload/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/edutech/json/Books;->setbook_path(Ljava/lang/String;)V

    .line 26
    invoke-static {v0, p6}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 27
    const/4 v2, 0x1

    .line 28
    .local v2, "isnewbook":Z
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .line 38
    if-eqz v2, :cond_1

    .line 39
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    :cond_1
    invoke-static {v0, p0, p6}, Lcom/edutech/json/BookJsonHelper;->writeToLocal(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .end local v0    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    .end local v2    # "isnewbook":Z
    .end local v3    # "newbook":Lcom/edutech/json/Books;
    :cond_2
    return-void

    .line 28
    .restart local v0    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    .restart local v2    # "isnewbook":Z
    .restart local v3    # "newbook":Lcom/edutech/json/Books;
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/json/Books;

    .line 29
    .local v1, "entry":Lcom/edutech/json/Books;
    invoke-virtual {v3}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v3}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/edutech/json/Books;->setbook_id(Ljava/lang/String;)V

    .line 32
    invoke-virtual {v3}, Lcom/edutech/json/Books;->getbook_name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/edutech/json/Books;->setbook_name(Ljava/lang/String;)V

    .line 34
    invoke-virtual {v3}, Lcom/edutech/json/Books;->getBooksize()J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Lcom/edutech/json/Books;->setBooksize(J)V

    .line 35
    invoke-virtual {v3}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/edutech/json/Books;->setbook_path(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static deleteBooksJsonInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p0, "bookid"    # Ljava/lang/String;
    .param p1, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 88
    const/4 v2, 0x0

    .line 89
    .local v2, "isexistbook":Z
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-static {v0, p1}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 91
    new-instance v3, Lcom/edutech/json/Books;

    invoke-direct {v3}, Lcom/edutech/json/Books;-><init>()V

    .line 92
    .local v3, "newbook":Lcom/edutech/json/Books;
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 100
    if-eqz v2, :cond_1

    .line 102
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 104
    :cond_1
    invoke-static {v0, p0, p1}, Lcom/edutech/json/BookJsonHelper;->writeToLocal(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    return-void

    .line 92
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/json/Books;

    .line 94
    .local v1, "entry":Lcom/edutech/json/Books;
    invoke-virtual {v1}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 96
    const/4 v2, 0x1

    .line 97
    move-object v3, v1

    goto :goto_0
.end method

.method public static getBooks(Lcom/edutech/json/Books;Ljava/lang/String;)V
    .locals 8
    .param p0, "book"    # Lcom/edutech/json/Books;
    .param p1, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 49
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v1, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "bookid":Ljava/lang/String;
    const/4 v3, 0x1

    .line 52
    .local v3, "isnewbook":Z
    if-eqz v0, :cond_1

    const-string/jumbo v4, ""

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 54
    invoke-static {v1, p1}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_3

    .line 75
    :cond_1
    if-eqz v3, :cond_2

    .line 77
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_2
    invoke-static {v1, v0, p1}, Lcom/edutech/json/BookJsonHelper;->writeToLocal(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void

    .line 56
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/json/Books;

    .line 58
    .local v2, "entry":Lcom/edutech/json/Books;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 60
    const/4 v3, 0x0

    .line 62
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getbook_name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setbook_name(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setbook_path(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getBook_updatetime()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setBook_updatetime(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getBook_total()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setBook_total(I)V

    .line 68
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getBook_isnew()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setBook_isnew(I)V

    .line 69
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getBookdownloadsize()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/edutech/json/Books;->setBookdownloadsize(J)V

    .line 70
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getBooksize()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/edutech/json/Books;->setBooksize(J)V

    .line 71
    invoke-virtual {p0}, Lcom/edutech/json/Books;->getProgress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getLongDefault(Ljava/lang/Object;)J
    .locals 2
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 149
    if-nez p0, :cond_0

    .line 151
    const-wide/16 v0, 0x0

    .line 154
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0
.end method

.method public static getStringDefault(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 140
    if-nez p0, :cond_0

    .line 142
    const-string/jumbo v0, ""

    .line 145
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static updateIsNewToBooksJson(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "book_id"    # Ljava/lang/String;
    .param p1, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 110
    const-string/jumbo v2, ""

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-static {v0, p1}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 114
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 119
    invoke-static {v0, p0, p1}, Lcom/edutech/json/BookJsonHelper;->writeToLocal(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    .end local v0    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    :cond_1
    return-void

    .line 114
    .restart local v0    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/json/Books;

    .line 115
    .local v1, "entry":Lcom/edutech/json/Books;
    invoke-virtual {v1}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 116
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/edutech/json/Books;->setBook_isnew(I)V

    goto :goto_0
.end method

.method private static writeToLocal(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "book_id"    # Ljava/lang/String;
    .param p2, "booksJsonPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Books;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-static {p0}, Lcom/edutech/json/JsonCreate;->createBooksJson(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 128
    .local v0, "Newjson":Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    :cond_0
    return-void
.end method
