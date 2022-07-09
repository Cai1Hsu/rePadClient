.class public Lcom/edutech/daoxueben/until/InitDownLoad;
.super Ljava/lang/Object;
.source "InitDownLoad.java"


# instance fields
.field private common:Lcom/edutech/json/CommonJSONParser;

.field private downloadsize:J

.field private isnewCount:I

.field private jsonPort:Lcom/edutech/json/JsonPort;

.field private size:J

.field private total:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    .line 23
    iput-wide v2, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    .line 24
    iput v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    .line 25
    iput v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    .line 26
    new-instance v0, Lcom/edutech/json/JsonPort;

    invoke-direct {v0}, Lcom/edutech/json/JsonPort;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    .line 27
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    iput-object v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->common:Lcom/edutech/json/CommonJSONParser;

    .line 20
    return-void
.end method

.method private addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
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
    .line 485
    .local p3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p3, :cond_0

    :try_start_0
    const-string/jumbo v0, "dxid"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "dxid"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 490
    .local v2, "SourceID":Ljava/lang/String;
    const-string/jumbo v4, "size"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToDownList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 491
    const-string/jumbo v0, "exams"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 493
    const-string/jumbo v0, "dxid"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 494
    .local v6, "dxid":Ljava/lang/String;
    const/4 v4, 0x1

    const-string/jumbo v0, "exams"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    sget-object v8, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->StudentId:Ljava/lang/String;

    move-object v3, p0

    move-object v5, p1

    invoke-virtual/range {v3 .. v8}, Lcom/edutech/daoxueben/until/InitDownLoad;->createExamsJson(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 496
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .local v10, "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v1, "exams"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 498
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 499
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_0
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v11, v0, :cond_1

    .line 587
    .end local v2    # "SourceID":Ljava/lang/String;
    .end local v6    # "dxid":Ljava/lang/String;
    .end local v10    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "j":I
    :cond_0
    :goto_1
    return-object p4

    .line 500
    .restart local v2    # "SourceID":Ljava/lang/String;
    .restart local v6    # "dxid":Ljava/lang/String;
    .restart local v10    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v11    # "j":I
    :cond_1
    iget-object v0, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 501
    .local v3, "examDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_2

    .line 503
    const-string/jumbo v4, "sizes"

    move-object v0, p0

    move-object v1, p1

    move-object/from16 v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToDownList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 499
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 583
    .end local v2    # "SourceID":Ljava/lang/String;
    .end local v3    # "examDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v6    # "dxid":Ljava/lang/String;
    .end local v10    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "j":I
    :catch_0
    move-exception v9

    .line 585
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private compareTreewebpath(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 11
    .param p1, "ischange"    # Z
    .param p7, "key"    # Ljava/lang/String;
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
    .line 976
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v3, v8, :cond_0

    move v4, p1

    .line 1010
    .end local p1    # "ischange":Z
    .local v4, "ischange":I
    :goto_1
    return v4

    .line 977
    .end local v4    # "ischange":I
    .restart local p1    # "ischange":Z
    :cond_0
    move-object/from16 v0, p5

    invoke-virtual {p3, v0}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v1

    .line 979
    .local v1, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v5, 0x0

    .line 980
    .local v5, "isfound":Z
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_2

    .line 1005
    if-nez v5, :cond_3

    .line 1006
    const/4 p1, 0x1

    move v4, p1

    .line 1007
    .restart local v4    # "ischange":I
    goto :goto_1

    .line 980
    .end local v4    # "ischange":I
    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 982
    .local v7, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_1

    move-object/from16 v0, p7

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 984
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    move-object/from16 v0, p7

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 985
    const/4 v5, 0x1

    .line 986
    move-object/from16 p5, v7

    .line 987
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ne v3, v8, :cond_1

    .line 989
    if-eqz p6, :cond_1

    const-string/jumbo v8, "isnew"

    move-object/from16 v0, p6

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 990
    const/4 v6, 0x0

    .line 992
    .local v6, "isnew":Z
    :try_start_0
    const-string/jumbo v8, "isnew"

    move-object/from16 v0, p6

    invoke-virtual {v0, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 997
    :goto_3
    if-eqz v6, :cond_1

    .line 998
    const/4 p1, 0x1

    goto :goto_2

    .line 994
    :catch_0
    move-exception v2

    .line 995
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 976
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "isnew":Z
    .end local v7    # "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private compareWebpath(ZLjava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 6
    .param p1, "ischange"    # Z
    .param p4, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
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
            ")Z"
        }
    .end annotation

    .prologue
    .line 1015
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v4, "webpath"

    invoke-virtual {p2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "webpath"

    invoke-virtual {p3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    :cond_0
    const-string/jumbo v4, "webpath"

    invoke-virtual {p2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_2

    const-string/jumbo v4, "webpath"

    invoke-virtual {p3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1017
    :cond_1
    const/4 p1, 0x1

    move v3, p1

    .line 1044
    .end local p1    # "ischange":Z
    .local v3, "ischange":I
    :goto_0
    return v3

    .line 1019
    .end local v3    # "ischange":I
    .restart local p1    # "ischange":Z
    :cond_2
    const-string/jumbo v4, "webpath"

    invoke-virtual {p2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_7

    const-string/jumbo v4, "webpath"

    invoke-virtual {p3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_7

    .line 1020
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1021
    .local v0, "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1022
    .local v2, "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v5, "webpath"

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1023
    iget-object v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v5, "webpath"

    invoke-virtual {p3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    .line 1024
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_5

    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_5

    .line 1025
    :cond_4
    const/4 p1, 0x1

    move v3, p1

    .line 1026
    .restart local v3    # "ischange":I
    goto :goto_0

    .line 1027
    .end local v3    # "ischange":I
    :cond_5
    if-eqz v0, :cond_7

    if-eqz v2, :cond_7

    .line 1029
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_6

    .line 1031
    const/4 p1, 0x1

    move v3, p1

    .line 1032
    .restart local v3    # "ischange":I
    goto :goto_0

    .line 1035
    .end local v3    # "ischange":I
    :cond_6
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_8

    .end local v0    # "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v1    # "i":I
    .end local v2    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_7
    move v3, p1

    .line 1044
    .restart local v3    # "ischange":I
    goto :goto_0

    .line 1036
    .end local v3    # "ischange":I
    .restart local v0    # "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v1    # "i":I
    .restart local v2    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 1037
    const/4 p1, 0x1

    move v3, p1

    .line 1038
    .restart local v3    # "ischange":I
    goto :goto_0

    .line 1035
    .end local v3    # "ischange":I
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private compareisDown(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 13
    .param p1, "ischange"    # Z
    .param p7, "key"    # Ljava/lang/String;
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
    .line 931
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v10

    .line 933
    .local v10, "idSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    move v11, p1

    .line 971
    .end local p1    # "ischange":Z
    .local v11, "ischange":Z
    :goto_1
    return v11

    .line 933
    .end local v11    # "ischange":Z
    .restart local p1    # "ischange":Z
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    .line 935
    .local v8, "tempidSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v8, :cond_0

    move-object/from16 v0, p7

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 940
    move-object/from16 v0, p7

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v9, p7

    .line 960
    invoke-direct/range {v2 .. v9}, Lcom/edutech/daoxueben/until/InitDownLoad;->compareTreewebpath(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result p1

    .line 961
    if-eqz p1, :cond_2

    move v11, p1

    .line 962
    .end local p1    # "ischange":Z
    .restart local v11    # "ischange":Z
    goto :goto_1

    .end local v11    # "ischange":Z
    .restart local p1    # "ischange":Z
    :cond_2
    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v9, p7

    .line 964
    invoke-direct/range {v2 .. v9}, Lcom/edutech/daoxueben/until/InitDownLoad;->compareisDown(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result p1

    .line 966
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 967
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method private getSourceRemovepath(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 7
    .param p1, "bookId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1492
    .local p2, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v5, "webpath"

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "path"

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1493
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1494
    .local v3, "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1495
    .local v1, "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "webpath"

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v3, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1496
    iget-object v5, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "path"

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1497
    if-eqz v3, :cond_0

    if-eqz v1, :cond_0

    .line 1498
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v5, v6, :cond_0

    .line 1500
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v0, v5, :cond_1

    .line 1509
    .end local v0    # "i":I
    .end local v1    # "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v3    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 1501
    .restart local v0    # "i":I
    .restart local v1    # "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v3    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1502
    .local v2, "idheadwebpath":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1503
    .local v4, "idpath":Ljava/lang/String;
    invoke-direct {p0, p1, v2, v4, p3}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateSourceNeedRemoveList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1500
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getidheadSourceRemoveList(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 5
    .param p1, "bookId"    # Ljava/lang/String;
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1472
    .local p2, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/edutech/daoxueben/until/InitDownLoad;->getSourceRemovepath(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1473
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1474
    .local v0, "idheadexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "exams"

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1476
    iget-object v3, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v4, "exams"

    invoke-virtual {p3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1477
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 1478
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 1488
    .end local v1    # "k":I
    :cond_0
    return-void

    .line 1480
    .restart local v1    # "k":I
    :cond_1
    iget-object v3, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v2

    .line 1481
    .local v2, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v2, :cond_2

    const-string/jumbo v3, "questionid"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1482
    invoke-direct {p0, p1, v2, p4}, Lcom/edutech/daoxueben/until/InitDownLoad;->getSourceRemovepath(Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1478
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private getisDown(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 14
    .param p1, "downloadjsonbookid"    # Ljava/lang/String;
    .param p7, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1077
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p8, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p9, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v12

    .line 1079
    .local v12, "idSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v12}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1098
    return-void

    .line 1079
    :cond_1
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/HashMap;

    .line 1081
    .local v8, "tempidSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v8, :cond_0

    move-object/from16 v0, p7

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1086
    move-object/from16 v0, p7

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1089
    invoke-virtual/range {p3 .. p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    invoke-direct/range {v2 .. v11}, Lcom/edutech/daoxueben/until/InitDownLoad;->rePlaceTreewebpath(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1090
    invoke-virtual/range {p3 .. p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    move-object v2, p0

    move-object v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    invoke-direct/range {v2 .. v11}, Lcom/edutech/daoxueben/until/InitDownLoad;->getisDown(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1092
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 1093
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method private rePlaceTreewebpath(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 44
    .param p1, "downloadjsonbookid"    # Ljava/lang/String;
    .param p7, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1101
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p8, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p9, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/16 v35, 0x0

    .line 1102
    .local v35, "isfound":Z
    const-string/jumbo v5, ""

    .line 1103
    .local v5, "bookId":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 1104
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "bookId":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 1105
    .restart local v5    # "bookId":Ljava/lang/String;
    :cond_0
    const/16 v29, 0x1

    .local v29, "i":I
    :goto_0
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v29

    if-lt v0, v4, :cond_2

    .line 1303
    if-nez v35, :cond_1

    const-string/jumbo v4, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1305
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p6

    move-object/from16 v3, p8

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/edutech/daoxueben/until/InitDownLoad;->getidheadSourceRemoveList(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1307
    :cond_1
    return-void

    .line 1106
    :cond_2
    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v22

    .line 1109
    .local v22, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface/range {v22 .. v22}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v43

    :cond_3
    :goto_1
    invoke-interface/range {v43 .. v43}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_4

    .line 1105
    add-int/lit8 v29, v29, 0x1

    goto :goto_0

    .line 1109
    :cond_4
    invoke-interface/range {v43 .. v43}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Ljava/util/HashMap;

    .line 1111
    .local v42, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v42, :cond_3

    move-object/from16 v0, v42

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1113
    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, v42

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1115
    move-object/from16 p5, v42

    .line 1116
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move/from16 v0, v29

    if-ne v0, v4, :cond_3

    .line 1118
    const-string/jumbo v4, "isdown"

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 1119
    const/16 v34, 0x0

    .line 1121
    .local v34, "isdown":Z
    :try_start_0
    const-string/jumbo v4, "isdown"

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v34

    .line 1127
    :goto_2
    if-eqz v34, :cond_5

    .line 1128
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string/jumbo v7, "isdown"

    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1, v6, v7}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 1131
    .end local v34    # "isdown":Z
    :cond_5
    const-string/jumbo v4, "dxitems"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 1132
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 1133
    .local v25, "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "dxitems"

    move-object/from16 v0, p5

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v25

    invoke-virtual {v4, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v25

    .line 1134
    if-eqz v25, :cond_6

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_6

    .line 1135
    const/16 v36, 0x0

    .local v36, "j":I
    :goto_3
    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v36

    if-lt v0, v4, :cond_7

    .line 1225
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-static/range {v25 .. v25}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "dxitems"

    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1, v6, v7}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 1289
    .end local v25    # "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v36    # "j":I
    :cond_6
    const-string/jumbo v4, "-2"

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    const-string/jumbo v4, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 1292
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/edutech/json/JsonPort;->listToSourceId(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v20

    .local v20, "sourceId":Ljava/lang/String;
    move-object/from16 v16, p0

    move-object/from16 v17, p3

    move-object/from16 v18, p5

    move-object/from16 v19, v5

    move-object/from16 v21, p9

    .line 1295
    invoke-virtual/range {v16 .. v21}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateDxiditemsIsDown(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_1

    .line 1123
    .end local v20    # "sourceId":Ljava/lang/String;
    .restart local v34    # "isdown":Z
    :catch_0
    move-exception v26

    .line 1125
    .local v26, "e":Ljava/lang/Exception;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 1136
    .end local v26    # "e":Ljava/lang/Exception;
    .end local v34    # "isdown":Z
    .restart local v25    # "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v36    # "j":I
    :cond_7
    move-object/from16 v0, v25

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v41

    .line 1137
    .local v41, "object":Ljava/lang/Object;
    if-eqz v41, :cond_9

    .line 1138
    invoke-static/range {v41 .. v41}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v8

    .line 1139
    .local v8, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v8, :cond_9

    const-string/jumbo v4, "dxid"

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9

    .line 1142
    const-string/jumbo v4, "dxid"

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v24

    .line 1143
    .local v24, "dxidString":Ljava/lang/String;
    const-string/jumbo v4, "dxitems"

    move-object/from16 v0, p6

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_8

    .line 1144
    new-instance v30, Ljava/util/ArrayList;

    invoke-direct/range {v30 .. v30}, Ljava/util/ArrayList;-><init>()V

    .line 1145
    .local v30, "iddxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "dxitems"

    move-object/from16 v0, p6

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v30

    invoke-virtual {v4, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v30

    .line 1146
    if-eqz v30, :cond_8

    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_8

    .line 1147
    const/16 v37, 0x0

    .local v37, "k":I
    :goto_4
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v37

    if-lt v0, v4, :cond_a

    .line 1216
    .end local v30    # "iddxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v37    # "k":I
    :cond_8
    :goto_5
    invoke-static {v8}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v39

    .line 1217
    .local v39, "newObject":Ljava/lang/Object;
    if-eqz v39, :cond_9

    .line 1218
    move-object/from16 v0, v25

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1219
    move-object/from16 v0, v25

    move/from16 v1, v36

    move-object/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1135
    .end local v8    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v24    # "dxidString":Ljava/lang/String;
    .end local v39    # "newObject":Ljava/lang/Object;
    :cond_9
    add-int/lit8 v36, v36, 0x1

    goto/16 :goto_3

    .line 1148
    .restart local v8    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v24    # "dxidString":Ljava/lang/String;
    .restart local v30    # "iddxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v37    # "k":I
    :cond_a
    move-object/from16 v0, v30

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v33

    .line 1149
    .local v33, "idobject":Ljava/lang/Object;
    if-eqz v33, :cond_10

    .line 1150
    invoke-static/range {v33 .. v33}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 1151
    .local v9, "idtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_10

    const-string/jumbo v4, "dxid"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_10

    .line 1152
    const-string/jumbo v4, "dxid"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1154
    const-string/jumbo v4, "isdown"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_10

    .line 1155
    const/16 v34, 0x0

    .line 1157
    .restart local v34    # "isdown":Z
    :try_start_1
    const-string/jumbo v4, "isdown"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v34

    .line 1162
    :goto_6
    const/16 v34, 0x1

    if-eqz v34, :cond_8

    .line 1164
    const/4 v6, 0x0

    move-object/from16 v4, p0

    move-object/from16 v7, p3

    move-object/from16 v10, p8

    invoke-direct/range {v4 .. v10}, Lcom/edutech/daoxueben/until/InitDownLoad;->rePlaceWebpath(Ljava/lang/String;ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1166
    const-string/jumbo v4, "isdown"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    const-string/jumbo v4, "isnew"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    const-string/jumbo v4, "examsprogress"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 1167
    const-string/jumbo v4, "isdown"

    const-string/jumbo v6, "isdown"

    invoke-virtual {v9, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v8, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1168
    const-string/jumbo v4, "isnew"

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v8, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1169
    const-string/jumbo v4, "examsprogress"

    const-string/jumbo v6, "examsprogress"

    invoke-virtual {v9, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v8, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1172
    :cond_b
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 1173
    .local v27, "headexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 1174
    .local v31, "idheadexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/16 v28, 0x0

    .line 1175
    .local v28, "headexamssize":I
    const/16 v32, 0x0

    .line 1176
    .local v32, "idheadexamssize":I
    const-string/jumbo v4, "exams"

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 1177
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "exams"

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v27

    invoke-virtual {v4, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v27

    .line 1178
    if-eqz v27, :cond_c

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_c

    .line 1179
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v28

    .line 1183
    :cond_c
    const-string/jumbo v4, "exams"

    invoke-virtual {v9, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_d

    .line 1184
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "exams"

    invoke-virtual {v9, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v31

    invoke-virtual {v4, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v31

    .line 1185
    if-eqz v31, :cond_d

    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_d

    .line 1186
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v32

    .line 1189
    :cond_d
    if-eqz v28, :cond_8

    move/from16 v0, v28

    move/from16 v1, v32

    if-ne v0, v1, :cond_8

    .line 1190
    const/16 v38, 0x0

    .local v38, "m":I
    :goto_7
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v38

    if-lt v0, v4, :cond_e

    .line 1201
    invoke-static/range {v27 .. v27}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v23

    .line 1202
    .local v23, "arrayObject":Ljava/lang/Object;
    const-string/jumbo v4, "exams"

    move-object/from16 v0, v23

    invoke-virtual {v8, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 1159
    .end local v23    # "arrayObject":Ljava/lang/Object;
    .end local v27    # "headexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v28    # "headexamssize":I
    .end local v31    # "idheadexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v32    # "idheadexamssize":I
    .end local v38    # "m":I
    :catch_1
    move-exception v26

    .line 1160
    .restart local v26    # "e":Ljava/lang/Exception;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 1191
    .end local v26    # "e":Ljava/lang/Exception;
    .restart local v27    # "headexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v28    # "headexamssize":I
    .restart local v31    # "idheadexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v32    # "idheadexamssize":I
    .restart local v38    # "m":I
    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v0, v27

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v14

    .line 1192
    .local v14, "headtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v0, v31

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v15

    .line 1193
    .local v15, "iheadidtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v14, :cond_f

    if-eqz v15, :cond_f

    const-string/jumbo v4, "questionid"

    invoke-virtual {v14, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_f

    const-string/jumbo v4, "questionid"

    invoke-virtual {v15, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_f

    .line 1195
    const/4 v12, 0x1

    move-object/from16 v10, p0

    move-object v11, v5

    move-object/from16 v13, p3

    move-object/from16 v16, p8

    invoke-direct/range {v10 .. v16}, Lcom/edutech/daoxueben/until/InitDownLoad;->rePlaceWebpath(Ljava/lang/String;ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;)V

    .line 1196
    invoke-static {v14}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v40

    .line 1197
    .local v40, "newobject":Ljava/lang/Object;
    move-object/from16 v0, v27

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1198
    move-object/from16 v0, v27

    move/from16 v1, v38

    move-object/from16 v2, v40

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1190
    .end local v40    # "newobject":Ljava/lang/Object;
    :cond_f
    add-int/lit8 v38, v38, 0x1

    goto :goto_7

    .line 1147
    .end local v9    # "idtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v14    # "headtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v15    # "iheadidtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v27    # "headexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v28    # "headexamssize":I
    .end local v31    # "idheadexamsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v32    # "idheadexamssize":I
    .end local v34    # "isdown":Z
    .end local v38    # "m":I
    :cond_10
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_4
.end method

.method private rePlaceWebpath(Ljava/lang/String;ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;)V
    .locals 18
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "isexam"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1347
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v16, "webpath"

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_1

    const-string/jumbo v16, "progress"

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_1

    const-string/jumbo v16, "downloadsize"

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_1

    .line 1348
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1349
    .local v12, "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1350
    .local v10, "idheadprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1351
    .local v8, "idheaddownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1353
    .local v9, "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "webpath"

    move-object/from16 v0, p5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v12, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v12

    .line 1354
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "progress"

    move-object/from16 v0, p5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v10, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1355
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "downloadsize"

    move-object/from16 v0, p5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v8, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "path"

    move-object/from16 v0, p5

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v9, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 1357
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1358
    .local v6, "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1359
    .local v5, "headprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1360
    .local v4, "headdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    .line 1361
    .local v3, "headListSize":I
    if-eqz v12, :cond_1

    if-eqz v10, :cond_1

    if-eqz v8, :cond_1

    if-eqz v9, :cond_1

    .line 1363
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_1

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v16

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v16

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v16

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_1

    .line 1364
    const-string/jumbo v16, "webpath"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_0

    const-string/jumbo v16, "progress"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_0

    const-string/jumbo v16, "downloadsize"

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_0

    .line 1365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "webpath"

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v6, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "progress"

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v5, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 1367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v17, "downloadsize"

    move-object/from16 v0, p4

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v4, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 1368
    if-eqz v6, :cond_0

    if-eqz v5, :cond_0

    if-eqz v4, :cond_0

    .line 1370
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_0

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v16

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_0

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v16

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_0

    .line 1371
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1376
    :cond_0
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-lt v7, v0, :cond_2

    .line 1408
    const-string/jumbo v16, "progress"

    invoke-static {v5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1409
    const-string/jumbo v16, "downloadsize"

    invoke-static {v4}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v0, p4

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1465
    .end local v3    # "headListSize":I
    .end local v4    # "headdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "headprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v6    # "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "i":I
    .end local v8    # "idheaddownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "idheadprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v12    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    return-void

    .line 1377
    .restart local v3    # "headListSize":I
    .restart local v4    # "headdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v5    # "headprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v6    # "headwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "i":I
    .restart local v8    # "idheaddownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "idheadpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v10    # "idheadprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v12    # "idheadwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    invoke-virtual {v12, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1378
    .local v11, "idheadwebpath":Ljava/lang/String;
    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1379
    .local v13, "idpath":Ljava/lang/String;
    const/4 v14, 0x0

    .line 1380
    .local v14, "isfound":Z
    const/4 v15, 0x0

    .local v15, "j":I
    :goto_1
    if-lt v15, v3, :cond_4

    .line 1392
    :goto_2
    if-nez v14, :cond_3

    .line 1393
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    invoke-direct {v0, v1, v11, v13, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateSourceNeedRemoveList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 1376
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1382
    :cond_4
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    .line 1384
    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1385
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v5, v15, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1386
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1387
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1388
    const/4 v14, 0x1

    .line 1389
    goto :goto_2

    .line 1380
    :cond_5
    add-int/lit8 v15, v15, 0x1

    goto :goto_1
.end method

.method private updateBooksJson(Lcom/edutech/json/Tree;Ljava/util/HashMap;)V
    .locals 19
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
            ">;)V"
        }
    .end annotation

    .prologue
    .line 765
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v11, "id"

    .line 766
    .local v11, "key":Ljava/lang/String;
    invoke-virtual/range {p1 .. p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v2

    .line 767
    .local v2, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_0

    .line 890
    return-void

    .line 767
    :cond_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/HashMap;

    .line 770
    .local v14, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v16, "dxitems"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_1

    .line 771
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 772
    .local v5, "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v18, "dxitems"

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v5, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 773
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_1

    .line 774
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-lt v9, v0, :cond_3

    .line 877
    .end local v5    # "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "i":I
    :cond_1
    const-string/jumbo v16, "isnew"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_2

    .line 878
    const/4 v4, 0x0

    .line 880
    .local v4, "boolisnew":Z
    :try_start_0
    const-string/jumbo v16, "isnew"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Boolean;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    .line 885
    :goto_2
    if-eqz v4, :cond_2

    .line 886
    move-object/from16 v0, p0

    iget v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    .line 888
    .end local v4    # "boolisnew":Z
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateBooksJson(Lcom/edutech/json/Tree;Ljava/util/HashMap;)V

    goto :goto_0

    .line 775
    .restart local v5    # "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "i":I
    :cond_3
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 776
    .local v6, "dxitemsObject":Ljava/lang/Object;
    if-eqz v6, :cond_6

    .line 777
    invoke-static {v6}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v13

    .line 778
    .local v13, "tempDxitemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v13, :cond_6

    const-string/jumbo v16, "dxid"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_6

    .line 780
    const/4 v3, 0x0

    .line 781
    .local v3, "booklisdown":Z
    const-string/jumbo v16, "isdown"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_4

    .line 783
    :try_start_1
    const-string/jumbo v16, "isdown"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Boolean;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v3

    .line 789
    :cond_4
    :goto_3
    const-string/jumbo v16, "webpath"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_5

    .line 790
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 791
    .local v15, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v18, "webpath"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v15, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v15

    .line 792
    move-object/from16 v0, p0

    iget v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    move/from16 v16, v0

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int v16, v16, v18

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    .line 794
    if-eqz v3, :cond_5

    .line 795
    const-string/jumbo v16, "size"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v13, v1, v15}, Lcom/edutech/daoxueben/until/InitDownLoad;->getSize(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 799
    .end local v15    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_5
    const-string/jumbo v16, "exams"

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_6

    .line 800
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 801
    .local v8, "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v18, "exams"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v8, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 802
    if-eqz v8, :cond_6

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_6

    .line 803
    move-object/from16 v0, p0

    iget v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    move/from16 v16, v0

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v18

    add-int v16, v16, v18

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    .line 804
    if-eqz v3, :cond_6

    .line 805
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_4
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-lt v10, v0, :cond_7

    .line 774
    .end local v3    # "booklisdown":Z
    .end local v8    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "j":I
    .end local v13    # "tempDxitemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 784
    .restart local v3    # "booklisdown":Z
    .restart local v13    # "tempDxitemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v7

    .line 785
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_3

    .line 806
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v8    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v10    # "j":I
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v12

    .line 807
    .local v12, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v12, :cond_8

    const-string/jumbo v16, "webpath"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    if-eqz v16, :cond_8

    .line 808
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 809
    .restart local v15    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v16, v0

    const-string/jumbo v18, "webpath"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v15, v1}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v15

    .line 810
    if-eqz v15, :cond_8

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-lez v16, :cond_8

    .line 811
    if-eqz v3, :cond_8

    .line 812
    const-string/jumbo v16, "sizes"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v12, v1, v15}, Lcom/edutech/daoxueben/until/InitDownLoad;->getSize(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 805
    .end local v15    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_8
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 881
    .end local v3    # "booklisdown":Z
    .end local v5    # "dxitemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v6    # "dxitemsObject":Ljava/lang/Object;
    .end local v8    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "i":I
    .end local v10    # "j":I
    .end local v12    # "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v13    # "tempDxitemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v4    # "boolisnew":Z
    :catch_1
    move-exception v7

    .line 883
    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2
.end method

.method private updateSourceNeedRemoveList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "webpath"    # Ljava/lang/String;
    .param p3, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1512
    .local p4, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1514
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1515
    .local v0, "sources":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "book_id"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1516
    const-string/jumbo v1, "source_webpath"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1517
    const-string/jumbo v1, "source_path"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1518
    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1520
    .end local v0    # "sources":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public addNewKeys(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 30
    .param p1, "bookId"    # Ljava/lang/String;
    .param p4, "key"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p2 .. p3}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v11

    .line 43
    .local v11, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v29

    :cond_0
    :goto_0
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 172
    return-void

    .line 43
    :cond_1
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Ljava/util/HashMap;

    .line 45
    .local v27, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, v27

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 47
    move-object/from16 v0, v27

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    .line 49
    .local v17, "id":Ljava/lang/String;
    const-string/jumbo v5, "isdown"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, "isnew"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_3

    .line 52
    :cond_2
    const/16 v19, 0x0

    .line 53
    .local v19, "isdown":Z
    const/16 v21, 0x0

    .line 54
    .local v21, "isnew":Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string/jumbo v7, "isdown"

    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v5, v0, v1, v6, v7}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-static/range {v21 .. v21}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string/jumbo v7, "isnew"

    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v5, v0, v1, v6, v7}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    .end local v19    # "isdown":Z
    .end local v21    # "isnew":Z
    :cond_3
    const-string/jumbo v5, "dxitems"

    move-object/from16 v0, v27

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 58
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v13, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "dxitems"

    move-object/from16 v0, v27

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v13, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v13

    .line 60
    if-eqz v13, :cond_4

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 62
    const/16 v18, 0x0

    .line 63
    .local v18, "ischange":Z
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_1
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v5

    move/from16 v0, v16

    if-lt v0, v5, :cond_5

    .line 166
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-static {v13}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "dxitems"

    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v5, v0, v1, v6, v7}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 169
    .end local v13    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v16    # "i":I
    .end local v18    # "ischange":Z
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, v27

    move-object/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/daoxueben/until/InitDownLoad;->addNewKeys(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 65
    .restart local v13    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v16    # "i":I
    .restart local v18    # "ischange":Z
    :cond_5
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v26

    .line 66
    .local v26, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v26, :cond_c

    .line 67
    const-string/jumbo v5, "isdown"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6

    const-string/jumbo v5, "isnew"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_7

    .line 70
    :cond_6
    const/16 v18, 0x1

    .line 71
    const/16 v19, 0x0

    .line 72
    .restart local v19    # "isdown":Z
    const/16 v21, 0x0

    .line 73
    .restart local v21    # "isnew":Z
    const-string/jumbo v5, "isdown"

    invoke-static/range {v19 .. v19}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string/jumbo v5, "isnew"

    invoke-static/range {v21 .. v21}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .end local v19    # "isdown":Z
    .end local v21    # "isnew":Z
    :cond_7
    const-string/jumbo v5, "webpath"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9

    const-string/jumbo v5, "path"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9

    const-string/jumbo v5, "size"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_9

    .line 77
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .local v28, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "webpath"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v28

    invoke-virtual {v5, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v28

    .line 80
    if-eqz v28, :cond_9

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_9

    const-string/jumbo v5, "progress"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_8

    const-string/jumbo v5, "downloadsize"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_9

    .line 82
    :cond_8
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v25, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v12, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/16 v22, 0x0

    .local v22, "j":I
    :goto_2
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v5

    move/from16 v0, v22

    if-lt v0, v5, :cond_e

    .line 89
    const/16 v18, 0x1

    .line 90
    const-string/jumbo v5, "progress"

    invoke-static/range {v25 .. v25}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string/jumbo v5, "downloadsize"

    invoke-static {v12}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .end local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v22    # "j":I
    .end local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_9
    const-string/jumbo v5, "exams"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_c

    .line 98
    const-string/jumbo v5, "dxid"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_a

    .line 99
    const-string/jumbo v5, "dxid"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 100
    .local v8, "dxid":Ljava/lang/String;
    const/4 v6, 0x0

    const-string/jumbo v5, "exams"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    sget-object v10, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->StudentId:Ljava/lang/String;

    move-object/from16 v5, p0

    move-object/from16 v7, p1

    invoke-virtual/range {v5 .. v10}, Lcom/edutech/daoxueben/until/InitDownLoad;->createExamsJson(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .end local v8    # "dxid":Ljava/lang/String;
    :cond_a
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v14, "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v5, "0"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_b

    .line 105
    const/16 v18, 0x1

    .line 106
    const-string/jumbo v5, "examsprogress"

    const-string/jumbo v6, "100"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    :cond_b
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "exams"

    move-object/from16 v0, v26

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v14, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v14

    .line 111
    if-eqz v14, :cond_c

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_c

    .line 113
    const/16 v20, 0x0

    .line 114
    .local v20, "isexamchange":Z
    const/16 v22, 0x0

    .restart local v22    # "j":I
    :goto_3
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v5

    move/from16 v0, v22

    if-lt v0, v5, :cond_f

    .line 152
    const-string/jumbo v5, "exams"

    invoke-static {v14}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .end local v14    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v20    # "isexamchange":Z
    .end local v22    # "j":I
    :cond_c
    if-eqz v18, :cond_d

    .line 158
    invoke-static/range {v26 .. v26}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v24

    .line 159
    .local v24, "newObject":Ljava/lang/Object;
    if-eqz v24, :cond_d

    .line 161
    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 162
    move/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v13, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 63
    .end local v24    # "newObject":Ljava/lang/Object;
    :cond_d
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_1

    .line 86
    .restart local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v22    # "j":I
    .restart local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_e
    const-string/jumbo v5, "0"

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_2

    .line 116
    .end local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v14    # "examsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v20    # "isexamchange":Z
    :cond_f
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move/from16 v0, v22

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v15

    .line 117
    .local v15, "examtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v15, :cond_12

    .line 118
    const-string/jumbo v5, "webpath"

    invoke-virtual {v15, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_12

    const-string/jumbo v5, "path"

    invoke-virtual {v15, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_12

    const-string/jumbo v5, "sizes"

    invoke-virtual {v15, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_12

    .line 119
    const/16 v20, 0x1

    .line 120
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .restart local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "webpath"

    invoke-virtual {v15, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, v28

    invoke-virtual {v5, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v28

    .line 122
    if-eqz v28, :cond_10

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_10

    .line 123
    const/16 v18, 0x1

    .line 124
    const-string/jumbo v5, "examsprogress"

    const-string/jumbo v6, "0"

    move-object/from16 v0, v26

    invoke-virtual {v0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    :cond_10
    if-eqz v28, :cond_12

    const-string/jumbo v5, "progress"

    invoke-virtual {v15, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_11

    const-string/jumbo v5, "downloadsize"

    invoke-virtual {v15, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_12

    .line 130
    :cond_11
    const/16 v18, 0x1

    .line 131
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .restart local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .restart local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/16 v23, 0x0

    .local v23, "k":I
    :goto_4
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v5

    move/from16 v0, v23

    if-lt v0, v5, :cond_14

    .line 138
    const-string/jumbo v5, "progress"

    invoke-static/range {v25 .. v25}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v15, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string/jumbo v5, "downloadsize"

    invoke-static {v12}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v15, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .end local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v23    # "k":I
    .end local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_12
    if-eqz v20, :cond_13

    .line 144
    invoke-static {v15}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v24

    .line 145
    .restart local v24    # "newObject":Ljava/lang/Object;
    if-eqz v24, :cond_13

    .line 147
    move/from16 v0, v22

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 148
    move/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v14, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 114
    .end local v24    # "newObject":Ljava/lang/Object;
    :cond_13
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_3

    .line 135
    .restart local v12    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v23    # "k":I
    .restart local v25    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v28    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_14
    const-string/jumbo v5, "0"

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    add-int/lit8 v23, v23, 0x1

    goto :goto_4
.end method

.method public addToDownList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 13
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "sizekey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 595
    .local p3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v11, "webpath"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    const-string/jumbo v11, "path"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    const-string/jumbo v11, "progress"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    invoke-virtual/range {p3 .. p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_0

    .line 596
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 597
    .local v10, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 598
    .local v4, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 599
    .local v6, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 600
    .local v8, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v11, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v12, "webpath"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v10, v12}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 601
    iget-object v11, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v12, "path"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v4, v12}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 602
    iget-object v11, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v12, "progress"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v6, v12}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 603
    iget-object v11, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual/range {p3 .. p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v8, v12}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 604
    if-eqz v10, :cond_0

    if-eqz v4, :cond_0

    if-eqz v6, :cond_0

    if-eqz v8, :cond_0

    .line 610
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v11, v12, :cond_0

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v11, v12, :cond_0

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ne v11, v12, :cond_0

    .line 612
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lt v2, v11, :cond_1

    .line 636
    .end local v2    # "i":I
    .end local v4    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v6    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 614
    .restart local v2    # "i":I
    .restart local v4    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v6    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v8    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v10    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    const-string/jumbo v11, "100"

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 615
    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 616
    .local v9, "webpath":Ljava/lang/String;
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 617
    .local v3, "path":Ljava/lang/String;
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 618
    .local v5, "progress":Ljava/lang/String;
    invoke-virtual {v8, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 619
    .local v7, "size":Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 620
    .local v1, "downInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v11, "book_id"

    invoke-virtual {v1, v11, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    const-string/jumbo v11, "source_id"

    invoke-virtual {v1, v11, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 624
    const-string/jumbo v11, "source_webpath"

    invoke-virtual {v1, v11, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    const-string/jumbo v11, "source_path"

    invoke-virtual {v1, v11, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 626
    const-string/jumbo v11, "source_progress"

    invoke-virtual {v1, v11, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    const-string/jumbo v11, "source_size"

    invoke-virtual {v1, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    const-string/jumbo v11, "source_isdown"

    const-string/jumbo v12, "1"

    invoke-virtual {v1, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 629
    move-object/from16 v0, p5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 612
    .end local v1    # "downInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "path":Ljava/lang/String;
    .end local v5    # "progress":Ljava/lang/String;
    .end local v7    # "size":Ljava/lang/String;
    .end local v9    # "webpath":Ljava/lang/String;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public changeIsDown(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 24
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p4, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v6, "id"

    .line 177
    .local v6, "key":Ljava/lang/String;
    if-eqz p1, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 179
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    .line 181
    .local v13, "bookId":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 183
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .local v5, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    const-string/jumbo v7, ""

    .line 187
    .local v7, "dxid":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    invoke-virtual/range {v2 .. v7}, Lcom/edutech/daoxueben/until/InitDownLoad;->getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 189
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {v2, v5}, Lcom/edutech/json/JsonPort;->listToSourceId(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v14

    .line 193
    .local v14, "sourceId":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/HashMap;

    .line 194
    .local v11, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_0

    .line 196
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v2, v5, v6}, Lcom/edutech/daoxueben/until/InitDownLoad;->getNeedDownHead(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v11

    .line 201
    :cond_0
    const-string/jumbo v2, ""

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 202
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v21

    .line 209
    .local v21, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v2, "isdown"

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 210
    const/16 v23, 0x1

    .line 212
    .local v23, "isdown":Z
    :try_start_0
    const-string/jumbo v2, "isdown"

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v23

    .line 217
    :goto_0
    if-nez v23, :cond_1

    .line 218
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string/jumbo v4, "isdown"

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v11, v3, v4}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 226
    .end local v23    # "isdown":Z
    :cond_1
    const/4 v9, 0x0

    move-object/from16 v8, p0

    move-object/from16 v10, p1

    move-object v12, v7

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    invoke-virtual/range {v8 .. v16}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateDxiditemsIsDown(ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    move-object/from16 v12, p0

    move-object/from16 v15, p1

    move-object/from16 v16, v11

    move-object/from16 v17, p3

    move-object/from16 v18, v6

    move-object/from16 v19, p3

    move-object/from16 v20, p4

    .line 230
    invoke-virtual/range {v12 .. v20}, Lcom/edutech/daoxueben/until/InitDownLoad;->getNeedDownLoadList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 238
    .end local v5    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v7    # "dxid":Ljava/lang/String;
    .end local v11    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v13    # "bookId":Ljava/lang/String;
    .end local v14    # "sourceId":Ljava/lang/String;
    .end local v21    # "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_2
    :goto_1
    return-void

    .line 213
    .restart local v5    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v7    # "dxid":Ljava/lang/String;
    .restart local v11    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v13    # "bookId":Ljava/lang/String;
    .restart local v14    # "sourceId":Ljava/lang/String;
    .restart local v21    # "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v23    # "isdown":Z
    :catch_0
    move-exception v22

    .line 215
    .local v22, "e":Ljava/lang/Exception;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 234
    .end local v21    # "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v22    # "e":Ljava/lang/Exception;
    .end local v23    # "isdown":Z
    :cond_3
    const/4 v9, 0x1

    move-object/from16 v8, p0

    move-object/from16 v10, p1

    move-object v12, v7

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    invoke-virtual/range {v8 .. v16}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateDxiditemsIsDown(ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    goto :goto_1
.end method

.method public createExamsJson(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 8
    .param p1, "jsupdate"    # I
    .param p2, "bookid"    # Ljava/lang/String;
    .param p3, "dxid"    # Ljava/lang/String;
    .param p4, "exams"    # Ljava/lang/Object;
    .param p5, "studentid"    # Ljava/lang/String;

    .prologue
    .line 641
    if-eqz p4, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, ""

    invoke-virtual {v6, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 642
    const-string/jumbo v1, ""

    .line 643
    .local v1, "json":Ljava/lang/String;
    new-instance v2, Lorg/json/JSONStringer;

    invoke-direct {v2}, Lorg/json/JSONStringer;-><init>()V

    .line 645
    .local v2, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v2}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 646
    const-string/jumbo v6, "studentid"

    invoke-virtual {v2, v6}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {v6, p5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 647
    const-string/jumbo v6, "exams"

    invoke-virtual {v2, v6}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {v6, p4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 648
    invoke-virtual {v2}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 656
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 659
    new-instance v6, Ljava/lang/StringBuilder;

    sget-object v7, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 660
    .local v5, "pathdir":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    sget-object v7, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ".json"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 661
    .local v4, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 662
    .local v3, "outFile":Ljava/io/File;
    if-nez p1, :cond_1

    .line 664
    invoke-static {v5}, Lcom/edutech/daoxueben/until/FileInOutHelper;->fileIsExists(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 667
    invoke-static {v3}, Lcom/edutech/daoxueben/until/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 668
    invoke-static {v1, v4}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 683
    .end local v1    # "json":Ljava/lang/String;
    .end local v2    # "jsonStringer":Lorg/json/JSONStringer;
    .end local v3    # "outFile":Ljava/io/File;
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "pathdir":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 649
    .restart local v1    # "json":Ljava/lang/String;
    .restart local v2    # "jsonStringer":Lorg/json/JSONStringer;
    :catch_0
    move-exception v0

    .line 651
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_0

    .line 652
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 654
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 671
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "outFile":Ljava/io/File;
    .restart local v4    # "path":Ljava/lang/String;
    .restart local v5    # "pathdir":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x1

    if-ne p1, v6, :cond_0

    .line 673
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 675
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 677
    :cond_2
    invoke-static {v3}, Lcom/edutech/daoxueben/until/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 678
    invoke-static {v1, v4}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1
.end method

.method public getBooks(Lcom/edutech/json/Tree;Lcom/edutech/json/Books;)Lcom/edutech/json/Books;
    .locals 11
    .param p2, "book"    # Lcom/edutech/json/Books;
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
            "Lcom/edutech/json/Books;",
            ")",
            "Lcom/edutech/json/Books;"
        }
    .end annotation

    .prologue
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v10, 0x0

    const-wide/16 v8, 0x0

    .line 696
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 699
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string/jumbo v5, "id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 701
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string/jumbo v5, "id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 702
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string/jumbo v5, "name"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 703
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    const-string/jumbo v5, "updatetime"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 704
    .local v3, "updatetime":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 705
    invoke-virtual {p2, v0}, Lcom/edutech/json/Books;->setbook_id(Ljava/lang/String;)V

    .line 706
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "../offlinedownload/"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setbook_path(Ljava/lang/String;)V

    .line 709
    :cond_0
    if-eqz v1, :cond_1

    .line 710
    invoke-virtual {p2, v1}, Lcom/edutech/json/Books;->setbook_name(Ljava/lang/String;)V

    .line 711
    :cond_1
    if-eqz v3, :cond_2

    .line 712
    invoke-virtual {p2, v3}, Lcom/edutech/json/Books;->setBook_updatetime(Ljava/lang/String;)V

    .line 718
    :cond_2
    iput-wide v8, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    .line 719
    iput-wide v8, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    .line 720
    iput v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    .line 721
    iput v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    .line 722
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    invoke-direct {p0, p1, v4}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateBooksJson(Lcom/edutech/json/Tree;Ljava/util/HashMap;)V

    .line 724
    iget v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setBook_total(I)V

    .line 725
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    invoke-virtual {p2, v4, v5}, Lcom/edutech/json/Books;->setBookdownloadsize(J)V

    .line 726
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    invoke-virtual {p2, v4, v5}, Lcom/edutech/json/Books;->setBooksize(J)V

    .line 727
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    cmp-long v4, v4, v8

    if-nez v4, :cond_4

    .line 729
    const-string/jumbo v4, "100"

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    .line 748
    :goto_0
    iget v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    if-nez v4, :cond_7

    .line 749
    invoke-virtual {p2, v10}, Lcom/edutech/json/Books;->setBook_isnew(I)V

    .line 755
    .end local v0    # "id":Ljava/lang/String;
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "updatetime":Ljava/lang/String;
    :cond_3
    :goto_1
    iput-wide v8, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    .line 756
    iput-wide v8, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    .line 757
    iput v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->total:I

    .line 758
    iput v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->isnewCount:I

    .line 759
    return-object p2

    .line 733
    .restart local v0    # "id":Ljava/lang/String;
    .restart local v1    # "name":Ljava/lang/String;
    .restart local v3    # "updatetime":Ljava/lang/String;
    :cond_4
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    long-to-float v4, v4

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v4, v5

    iget-wide v6, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    long-to-float v5, v6

    div-float/2addr v4, v5

    float-to-long v4, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .line 734
    .local v2, "newprogress":Ljava/lang/String;
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    iget-wide v6, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_5

    .line 736
    const-string/jumbo v4, "100"

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    goto :goto_0

    .line 739
    :cond_5
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    cmp-long v4, v4, v8

    if-lez v4, :cond_6

    const-string/jumbo v4, "0"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 741
    const-string/jumbo v4, "1"

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    goto :goto_0

    .line 744
    :cond_6
    invoke-virtual {p2, v2}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    goto :goto_0

    .line 751
    .end local v2    # "newprogress":Ljava/lang/String;
    :cond_7
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/edutech/json/Books;->setBook_isnew(I)V

    goto :goto_1
.end method

.method public getNeedDownHead(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 6
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
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
    .line 406
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_0

    .line 419
    return-object p2

    .line 407
    :cond_0
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 409
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 410
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 406
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 410
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 412
    .local v3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 414
    move-object p2, v3

    .line 415
    goto :goto_1
.end method

.method public getNeedDownLoadList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 18
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p6, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 435
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p7, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p8, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual/range {p3 .. p4}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v14

    .line 437
    .local v14, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_0
    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 470
    return-void

    .line 437
    :cond_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 439
    .local v4, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v4, :cond_0

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 440
    const-string/jumbo v1, ""

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 441
    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 446
    :goto_1
    const-string/jumbo v1, "isdown"

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 447
    const/16 v16, 0x1

    .line 449
    .local v16, "isdown":Z
    :try_start_0
    const-string/jumbo v1, "isdown"

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v16

    .line 455
    :goto_2
    if-nez v16, :cond_2

    .line 456
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string/jumbo v3, "isdown"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0, v4, v2, v3}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 465
    .end local v16    # "isdown":Z
    :cond_2
    const/4 v2, 0x0

    const-string/jumbo v5, ""

    move-object/from16 v1, p0

    move-object/from16 v3, p3

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v1 .. v9}, Lcom/edutech/daoxueben/until/InitDownLoad;->updateDxiditemsIsDown(ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object v9, v4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move-object/from16 v12, p7

    move-object/from16 v13, p8

    .line 466
    invoke-virtual/range {v5 .. v13}, Lcom/edutech/daoxueben/until/InitDownLoad;->getNeedDownLoadList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 467
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lcom/edutech/json/JsonPort;->removeSourceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto/16 :goto_0

    .line 443
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    .line 451
    .restart local v16    # "isdown":Z
    :catch_0
    move-exception v15

    .line 453
    .local v15, "e":Ljava/lang/Exception;
    invoke-virtual {v15}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public getSize(Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 8
    .param p2, "sizekey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 895
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "downloadsize"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 896
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 897
    .local v0, "downloadsizelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 898
    .local v2, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v3, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v4, "downloadsize"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 899
    iget-object v3, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    .line 900
    if-eqz p3, :cond_0

    if-eqz v0, :cond_0

    if-eqz v2, :cond_0

    .line 901
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 903
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 910
    .end local v0    # "downloadsizelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v1    # "i":I
    .end local v2    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 904
    .restart local v0    # "downloadsizelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v1    # "i":I
    .restart local v2    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->downloadsize:J

    .line 905
    iget-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->size:J

    .line 903
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "dxid"    # Ljava/lang/String;
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 384
    .local p1, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v6

    .line 386
    .local v6, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 400
    return-object p5

    .line 386
    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 388
    .local v2, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v2, :cond_0

    invoke-virtual {v2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 390
    invoke-virtual {v2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 391
    .local v7, "id":Ljava/lang/String;
    invoke-virtual {p3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    const-string/jumbo v0, "dxid"

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 394
    const-string/jumbo v0, "dxid"

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p5

    :cond_2
    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 397
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/daoxueben/until/InitDownLoad;->getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    goto :goto_0
.end method

.method public treeIschange(ZLcom/edutech/json/Tree;Lcom/edutech/json/Tree;)Z
    .locals 9
    .param p1, "ischange"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
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
            ">;>;)Z"
        }
    .end annotation

    .prologue
    .line 914
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v7, "id"

    .line 915
    .local v7, "key":Ljava/lang/String;
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 916
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 917
    .local v8, "bookid":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 918
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 919
    .local v2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 920
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v7}, Lcom/edutech/daoxueben/until/InitDownLoad;->compareisDown(ZLjava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result p1

    .line 923
    .end local v2    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v8    # "bookid":Ljava/lang/String;
    :cond_0
    return p1
.end method

.method public treeReplace(Ljava/lang/String;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 12
    .param p1, "downloadjsonbookid"    # Ljava/lang/String;
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
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1050
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p5, "sourceNeedRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v11, "id"

    .line 1051
    .local v11, "key":Ljava/lang/String;
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1052
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1053
    .local v10, "bookid":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1054
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1055
    .local v2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1056
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    invoke-virtual {p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    const-string/jumbo v7, "id"

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p4

    invoke-direct/range {v0 .. v9}, Lcom/edutech/daoxueben/until/InitDownLoad;->getisDown(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1060
    .end local v2    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v10    # "bookid":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public updateBooksJson(Lcom/edutech/json/Tree;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 688
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v0, Lcom/edutech/json/Books;

    invoke-direct {v0}, Lcom/edutech/json/Books;-><init>()V

    .line 689
    .local v0, "book":Lcom/edutech/json/Books;
    invoke-virtual {p0, p1, v0}, Lcom/edutech/daoxueben/until/InitDownLoad;->getBooks(Lcom/edutech/json/Tree;Lcom/edutech/json/Books;)Lcom/edutech/json/Books;

    move-result-object v0

    .line 691
    iget-object v1, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    sget-object v2, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lcom/edutech/json/JsonPort;->updateBooksJson(Lcom/edutech/json/Books;Ljava/lang/String;)V

    .line 693
    return-void
.end method

.method public updateDxiditemsIsDown(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 7
    .param p3, "bookid"    # Ljava/lang/String;
    .param p4, "soucrceId"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1319
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v5, "dxitems"

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1321
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1322
    .local v0, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v5, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v6, "dxitems"

    invoke-virtual {p2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1323
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 1325
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v2, v5, :cond_1

    .line 1345
    .end local v0    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 1327
    .restart local v0    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v2    # "i":I
    :cond_1
    iget-object v5, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v4

    .line 1328
    .local v4, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v4, :cond_2

    const-string/jumbo v5, "dxid"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 1330
    const/4 v3, 0x1

    .line 1332
    .local v3, "isdown":Z
    :try_start_0
    const-string/jumbo v5, "isdown"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 1337
    :goto_1
    if-eqz v3, :cond_2

    .line 1339
    invoke-direct {p0, p3, p4, v4, p5}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 1325
    .end local v3    # "isdown":Z
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1333
    .restart local v3    # "isdown":Z
    :catch_0
    move-exception v1

    .line 1335
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public updateDxiditemsIsDown(ZLcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 13
    .param p1, "isSingle"    # Z
    .param p4, "dxid"    # Ljava/lang/String;
    .param p5, "bookid"    # Ljava/lang/String;
    .param p6, "soucrceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 243
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p7, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p8, "isDownTrueDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v10, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 245
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .local v3, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    iget-object v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    const-string/jumbo v11, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v3, v11}, Lcom/edutech/json/JsonPort;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 247
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_0

    .line 249
    const/4 v6, 0x0

    .line 250
    .local v6, "ischange":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lt v5, v10, :cond_1

    .line 312
    iget-object v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-static {v3}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v11

    const-string/jumbo v12, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v10, p2, v0, v11, v12}, Lcom/edutech/json/JsonPort;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 380
    .end local v3    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "i":I
    .end local v6    # "ischange":Z
    :cond_0
    return-void

    .line 252
    .restart local v3    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v5    # "i":I
    .restart local v6    # "ischange":Z
    :cond_1
    iget-object v10, p0, Lcom/edutech/daoxueben/until/InitDownLoad;->jsonPort:Lcom/edutech/json/JsonPort;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/edutech/json/JsonPort;->objectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 253
    .local v9, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_3

    const-string/jumbo v10, "dxid"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 254
    if-eqz p1, :cond_5

    .line 255
    const-string/jumbo v10, "dxid"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p4

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 256
    const/4 v6, 0x1

    .line 258
    const/4 v7, 0x1

    .line 260
    .local v7, "isdown":Z
    :try_start_0
    const-string/jumbo v10, "isdown"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 265
    :goto_1
    if-nez v7, :cond_4

    .line 267
    const-string/jumbo v10, "isdown"

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    invoke-direct {p0, v0, v1, v9, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 302
    .end local v7    # "isdown":Z
    :cond_2
    :goto_2
    if-eqz v6, :cond_3

    .line 303
    invoke-static {v9}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v8

    .line 304
    .local v8, "newObject":Ljava/lang/Object;
    if-eqz v8, :cond_3

    .line 306
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 307
    invoke-virtual {v3, v5, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 250
    .end local v8    # "newObject":Ljava/lang/Object;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 261
    .restart local v7    # "isdown":Z
    :catch_0
    move-exception v4

    .line 263
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 273
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_4
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p8

    invoke-direct {p0, v0, v1, v9, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    goto :goto_2

    .line 279
    .end local v7    # "isdown":Z
    :cond_5
    const/4 v6, 0x1

    .line 281
    const/4 v7, 0x1

    .line 283
    .restart local v7    # "isdown":Z
    :try_start_1
    const-string/jumbo v10, "isdown"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v7

    .line 288
    :goto_3
    if-nez v7, :cond_6

    .line 290
    const-string/jumbo v10, "isdown"

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p7

    invoke-direct {p0, v0, v1, v9, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    goto :goto_2

    .line 284
    :catch_1
    move-exception v4

    .line 286
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 297
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_6
    move-object/from16 v0, p5

    move-object/from16 v1, p6

    move-object/from16 v2, p8

    invoke-direct {p0, v0, v1, v9, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    goto :goto_2
.end method

.method public updateKeys(Lcom/edutech/json/Tree;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 31
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 32
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "bookId":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string/jumbo v2, "id"

    invoke-virtual {p0, v0, p1, v1, v2}, Lcom/edutech/daoxueben/until/InitDownLoad;->addNewKeys(Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)V

    .line 35
    .end local v0    # "bookId":Ljava/lang/String;
    :cond_0
    return-void
.end method
