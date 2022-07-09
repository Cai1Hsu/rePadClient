.class public Lcom/edutech/daoxueben/until/BookUpdateHelper;
.super Ljava/lang/Object;
.source "BookUpdateHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method public BookUpdateBook(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .local v3, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    invoke-static {v3}, Lcom/edutech/daoxueben/until/JsonHelper;->booksparserJson(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    .line 160
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_0

    .line 172
    return-object p1

    .line 160
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/edutech/daoxueben/until/OldBooks;

    .line 161
    .local v5, "entry":Lcom/edutech/daoxueben/until/OldBooks;
    invoke-virtual {v5}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "book_id":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_updatetime()Ljava/lang/String;

    move-result-object v2

    .line 163
    .local v2, "book_updatetime":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_total()I

    move-result v1

    .line 164
    .local v1, "book_total":I
    new-instance v4, Lcom/edutech/daoxueben/until/BookUpdateInfo;

    invoke-direct {v4}, Lcom/edutech/daoxueben/until/BookUpdateInfo;-><init>()V

    .line 165
    .local v4, "bookupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    invoke-virtual {v4, v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setid(Ljava/lang/String;)V

    .line 166
    const-string/jumbo v7, "1"

    invoke-virtual {v4, v7}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->settype(Ljava/lang/String;)V

    .line 167
    const-string/jumbo v7, "1"

    invoke-virtual {v4, v7}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setsource(Ljava/lang/String;)V

    .line 168
    invoke-virtual {v4, v2}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setupdatetime(Ljava/lang/String;)V

    .line 169
    invoke-virtual {v4, v1}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->settotal(I)V

    .line 170
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public BookUpdateChapter(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    .local p1, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .local p2, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    return-object p1
.end method

.method public BookUpdateGetPeerBook(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5
    .param p1, "tempbook_id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 182
    .local p2, "localpeerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "//json.json"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 183
    .local v1, "bookJsonPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 184
    .local v0, "bookJsonFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 188
    invoke-static {v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 189
    .local v2, "localjson":Ljava/lang/String;
    invoke-static {p2, v2}, Lcom/edutech/daoxueben/until/JsonHelper;->peerbookparserJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    .line 191
    .end local v2    # "localjson":Ljava/lang/String;
    :cond_0
    return-object p2
.end method

.method public BookUpdateLocalBookJson(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 310
    .local p1, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 311
    .local v1, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    invoke-static {v1}, Lcom/edutech/daoxueben/until/JsonHelper;->booksparserJson(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .line 312
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 324
    invoke-static {v1}, Lcom/edutech/daoxueben/until/JsonHelper;->bookscreateJson(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 325
    .local v0, "Newjson":Ljava/lang/String;
    sget-object v5, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    invoke-static {v0, v5}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 332
    return-void

    .line 312
    .end local v0    # "Newjson":Ljava/lang/String;
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/daoxueben/until/BookUpdateInfo;

    .line 314
    .local v4, "tempupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    invoke-virtual {v4}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getid()Ljava/lang/String;

    move-result-object v3

    .line 315
    .local v3, "tempbookid":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/daoxueben/until/OldBooks;

    .line 316
    .local v2, "entry":Lcom/edutech/daoxueben/until/OldBooks;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 318
    invoke-virtual {v4}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getBook_isnew()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_isnew(I)V

    .line 319
    invoke-virtual {v4}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getupdatetime()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_updatetime(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public BookUpdateLocalJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p2, "sectionid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "localpeerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 283
    :goto_1
    return-object p1

    .line 268
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/daoxueben/until/BookInfo;

    .line 269
    .local v0, "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->isIsdown()Z

    move-result v1

    .line 270
    .local v1, "isdwon":Z
    if-nez v1, :cond_2

    .line 266
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 274
    :cond_2
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v3

    .line 275
    .local v3, "section_id":Ljava/lang/String;
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 277
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/daoxueben/until/BookInfo;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/edutech/daoxueben/until/BookInfo;->setIsnew(Z)V

    goto :goto_1
.end method

.method public BookUpdateLocalJsonJson(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 5
    .param p2, "book_id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 292
    .local p1, "localpeerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 293
    .local v0, "NewBookPath":Ljava/lang/String;
    invoke-static {p1}, Lcom/edutech/daoxueben/until/JsonHelper;->peerbookcreateJson(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    .line 294
    .local v1, "Newjson":Ljava/lang/String;
    const-string/jumbo v2, "CreateJson"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "BookUpdateLocalJsonJson"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "//json.json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 302
    return-void
.end method

.method public BookUpdateQuestion(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 242
    .local p1, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .local p2, "localpeerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v2, v5, :cond_0

    .line 255
    return-object p1

    .line 244
    :cond_0
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/daoxueben/until/BookInfo;

    .line 245
    .local v0, "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->isIsdown()Z

    move-result v1

    .line 246
    .local v1, "isdwon":Z
    if-nez v1, :cond_1

    .line 242
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 250
    :cond_1
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v3

    .line 251
    .local v3, "section_id":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_updatetime()Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "section_updatetime":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/2addr v5, v6

    goto :goto_1
.end method

.method public BookUpdateSection(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .local p2, "localpeerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v3, v7, :cond_0

    .line 232
    return-object p1

    .line 215
    :cond_0
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/daoxueben/until/BookInfo;

    .line 216
    .local v0, "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->isIsdown()Z

    move-result v2

    .line 217
    .local v2, "isdwon":Z
    if-nez v2, :cond_1

    .line 213
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 221
    :cond_1
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v4

    .line 222
    .local v4, "section_id":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_updatetime()Ljava/lang/String;

    move-result-object v5

    .line 223
    .local v5, "section_updatetime":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int v6, v7, v8

    .line 224
    .local v6, "total":I
    new-instance v1, Lcom/edutech/daoxueben/until/BookUpdateInfo;

    invoke-direct {v1}, Lcom/edutech/daoxueben/until/BookUpdateInfo;-><init>()V

    .line 225
    .local v1, "bookupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    invoke-virtual {v1, v4}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setid(Ljava/lang/String;)V

    .line 226
    const-string/jumbo v7, "3"

    invoke-virtual {v1, v7}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->settype(Ljava/lang/String;)V

    .line 227
    const-string/jumbo v7, "1"

    invoke-virtual {v1, v7}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setsource(Ljava/lang/String;)V

    .line 228
    invoke-virtual {v1, v5}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setupdatetime(Ljava/lang/String;)V

    .line 229
    invoke-virtual {v1, v6}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->settotal(I)V

    .line 230
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public JsonUpdateHttpPost(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 9
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "studentid"    # Ljava/lang/String;
    .param p3, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    .local p4, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    invoke-static {p1, p2}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->UPDATEJSON_HTTPPOST_URL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 46
    .local v6, "url":Ljava/lang/String;
    if-eqz p3, :cond_1

    const-string/jumbo v7, ""

    invoke-virtual {v7, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 48
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, v6}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 49
    .local v1, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v3, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v7, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v8, "data"

    invoke-direct {v7, v8, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    :try_start_0
    new-instance v7, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string/jumbo v8, "UTF-8"

    invoke-direct {v7, v3, v8}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 54
    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-virtual {v7, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 56
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_0

    .line 57
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v4

    .line 59
    .local v4, "strResult":Ljava/lang/String;
    invoke-virtual {p0, v4, p4}, Lcom/edutech/daoxueben/until/BookUpdateHelper;->parseHttpPostReturnJson(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object p4

    move-object v5, p4

    .line 83
    .end local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v4    # "strResult":Ljava/lang/String;
    .end local p4    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .local v5, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    :goto_0
    return-object v5

    .line 65
    .end local v5    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .restart local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .restart local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local p4    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :cond_0
    :goto_1
    move-object v5, p4

    .line 80
    .end local p4    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .restart local v5    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    goto :goto_0

    .line 70
    .end local v5    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .restart local p4    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    :catch_1
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 75
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :cond_1
    move-object v5, p4

    .line 83
    .end local p4    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    .restart local v5    # "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    goto :goto_0
.end method

.method public getIsDownTrue(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Lcom/edutech/json/JsonPort;Ljava/lang/String;Ljava/util/HashMap;)I
    .locals 11
    .param p1, "parId"    # Ljava/lang/String;
    .param p4, "jsonPort"    # Lcom/edutech/json/JsonPort;
    .param p5, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/edutech/json/JsonPort;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 360
    .local p2, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idSourceCount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-virtual {p2, p3}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    .line 362
    .local v1, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 398
    const/4 v9, 0x0

    return v9

    .line 364
    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 366
    .local v6, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v6, :cond_0

    move-object/from16 v0, p5

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 367
    move-object/from16 v0, p5

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 368
    .local v5, "sourceId":Ljava/lang/String;
    const/4 v7, 0x0

    .line 369
    .local v7, "total":I
    const-string/jumbo v10, "webpath"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_2

    .line 370
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .local v8, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v10, "webpath"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p4, v8, v10}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 372
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_2

    .line 373
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v7, v10

    .line 376
    .end local v8    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    const-string/jumbo v10, "exams"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 377
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 378
    .local v2, "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v10, "exams"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p4, v2, v10}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    .line 379
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_3

    .line 381
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v7, v10

    .line 384
    .end local v2    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object/from16 v0, p6

    invoke-virtual {v0, v5, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    const-string/jumbo v10, "isdown"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 388
    const-string/jumbo v10, "isdown"

    invoke-virtual {p4, v6, v10}, Lcom/edutech/json/JsonPort;->objectToBoolean(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v4

    .line 389
    .local v4, "isdown":Z
    if-eqz v4, :cond_0

    .line 391
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method public getLocalJsonTree(Ljava/lang/String;Lcom/edutech/json/Tree;Lcom/edutech/json/JsonPort;)Lcom/edutech/json/Tree;
    .locals 5
    .param p1, "book_id"    # Ljava/lang/String;
    .param p3, "jsonPort"    # Lcom/edutech/json/JsonPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/edutech/json/JsonPort;",
            ")",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 337
    .local p2, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/json.json"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 339
    .local v1, "bookJsonPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 340
    .local v0, "bookJsonFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 342
    invoke-static {v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 343
    .local v2, "localjson":Ljava/lang/String;
    const-string/jumbo v3, "data"

    const-string/jumbo v4, "children"

    invoke-virtual {p3, p2, v2, v3, v4}, Lcom/edutech/json/JsonPort;->parseJson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object p2

    .line 345
    .end local v2    # "localjson":Ljava/lang/String;
    :cond_0
    return-object p2
.end method

.method public parseHttpPostReturnJson(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 19
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    .local p2, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    const-string/jumbo v17, ""

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 148
    :cond_0
    :goto_0
    return-object p2

    .line 102
    :cond_1
    :try_start_0
    new-instance v9, Lorg/json/JSONTokener;

    move-object/from16 v0, p1

    invoke-direct {v9, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 103
    .local v9, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v9}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONObject;

    .line 104
    .local v8, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v17, "status"

    move-object/from16 v0, v17

    invoke-static {v8, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v12

    .line 105
    .local v12, "status":Z
    const-string/jumbo v17, "errorNum"

    move-object/from16 v0, v17

    invoke-static {v8, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v5

    .line 106
    .local v5, "errorNum":I
    const-string/jumbo v17, "errorInfo"

    move-object/from16 v0, v17

    invoke-static {v8, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 107
    .local v4, "errorInfo":Ljava/lang/String;
    const-string/jumbo v17, "data"

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 108
    .local v2, "array":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    if-lt v6, v0, :cond_2

    .line 130
    if-eqz v12, :cond_0

    if-nez v5, :cond_0

    const-string/jumbo v17, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_0

    goto :goto_0

    .line 109
    :cond_2
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 111
    .local v10, "object":Lorg/json/JSONObject;
    const-string/jumbo v17, "id"

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 112
    .local v7, "id":Ljava/lang/String;
    const-string/jumbo v17, "type"

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 113
    .local v14, "type":Ljava/lang/String;
    const-string/jumbo v17, "source"

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 114
    .local v11, "source":Ljava/lang/String;
    const-string/jumbo v17, "updated"

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v15

    .line 115
    .local v15, "updated":Z
    const-string/jumbo v17, "updatetime"

    move-object/from16 v0, v17

    invoke-static {v10, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 116
    .local v16, "updatetime":Ljava/lang/String;
    if-eqz v15, :cond_4

    .line 118
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-nez v18, :cond_5

    .line 108
    :cond_4
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 118
    :cond_5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/edutech/daoxueben/until/BookUpdateInfo;

    .line 120
    .local v13, "tempupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    invoke-virtual {v13}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getid()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    invoke-virtual {v13}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->gettype()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    invoke-virtual {v13}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getsource()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 122
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setupdated(Z)V

    .line 123
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->setupdatetime(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 139
    .end local v2    # "array":Lorg/json/JSONArray;
    .end local v4    # "errorInfo":Ljava/lang/String;
    .end local v5    # "errorNum":I
    .end local v6    # "i":I
    .end local v7    # "id":Ljava/lang/String;
    .end local v8    # "jsonObject":Lorg/json/JSONObject;
    .end local v9    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v10    # "object":Lorg/json/JSONObject;
    .end local v11    # "source":Ljava/lang/String;
    .end local v12    # "status":Z
    .end local v13    # "tempupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    .end local v14    # "type":Ljava/lang/String;
    .end local v15    # "updated":Z
    .end local v16    # "updatetime":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 141
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 143
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v3

    .line 145
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public updateIsNew(Lcom/edutech/json/Tree;Lcom/edutech/json/JsonPort;)Lcom/edutech/json/Tree;
    .locals 2
    .param p2, "jsonPort"    # Lcom/edutech/json/JsonPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/edutech/json/JsonPort;",
            ")",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 348
    .local p1, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v0, "id"

    .line 349
    .local v0, "key":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 350
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 356
    :cond_0
    return-object p1
.end method
