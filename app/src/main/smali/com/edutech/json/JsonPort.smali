.class public Lcom/edutech/json/JsonPort;
.super Ljava/lang/Object;
.source "JsonPort.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ObjectToJosn(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "json"    # Ljava/lang/String;
    .param p2, "jsonpath"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-static {p1, p2}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addBookToBooksJson(Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 7
    .param p2, "booksJsonPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v6, "id"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 185
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 184
    invoke-static {v6}, Lcom/edutech/json/BookJsonHelper;->getStringDefault(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "book_id":Ljava/lang/String;
    const-string/jumbo v6, "name"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 187
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 186
    invoke-static {v6}, Lcom/edutech/json/BookJsonHelper;->getStringDefault(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "book_name":Ljava/lang/String;
    const-string/jumbo v6, "downloadsize"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 188
    invoke-static {v6}, Lcom/edutech/json/BookJsonHelper;->getLongDefault(Ljava/lang/Object;)J

    move-result-wide v2

    .line 190
    .local v2, "book_downloadsize":J
    const-string/jumbo v6, "size"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/json/BookJsonHelper;->getLongDefault(Ljava/lang/Object;)J

    move-result-wide v4

    .local v4, "book_size":J
    move-object v6, p2

    .line 191
    invoke-static/range {v0 .. v6}, Lcom/edutech/json/BookJsonHelper;->addBookToBooksJson(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V

    .line 193
    return-void
.end method

.method public addExamToDownlist(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .param p3, "appName"    # Ljava/lang/String;
    .param p4, "jsonpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 380
    .local p1, "jsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "localJsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 381
    .local v0, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v1, Lcom/edutech/json/TreeData;

    invoke-direct {v1}, Lcom/edutech/json/TreeData;-><init>()V

    .line 383
    .local v1, "updataExamData":Lcom/edutech/json/TreeData;
    invoke-virtual {v1, p1, p3}, Lcom/edutech/json/TreeData;->examAddNewKeys(Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p1

    .line 385
    const-string/jumbo v2, "GeRenChengZhang"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 386
    invoke-virtual {v1, p1, p2, p3, v0}, Lcom/edutech/json/TreeData;->UpdateGeRenOldJsonMap(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 392
    :goto_0
    return-object v0

    .line 389
    :cond_0
    invoke-virtual {v1, p1, p2, p3, v0}, Lcom/edutech/json/TreeData;->UpdateOldJsonMap(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method public changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p3, "object"    # Ljava/lang/Object;
    .param p4, "key"    # Ljava/lang/String;
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "oldHead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 169
    .local v0, "changeTreeData":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public checkResourceUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .param p1, "booksJsonPath"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;
    .param p3, "ip"    # Ljava/lang/String;
    .param p4, "studentid"    # Ljava/lang/String;
    .param p5, "offline_download"    # Ljava/lang/String;

    .prologue
    .line 328
    .line 327
    invoke-static/range {p1 .. p2}, Lcom/edutech/json/CheckUpdataHelper;->getBookCheckUpdateJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 330
    .local v4, "bookcheckupdatejson":Ljava/lang/String;
    if-eqz v4, :cond_1

    const-string/jumbo v12, ""

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 332
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-static {v0, v1, v4}, Lcom/edutech/json/CheckUpdataHelper;->jsonUpdateHttpPost(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 335
    .local v10, "returnJson":Ljava/lang/String;
    if-eqz v10, :cond_1

    const-string/jumbo v12, ""

    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 336
    invoke-virtual {p0, v10}, Lcom/edutech/json/JsonPort;->getStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v11

    .line 339
    .local v11, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v11, :cond_1

    const-string/jumbo v12, "status"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 340
    const-string/jumbo v12, "errorNum"

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 342
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 343
    .local v6, "bookidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {v6, v11}, Lcom/edutech/json/CheckUpdataHelper;->getNeedCheckLeafBookIdList(Ljava/util/ArrayList;Ljava/util/HashMap;)Ljava/util/ArrayList;

    .line 346
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lez v12, :cond_1

    .line 347
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_2

    .line 372
    .end local v6    # "bookidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v10    # "returnJson":Ljava/lang/String;
    .end local v11    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-void

    .line 347
    .restart local v6    # "bookidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v10    # "returnJson":Ljava/lang/String;
    .restart local v11    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 348
    .local v5, "bookid":Ljava/lang/String;
    const/4 v8, 0x0

    .line 349
    .local v8, "localTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    move-object/from16 v0, p5

    move-object/from16 v1, p2

    invoke-static {v0, v5, v1}, Lcom/edutech/json/CheckUpdataHelper;->getLocalTree(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v8

    .line 351
    if-eqz v8, :cond_0

    .line 353
    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    invoke-static {v8, v0, v1, v5, v2}, Lcom/edutech/json/CheckUpdataHelper;->aBookCheckUpdata(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    .line 356
    .local v7, "isNew":Z
    if-eqz v7, :cond_0

    .line 357
    move-object/from16 v0, p1

    invoke-static {v5, v0}, Lcom/edutech/json/BookJsonHelper;->updateIsNewToBooksJson(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    invoke-static {v8}, Lcom/edutech/json/JsonCreate;->createjson(Lcom/edutech/json/Tree;)Ljava/lang/String;

    move-result-object v9

    .line 361
    .local v9, "newjson":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static/range {p5 .. p5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 362
    const-string/jumbo v14, "/json.json"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 361
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 363
    .local v3, "JsonPath":Ljava/lang/String;
    invoke-static {v9, v3}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "srcPath"    # Ljava/lang/String;
    .param p2, "desPath"    # Ljava/lang/String;

    .prologue
    .line 163
    invoke-static {p1, p2}, Lcom/edutech/json/FileHelper;->copyAllDirectoryFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    return-void
.end method

.method public createJson(Lcom/edutech/json/Tree;Ljava/lang/String;)Z
    .locals 2
    .param p2, "jsonpath"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->createjson(Lcom/edutech/json/Tree;)Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "json":Ljava/lang/String;
    invoke-static {v0, p2}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public deleteBooksJsonInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 258
    invoke-static {p1, p2}, Lcom/edutech/json/BookJsonHelper;->deleteBooksJsonInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public deleteDir(Ljava/lang/String;)V
    .locals 0
    .param p1, "FileDir"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-static {p1}, Lcom/edutech/json/FileHelper;->deleteDir(Ljava/lang/String;)V

    .line 154
    return-void
.end method

.method public deleteSourceFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "deletejson"    # Ljava/lang/String;
    .param p2, "offlineDownloadDir"    # Ljava/lang/String;
    .param p3, "studentId"    # Ljava/lang/String;
    .param p5, "key"    # Ljava/lang/String;
    .param p6, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 266
    .local p4, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .local v0, "deleteSourceData":Lcom/edutech/json/TreeData;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 267
    invoke-virtual/range {v0 .. v6}, Lcom/edutech/json/TreeData;->deleteSourceFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 269
    return-object p4
.end method

.method public getAllBooksNeedDownloadList(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p2, "booksJsonPath"    # Ljava/lang/String;
    .param p3, "offlineDownloadDir"    # Ljava/lang/String;
    .param p4, "studentId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 242
    .local p1, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .local v0, "downlistTreeData":Lcom/edutech/json/TreeData;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 247
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->getAllBookNeedDownList(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 252
    return-object p1
.end method

.method public getFileDownloadList(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 5
    .param p1, "jsonpath"    # Ljava/lang/String;
    .param p3, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 410
    .local p2, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 411
    .local v3, "newFileJson":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 412
    invoke-static {p1}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 413
    .local v1, "localjson":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/edutech/json/JsonPort;->getStringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v2

    .line 414
    .local v2, "localjsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 415
    .local v0, "getFileTreeData":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, v2, p2, p3}, Lcom/edutech/json/TreeData;->getFileDownloadList(Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 420
    .end local v0    # "getFileTreeData":Lcom/edutech/json/TreeData;
    .end local v1    # "localjson":Ljava/lang/String;
    .end local v2    # "localjsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public getStringToMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 2
    .param p1, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 135
    .local v0, "common":Lcom/edutech/json/CommonJSONParser;
    invoke-virtual {v0, p1}, Lcom/edutech/json/CommonJSONParser;->parse(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    .line 147
    .local v1, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-object v1
.end method

.method public getUpdateJsonObject(Lcom/edutech/json/Tree;Ljava/util/ArrayList;)Ljava/util/HashMap;
    .locals 2
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 275
    .local v0, "treedata":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1, p2}, Lcom/edutech/json/TreeData;->getUpdateJsonObject(Lcom/edutech/json/Tree;Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v1

    return-object v1
.end method

.method public getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 2
    .param p2, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 56
    .local v0, "getObjectlistData":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1, p2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    return-object v1
.end method

.method public isJsonArray(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    .line 114
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 116
    .local v0, "common":Lcom/edutech/json/CommonJSONParser;
    invoke-virtual {v0, p1}, Lcom/edutech/json/CommonJSONParser;->isJsonArray(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public listToSourceId(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 104
    .local v0, "sourceTreedata":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public mapToObject(Ljava/util/HashMap;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public objectToBoolean(Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 1
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1, p2}, Lcom/edutech/json/JsonParse;->isBooleanTrue(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    invoke-static {p1}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public parseJson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;
    .locals 0
    .param p2, "json"    # Ljava/lang/String;
    .param p3, "parkey"    # Ljava/lang/String;
    .param p4, "leafKey"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    .line 29
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {p1, p2, p3, p4}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object p1

    .line 30
    return-object p1
.end method

.method public removeSourceId(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "sourceId"    # Ljava/lang/String;

    .prologue
    .line 109
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 110
    .local v0, "sourceTreedata":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1}, Lcom/edutech/json/TreeData;->removeSourceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public sourceidToList(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "sourceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 98
    .local v0, "sourceTreedata":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1}, Lcom/edutech/json/TreeData;->sourceidToList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    return-object v1
.end method

.method public toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public updateBooksJson(Lcom/edutech/json/Books;Ljava/lang/String;)V
    .locals 0
    .param p1, "book"    # Lcom/edutech/json/Books;
    .param p2, "booksJsonPath"    # Ljava/lang/String;

    .prologue
    .line 197
    invoke-static {p1, p2}, Lcom/edutech/json/BookJsonHelper;->getBooks(Lcom/edutech/json/Books;Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method public updateErrorStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/edutech/json/Tree;)V
    .locals 7
    .param p1, "booksJsonPath"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;
    .param p3, "offline_download"    # Ljava/lang/String;
    .param p4, "inerror"    # I
    .param p5, "bookid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 426
    .local p6, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .local v0, "updateErrorStatusTreeData":Lcom/edutech/json/TreeData;
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 427
    invoke-virtual/range {v0 .. v6}, Lcom/edutech/json/TreeData;->updateErrorStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/edutech/json/Tree;)V

    .line 429
    return-void
.end method

.method public updateFormJson(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p1, "questionid"    # Ljava/lang/String;
    .param p2, "bookJsonPath"    # Ljava/lang/String;
    .param p3, "status"    # I

    .prologue
    .line 399
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 400
    .local v0, "removeQuestionTreeData":Lcom/edutech/json/TreeData;
    invoke-virtual {v0, p1, p2, p3}, Lcom/edutech/json/TreeData;->updateFormJson(Ljava/lang/String;Ljava/lang/String;I)V

    .line 402
    return-void
.end method

.method public updateHMProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 12
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 314
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Lcom/edutech/json/TreeData;

    invoke-direct {v2}, Lcom/edutech/json/TreeData;-><init>()V

    .line 315
    .local v2, "treedata":Lcom/edutech/json/TreeData;
    const-string/jumbo v3, "GeRenChengZhang"

    move-object/from16 v0, p8

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    .line 316
    invoke-virtual/range {v2 .. v10}, Lcom/edutech/json/TreeData;->updateGeRenProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 321
    :goto_0
    return-void

    :cond_0
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    .line 319
    invoke-virtual/range {v2 .. v10}, Lcom/edutech/json/TreeData;->updateHMProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    goto :goto_0
.end method

.method public updateHomeworkProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 445
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 449
    .local v0, "treedata":Lcom/edutech/json/TreeData;
    const-string/jumbo v9, "webpath"

    const-string/jumbo v10, "path"

    .line 450
    const-string/jumbo v11, "downloadsize"

    const-string/jumbo v12, "progress"

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-wide/from16 v6, p6

    move-object/from16 v8, p8

    .line 447
    invoke-virtual/range {v0 .. v12}, Lcom/edutech/json/TreeData;->updateXINHomeworkProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updateProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)Ljava/lang/String;
    .locals 16
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 282
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Lcom/edutech/json/TreeData;

    invoke-direct {v2}, Lcom/edutech/json/TreeData;-><init>()V

    .line 297
    .local v2, "treedata":Lcom/edutech/json/TreeData;
    const-string/jumbo v3, "DaoXueBenNew"

    move-object/from16 v0, p8

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 300
    const-string/jumbo v11, "webpath"

    const-string/jumbo v12, "path"

    .line 301
    const-string/jumbo v13, "downloadsize"

    const-string/jumbo v14, "progress"

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    .line 298
    invoke-virtual/range {v2 .. v14}, Lcom/edutech/json/TreeData;->updateDxProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 303
    :goto_0
    return-object v3

    .line 305
    :cond_0
    const-string/jumbo v11, "webpath"

    const-string/jumbo v12, "path"

    .line 306
    const-string/jumbo v13, "downloadsize"

    const-string/jumbo v14, "progress"

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    .line 303
    invoke-virtual/range {v2 .. v14}, Lcom/edutech/json/TreeData;->updateProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public updateTree(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p3, "downloadJson"    # Ljava/lang/String;
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .param p6, "jsonpath"    # Ljava/lang/String;
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
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .local v6, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    .line 217
    .local v0, "updataTreeData":Lcom/edutech/json/TreeData;
    if-eqz p2, :cond_0

    .line 218
    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move-object v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->updateJsonTree(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_0
    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, v6

    .line 222
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->getNeedDownloadList(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 225
    invoke-virtual {p0, p1, p6}, Lcom/edutech/json/JsonPort;->createJson(Lcom/edutech/json/Tree;Ljava/lang/String;)Z

    .line 228
    return-object v6
.end method
