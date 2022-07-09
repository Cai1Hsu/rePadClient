.class public Lcom/edutech/json/CheckUpdataHelper;
.super Ljava/lang/Object;
.source "CheckUpdataHelper.java"


# static fields
.field private static checkdata:Lcom/edutech/json/TreeData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    new-instance v0, Lcom/edutech/json/TreeData;

    invoke-direct {v0}, Lcom/edutech/json/TreeData;-><init>()V

    sput-object v0, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static aBookCheckUpdata(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 39
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "studentid"    # Ljava/lang/String;
    .param p3, "bookid"    # Ljava/lang/String;
    .param p4, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "localTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/16 v23, 0x0

    .line 227
    .local v23, "isNew":Z
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    const-string/jumbo v10, "id"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 229
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    const-string/jumbo v10, "id"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    .line 231
    .local v19, "bookId":Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 233
    .local v5, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v6, v19

    .line 234
    .local v6, "sourceId":Ljava/lang/String;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v4, "countList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    move-object/from16 v7, p0

    move-object/from16 v9, p4

    invoke-static/range {v4 .. v9}, Lcom/edutech/json/CheckUpdataHelper;->getLeafCheckUpdateJson(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 238
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .local v20, "checkUpdataJsonList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v38

    :cond_0
    :goto_0
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_3

    .line 285
    const-string/jumbo v30, ""

    .line 286
    .local v30, "postJson":Ljava/lang/String;
    move-object/from16 v0, v30

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/edutech/json/CheckUpdataHelper;->getPostJson(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v30

    .line 288
    if-eqz v30, :cond_2

    const-string/jumbo v9, ""

    move-object/from16 v0, v30

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 289
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2}, Lcom/edutech/json/CheckUpdataHelper;->jsonUpdateHttpPost(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 291
    .local v25, "leafReturnJson":Ljava/lang/String;
    if-eqz v25, :cond_2

    const-string/jumbo v9, ""

    move-object/from16 v0, v25

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 292
    new-instance v21, Lcom/edutech/json/CommonJSONParser;

    invoke-direct/range {v21 .. v21}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 293
    .local v21, "common":Lcom/edutech/json/CommonJSONParser;
    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/edutech/json/CommonJSONParser;->parse(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v27

    .line 294
    .local v27, "leaftempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v27, :cond_2

    const-string/jumbo v9, "status"

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    const-string/jumbo v9, "errorNum"

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_2

    .line 296
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .local v26, "leafidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static/range {v26 .. v27}, Lcom/edutech/json/CheckUpdataHelper;->getNeedCheckLeafBookIdList(Ljava/util/ArrayList;Ljava/util/HashMap;)Ljava/util/ArrayList;

    .line 299
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_2

    .line 300
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_8

    .line 322
    .end local v4    # "countList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v5    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v6    # "sourceId":Ljava/lang/String;
    .end local v19    # "bookId":Ljava/lang/String;
    .end local v20    # "checkUpdataJsonList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v21    # "common":Lcom/edutech/json/CommonJSONParser;
    .end local v25    # "leafReturnJson":Ljava/lang/String;
    .end local v26    # "leafidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v27    # "leaftempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v30    # "postJson":Ljava/lang/String;
    :cond_2
    return v23

    .line 239
    .restart local v4    # "countList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v5    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v6    # "sourceId":Ljava/lang/String;
    .restart local v19    # "bookId":Ljava/lang/String;
    .restart local v20    # "checkUpdataJsonList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Ljava/util/HashMap;

    .line 240
    .local v37, "tempidList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v9, "SourceId"

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 241
    .local v8, "id":Ljava/lang/String;
    const-string/jumbo v9, "updateTime"

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 242
    .local v11, "updatetime":Ljava/lang/String;
    const/4 v12, 0x0

    .line 244
    .local v12, "count":I
    const/16 v24, 0x0

    .line 245
    .local v24, "isneedupdate":Z
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_4
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_5

    .line 260
    if-eqz v24, :cond_0

    .line 262
    const-string/jumbo v9, "count"

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, v37

    invoke-virtual {v0, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 264
    .local v7, "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v9, "DaoXueBen"

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 265
    const-string/jumbo v9, "2"

    const-string/jumbo v10, "1"

    invoke-static/range {v7 .. v12}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 277
    :goto_2
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v29

    .line 278
    .local v29, "newObject":Ljava/lang/Object;
    if-eqz v29, :cond_0

    .line 279
    move-object/from16 v0, v20

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 245
    .end local v7    # "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v29    # "newObject":Ljava/lang/Object;
    :cond_5
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/util/HashMap;

    .line 247
    .local v35, "tempcountList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v10, "SourceIdList"

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 248
    .local v22, "countid":Ljava/lang/String;
    const-string/jumbo v10, "count"

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 251
    .local v32, "strcount":Ljava/lang/String;
    if-eqz v22, :cond_4

    if-eqz v8, :cond_4

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    const/4 v13, -0x1

    if-eq v10, v13, :cond_4

    .line 252
    invoke-static/range {v32 .. v32}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/2addr v12, v10

    .line 253
    const-string/jumbo v10, "isNeedUpdate"

    move-object/from16 v0, v35

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    .line 255
    .local v28, "needcount":Ljava/lang/String;
    if-eqz v28, :cond_4

    const-string/jumbo v10, "true"

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 256
    const/16 v24, 0x1

    goto/16 :goto_1

    .line 266
    .end local v22    # "countid":Ljava/lang/String;
    .end local v28    # "needcount":Ljava/lang/String;
    .end local v32    # "strcount":Ljava/lang/String;
    .end local v35    # "tempcountList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v7    # "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_6
    const-string/jumbo v9, "DaoXueBenNew"

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 267
    const-string/jumbo v9, "2"

    const-string/jumbo v10, "1"

    invoke-static/range {v7 .. v12}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_2

    .line 269
    :cond_7
    const-string/jumbo v15, "4"

    const-string/jumbo v16, "2"

    const/16 v18, 0x1

    move-object v13, v7

    move-object v14, v8

    move-object/from16 v17, v11

    invoke-static/range {v13 .. v18}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 300
    .end local v7    # "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "id":Ljava/lang/String;
    .end local v11    # "updatetime":Ljava/lang/String;
    .end local v12    # "count":I
    .end local v24    # "isneedupdate":Z
    .end local v37    # "tempidList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v21    # "common":Lcom/edutech/json/CommonJSONParser;
    .restart local v25    # "leafReturnJson":Ljava/lang/String;
    .restart local v26    # "leafidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v27    # "leaftempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v30    # "postJson":Ljava/lang/String;
    :cond_8
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/String;

    .line 302
    .local v34, "strleafid":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_9
    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Ljava/util/HashMap;

    .line 303
    .restart local v37    # "tempidList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v9, "SourceId"

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljava/lang/String;

    .line 305
    .local v36, "tempid":Ljava/lang/String;
    move-object/from16 v0, v34

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 308
    const-string/jumbo v9, "SourceIdList"

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    .line 309
    .local v31, "sourceIdList":Ljava/lang/String;
    sget-object v9, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    move-object/from16 v0, v31

    invoke-virtual {v9, v0}, Lcom/edutech/json/TreeData;->sourceidToList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v33

    .line 311
    .local v33, "stridList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/HashMap;

    move/from16 v0, v23

    move-object/from16 v1, v33

    move-object/from16 v2, p0

    move-object/from16 v3, p4

    invoke-static {v0, v1, v2, v9, v3}, Lcom/edutech/json/CheckUpdataHelper;->updateIsNew(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v23

    goto :goto_3
.end method

.method public static getBookCheckUpdateJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p0, "booksJsonPath"    # Ljava/lang/String;
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 30
    const-string/jumbo v10, ""

    .line 31
    .local v10, "postJson":Ljava/lang/String;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .local v7, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-static {v7, p0}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 33
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v8, "checkUpdataJsonList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 59
    invoke-static {v10, v8}, Lcom/edutech/json/CheckUpdataHelper;->getPostJson(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v10

    .line 76
    return-object v10

    .line 34
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/edutech/json/Books;

    .line 35
    .local v11, "tempBook":Lcom/edutech/json/Books;
    invoke-virtual {v11}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "bookid":Ljava/lang/String;
    invoke-virtual {v11}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v6

    .line 37
    .local v6, "bookpath":Ljava/lang/String;
    invoke-virtual {v11}, Lcom/edutech/json/Books;->getBook_updatetime()Ljava/lang/String;

    move-result-object v4

    .line 38
    .local v4, "book_updatetime":Ljava/lang/String;
    invoke-virtual {v11}, Lcom/edutech/json/Books;->getBook_total()I

    move-result v5

    .line 39
    .local v5, "book_total":I
    if-eqz v1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 41
    .local v0, "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v2, "DaoXueBen"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 42
    const-string/jumbo v2, "1"

    const-string/jumbo v3, "1"

    invoke-static/range {v0 .. v5}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 54
    :goto_1
    invoke-static {v0}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v9

    .line 55
    .local v9, "newObject":Ljava/lang/Object;
    if-eqz v9, :cond_0

    .line 56
    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 43
    .end local v9    # "newObject":Ljava/lang/Object;
    :cond_2
    const-string/jumbo v2, "DaoXueBenNew"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 44
    const-string/jumbo v2, "1"

    const-string/jumbo v3, "1"

    invoke-static/range {v0 .. v5}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1

    .line 47
    :cond_3
    const-string/jumbo v2, "1"

    const-string/jumbo v3, "2"

    invoke-static/range {v0 .. v5}, Lcom/edutech/json/CheckUpdataHelper;->getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_1
.end method

.method private static getLeafCheckUpdateJson(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 27
    .param p2, "sourceId"    # Ljava/lang/String;
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, "countList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p3, "localTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p3 .. p4}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v7

    .line 327
    .local v7, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :cond_0
    :goto_0
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 487
    return-void

    .line 327
    :cond_1
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    .line 328
    .local v5, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v1, "id"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "updatetime"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 329
    const-string/jumbo v1, "id"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 330
    .local v16, "id":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 331
    const-string/jumbo v1, "updatetime"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v24

    .line 332
    .local v24, "updatetime":Ljava/lang/String;
    const-string/jumbo v1, "DaoXueBen"

    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 334
    const/4 v8, 0x0

    .line 335
    .local v8, "boolisdown":Z
    const-string/jumbo v1, "isdown"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 337
    :try_start_0
    const-string/jumbo v1, "isdown"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 343
    :cond_2
    :goto_1
    if-eqz v8, :cond_3

    .line 344
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 345
    .local v12, "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "SourceId"

    move-object/from16 v0, v16

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    const-string/jumbo v1, "SourceIdList"

    move-object/from16 v0, p2

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    const-string/jumbo v1, "isUpdated"

    const-string/jumbo v2, "0"

    invoke-virtual {v12, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    const-string/jumbo v1, "updateTime"

    move-object/from16 v0, v24

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    .end local v12    # "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    const/16 v18, 0x0

    .line 353
    .local v18, "leafcount":I
    const-string/jumbo v1, "webpath"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 354
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 355
    .local v25, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "webpath"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-virtual {v1, v0, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v25

    .line 356
    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v18, v18, v1

    .line 359
    .end local v25    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    const-string/jumbo v1, "exams"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 360
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 361
    .local v11, "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "exams"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v11, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 362
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v18, v18, v1

    .line 365
    .end local v11    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_5
    if-lez v18, :cond_6

    .line 367
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 368
    .local v14, "hashcount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "SourceIdList"

    move-object/from16 v0, p2

    invoke-virtual {v14, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    const-string/jumbo v1, "count"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    .end local v8    # "boolisdown":Z
    .end local v14    # "hashcount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v18    # "leafcount":I
    :cond_6
    :goto_2
    const-string/jumbo v1, "children"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p5

    .line 482
    invoke-static/range {v1 .. v6}, Lcom/edutech/json/CheckUpdataHelper;->getLeafCheckUpdateJson(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 484
    :cond_7
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lcom/edutech/json/TreeData;->removeSourceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto/16 :goto_0

    .line 338
    .restart local v8    # "boolisdown":Z
    :catch_0
    move-exception v10

    .line 340
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 373
    .end local v8    # "boolisdown":Z
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_8
    const-string/jumbo v1, "DaoXueBenNew"

    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 393
    if-eqz p2, :cond_9

    .line 394
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 395
    .restart local v12    # "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "SourceId"

    move-object/from16 v0, v16

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-string/jumbo v1, "SourceIdList"

    move-object/from16 v0, p2

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-string/jumbo v1, "isUpdated"

    const-string/jumbo v2, "0"

    invoke-virtual {v12, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    const-string/jumbo v1, "updateTime"

    move-object/from16 v0, v24

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 403
    .end local v12    # "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_9
    const/16 v18, 0x0

    .line 404
    .restart local v18    # "leafcount":I
    const/16 v17, 0x0

    .line 406
    .local v17, "isNeedUpdate":Z
    const-string/jumbo v1, "dxitems"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 407
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 408
    .local v9, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "dxitems"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v9, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 409
    if-eqz v9, :cond_6

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_6

    .line 410
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_3
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v15, v1, :cond_a

    .line 431
    if-lez v18, :cond_6

    .line 433
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 434
    .restart local v14    # "hashcount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "SourceIdList"

    move-object/from16 v0, p2

    invoke-virtual {v14, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    const-string/jumbo v1, "count"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    const-string/jumbo v1, "isNeedUpdate"

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 411
    .end local v14    # "hashcount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_a
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v22

    .line 412
    .local v22, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v22, :cond_d

    .line 413
    const-string/jumbo v1, "webpath"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_b

    .line 414
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .restart local v25    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "webpath"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v25

    invoke-virtual {v1, v0, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v25

    .line 416
    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v18, v18, v1

    .line 419
    .end local v25    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_b
    const-string/jumbo v1, "exams"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 420
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 421
    .restart local v11    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "exams"

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v11, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 422
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int v18, v18, v1

    .line 425
    .end local v11    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_c
    const-string/jumbo v1, "isdown"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_d

    const-string/jumbo v1, "isdown"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 427
    const-string/jumbo v1, "isdown"

    move-object/from16 v0, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v17

    .line 410
    :cond_d
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_3

    .line 449
    .end local v9    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v15    # "i":I
    .end local v17    # "isNeedUpdate":Z
    .end local v18    # "leafcount":I
    .end local v22    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_e
    const-string/jumbo v1, "question"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 451
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 452
    .local v20, "questionList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v1, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v2, "question"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-virtual {v1, v0, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v20

    .line 453
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    .line 454
    .local v23, "tempQues":Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v13

    .line 455
    .local v13, "hashQuesMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v13, :cond_f

    const-string/jumbo v1, "id"

    invoke-virtual {v13, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_f

    const-string/jumbo v1, "updatetime"

    invoke-virtual {v13, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 456
    const-string/jumbo v1, "id"

    invoke-virtual {v13, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    .line 457
    .local v19, "quesid":Ljava/lang/String;
    const-string/jumbo v1, "updatetime"

    invoke-virtual {v5, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v21

    .line 458
    .local v21, "quesupdatetime":Ljava/lang/String;
    const/4 v8, 0x0

    .line 459
    .restart local v8    # "boolisdown":Z
    const-string/jumbo v1, "isdown"

    invoke-virtual {v13, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_10

    .line 461
    :try_start_1
    const-string/jumbo v1, "isdown"

    invoke-virtual {v13, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v8

    .line 467
    :cond_10
    :goto_5
    if-eqz v8, :cond_f

    .line 468
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 469
    .restart local v12    # "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "SourceId"

    move-object/from16 v0, v19

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    const-string/jumbo v1, "SourceIdList"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    const-string/jumbo v1, "isUpdated"

    const-string/jumbo v3, "0"

    invoke-virtual {v12, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    const-string/jumbo v1, "updateTime"

    move-object/from16 v0, v21

    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    const-string/jumbo v1, "count"

    const-string/jumbo v3, "1"

    invoke-virtual {v12, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 462
    .end local v12    # "hashList":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_1
    move-exception v10

    .line 464
    .restart local v10    # "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5
.end method

.method public static getLocalTree(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;
    .locals 6
    .param p0, "offline_download"    # Ljava/lang/String;
    .param p1, "bookid"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 108
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/json.json"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 109
    .local v1, "bookJsonPath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    .local v0, "bookJsonFile":Ljava/io/File;
    const/4 v2, 0x0

    .line 111
    .local v2, "localTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 113
    invoke-static {v1}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 114
    .local v3, "localjson":Ljava/lang/String;
    const-string/jumbo v4, "data"

    const-string/jumbo v5, "children"

    invoke-static {v2, v3, v4, v5}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v2

    .line 116
    .end local v3    # "localjson":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method public static getNeedCheckLeafBookIdList(Ljava/util/ArrayList;Ljava/util/HashMap;)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 177
    .local p0, "bookidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p1, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v5, 0x0

    .line 179
    .local v5, "status":Z
    :try_start_0
    const-string/jumbo v9, "status"

    invoke-virtual {p1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 184
    :goto_0
    const-string/jumbo v9, "errorNum"

    invoke-virtual {p1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 186
    .local v3, "errorNum":I
    if-eqz v5, :cond_1

    if-nez v3, :cond_1

    .line 188
    const-string/jumbo v9, "data"

    invoke-virtual {p1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_1

    .line 190
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v0, "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v1, Lcom/edutech/json/TreeData;

    invoke-direct {v1}, Lcom/edutech/json/TreeData;-><init>()V

    .line 192
    .local v1, "datatree":Lcom/edutech/json/TreeData;
    const-string/jumbo v9, "data"

    invoke-virtual {p1, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v1, v0, v9}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 193
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_1

    .line 195
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 222
    .end local v0    # "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v1    # "datatree":Lcom/edutech/json/TreeData;
    :cond_1
    return-object p0

    .line 180
    .end local v3    # "errorNum":I
    :catch_0
    move-exception v2

    .line 182
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 195
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v1    # "datatree":Lcom/edutech/json/TreeData;
    .restart local v3    # "errorNum":I
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 197
    .local v7, "tempDataObject":Ljava/lang/Object;
    invoke-static {v7}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v6

    .line 198
    .local v6, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v6, :cond_0

    const-string/jumbo v9, "updated"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 200
    const/4 v8, 0x0

    .line 203
    .local v8, "updated":Z
    :try_start_1
    const-string/jumbo v9, "updated"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v8

    .line 209
    :goto_2
    if-eqz v8, :cond_0

    .line 211
    const-string/jumbo v9, "id"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 213
    const-string/jumbo v9, "id"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 214
    .local v4, "id":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 204
    .end local v4    # "id":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 206
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private static getPostHashMap(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "bookid"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/String;
    .param p4, "updatetime"    # Ljava/lang/String;
    .param p5, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "bookinfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v0, "id"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    const-string/jumbo v0, "type"

    invoke-virtual {p0, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    const-string/jumbo v0, "source"

    invoke-virtual {p0, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const-string/jumbo v0, "updatetime"

    invoke-virtual {p0, v0, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string/jumbo v0, "total"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    return-void
.end method

.method private static getPostJson(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 4
    .param p0, "postJson"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "checkUpdataJsonList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 91
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v0

    .line 92
    .local v0, "JsonListObject":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 94
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 95
    .local v1, "postCheckJson":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v3, "data"

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-static {v1}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v2

    .line 97
    .local v2, "postObject":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 99
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 103
    .end local v0    # "JsonListObject":Ljava/lang/Object;
    .end local v1    # "postCheckJson":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "postObject":Ljava/lang/Object;
    :cond_0
    return-object p0
.end method

.method public static jsonUpdateHttpPost(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "ip"    # Ljava/lang/String;
    .param p1, "studentid"    # Ljava/lang/String;
    .param p2, "json"    # Ljava/lang/String;

    .prologue
    .line 125
    const-string/jumbo v4, ""

    .line 126
    .local v4, "strResult":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/edutech/idauthentication/AppEnvironment;->UPDATEJSON_HTTPPOST_URL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 127
    .local v6, "url":Ljava/lang/String;
    if-eqz p2, :cond_1

    const-string/jumbo v7, ""

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 129
    new-instance v1, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v1, v6}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 130
    .local v1, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v3, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v7, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v8, "data"

    invoke-direct {v7, v8, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    :try_start_0
    new-instance v7, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string/jumbo v8, "UTF-8"

    invoke-direct {v7, v3, v8}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 135
    new-instance v7, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v7}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-virtual {v7, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 137
    .local v2, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_0

    .line 138
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v4

    move-object v5, v4

    .line 164
    .end local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v2    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v4    # "strResult":Ljava/lang/String;
    .local v5, "strResult":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 146
    .end local v5    # "strResult":Ljava/lang/String;
    .restart local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .restart local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v4    # "strResult":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 149
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    :cond_0
    :goto_1
    move-object v5, v4

    .line 161
    .end local v4    # "strResult":Ljava/lang/String;
    .restart local v5    # "strResult":Ljava/lang/String;
    goto :goto_0

    .line 151
    .end local v5    # "strResult":Ljava/lang/String;
    .restart local v4    # "strResult":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 154
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 156
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 159
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :cond_1
    move-object v5, v4

    .line 164
    .end local v4    # "strResult":Ljava/lang/String;
    .restart local v5    # "strResult":Ljava/lang/String;
    goto :goto_0
.end method

.method private static updateIsNew(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 21
    .param p0, "isNew"    # Z
    .param p4, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
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
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 494
    .local p1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "localTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-lt v6, v0, :cond_0

    .line 596
    return p0

    .line 495
    :cond_0
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 496
    .local v7, "id":Ljava/lang/String;
    invoke-virtual/range {p2 .. p3}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v5

    .line 497
    .local v5, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_3

    .line 494
    :cond_2
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 497
    :cond_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/HashMap;

    .line 499
    .local v17, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v19, "id"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    if-eqz v19, :cond_1

    .line 500
    const-string/jumbo v19, "id"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 502
    .local v9, "leafid":Ljava/lang/String;
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 504
    move-object/from16 p3, v17

    .line 505
    const-string/jumbo v18, "DaoXueBen"

    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 507
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    if-ne v6, v0, :cond_2

    .line 509
    const/16 p0, 0x1

    .line 511
    sget-object v18, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const/16 v19, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    const-string/jumbo v20, "isnew"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1

    .line 516
    :cond_4
    const-string/jumbo v18, "DaoXueBenNew"

    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 518
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    if-ne v6, v0, :cond_2

    .line 520
    const/16 p0, 0x1

    .line 522
    sget-object v18, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const/16 v19, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    const-string/jumbo v20, "isnew"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 552
    :cond_5
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int/lit8 v18, v18, -0x2

    move/from16 v0, v18

    if-ne v6, v0, :cond_2

    .line 555
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int/lit8 v18, v18, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 557
    .local v13, "quesid":Ljava/lang/String;
    if-eqz v13, :cond_2

    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_2

    .line 559
    const-string/jumbo v18, "question"

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    if-eqz v18, :cond_2

    .line 561
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 562
    .local v12, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    sget-object v18, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v19, "question"

    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v12, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v12

    .line 563
    if-eqz v12, :cond_2

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v18

    if-lez v18, :cond_2

    .line 565
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_2
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-lt v8, v0, :cond_6

    .line 582
    :goto_3
    invoke-static {v12}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v10

    .line 583
    .local v10, "newQuesListObject":Ljava/lang/Object;
    sget-object v18, Lcom/edutech/json/CheckUpdataHelper;->checkdata:Lcom/edutech/json/TreeData;

    const-string/jumbo v19, "question"

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v10, v3}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 566
    .end local v10    # "newQuesListObject":Ljava/lang/Object;
    :cond_6
    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    .line 567
    .local v14, "tempQues":Ljava/lang/Object;
    invoke-static {v14}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v15

    .line 568
    .local v15, "tempQuesMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v15, :cond_7

    const-string/jumbo v18, "id"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    if-eqz v18, :cond_7

    .line 570
    const-string/jumbo v18, "id"

    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    .line 572
    .local v16, "tempQuesid":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 574
    const/16 p0, 0x1

    .line 575
    const-string/jumbo v18, "isnew"

    const/16 v19, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v15, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    invoke-static {v15}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v11

    .line 577
    .local v11, "newQuesObject":Ljava/lang/Object;
    invoke-virtual {v12, v8, v11}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 565
    .end local v11    # "newQuesObject":Ljava/lang/Object;
    .end local v16    # "tempQuesid":Ljava/lang/String;
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_2
.end method
