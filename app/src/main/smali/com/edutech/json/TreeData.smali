.class public Lcom/edutech/json/TreeData;
.super Ljava/lang/Object;
.source "TreeData.java"


# instance fields
.field private common:Lcom/edutech/json/CommonJSONParser;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    iput-object v0, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 21
    return-void
.end method

.method private addDaoToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 19
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
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
            ">;>;",
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
    .line 648
    .local p3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v15, 0x0

    .line 649
    .local v15, "boolisdown":Z
    const-string/jumbo v2, "isdown"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 651
    :try_start_0
    const-string/jumbo v2, "isdown"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    .line 657
    :cond_0
    :goto_0
    if-eqz v15, :cond_2

    .line 659
    const-string/jumbo v7, "size"

    const-string/jumbo v8, "webpath"

    const-string/jumbo v9, "path"

    const-string/jumbo v10, "progress"

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    .line 658
    invoke-direct/range {v2 .. v10}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 660
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 666
    .local v16, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 669
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 668
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v16

    .line 670
    if-eqz v16, :cond_2

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 672
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_1
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 687
    .end local v16    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    return-object p4

    .line 652
    :catch_0
    move-exception v17

    .line 654
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 672
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v16    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "tempdataobject":Ljava/lang/Object;
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    .line 674
    invoke-direct/range {v2 .. v7}, Lcom/edutech/json/TreeData;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 677
    invoke-static {v5}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 678
    .local v9, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_1

    .line 680
    const-string/jumbo v11, "sizes"

    .line 681
    const-string/jumbo v12, "webpath"

    const-string/jumbo v13, "path"

    const-string/jumbo v14, "progress"

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v10, p4

    .line 679
    invoke-direct/range {v6 .. v14}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    goto :goto_1
.end method

.method private addNewDaoToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 21
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
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
            ">;>;",
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
    .line 695
    .local p3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p3, :cond_0

    const-string/jumbo v2, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 696
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 698
    .local v16, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v2, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 697
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v16

    .line 699
    if-eqz v16, :cond_0

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 702
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_0
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v18

    if-lt v0, v2, :cond_1

    .line 758
    .end local v16    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v18    # "i":I
    :cond_0
    return-object p4

    .line 705
    .restart local v16    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v18    # "i":I
    :cond_1
    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v5

    .line 706
    .local v5, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v5, :cond_3

    const-string/jumbo v2, "dxid"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 707
    const-string/jumbo v2, "isdown"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 708
    const/16 v19, 0x0

    .line 710
    .local v19, "isdown":Z
    :try_start_0
    const-string/jumbo v2, "isdown"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v19

    .line 715
    :goto_1
    if-eqz v19, :cond_3

    .line 717
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 718
    const-string/jumbo v3, "dxid"

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 717
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 721
    .local v4, "newSourceId":Ljava/lang/String;
    const-string/jumbo v7, "size"

    const-string/jumbo v8, "webpath"

    const-string/jumbo v9, "path"

    const-string/jumbo v10, "progress"

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v6, p4

    .line 719
    invoke-direct/range {v2 .. v10}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 722
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 728
    .local v15, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 732
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 730
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v15

    .line 733
    if-eqz v15, :cond_3

    .line 734
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 736
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 702
    .end local v4    # "newSourceId":Ljava/lang/String;
    .end local v15    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v19    # "isdown":Z
    :cond_3
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_0

    .line 711
    .restart local v19    # "isdown":Z
    :catch_0
    move-exception v17

    .line 713
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 736
    .end local v17    # "e":Ljava/lang/Exception;
    .restart local v4    # "newSourceId":Ljava/lang/String;
    .restart local v15    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .line 739
    .local v20, "tempdataobject":Ljava/lang/Object;
    invoke-static/range {v20 .. v20}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 740
    .local v9, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_2

    .line 744
    const-string/jumbo v11, "sizes"

    .line 745
    const-string/jumbo v12, "webpath"

    const-string/jumbo v13, "path"

    .line 746
    const-string/jumbo v14, "progress"

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object v8, v4

    move-object/from16 v10, p4

    .line 741
    invoke-direct/range {v6 .. v14}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    goto :goto_2
.end method

.method private addNewKeys(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p2, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 253
    .local p1, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v6, "null"

    .line 254
    .local v6, "key":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 255
    const/4 v3, 0x0

    .line 256
    .local v3, "isChange":Z
    const/4 v5, 0x0

    .line 257
    .local v5, "i":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 287
    return-object p1

    .line 257
    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 259
    .local v7, "tempdataobject":Ljava/lang/Object;
    if-eqz v7, :cond_5

    .line 262
    invoke-static {v7}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v1

    .line 263
    .local v1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_5

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 265
    const-string/jumbo v0, "webpath"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 266
    const-string/jumbo v0, "WrongQuestionSet"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 267
    const-string/jumbo v0, "GeRenChengZhang"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    .line 268
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->addNewKeysChange(Ljava/util/HashMap;Ljava/util/ArrayList;ZLjava/lang/String;I)V

    .line 271
    :cond_2
    const-string/jumbo v0, "items"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 272
    const-string/jumbo v0, "LessonPlanning"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    .line 273
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->addNewKeysLessonPlan(Ljava/util/HashMap;Ljava/util/ArrayList;ZLjava/lang/String;I)V

    .line 277
    :cond_3
    const-string/jumbo v0, "Homework"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 278
    const-string/jumbo v0, "MyExaminationPaper"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    move-object v0, p0

    move-object v2, p1

    move-object v4, p2

    .line 279
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->addNewKeysChange(Ljava/util/HashMap;Ljava/util/ArrayList;ZLjava/lang/String;I)V

    .line 284
    .end local v1    # "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private addPlanToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p3, "dataObject"    # Ljava/lang/Object;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
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
    .line 2291
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v6, "webpath"

    .line 2294
    .local v6, "key":Ljava/lang/String;
    invoke-static {p3}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 2295
    .local v3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_0

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2298
    invoke-direct {p0, p5}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    .line 2297
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->updateLessonPlanDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 2300
    :cond_0
    return-object p4
.end method

.method private addQuestionListToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 11
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
    .line 850
    .local p3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v0, "question"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 852
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 854
    .local v10, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v0, "question"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 853
    invoke-virtual {p0, v10, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 855
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 857
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_0
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v9, v0, :cond_1

    .line 872
    .end local v9    # "j":I
    .end local v10    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-object p4

    .line 859
    .restart local v9    # "j":I
    .restart local v10    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 860
    .local v3, "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v0, "questionid"

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 863
    const-string/jumbo v5, "size"

    const-string/jumbo v6, "webpath"

    .line 864
    const-string/jumbo v7, "path"

    const-string/jumbo v8, "progress"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    .line 862
    invoke-direct/range {v0 .. v8}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 866
    const-string/jumbo v5, "qsize"

    .line 867
    const-string/jumbo v6, "qwebpath"

    const-string/jumbo v7, "qpath"

    const-string/jumbo v8, "qprogress"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    .line 865
    invoke-direct/range {v0 .. v8}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 857
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_0
.end method

.method private addToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
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
    .line 765
    .local p3, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 770
    return-object p4

    .line 765
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "tempdataobject":Ljava/lang/Object;
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    .line 767
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 18
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p3, "dataObject"    # Ljava/lang/Object;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
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
    .line 776
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v17, "null"

    .line 777
    .local v17, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 780
    invoke-static/range {p3 .. p3}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v7

    .line 781
    .local v7, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_1

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 783
    const-string/jumbo v4, ""

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 784
    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 788
    :goto_0
    const-string/jumbo v4, "ZuoYeFuDao"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 789
    const/4 v14, 0x0

    .line 790
    .local v14, "boolisdown":Z
    const-string/jumbo v4, "isdown"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 792
    :try_start_0
    const-string/jumbo v4, "isdown"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v14

    .line 799
    :cond_0
    :goto_1
    if-eqz v14, :cond_1

    .line 801
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 802
    const-string/jumbo v10, "webpath"

    const-string/jumbo v11, "path"

    const-string/jumbo v12, "progress"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    .line 800
    invoke-direct/range {v4 .. v12}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 842
    .end local v14    # "boolisdown":Z
    :cond_1
    :goto_2
    return-object p4

    .line 786
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 793
    .restart local v14    # "boolisdown":Z
    :catch_0
    move-exception v15

    .line 795
    .local v15, "e":Ljava/lang/Exception;
    invoke-virtual {v15}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 803
    .end local v14    # "boolisdown":Z
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_3
    const-string/jumbo v4, "WrongQuestionSet"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 808
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 809
    const-string/jumbo v10, "webpath"

    const-string/jumbo v11, "path"

    const-string/jumbo v12, "progress"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    .line 807
    invoke-direct/range {v4 .. v12}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 809
    goto :goto_2

    .line 810
    :cond_4
    const-string/jumbo v4, "Homework"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 811
    const-string/jumbo v4, "MyExaminationPaper"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 813
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 814
    const-string/jumbo v10, "webpath"

    const-string/jumbo v11, "path"

    const-string/jumbo v12, "progress"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    .line 812
    invoke-direct/range {v4 .. v12}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 816
    const-string/jumbo v4, "attwebpath"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 817
    const-string/jumbo v4, "attpath"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 819
    const-string/jumbo v9, "attsize"

    const-string/jumbo v10, "attwebpath"

    .line 820
    const-string/jumbo v11, "attpath"

    const-string/jumbo v12, "attprogress"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    .line 818
    invoke-direct/range {v4 .. v12}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 822
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/edutech/json/TreeData;->addQuestionListToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p4

    .line 825
    goto/16 :goto_2

    :cond_7
    const-string/jumbo v4, "LessonPlanning"

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 826
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 827
    .local v16, "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "items"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 830
    const-string/jumbo v4, "items"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 829
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v16

    .line 831
    if-eqz v16, :cond_1

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 833
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "itemObject":Ljava/lang/Object;
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object/from16 v12, p4

    move-object/from16 v13, p5

    .line 835
    invoke-direct/range {v8 .. v13}, Lcom/edutech/json/TreeData;->addPlanToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_3
.end method

.method private addToneedDownloadListGeRen(Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .param p1, "sourceId"    # Ljava/lang/String;
    .param p2, "dataObject"    # Ljava/lang/Object;
    .param p4, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
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
    .line 3295
    .local p3, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v9, "null"

    .line 3296
    .local v9, "key":Ljava/lang/String;
    invoke-direct {p0, p4}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3299
    invoke-static {p2}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 3300
    .local v3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_0

    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3302
    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3303
    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 3306
    :goto_0
    const-string/jumbo v0, "GeRenChengZhang"

    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3307
    const-string/jumbo v1, "-1"

    .line 3308
    invoke-direct {p0, p4}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "webpath"

    const-string/jumbo v7, "path"

    .line 3309
    const-string/jumbo v8, "progress"

    move-object v0, p0

    move-object v2, p1

    move-object v4, p3

    .line 3307
    invoke-direct/range {v0 .. v8}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p3

    .line 3312
    :cond_0
    return-object p3

    .line 3305
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v3, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private appendObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 24
    .param p1, "book_id"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2384
    .local p2, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "idObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p6, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v17, "null"

    .line 2385
    .local v17, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 2390
    if-eqz p4, :cond_1

    .line 2391
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_0
    :goto_0
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 2505
    :cond_1
    return-object p3

    .line 2391
    :cond_2
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .line 2392
    .local v12, "tempobject":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 2394
    .local v16, "isexist":Z
    invoke-static {v12}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v21

    .line 2395
    .local v21, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p3, :cond_3

    .line 2396
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_1
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v15, v4, :cond_5

    .line 2489
    .end local v15    # "i":I
    :cond_3
    :goto_2
    if-nez v16, :cond_0

    .line 2491
    if-nez p3, :cond_4

    .line 2492
    new-instance p3, Ljava/util/ArrayList;

    .end local p3    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct/range {p3 .. p3}, Ljava/util/ArrayList;-><init>()V

    .line 2495
    .restart local p3    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2496
    if-eqz p6, :cond_0

    .line 2498
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v6

    .local v6, "sourceId":Ljava/lang/String;
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object v11, v6

    move-object/from16 v13, p6

    move-object/from16 v14, p5

    .line 2500
    invoke-direct/range {v9 .. v14}, Lcom/edutech/json/TreeData;->addToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0

    .line 2397
    .end local v6    # "sourceId":Ljava/lang/String;
    .restart local v15    # "i":I
    :cond_5
    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    .line 2399
    .local v22, "tempdataobject":Ljava/lang/Object;
    invoke-static/range {v22 .. v22}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v20

    .line 2400
    .local v20, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v21, :cond_b

    if-eqz v20, :cond_b

    .line 2401
    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 2402
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 2403
    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2404
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 2408
    const/16 v16, 0x1

    .line 2410
    if-eqz p6, :cond_3

    .line 2411
    const-string/jumbo v4, "question"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 2413
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2416
    .local v7, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "question"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 2414
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 2418
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v6

    .line 2419
    .restart local v6    # "sourceId":Ljava/lang/String;
    const-string/jumbo v4, ""

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 2420
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 2421
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2428
    :goto_3
    if-eqz v7, :cond_3

    .line 2429
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 2430
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 2433
    .local v8, "localquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "question"

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 2431
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 2434
    if-eqz v8, :cond_6

    .line 2435
    if-eqz v8, :cond_9

    .line 2436
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_9

    .line 2438
    :cond_6
    const-string/jumbo v4, "question"

    .line 2439
    const-string/jumbo v5, "question"

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 2438
    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2440
    const-string/jumbo v4, "question_num"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_7

    .line 2442
    const-string/jumbo v4, "question_num"

    .line 2443
    const-string/jumbo v5, "question_num"

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 2442
    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2445
    :cond_7
    invoke-static/range {v20 .. v20}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v19

    .line 2446
    .local v19, "newtempDataObject":Ljava/lang/Object;
    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v15, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2458
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    move-object/from16 v3, p6

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/edutech/json/TreeData;->addQuestionListToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p6

    .line 2462
    goto/16 :goto_2

    .line 2423
    .end local v8    # "localquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v19    # "newtempDataObject":Ljava/lang/Object;
    :cond_8
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2424
    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2425
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 2426
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2425
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2423
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_3

    .restart local v8    # "localquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_9
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v9, p6

    .line 2463
    invoke-direct/range {v4 .. v9}, Lcom/edutech/json/TreeData;->compareAndReplaceExamQuestion(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 2468
    const-string/jumbo v4, "question_num"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_a

    .line 2470
    const-string/jumbo v4, "question_num"

    .line 2471
    const-string/jumbo v5, "question_num"

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 2470
    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2473
    :cond_a
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v18

    .line 2474
    .local v18, "newObject":Ljava/lang/Object;
    const-string/jumbo v4, "question"

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2477
    invoke-static/range {v20 .. v20}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v19

    .line 2478
    .restart local v19    # "newtempDataObject":Ljava/lang/Object;
    move-object/from16 v0, p3

    move-object/from16 v1, v19

    invoke-virtual {v0, v15, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 2396
    .end local v6    # "sourceId":Ljava/lang/String;
    .end local v7    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "localquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v18    # "newObject":Ljava/lang/Object;
    .end local v19    # "newtempDataObject":Ljava/lang/Object;
    :cond_b
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_1
.end method

.method private appendObjectGeRen(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 13
    .param p4, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3244
    .local p1, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p3, "idObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p5, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v4, "null"

    .line 3245
    .local v4, "key":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-direct {p0, v0}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3250
    if-eqz p3, :cond_1

    .line 3251
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_2

    .line 3289
    :cond_1
    return-object p2

    .line 3251
    :cond_2
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 3252
    .local v9, "tempobject":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 3254
    .local v3, "isexist":Z
    invoke-static {v9}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v7

    .line 3255
    .local v7, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_3

    .line 3256
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lt v2, v11, :cond_5

    .line 3274
    .end local v2    # "i":I
    :cond_3
    :goto_2
    if-nez v3, :cond_0

    .line 3276
    if-nez p2, :cond_4

    .line 3277
    new-instance p2, Ljava/util/ArrayList;

    .end local p2    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 3279
    .restart local p2    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    invoke-virtual {p2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3280
    if-eqz p5, :cond_0

    .line 3282
    invoke-virtual {p0, p1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    .line 3284
    .local v5, "sourceId":Ljava/lang/String;
    move-object/from16 v0, p5

    move-object/from16 v1, p4

    invoke-direct {p0, v5, v9, v0, v1}, Lcom/edutech/json/TreeData;->addToneedDownloadListGeRen(Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0

    .line 3257
    .end local v5    # "sourceId":Ljava/lang/String;
    .restart local v2    # "i":I
    :cond_5
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    .line 3259
    .local v8, "tempdataobject":Ljava/lang/Object;
    invoke-static {v8}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v6

    .line 3260
    .local v6, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_6

    if-eqz v6, :cond_6

    .line 3261
    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_6

    .line 3262
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_6

    .line 3263
    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 3264
    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 3267
    const/4 v3, 0x1

    .line 3268
    goto :goto_2

    .line 3256
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method private appendPlanIdObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 22
    .param p1, "book_id"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2214
    .local p2, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "idObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p6, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 2215
    .local v16, "key":Ljava/lang/String;
    if-eqz p4, :cond_1

    .line 2216
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_0
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 2283
    :cond_1
    return-object p3

    .line 2216
    :cond_2
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .line 2217
    .local v20, "tempobject":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 2219
    .local v14, "isexist":Z
    invoke-static/range {v20 .. v20}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 2220
    .local v3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p3, :cond_3

    .line 2221
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v13, v2, :cond_5

    .line 2248
    .end local v13    # "i":I
    :cond_3
    :goto_1
    if-nez v14, :cond_0

    .line 2250
    if-nez p3, :cond_4

    .line 2251
    new-instance p3, Ljava/util/ArrayList;

    .end local p3    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct/range {p3 .. p3}, Ljava/util/ArrayList;-><init>()V

    .line 2253
    .restart local p3    # "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2254
    if-eqz p6, :cond_0

    .line 2256
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 2257
    .local v15, "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz v3, :cond_0

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2259
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2260
    .local v18, "planId":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string/jumbo v2, "items"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2263
    const-string/jumbo v2, "items"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2262
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v15

    .line 2264
    if-eqz v15, :cond_0

    .line 2265
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 2267
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .line 2269
    .local v10, "itemObject":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v6

    .line 2270
    .local v6, "sourceId":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "_"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object v9, v6

    move-object/from16 v11, p6

    move-object/from16 v12, p5

    .line 2272
    invoke-direct/range {v7 .. v12}, Lcom/edutech/json/TreeData;->addPlanToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_2

    .line 2222
    .end local v6    # "sourceId":Ljava/lang/String;
    .end local v10    # "itemObject":Ljava/lang/Object;
    .end local v15    # "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v18    # "planId":Ljava/lang/String;
    .restart local v13    # "i":I
    :cond_5
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    .line 2224
    .local v19, "tempdataobject":Ljava/lang/Object;
    invoke-static/range {v19 .. v19}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v4

    .line 2225
    .local v4, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_6

    if-eqz v4, :cond_6

    .line 2226
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 2227
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 2228
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2229
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2231
    const/4 v14, 0x1

    .line 2232
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v6

    .line 2233
    .restart local v6    # "sourceId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "_"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2234
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2233
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v2, p0

    move-object/from16 v5, p1

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    .line 2235
    invoke-direct/range {v2 .. v8}, Lcom/edutech/json/TreeData;->comparePlanItems(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p6

    .line 2239
    invoke-static {v4}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v17

    .line 2240
    .local v17, "newObject":Ljava/lang/Object;
    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2241
    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v13, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto/16 :goto_1

    .line 2221
    .end local v6    # "sourceId":Ljava/lang/String;
    .end local v17    # "newObject":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_0
.end method

.method private compareAndReplaceExamQuestion(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 26
    .param p1, "book_id"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
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
    .line 2514
    .local p3, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "localquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p5, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/16 v21, 0x0

    .local v21, "j":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v21

    if-lt v0, v2, :cond_0

    .line 2620
    return-void

    .line 2515
    :cond_0
    move-object/from16 v0, p3

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    .line 2517
    .local v25, "tempObject":Ljava/lang/Object;
    invoke-static/range {v25 .. v25}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 2518
    .local v3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_2

    const-string/jumbo v2, "questionid"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 2519
    const-string/jumbo v2, "questionid"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v24

    .line 2522
    .local v24, "quesid":Ljava/lang/String;
    const/16 v20, 0x1

    .line 2523
    .local v20, "isNew":Z
    const-string/jumbo v2, "progress"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2524
    const-string/jumbo v2, "downloadsize"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2525
    const-string/jumbo v2, "webpath"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2526
    const-string/jumbo v2, "size"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2527
    const-string/jumbo v2, "path"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2529
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2530
    .local v4, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2531
    .local v6, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 2532
    .local v8, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2533
    .local v7, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 2535
    .local v5, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v2, "webpath"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2534
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 2537
    const-string/jumbo v2, "downloadsize"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2536
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 2539
    const-string/jumbo v2, "progress"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2538
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 2540
    const-string/jumbo v2, "size"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 2541
    const-string/jumbo v2, "path"

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 2543
    if-eqz v4, :cond_1

    if-eqz v6, :cond_1

    .line 2544
    if-eqz v8, :cond_1

    if-eqz v7, :cond_1

    .line 2545
    if-eqz v5, :cond_1

    .line 2546
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_1

    .line 2547
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ne v2, v10, :cond_1

    .line 2548
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ne v2, v10, :cond_1

    .line 2549
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ne v2, v10, :cond_1

    .line 2550
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ne v2, v10, :cond_1

    .line 2552
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1
    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    move/from16 v0, v19

    if-lt v0, v2, :cond_3

    .line 2608
    .end local v4    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v6    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v19    # "i":I
    :cond_1
    :goto_2
    if-nez v20, :cond_2

    .line 2611
    const-string/jumbo v15, "size"

    const-string/jumbo v16, "webpath"

    .line 2612
    const-string/jumbo v17, "path"

    const-string/jumbo v18, "progress"

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object v13, v3

    move-object/from16 v14, p5

    .line 2610
    invoke-direct/range {v10 .. v18}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p5

    .line 2614
    const-string/jumbo v15, "qsize"

    const-string/jumbo v16, "qwebpath"

    .line 2615
    const-string/jumbo v17, "qpath"

    const-string/jumbo v18, "qprogress"

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object v13, v3

    move-object/from16 v14, p5

    .line 2613
    invoke-direct/range {v10 .. v18}, Lcom/edutech/json/TreeData;->updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p5

    .line 2514
    .end local v20    # "isNew":Z
    .end local v24    # "quesid":Ljava/lang/String;
    :cond_2
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_0

    .line 2554
    .restart local v4    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v5    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v6    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v8    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v19    # "i":I
    .restart local v20    # "isNew":Z
    .restart local v24    # "quesid":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    .line 2556
    .local v23, "localtempObject":Ljava/lang/Object;
    invoke-static/range {v23 .. v23}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 2557
    .local v9, "localtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_9

    .line 2558
    const-string/jumbo v2, "questionid"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 2560
    const-string/jumbo v2, "questionid"

    .line 2559
    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 2560
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    .line 2561
    .local v22, "localquesid":Ljava/lang/String;
    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 2562
    const/16 v20, 0x0

    .line 2568
    const-string/jumbo v10, "progress"

    .line 2569
    const-string/jumbo v11, "downloadsize"

    const-string/jumbo v12, "webpath"

    .line 2570
    const-string/jumbo v13, "size"

    const-string/jumbo v14, "path"

    move-object/from16 v2, p0

    .line 2565
    invoke-direct/range {v2 .. v14}, Lcom/edutech/json/TreeData;->rePlaceProAndDown(Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2571
    const-string/jumbo v2, "qprogress"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 2572
    const-string/jumbo v2, "qprogress"

    .line 2574
    const-string/jumbo v10, "qprogress"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 2572
    invoke-virtual {v3, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2575
    :cond_4
    const-string/jumbo v2, "qwebpath"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 2576
    const-string/jumbo v2, "qwebpath"

    .line 2578
    const-string/jumbo v10, "qwebpath"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 2576
    invoke-virtual {v3, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2579
    :cond_5
    const-string/jumbo v2, "qpath"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 2580
    const-string/jumbo v2, "qpath"

    .line 2581
    const-string/jumbo v10, "qpath"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 2580
    invoke-virtual {v3, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2582
    :cond_6
    const-string/jumbo v2, "qdownloadsize"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 2584
    const-string/jumbo v2, "qdownloadsize"

    .line 2586
    const-string/jumbo v10, "qdownloadsize"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 2583
    invoke-virtual {v3, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2587
    :cond_7
    const-string/jumbo v2, "qsize"

    invoke-virtual {v9, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 2588
    const-string/jumbo v2, "qsize"

    .line 2589
    const-string/jumbo v10, "qsize"

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 2588
    invoke-virtual {v3, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2592
    :cond_8
    invoke-static {v3}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v2

    .line 2591
    move-object/from16 v0, p3

    move/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2597
    move-object/from16 v0, p4

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_2

    .line 2552
    .end local v22    # "localquesid":Ljava/lang/String;
    :cond_9
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_1
.end method

.method private compareData(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 18
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
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
    .line 77
    .line 78
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p8, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v16

    .line 79
    .local v16, "idSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_0
    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 108
    return-void

    .line 79
    :cond_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/HashMap;

    .line 80
    .local v11, "tempidSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p6

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 82
    move-object/from16 v0, p6

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v6, "idObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz p8, :cond_5

    .line 85
    const-string/jumbo v2, "data"

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 88
    const-string/jumbo v2, "data"

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 87
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 95
    :cond_2
    :goto_1
    if-eqz v6, :cond_3

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 97
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v5, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v2 .. v9}, Lcom/edutech/json/TreeData;->addDataToNewTree(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 100
    :cond_3
    const-string/jumbo v2, "children"

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 101
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v12, p5

    move-object/from16 v13, p6

    move-object/from16 v14, p7

    move-object/from16 v15, p8

    invoke-direct/range {v7 .. v15}, Lcom/edutech/json/TreeData;->compareData(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 104
    :cond_4
    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 105
    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto/16 :goto_0

    .line 89
    :cond_5
    if-nez p8, :cond_2

    .line 90
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 93
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 92
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    goto :goto_1
.end method

.method private comparePlanItems(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 17
    .param p3, "book_id"    # Ljava/lang/String;
    .param p4, "sourceId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
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
    .line 2310
    .local p1, "localplanMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "planMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 2311
    .local v13, "localitemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz p1, :cond_2

    const-string/jumbo v1, "items"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2314
    const-string/jumbo v1, "items"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2313
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v13

    .line 2315
    if-eqz v13, :cond_2

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 2316
    const/4 v11, 0x0

    .line 2317
    .local v11, "itemsObjectListsize":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 2318
    .local v10, "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz p2, :cond_0

    const-string/jumbo v1, "items"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2321
    const-string/jumbo v1, "items"

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2320
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 2322
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 2323
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 2327
    :cond_0
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_1
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 2365
    const-string/jumbo v1, "items"

    .line 2366
    invoke-static {v10}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2365
    move-object/from16 v0, p2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2370
    .end local v10    # "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "itemsObjectListsize":I
    :cond_2
    return-object p6

    .line 2327
    .restart local v10    # "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v11    # "itemsObjectListsize":I
    :cond_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 2329
    .local v4, "localitemObject":Ljava/lang/Object;
    invoke-static {v4}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v12

    .line 2330
    .local v12, "localitemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v12, :cond_1

    .line 2331
    const-string/jumbo v1, "webpath"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2332
    const-string/jumbo v1, "webpath"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2333
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 2334
    .local v14, "localwebpath":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2335
    .local v8, "isfound":Z
    if-lez v11, :cond_4

    .line 2337
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    if-lt v7, v11, :cond_6

    .line 2352
    .end local v7    # "i":I
    :cond_4
    :goto_2
    if-nez v8, :cond_1

    .line 2353
    if-nez v11, :cond_5

    .line 2354
    new-instance v10, Ljava/util/ArrayList;

    .end local v10    # "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 2355
    .restart local v10    # "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_5
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2357
    if-eqz p6, :cond_1

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v5, p6

    move-object/from16 v6, p5

    .line 2358
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->addPlanToneedDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0

    .line 2340
    .restart local v7    # "i":I
    :cond_6
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v9

    .line 2341
    .local v9, "itemsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v9, :cond_7

    .line 2342
    const-string/jumbo v1, "webpath"

    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 2343
    const-string/jumbo v1, "webpath"

    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2344
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    .line 2345
    .local v15, "webpath":Ljava/lang/String;
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 2346
    const/4 v8, 0x1

    .line 2347
    goto :goto_2

    .line 2337
    .end local v15    # "webpath":Ljava/lang/String;
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_1
.end method

.method private deleteExamPath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p2, "offlineDownloadDir"    # Ljava/lang/String;
    .param p3, "bookid"    # Ljava/lang/String;
    .param p4, "studentId"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
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
            ")V"
        }
    .end annotation

    .prologue
    .line 1423
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v0, "question"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1424
    const-string/jumbo v0, "Homework"

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1425
    const-string/jumbo v0, "MyExaminationPaper"

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1427
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1429
    .local v6, "examquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v0, "question"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1428
    invoke-virtual {p0, v6, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1430
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 1431
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v7, v0, :cond_2

    .line 1443
    .end local v6    # "examquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "i":I
    :cond_1
    return-void

    .line 1433
    .restart local v6    # "examquesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "i":I
    :cond_2
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v1

    .line 1434
    .local v1, "quesDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_3

    .line 1436
    const-string/jumbo v5, "path"

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 1435
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->getdeletePath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    const-string/jumbo v5, "qpath"

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 1437
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->getdeletePath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1431
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method private deleteFile(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 10
    .param p2, "json"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "key1"    # Ljava/lang/String;
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2871
    .local p1, "booktree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v6, 0x0

    .line 2872
    .local v6, "returnhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, p2, p3, p4}, Lcom/edutech/json/TreeData;->treeToList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 2873
    .local v1, "deletefilelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 2874
    const/4 v2, 0x0

    .line 2875
    .local v2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    check-cast v2, Ljava/util/HashMap;

    .line 2876
    .restart local v2    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 2878
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v3, v8, :cond_1

    .line 2906
    .end local v2    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "i":I
    :cond_0
    return-object v6

    .line 2881
    .restart local v2    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v3    # "i":I
    :cond_1
    invoke-virtual {p1, v2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 2882
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v5, 0x0

    .line 2883
    .local v5, "isfound":Z
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_4

    .line 2896
    :goto_1
    if-eqz v5, :cond_0

    .line 2897
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ne v3, v8, :cond_3

    .line 2898
    move-object v6, v2

    .line 2878
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2883
    :cond_4
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 2886
    .local v7, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v7, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 2888
    invoke-virtual {v7, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2889
    .local v4, "id":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 2890
    move-object v2, v7

    .line 2891
    const/4 v5, 0x1

    .line 2892
    goto :goto_1
.end method

.method private deleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 12
    .param p1, "bookid"    # Ljava/lang/String;
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "appName"    # Ljava/lang/String;
    .param p8, "offlineDownloadDir"    # Ljava/lang/String;
    .param p9, "studentId"    # Ljava/lang/String;
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
    .line 1177
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    invoke-direct/range {v1 .. v8}, Lcom/edutech/json/TreeData;->removeSourceNoData(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1180
    invoke-virtual/range {p3 .. p4}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v9

    .line 1181
    .local v9, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1193
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 1194
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1195
    :cond_1
    return-object p5

    .line 1181
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/HashMap;

    .line 1182
    .local v11, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p6

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1183
    move-object/from16 v0, p6

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1184
    .local v10, "id":Ljava/lang/String;
    move-object/from16 p4, v11

    .line 1185
    invoke-virtual {p2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1186
    invoke-direct/range {p0 .. p9}, Lcom/edutech/json/TreeData;->deleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private deletePathFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "offlineDownloadDir"    # Ljava/lang/String;
    .param p2, "bookid"    # Ljava/lang/String;
    .param p3, "studentId"    # Ljava/lang/String;
    .param p4, "path"    # Ljava/lang/String;

    .prologue
    .line 1469
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1470
    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1469
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1472
    .local v0, "deleteFilepath":Ljava/lang/String;
    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteFile(Ljava/lang/String;)I

    move-result v1

    .line 1474
    .local v1, "i":I
    return-void
.end method

.method private getBookDownList(Ljava/util/ArrayList;Lcom/edutech/json/Books;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p2, "book"    # Lcom/edutech/json/Books;
    .param p3, "bookjsonfilepath"    # Ljava/lang/String;
    .param p4, "appName"    # Ljava/lang/String;
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
            "Lcom/edutech/json/Books;",
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
    .line 573
    .local p1, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v3, 0x0

    .line 574
    .local v3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {p3}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 575
    .local v8, "json":Ljava/lang/String;
    const-string/jumbo v0, "data"

    const-string/jumbo v4, "children"

    invoke-static {v3, v8, v0, v4}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v3

    .line 576
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 577
    invoke-virtual {v3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string/jumbo v4, "id"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 579
    invoke-virtual {v3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string/jumbo v4, "id"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 581
    .local v1, "bookId":Ljava/lang/String;
    move-object v2, v1

    .line 582
    .local v2, "sourceId":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 583
    const-string/jumbo v6, "children"

    move-object v0, p0

    move-object v5, p1

    move-object v7, p4

    .line 582
    invoke-direct/range {v0 .. v7}, Lcom/edutech/json/TreeData;->getDownList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 586
    .end local v1    # "bookId":Ljava/lang/String;
    .end local v2    # "sourceId":Ljava/lang/String;
    :cond_0
    return-object p1
.end method

.method private getBookExamDownList(Ljava/util/ArrayList;Lcom/edutech/json/Books;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p2, "book"    # Lcom/edutech/json/Books;
    .param p3, "bookjsonfilepath"    # Ljava/lang/String;
    .param p4, "appName"    # Ljava/lang/String;
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
            "Lcom/edutech/json/Books;",
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
    .line 3138
    .local p1, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-static {p3}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 3139
    .local v7, "localjson":Ljava/lang/String;
    iget-object v0, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    invoke-virtual {v0, v7}, Lcom/edutech/json/CommonJSONParser;->parse(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v6

    .line 3140
    .local v6, "localJsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v6, :cond_0

    const-string/jumbo v0, "id"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3141
    const-string/jumbo v0, "data"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3142
    const-string/jumbo v0, "id"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3143
    .local v1, "book_id":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 3145
    .local v3, "localJsonObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v0, "data"

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3144
    invoke-virtual {p0, v3, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 3146
    move-object v2, v1

    .line 3147
    .local v2, "sourceId":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    move-object v0, p0

    move-object v4, p1

    move-object v5, p4

    .line 3149
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->addToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 3155
    .end local v1    # "book_id":Ljava/lang/String;
    .end local v2    # "sourceId":Ljava/lang/String;
    .end local v3    # "localJsonObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-object p1
.end method

.method private getDataIdKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 2776
    const-string/jumbo v0, "null"

    .line 2777
    .local v0, "id":Ljava/lang/String;
    const-string/jumbo v2, "DaoXueBen"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2778
    const-string/jumbo v2, "DaoXueBenNew"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    move-object v1, v0

    .line 2791
    .end local v0    # "id":Ljava/lang/String;
    .local v1, "id":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 2780
    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "WrongQuestionSet"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2781
    const-string/jumbo v0, "ErrorID"

    move-object v1, v0

    .line 2782
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0

    .line 2783
    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_2
    const-string/jumbo v2, "GeRenChengZhang"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2784
    const-string/jumbo v2, "ZuoYeFuDao"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2785
    const-string/jumbo v2, "LessonPlanning"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2786
    const-string/jumbo v2, "MyExaminationPaper"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2787
    const-string/jumbo v2, "Homework"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2788
    :cond_3
    const-string/jumbo v0, "id"

    move-object v1, v0

    .line 2789
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_4
    move-object v1, v0

    .line 2791
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0
.end method

.method private getDataName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 2759
    const-string/jumbo v0, "DaoXueBen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2760
    const-string/jumbo v0, "DaoXueBenNew"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2761
    :cond_0
    const-string/jumbo v0, "exams"

    .line 2771
    :goto_0
    return-object v0

    .line 2762
    :cond_1
    const-string/jumbo v0, "WrongQuestionSet"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 2763
    const-string/jumbo v0, "ZuoYeFuDao"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2764
    :cond_2
    const-string/jumbo v0, "question"

    goto :goto_0

    .line 2765
    :cond_3
    const-string/jumbo v0, "LessonPlanning"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2766
    const-string/jumbo v0, "plan"

    goto :goto_0

    .line 2767
    :cond_4
    const-string/jumbo v0, "Homework"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 2768
    const-string/jumbo v0, "MyExaminationPaper"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2769
    :cond_5
    const-string/jumbo v0, "exam"

    goto :goto_0

    .line 2771
    :cond_6
    const-string/jumbo v0, "question"

    goto :goto_0
.end method

.method private getDownList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 21
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p6, "children"    # Ljava/lang/String;
    .param p7, "appName"    # Ljava/lang/String;
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
    .line 595
    .line 596
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual/range {p3 .. p4}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v18

    .line 597
    .local v18, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_0
    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 640
    return-object p5

    .line 597
    :cond_1
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    .line 598
    .local v5, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v2, "id"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 599
    const-string/jumbo v2, "id"

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    .line 601
    .local v19, "id":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 603
    const-string/jumbo v2, "DaoXueBen"

    move-object/from16 v0, p7

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v6, p5

    move-object/from16 v7, p7

    .line 605
    invoke-direct/range {v2 .. v7}, Lcom/edutech/json/TreeData;->addDaoToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 633
    :cond_2
    :goto_1
    move-object/from16 v0, p6

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object v14, v5

    move-object/from16 v15, p5

    move-object/from16 v16, p6

    move-object/from16 v17, p7

    .line 634
    invoke-direct/range {v10 .. v17}, Lcom/edutech/json/TreeData;->getDownList(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    .line 636
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->removeSourceId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 607
    :cond_4
    const-string/jumbo v2, "DaoXueBenNew"

    move-object/from16 v0, p7

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v6, p5

    move-object/from16 v7, p7

    .line 609
    invoke-direct/range {v2 .. v7}, Lcom/edutech/json/TreeData;->addNewDaoToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_1

    .line 614
    :cond_5
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 620
    .local v9, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 624
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 623
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 626
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_2

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v10, p5

    move-object/from16 v11, p7

    .line 628
    invoke-direct/range {v6 .. v11}, Lcom/edutech/json/TreeData;->addToDownloadList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_1
.end method

.method private getPlanPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 7
    .param p1, "offlineDownloadDir"    # Ljava/lang/String;
    .param p2, "bookid"    # Ljava/lang/String;
    .param p3, "studentId"    # Ljava/lang/String;
    .param p5, "webpath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    .line 1377
    .local p4, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 1379
    .local v0, "ischange":Z
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1380
    .local v1, "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v6, "items"

    invoke-virtual {p4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v1, v6}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1382
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 1385
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v2, v6, :cond_1

    .line 1416
    .end local v2    # "j":I
    :cond_0
    return v0

    .line 1387
    .restart local v2    # "j":I
    :cond_1
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v5

    .line 1388
    .local v5, "tempItemMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v6, "path"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 1389
    if-nez p5, :cond_3

    .line 1390
    const-string/jumbo v6, "path"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1391
    .local v4, "path":Ljava/lang/String;
    invoke-direct {p0, p1, p2, p3, v4}, Lcom/edutech/json/TreeData;->deletePathFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1385
    .end local v4    # "path":Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1397
    :cond_3
    const-string/jumbo v6, "webpath"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 1398
    const-string/jumbo v6, "webpath"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 1399
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1398
    invoke-virtual {p5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 1399
    if-eqz v6, :cond_2

    .line 1401
    const-string/jumbo v6, "path"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1403
    .restart local v4    # "path":Ljava/lang/String;
    invoke-direct {p0, p1, p2, p3, v4}, Lcom/edutech/json/TreeData;->deletePathFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1405
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1408
    invoke-static {v1}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 1409
    .local v3, "newitemobject":Ljava/lang/Object;
    const-string/jumbo v6, "items"

    invoke-virtual {p4, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1410
    const/4 v0, 0x1

    goto :goto_1
.end method

.method private getRemoveItem(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 9
    .param p1, "removeObject"    # Ljava/lang/Object;
    .param p2, "webpath"    # Ljava/lang/String;

    .prologue
    .line 2934
    :try_start_0
    iget-object v8, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 2935
    move-object v0, p1

    check-cast v0, Lorg/json/JSONObject;

    move-object v7, v0

    invoke-virtual {v8, v7}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v6

    .line 2936
    .local v6, "sourceMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v2, "items"

    .line 2937
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 2938
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2939
    .local v4, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v4, v7}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 2940
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_0

    .line 2942
    const-string/jumbo v7, "webpath"

    .line 2941
    invoke-direct {p0, v4, v7, p2}, Lcom/edutech/json/TreeData;->getRemoveObject(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 2943
    .local v5, "removeitemObject":Ljava/lang/Object;
    if-eqz v5, :cond_0

    .line 2944
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2945
    const/4 v3, 0x0

    .line 2947
    .local v3, "newDataObject":Ljava/lang/Object;
    invoke-static {v4}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 2948
    invoke-virtual {v6, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 2959
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "newDataObject":Ljava/lang/Object;
    .end local v4    # "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "removeitemObject":Ljava/lang/Object;
    .end local v6    # "sourceMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    :goto_0
    return-object p1

    .line 2952
    :catch_0
    move-exception v1

    .line 2954
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 2955
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 2957
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getRemoveObject(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "sourceId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 2913
    .local p1, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 2914
    .local v2, "removeobject":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2929
    .end local v2    # "removeobject":Ljava/lang/Object;
    :goto_1
    return-object v2

    .line 2914
    .restart local v2    # "removeobject":Ljava/lang/Object;
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 2916
    .local v4, "tempdataobject":Ljava/lang/Object;
    :try_start_0
    iget-object v7, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 2917
    move-object v0, v4

    check-cast v0, Lorg/json/JSONObject;

    move-object v5, v0

    invoke-virtual {v7, v5}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v3

    .line 2918
    .local v3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p3, :cond_0

    invoke-virtual {v3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 2919
    invoke-virtual {v3, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    .line 2920
    move-object v2, v4

    goto :goto_1

    .line 2924
    .end local v3    # "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    .line 2926
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private getSizeKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "appName"    # Ljava/lang/String;

    .prologue
    .line 2796
    const-string/jumbo v0, "Size"

    .line 2797
    .local v0, "id":Ljava/lang/String;
    const-string/jumbo v2, "DaoXueBenNew"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2798
    const-string/jumbo v2, "DaoXueBen"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2799
    const-string/jumbo v2, "LessonPlanning"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2800
    const-string/jumbo v2, "Homework"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2801
    const-string/jumbo v2, "MyExaminationPaper"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2802
    const-string/jumbo v2, "GeRenChengZhang"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2803
    :cond_0
    const-string/jumbo v0, "size"

    move-object v1, v0

    .line 2813
    .end local v0    # "id":Ljava/lang/String;
    .local v1, "id":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 2805
    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "ZuoYeFuDao"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2806
    const-string/jumbo v0, "size"

    move-object v1, v0

    .line 2807
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0

    .line 2808
    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_2
    const-string/jumbo v2, "WrongQuestionSet"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v1, v0

    .line 2810
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0

    .end local v1    # "id":Ljava/lang/String;
    .restart local v0    # "id":Ljava/lang/String;
    :cond_3
    move-object v1, v0

    .line 2813
    .end local v0    # "id":Ljava/lang/String;
    .restart local v1    # "id":Ljava/lang/String;
    goto :goto_0
.end method

.method private getSourceIdList(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 25
    .param p1, "bookid"    # Ljava/lang/String;
    .param p8, "key"    # Ljava/lang/String;
    .param p9, "appName"    # Ljava/lang/String;
    .param p10, "offlineDownloadDir"    # Ljava/lang/String;
    .param p11, "studentId"    # Ljava/lang/String;
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
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1032
    .line 1033
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p6, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p7, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v23

    .line 1036
    .local v23, "idSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    if-eqz v23, :cond_5

    invoke-interface/range {v23 .. v23}, Ljava/util/Collection;->size()I

    move-result v5

    if-lez v5, :cond_5

    .line 1038
    invoke-interface/range {v23 .. v23}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :cond_0
    :goto_0
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1079
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 1080
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1104
    :cond_1
    :goto_1
    return-void

    .line 1038
    :cond_2
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/HashMap;

    .line 1040
    .local v11, "tempidSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p8

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1041
    move-object/from16 v0, p8

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    .line 1042
    .local v22, "id":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1043
    const-string/jumbo v5, "children"

    invoke-virtual {v11, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 1047
    invoke-virtual/range {p3 .. p3}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    move-object/from16 v5, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move-object/from16 v12, p7

    move-object/from16 v13, p8

    move-object/from16 v14, p9

    move-object/from16 v15, p10

    move-object/from16 v16, p11

    .line 1046
    invoke-direct/range {v5 .. v16}, Lcom/edutech/json/TreeData;->getSourceIdList(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1052
    :cond_3
    const-string/jumbo v5, "data"

    invoke-virtual {v11, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 1054
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v4, p8

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->getdeleteSourceHead(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p5

    .line 1055
    if-eqz p5, :cond_0

    .line 1059
    const-string/jumbo v5, "data"

    invoke-virtual {v11, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move-object/from16 v15, p3

    move-object/from16 v16, p5

    move-object/from16 v17, p7

    move-object/from16 v19, p9

    move-object/from16 v20, p10

    move-object/from16 v21, p11

    .line 1056
    invoke-direct/range {v12 .. v21}, Lcom/edutech/json/TreeData;->removeSourceData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1069
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v4, p8

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->getdeleteSourceHead(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p5

    .line 1070
    if-eqz p5, :cond_0

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move-object/from16 v15, p3

    move-object/from16 v16, p5

    move-object/from16 v17, p7

    move-object/from16 v18, p8

    move-object/from16 v19, p9

    move-object/from16 v20, p10

    move-object/from16 v21, p11

    .line 1071
    invoke-direct/range {v12 .. v21}, Lcom/edutech/json/TreeData;->deleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p7

    goto/16 :goto_0

    .line 1083
    .end local v11    # "tempidSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v22    # "id":Ljava/lang/String;
    :cond_5
    invoke-virtual/range {p4 .. p4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v6, "data"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_6

    .line 1088
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    move-object/from16 v4, p8

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->getdeleteSourceHead(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p5

    .line 1090
    if-eqz p5, :cond_1

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move-object/from16 v15, p3

    move-object/from16 v16, p5

    move-object/from16 v17, p7

    move-object/from16 v18, p8

    move-object/from16 v19, p9

    move-object/from16 v20, p10

    move-object/from16 v21, p11

    .line 1091
    invoke-direct/range {v12 .. v21}, Lcom/edutech/json/TreeData;->deleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p7

    .line 1094
    goto/16 :goto_1

    .line 1097
    :cond_6
    invoke-virtual/range {p4 .. p4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v6, "data"

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v12, p0

    move-object/from16 v13, p1

    move-object/from16 v14, p2

    move-object/from16 v15, p3

    move-object/from16 v16, p5

    move-object/from16 v17, p7

    move-object/from16 v19, p9

    move-object/from16 v20, p10

    move-object/from16 v21, p11

    .line 1096
    invoke-direct/range {v12 .. v21}, Lcom/edutech/json/TreeData;->removeSourceData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method private getdeletePath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p2, "offlineDownloadDir"    # Ljava/lang/String;
    .param p3, "bookid"    # Ljava/lang/String;
    .param p4, "studentId"    # Ljava/lang/String;
    .param p5, "keyPath"    # Ljava/lang/String;
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
            ")V"
        }
    .end annotation

    .prologue
    .line 1449
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1451
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1452
    .local v1, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1454
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 1456
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_1

    .line 1463
    .end local v0    # "i":I
    .end local v1    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 1459
    .restart local v0    # "i":I
    .restart local v1    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1458
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/edutech/json/TreeData;->deletePathFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1456
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getdeleteSourceHead(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 7
    .param p4, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .line 1110
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_0

    move-object v3, v4

    .line 1137
    :goto_0
    return-object v3

    .line 1112
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1

    .line 1113
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    goto :goto_0

    .line 1116
    :cond_1
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_2

    move-object v3, v4

    .line 1137
    goto :goto_0

    .line 1119
    :cond_2
    invoke-virtual {p2, p3}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 1120
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 1116
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1120
    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 1122
    .local v2, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1124
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1125
    invoke-virtual {v2, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1124
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 1125
    if-eqz v3, :cond_3

    .line 1127
    move-object p3, v2

    .line 1128
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ne v1, v3, :cond_3

    move-object v3, v2

    .line 1130
    goto :goto_0
.end method

.method private getjsonObject(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/HashMap;
    .locals 7
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
            ">;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1530
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_0

    .line 1545
    const/4 v4, 0x0

    :goto_1
    return-object v4

    .line 1533
    :cond_0
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 1534
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1530
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1534
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 1535
    .local v3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v4, "id"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1536
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1537
    const-string/jumbo v6, "id"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1536
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1537
    if-eqz v4, :cond_1

    .line 1538
    const-string/jumbo v4, "id"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1539
    .local v2, "id":Ljava/lang/String;
    move-object p2, v3

    .line 1540
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    if-ne v1, v4, :cond_1

    move-object v4, p2

    .line 1541
    goto :goto_1
.end method

.method private hashToDownloadlist(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .param p2, "bookId"    # Ljava/lang/String;
    .param p3, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "path"    # Ljava/lang/String;
    .param p6, "progress"    # Ljava/lang/String;
    .param p7, "size"    # Ljava/lang/String;
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
    .line 945
    .local p1, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 946
    .local v0, "downInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "book_id"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 947
    const-string/jumbo v1, "source_id"

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 948
    const-string/jumbo v1, "source_webpath"

    invoke-virtual {v0, v1, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 949
    const-string/jumbo v1, "source_path"

    invoke-virtual {v0, v1, p5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    const-string/jumbo v1, "source_progress"

    invoke-virtual {v0, v1, p6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    const-string/jumbo v1, "source_size"

    invoke-virtual {v0, v1, p7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 952
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 953
    return-object p1
.end method

.method private insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p2, "isChange"    # Z
    .param p3, "keyWebpath"    # Ljava/lang/String;
    .param p4, "keyProgress"    # Ljava/lang/String;
    .param p5, "keyDownloadsize"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 410
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 411
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v3, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 413
    if-eqz v3, :cond_1

    .line 414
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 415
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 416
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    .line 417
    :cond_0
    const/4 p2, 0x1

    .line 419
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v2, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 421
    .local v0, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_2

    .line 427
    invoke-static {v2}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v4

    .line 426
    invoke-virtual {p1, p4, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    invoke-static {v0}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v4

    .line 428
    invoke-virtual {p1, p5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    .end local v0    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v1    # "j":I
    .end local v2    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v3    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    return p2

    .line 423
    .restart local v0    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v1    # "j":I
    .restart local v2    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v3    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    const-string/jumbo v4, "0"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 421
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private isNullWebpath(Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 3
    .param p2, "keyWebpath"    # Ljava/lang/String;
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
    .line 394
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 395
    .local v0, "isNullWebpath":Z
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 396
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 397
    .local v1, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 398
    if-eqz v1, :cond_0

    .line 399
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 400
    :cond_0
    const/4 v0, 0x1

    .line 403
    .end local v1    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    return v0
.end method

.method private olddeleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 17
    .param p1, "bookid"    # Ljava/lang/String;
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "appName"    # Ljava/lang/String;
    .param p8, "offlineDownloadDir"    # Ljava/lang/String;
    .param p9, "studentId"    # Ljava/lang/String;
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
    .line 1147
    .line 1148
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p3 .. p4}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v12

    .line 1149
    .local v12, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v12}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_0
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1168
    return-object p5

    .line 1149
    :cond_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 1150
    .local v6, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p6

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1151
    move-object/from16 v0, p6

    invoke-virtual {v6, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1152
    .local v13, "id":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1153
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 1155
    .local v15, "questionlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-static {v15}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v14

    .line 1157
    .local v14, "newObject":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1156
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v6, v14, v2}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .end local v14    # "newObject":Ljava/lang/Object;
    .end local v15    # "questionlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    .line 1160
    invoke-direct/range {v2 .. v11}, Lcom/edutech/json/TreeData;->olddeleteNoData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private rePlaceProAndDown(Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 22
    .param p8, "keyProgress"    # Ljava/lang/String;
    .param p9, "keyDownloadsize"    # Ljava/lang/String;
    .param p10, "keyWebpath"    # Ljava/lang/String;
    .param p11, "keySize"    # Ljava/lang/String;
    .param p12, "keyPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2630
    .local p1, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p3, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p5, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p6, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p7, "localtempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual/range {p7 .. p8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 2631
    move-object/from16 v0, p7

    move-object/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 2632
    move-object/from16 v0, p7

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 2633
    move-object/from16 v0, p7

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 2634
    move-object/from16 v0, p7

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 2636
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 2637
    .local v11, "localwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2638
    .local v6, "localdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 2639
    .local v8, "localprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 2640
    .local v9, "localsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2642
    .local v7, "localpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p7

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 2641
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 2644
    move-object/from16 v0, p7

    move-object/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 2643
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v6, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 2646
    invoke-virtual/range {p7 .. p8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 2645
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v8, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 2648
    move-object/from16 v0, p7

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 2647
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v9, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 2650
    move-object/from16 v0, p7

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .line 2649
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v7, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 2651
    if-eqz v11, :cond_0

    if-eqz v6, :cond_0

    .line 2652
    if-eqz v8, :cond_0

    if-eqz v9, :cond_0

    .line 2653
    if-eqz v7, :cond_0

    .line 2654
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-eqz v20, :cond_0

    .line 2655
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v20

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 2656
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v20

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 2657
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v20

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 2658
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v20

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 2659
    const/4 v4, 0x0

    .line 2660
    .local v4, "isChange":Z
    const-wide/16 v14, 0x0

    .line 2661
    .local v14, "totaldownloadsize":J
    const-wide/16 v18, 0x0

    .line 2662
    .local v18, "totalsize":J
    const/4 v12, 0x0

    .local v12, "m":I
    :goto_0
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-lt v12, v0, :cond_1

    .line 2692
    const-wide/16 v20, 0x0

    cmp-long v20, v18, v20

    if-nez v20, :cond_4

    .line 2694
    const-string/jumbo v20, "questionprogress"

    const-string/jumbo v21, "100"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2706
    :goto_1
    if-eqz v4, :cond_0

    .line 2708
    invoke-static/range {p3 .. p3}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v20

    .line 2707
    move-object/from16 v0, p1

    move-object/from16 v1, p12

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2710
    invoke-static/range {p6 .. p6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v20

    .line 2709
    move-object/from16 v0, p1

    move-object/from16 v1, p8

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2712
    invoke-static/range {p4 .. p4}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v20

    .line 2711
    move-object/from16 v0, p1

    move-object/from16 v1, p9

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2714
    invoke-static/range {p5 .. p5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v20

    .line 2713
    move-object/from16 v0, p1

    move-object/from16 v1, p11

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2719
    .end local v4    # "isChange":Z
    .end local v6    # "localdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "localpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "localprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "localsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "localwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v12    # "m":I
    .end local v14    # "totaldownloadsize":J
    .end local v18    # "totalsize":J
    :cond_0
    return-void

    .line 2663
    .restart local v4    # "isChange":Z
    .restart local v6    # "localdownloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "localpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v8    # "localprogressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "localsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v11    # "localwebpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v12    # "m":I
    .restart local v14    # "totaldownloadsize":J
    .restart local v18    # "totalsize":J
    :cond_1
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    .line 2666
    .local v17, "webpath":Ljava/lang/String;
    const/4 v5, 0x0

    .line 2667
    .local v5, "isFound":Z
    const/4 v13, 0x0

    .local v13, "n":I
    :goto_2
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v20

    move/from16 v0, v20

    if-lt v13, v0, :cond_2

    .line 2686
    :goto_3
    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .line 2687
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    .line 2686
    invoke-static/range {v20 .. v20}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    add-long v14, v14, v20

    .line 2689
    move-object/from16 v0, p5

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    add-long v18, v18, v20

    .line 2662
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 2668
    :cond_2
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .line 2669
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2670
    .local v10, "localwebpath":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 2671
    const/4 v4, 0x1

    .line 2672
    const/4 v5, 0x1

    .line 2674
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    .line 2673
    move-object/from16 v0, p4

    move-object/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2675
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, p6

    move-object/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2676
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2677
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-virtual {v0, v12, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 2667
    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 2695
    .end local v5    # "isFound":Z
    .end local v10    # "localwebpath":Ljava/lang/String;
    .end local v13    # "n":I
    .end local v17    # "webpath":Ljava/lang/String;
    :cond_4
    cmp-long v20, v18, v14

    if-nez v20, :cond_5

    .line 2696
    const-string/jumbo v20, "questionprogress"

    const-string/jumbo v21, "100"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 2701
    :cond_5
    long-to-float v0, v14

    move/from16 v20, v0

    const/high16 v21, 0x42c80000    # 100.0f

    mul-float v20, v20, v21

    move-wide/from16 v0, v18

    long-to-float v0, v0

    move/from16 v21, v0

    div-float v20, v20, v21

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v16

    .line 2702
    .local v16, "totalprogress":Ljava/lang/String;
    const-string/jumbo v20, "questionprogress"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1
.end method

.method private removeSourceData(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 26
    .param p1, "bookid"    # Ljava/lang/String;
    .param p6, "data"    # Ljava/lang/Object;
    .param p7, "appName"    # Ljava/lang/String;
    .param p8, "offlineDownloadDir"    # Ljava/lang/String;
    .param p9, "studentId"    # Ljava/lang/String;
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1258
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p5, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 1264
    .local v15, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {p8 .. p8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1265
    move-object/from16 v0, p9

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1264
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1266
    .local v17, "deleteFileDir":Ljava/lang/String;
    new-instance v16, Ljava/io/File;

    invoke-direct/range {v16 .. v17}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1267
    .local v16, "deleteDirFile":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1269
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    if-eqz p6, :cond_0

    .line 1271
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 1272
    .local v24, "sourcedataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v24

    .line 1273
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 1274
    const/4 v4, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p6

    .line 1276
    invoke-static/range {p6 .. p6}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v14

    .line 1277
    .local v14, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v14, :cond_0

    const-string/jumbo v4, "id"

    invoke-virtual {v14, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 1278
    const-string/jumbo v4, "id"

    invoke-virtual {v14, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    .line 1281
    .local v18, "deletesourceid":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1280
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v15

    .line 1282
    if-eqz v15, :cond_0

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 1284
    const/16 v20, 0x0

    .local v20, "m":I
    :goto_0
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v20

    if-lt v0, v4, :cond_1

    .line 1373
    .end local v14    # "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v18    # "deletesourceid":Ljava/lang/String;
    .end local v20    # "m":I
    .end local v24    # "sourcedataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    :goto_1
    return-void

    .line 1285
    .restart local v14    # "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v18    # "deletesourceid":Ljava/lang/String;
    .restart local v20    # "m":I
    .restart local v24    # "sourcedataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    .line 1287
    .local v25, "tempdataobject":Ljava/lang/Object;
    invoke-static/range {v25 .. v25}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v8

    .line 1288
    .local v8, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataIdKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1289
    .local v13, "IdKey":Ljava/lang/String;
    invoke-virtual {v8, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 1291
    invoke-virtual {v8, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1290
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1291
    if-eqz v4, :cond_5

    .line 1293
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v23

    .line 1295
    .local v23, "sourceId":Ljava/lang/String;
    const-string/jumbo v4, ""

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1296
    invoke-virtual {v8, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1297
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1296
    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1305
    :goto_2
    const-string/jumbo v4, "webpath"

    invoke-virtual {v14, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_4

    .line 1307
    const-string/jumbo v4, "items"

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1309
    const-string/jumbo v4, "LessonPlanning"

    move-object/from16 v0, p7

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1314
    const/4 v9, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p8

    move-object/from16 v6, p1

    move-object/from16 v7, p9

    .line 1312
    invoke-direct/range {v4 .. v9}, Lcom/edutech/json/TreeData;->getPlanPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)Z

    .line 1330
    :goto_3
    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1332
    invoke-static {v15}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v22

    .line 1335
    .local v22, "newobject":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1333
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1299
    .end local v22    # "newobject":Ljava/lang/Object;
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1300
    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 1301
    invoke-virtual {v8, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 1302
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1301
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1299
    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1320
    :cond_3
    const-string/jumbo v12, "path"

    move-object/from16 v7, p0

    move-object/from16 v9, p8

    move-object/from16 v10, p1

    move-object/from16 v11, p9

    .line 1317
    invoke-direct/range {v7 .. v12}, Lcom/edutech/json/TreeData;->getdeletePath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v7, p0

    move-object/from16 v9, p8

    move-object/from16 v10, p1

    move-object/from16 v11, p9

    move-object/from16 v12, p7

    .line 1323
    invoke-direct/range {v7 .. v12}, Lcom/edutech/json/TreeData;->deleteExamPath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 1340
    :cond_4
    const-string/jumbo v4, "webpath"

    .line 1339
    invoke-virtual {v14, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1340
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1343
    .local v9, "webpath":Ljava/lang/String;
    const-string/jumbo v4, "items"

    invoke-virtual {v8, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    move-object/from16 v4, p0

    move-object/from16 v5, p8

    move-object/from16 v6, p1

    move-object/from16 v7, p9

    .line 1345
    invoke-direct/range {v4 .. v9}, Lcom/edutech/json/TreeData;->getPlanPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v19

    .line 1349
    .local v19, "ischange":Z
    if-eqz v19, :cond_5

    .line 1351
    invoke-static {v8}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v21

    .line 1352
    .local v21, "newDataObject":Ljava/lang/Object;
    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1353
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v15, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1356
    invoke-static {v15}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v22

    .line 1361
    .restart local v22    # "newobject":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1357
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 1284
    .end local v9    # "webpath":Ljava/lang/String;
    .end local v19    # "ischange":Z
    .end local v21    # "newDataObject":Ljava/lang/Object;
    .end local v22    # "newobject":Ljava/lang/Object;
    .end local v23    # "sourceId":Ljava/lang/String;
    :cond_5
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_0
.end method

.method private removeSourceNoData(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "bookid"    # Ljava/lang/String;
    .param p5, "appName"    # Ljava/lang/String;
    .param p6, "offlineDownloadDir"    # Ljava/lang/String;
    .param p7, "studentId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1202
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1207
    .local v11, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static/range {p6 .. p6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1208
    move-object/from16 v0, p7

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1207
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1209
    .local v13, "deleteFileDir":Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1210
    .local v12, "deleteDirFile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1212
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1214
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1213
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 1215
    if-eqz v11, :cond_1

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 1217
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_0
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1248
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1251
    :cond_2
    return-void

    .line 1217
    :cond_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 1220
    .local v15, "tempdataobject":Ljava/lang/Object;
    invoke-static {v15}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v6

    .line 1221
    .local v6, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v2, "id"

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1223
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/edutech/json/TreeData;->appendid(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v14

    .line 1224
    .local v14, "sourceId":Ljava/lang/String;
    const-string/jumbo v2, ""

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1225
    const-string/jumbo v2, "id"

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1226
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1225
    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1231
    :goto_1
    const-string/jumbo v2, "items"

    invoke-virtual {v6, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 1235
    const/4 v7, 0x0

    move-object/from16 v2, p0

    move-object/from16 v3, p6

    move-object/from16 v4, p1

    move-object/from16 v5, p7

    .line 1234
    invoke-direct/range {v2 .. v7}, Lcom/edutech/json/TreeData;->getPlanPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)Z

    goto :goto_0

    .line 1228
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1229
    const-string/jumbo v3, "id"

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1228
    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1240
    :cond_5
    const-string/jumbo v10, "path"

    move-object/from16 v5, p0

    move-object/from16 v7, p6

    move-object/from16 v8, p1

    move-object/from16 v9, p7

    .line 1239
    invoke-direct/range {v5 .. v10}, Lcom/edutech/json/TreeData;->getdeletePath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v5, p0

    move-object/from16 v7, p6

    move-object/from16 v8, p1

    move-object/from16 v9, p7

    move-object/from16 v10, p5

    .line 1242
    invoke-direct/range {v5 .. v10}, Lcom/edutech/json/TreeData;->deleteExamPath(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private sortInsertObject(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2730
    .local p1, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2731
    .local v1, "finishObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v2, v6, :cond_0

    .line 2744
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_3

    .line 2748
    return-void

    .line 2732
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2734
    .local v4, "tempObject":Ljava/lang/Object;
    invoke-static {v4}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v3

    .line 2735
    .local v3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_2

    const-string/jumbo v6, "status"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 2736
    const-string/jumbo v6, "status"

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2737
    .local v5, "tempstatus":Ljava/lang/String;
    :goto_2
    const-string/jumbo v6, "1"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 2739
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2740
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2741
    add-int/lit8 v2, v2, -0x1

    .line 2731
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2736
    .end local v5    # "tempstatus":Ljava/lang/String;
    :cond_2
    const-string/jumbo v5, "0"

    goto :goto_2

    .line 2744
    .end local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v4    # "tempObject":Ljava/lang/Object;
    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 2746
    .local v0, "finishObject":Ljava/lang/Object;
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private toList(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "key1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2985
    .line 2986
    .local p1, "treeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p2, p3}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v6

    .line 2988
    .local v6, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v7, 0x0

    .line 2989
    .local v7, "i":I
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2999
    :cond_1
    return-object p1

    .line 2989
    :cond_2
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 2990
    .local v3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-gtz v7, :cond_1

    .line 2992
    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 2993
    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2995
    :cond_3
    invoke-virtual {v3, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    .line 2996
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->toList(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private updateDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 15
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p5, "sizekey"    # Ljava/lang/String;
    .param p6, "keyWebpath"    # Ljava/lang/String;
    .param p7, "keyPath"    # Ljava/lang/String;
    .param p8, "keyProgress"    # Ljava/lang/String;
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
    .line 881
    .local p3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p3

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 882
    move-object/from16 v0, p3

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 883
    move-object/from16 v0, p3

    move-object/from16 v1, p8

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 884
    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 885
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 886
    .local v14, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 887
    .local v11, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 888
    .local v12, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 889
    .local v13, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p3

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v14, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v14

    .line 890
    move-object/from16 v0, p3

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v11, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 892
    move-object/from16 v0, p3

    move-object/from16 v1, p8

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 891
    invoke-virtual {p0, v12, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v12

    .line 893
    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v13, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v13

    .line 894
    if-eqz v14, :cond_0

    if-eqz v11, :cond_0

    if-eqz v12, :cond_0

    .line 895
    if-eqz v13, :cond_0

    .line 898
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_0

    .line 899
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 900
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 901
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 903
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v10, v2, :cond_1

    .line 918
    .end local v10    # "i":I
    .end local v11    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v12    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v13    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v14    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-object p4

    .line 905
    .restart local v10    # "i":I
    .restart local v11    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v12    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v13    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v14    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    const-string/jumbo v2, "100"

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 906
    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 907
    .local v6, "webpath":Ljava/lang/String;
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 908
    .local v7, "path":Ljava/lang/String;
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    .line 909
    .local v8, "progress":Ljava/lang/String;
    invoke-virtual {v13, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .local v9, "size":Ljava/lang/String;
    move-object v2, p0

    move-object/from16 v3, p4

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    .line 910
    invoke-direct/range {v2 .. v9}, Lcom/edutech/json/TreeData;->hashToDownloadlist(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 903
    .end local v6    # "webpath":Ljava/lang/String;
    .end local v7    # "path":Ljava/lang/String;
    .end local v8    # "progress":Ljava/lang/String;
    .end local v9    # "size":Ljava/lang/String;
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0
.end method

.method private updateExamsProgress(Lcom/edutech/json/Tree;ZLjava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 35
    .param p2, "ischange"    # Z
    .param p3, "totalprogress"    # Ljava/lang/String;
    .param p5, "webpath"    # Ljava/lang/String;
    .param p6, "oldProgress"    # Ljava/lang/String;
    .param p7, "downloadsize"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;Z",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1957
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 1958
    .local v24, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "exams"

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v24

    .line 1959
    const-string/jumbo v4, "map1111"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "exams == "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "exams"

    move-object/from16 v0, p4

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1960
    if-eqz v24, :cond_0

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 1961
    const-wide/16 v32, 0x0

    .line 1962
    .local v32, "totalsize":J
    const-wide/16 v30, 0x0

    .line 1965
    .local v30, "totaldownloadsize":J
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_0
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v20

    if-lt v0, v4, :cond_1

    .line 2051
    const-wide/16 v4, 0x0

    cmp-long v4, v32, v4

    if-nez v4, :cond_6

    .line 2052
    const-string/jumbo p3, "0"

    .line 2061
    :goto_1
    const-string/jumbo v4, "examsprogress"

    move-object/from16 v0, p4

    move-object/from16 v1, p3

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2065
    .end local v20    # "i":I
    .end local v30    # "totaldownloadsize":J
    .end local v32    # "totalsize":J
    :cond_0
    return-object p3

    .line 1966
    .restart local v20    # "i":I
    .restart local v30    # "totaldownloadsize":J
    .restart local v32    # "totalsize":J
    :cond_1
    move-object/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    .line 1967
    .local v23, "object":Ljava/lang/Object;
    if-eqz v23, :cond_3

    .line 1971
    invoke-static/range {v23 .. v23}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v7

    .line 1978
    .local v7, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_3

    const-string/jumbo v4, "webpath"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1979
    const-string/jumbo v4, "path"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1980
    const-string/jumbo v4, "progress"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1981
    const-string/jumbo v4, "sizes"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1982
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1983
    .local v8, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 1984
    .local v25, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1985
    .local v9, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1986
    .local v11, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1988
    .local v10, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "webpath"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1987
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1989
    const-string/jumbo v4, "path"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v25

    .line 1991
    const-string/jumbo v4, "progress"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1990
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 1992
    const-string/jumbo v4, "sizes"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 1994
    const-string/jumbo v4, "downloadsize"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1993
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1996
    if-eqz v8, :cond_3

    if-eqz v25, :cond_3

    .line 1997
    if-eqz v9, :cond_3

    .line 1998
    if-eqz v10, :cond_3

    .line 2000
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-eqz v4, :cond_3

    .line 2001
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 2002
    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v4, v5, :cond_3

    .line 2003
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 2004
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 2003
    if-ne v4, v5, :cond_3

    .line 2005
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 2006
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 2005
    if-ne v4, v5, :cond_3

    .line 2007
    if-nez p2, :cond_2

    .line 2012
    const-string/jumbo v16, "Exams"

    .line 2013
    const-string/jumbo v17, "downloadsize"

    const-string/jumbo v18, "progress"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p2

    move-object/from16 v12, p5

    move-object/from16 v13, p6

    move-wide/from16 v14, p7

    .line 2008
    invoke-virtual/range {v4 .. v18}, Lcom/edutech/json/TreeData;->updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    .line 2014
    if-eqz p2, :cond_2

    .line 2016
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v22

    .line 2017
    .local v22, "newobject":Ljava/lang/Object;
    move-object/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2018
    move-object/from16 v0, v24

    move/from16 v1, v20

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2020
    invoke-static/range {v24 .. v24}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v19

    .line 2023
    .local v19, "arrayObject":Ljava/lang/Object;
    const-string/jumbo v4, "exams"

    move-object/from16 v0, p4

    move-object/from16 v1, v19

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2026
    .end local v19    # "arrayObject":Ljava/lang/Object;
    .end local v22    # "newobject":Ljava/lang/Object;
    :cond_2
    const/16 v21, 0x0

    .local v21, "j":I
    :goto_2
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v21

    if-lt v0, v4, :cond_4

    .line 1965
    .end local v7    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v21    # "j":I
    .end local v25    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_0

    .line 2028
    .restart local v7    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v8    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v10    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v11    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v21    # "j":I
    .restart local v25    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    move/from16 v0, v21

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 2029
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2028
    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v26

    .line 2031
    .local v26, "tempdownloadsize":J
    add-long v30, v30, v26

    .line 2033
    move/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2032
    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v28

    .line 2034
    .local v28, "tempsize":J
    add-long v32, v32, v28

    .line 2035
    const-wide/16 v4, 0x0

    cmp-long v4, v28, v4

    if-nez v4, :cond_5

    const-wide/16 v4, 0x0

    cmp-long v4, v30, v4

    if-lez v4, :cond_5

    .line 2043
    add-long v32, v32, v26

    .line 2026
    :cond_5
    add-int/lit8 v21, v21, 0x1

    goto :goto_2

    .line 2053
    .end local v7    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v21    # "j":I
    .end local v23    # "object":Ljava/lang/Object;
    .end local v25    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v26    # "tempdownloadsize":J
    .end local v28    # "tempsize":J
    :cond_6
    cmp-long v4, v32, v30

    if-nez v4, :cond_7

    .line 2054
    const-string/jumbo p3, "100"

    .line 2055
    goto/16 :goto_1

    .line 2057
    :cond_7
    move-wide/from16 v0, v30

    long-to-float v4, v0

    const/high16 v5, 0x42c80000    # 100.0f

    mul-float/2addr v4, v5

    move-wide/from16 v0, v32

    long-to-float v5, v0

    div-float/2addr v4, v5

    float-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p3

    .line 2056
    goto/16 :goto_1
.end method

.method private updateHMExamProAndSize(ZLcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 19
    .param p1, "isChange"    # Z
    .param p3, "sourceId"    # Ljava/lang/String;
    .param p5, "webpath"    # Ljava/lang/String;
    .param p6, "oldProgress"    # Ljava/lang/String;
    .param p7, "downloadsize"    # J
    .param p9, "appName"    # Ljava/lang/String;
    .param p10, "keyWebpath"    # Ljava/lang/String;
    .param p11, "keyPath"    # Ljava/lang/String;
    .param p12, "keyProgress"    # Ljava/lang/String;
    .param p13, "keyDownloadsize"    # Ljava/lang/String;
    .param p14, "keySize"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1888
    .local p2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p4, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    move-object/from16 v0, p4

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1889
    move-object/from16 v0, p4

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1890
    move-object/from16 v0, p4

    move-object/from16 v1, p13

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1891
    move-object/from16 v0, p4

    move-object/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1892
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1893
    .local v6, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 1894
    .local v17, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1895
    .local v7, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1896
    .local v9, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1897
    .local v8, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1898
    move-object/from16 v0, p4

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v17

    .line 1899
    move-object/from16 v0, p4

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 1900
    move-object/from16 v0, p4

    move-object/from16 v1, p14

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 1902
    move-object/from16 v0, p4

    move-object/from16 v1, p13

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1901
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1903
    if-eqz v6, :cond_1

    if-eqz v17, :cond_1

    if-eqz v7, :cond_1

    .line 1904
    if-eqz v8, :cond_1

    if-eqz v9, :cond_1

    .line 1906
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1907
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1908
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1909
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1910
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1915
    const-string/jumbo v15, "downloadsize"

    const-string/jumbo v16, "progress"

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    move/from16 v4, p1

    move-object/from16 v5, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    move-wide/from16 v12, p7

    move-object/from16 v14, p9

    .line 1912
    invoke-virtual/range {v2 .. v16}, Lcom/edutech/json/TreeData;->updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    .line 1916
    if-eqz p1, :cond_2

    .line 1917
    const-string/jumbo v2, "Homework"

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1918
    const-string/jumbo v2, "MyExaminationPaper"

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1920
    :cond_0
    const-string/jumbo v18, "0"

    .line 1921
    .local v18, "totalprogress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8, v9, v7}, Lcom/edutech/json/TreeData;->updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v18

    .line 1923
    const-string/jumbo v2, "homeworkprogress"

    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1948
    .end local v6    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v17    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v18    # "totalprogress":Ljava/lang/String;
    :cond_1
    :goto_0
    return p1

    .line 1925
    .restart local v6    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v8    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v17    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    if-eqz p1, :cond_3

    const-string/jumbo v2, "ExamMp"

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1927
    const-string/jumbo v18, "0"

    .line 1928
    .restart local v18    # "totalprogress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8, v9, v7}, Lcom/edutech/json/TreeData;->updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v18

    .line 1930
    const-string/jumbo v2, "questionprogress"

    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1931
    .end local v18    # "totalprogress":Ljava/lang/String;
    :cond_3
    if-eqz p1, :cond_4

    const-string/jumbo v2, "ExamImage"

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1933
    const-string/jumbo v18, "0"

    .line 1934
    .restart local v18    # "totalprogress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8, v9, v7}, Lcom/edutech/json/TreeData;->updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    goto :goto_0

    .line 1936
    .end local v18    # "totalprogress":Ljava/lang/String;
    :cond_4
    if-eqz p1, :cond_1

    .line 1937
    const-string/jumbo v2, "GeRenChengZhang"

    move-object/from16 v0, p9

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1940
    const-string/jumbo v18, "0"

    .line 1941
    .restart local v18    # "totalprogress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v8, v9, v7}, Lcom/edutech/json/TreeData;->updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v18

    .line 1943
    const-string/jumbo v2, "questionprogress"

    move-object/from16 v0, p4

    move-object/from16 v1, v18

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 14
    .param p1, "totalprogress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1853
    .local p2, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p3, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p4, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-wide/16 v10, 0x0

    .line 1854
    .local v10, "totalsize":J
    const-wide/16 v8, 0x0

    .line 1855
    .local v8, "totaldownloadsize":J
    const/4 v3, 0x1

    .line 1856
    .local v3, "isDownFinish":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v2, v12, :cond_0

    .line 1867
    const-wide/16 v12, 0x0

    cmp-long v12, v10, v12

    if-nez v12, :cond_3

    .line 1868
    if-nez v3, :cond_2

    .line 1869
    const-string/jumbo p1, "0"

    .line 1878
    :goto_1
    return-object p1

    .line 1857
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 1858
    .local v6, "tempsize":J
    add-long/2addr v10, v6

    .line 1859
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 1860
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1859
    invoke-static {v12}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 1861
    .local v4, "tempdownloadsize":J
    add-long/2addr v8, v4

    .line 1862
    const-string/jumbo v12, "100"

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 1864
    const/4 v3, 0x0

    .line 1856
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1871
    .end local v4    # "tempdownloadsize":J
    .end local v6    # "tempsize":J
    :cond_2
    const-string/jumbo p1, "100"

    .line 1872
    goto :goto_1

    :cond_3
    cmp-long v12, v10, v8

    if-nez v12, :cond_4

    .line 1873
    const-string/jumbo p1, "100"

    .line 1874
    goto :goto_1

    .line 1876
    :cond_4
    long-to-float v12, v8

    const/high16 v13, 0x42c80000    # 100.0f

    mul-float/2addr v12, v13

    long-to-float v13, v10

    div-float/2addr v12, v13

    float-to-int v12, v12

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 1875
    goto :goto_1
.end method

.method private updateLessonPlanDownloadlist(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "bookId"    # Ljava/lang/String;
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p5, "sizekey"    # Ljava/lang/String;
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
            ">;>;",
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
    .line 925
    .local p3, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v0, "webpath"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 926
    const-string/jumbo v0, "path"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 927
    const-string/jumbo v0, "progress"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 928
    invoke-virtual {p3, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 929
    const-string/jumbo v0, "webpath"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 930
    .local v4, "webpath":Ljava/lang/String;
    const-string/jumbo v0, "path"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 931
    .local v5, "path":Ljava/lang/String;
    const-string/jumbo v0, "progress"

    invoke-virtual {p3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 932
    .local v6, "progress":Ljava/lang/String;
    invoke-virtual {p3, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 933
    .local v7, "size":Ljava/lang/String;
    const-string/jumbo v0, "100"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p0

    move-object v1, p4

    move-object v2, p1

    move-object v3, p2

    .line 934
    invoke-direct/range {v0 .. v7}, Lcom/edutech/json/TreeData;->hashToDownloadlist(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 937
    .end local v4    # "webpath":Ljava/lang/String;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "progress":Ljava/lang/String;
    .end local v7    # "size":Ljava/lang/String;
    :cond_0
    return-object p4
.end method

.method private updateQprogress(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p2, "totalprogress"    # Ljava/lang/String;
    .param p3, "keyProgress"    # Ljava/lang/String;
    .param p4, "keyDownloadsize"    # Ljava/lang/String;
    .param p5, "keySize"    # Ljava/lang/String;
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
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1799
    .local p1, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1800
    .local v3, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v6, "question"

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v3, v6}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 1801
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 1803
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v1, v6, :cond_1

    .line 1846
    .end local v1    # "j":I
    :cond_0
    return-object p2

    .line 1805
    .restart local v1    # "j":I
    :cond_1
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v4

    .line 1806
    .local v4, "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v6, "questionid"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 1807
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1808
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1809
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 1810
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1811
    .local v2, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1812
    .local v5, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1814
    .local v0, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {p1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 1813
    invoke-virtual {p0, v2, v6}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    .line 1815
    invoke-virtual {p1, p5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 1817
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 1816
    invoke-virtual {p0, v0, v6}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1818
    if-eqz v2, :cond_4

    if-eqz v0, :cond_4

    .line 1819
    if-eqz v5, :cond_4

    .line 1821
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-eqz v6, :cond_3

    .line 1822
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1823
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 1822
    if-ne v6, v7, :cond_3

    .line 1824
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1825
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 1824
    if-ne v6, v7, :cond_3

    .line 1826
    invoke-direct {p0, p2, v0, v5, v2}, Lcom/edutech/json/TreeData;->updateHMTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p2

    .line 1829
    const-string/jumbo v6, "0"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1803
    .end local v0    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1833
    .restart local v0    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v2    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v5    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    const-string/jumbo p2, "100"

    .line 1835
    goto :goto_1

    .line 1837
    :cond_4
    const-string/jumbo p2, "100"

    .line 1839
    goto :goto_1

    .line 1841
    .end local v0    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_5
    const-string/jumbo p2, "100"

    goto :goto_1
.end method


# virtual methods
.method public UpdateGeRenOldJsonMap(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 7
    .param p3, "appName"    # Ljava/lang/String;
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
    .line 3209
    .local p1, "jsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "localJsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 3210
    .local v1, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 3211
    .local v3, "examObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3212
    .local v2, "localexamObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v0, "data"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3213
    const-string/jumbo v0, "data"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v3, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 3215
    :cond_0
    if-eqz p2, :cond_1

    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3218
    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3217
    invoke-virtual {p0, v2, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    .line 3220
    :cond_1
    const/4 v6, 0x0

    .local v6, "newDataObject":Ljava/lang/Object;
    move-object v0, p0

    move-object v4, p3

    move-object v5, p4

    .line 3222
    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->appendObjectGeRen(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    .line 3225
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 3226
    invoke-static {v2}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v6

    .line 3227
    .end local v6    # "newDataObject":Ljava/lang/Object;
    :cond_2
    if-eqz p2, :cond_3

    .line 3229
    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3231
    :cond_3
    return-void
.end method

.method public UpdateOldJsonMap(Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 8
    .param p3, "appName"    # Ljava/lang/String;
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
    .line 3100
    .local p1, "jsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "localJsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string/jumbo v0, "id"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 3101
    .local v1, "book_id":Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3102
    .local v2, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3103
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 3104
    .local v4, "examObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 3105
    .local v3, "localexamObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v0, "data"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 3106
    const-string/jumbo v0, "data"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 3108
    :cond_0
    if-eqz p2, :cond_1

    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 3111
    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 3110
    invoke-virtual {p0, v3, v0}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    .line 3113
    :cond_1
    const/4 v7, 0x0

    .local v7, "newDataObject":Ljava/lang/Object;
    move-object v0, p0

    move-object v5, p3

    move-object v6, p4

    .line 3115
    invoke-direct/range {v0 .. v6}, Lcom/edutech/json/TreeData;->appendObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    .line 3118
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 3120
    invoke-direct {p0, v3}, Lcom/edutech/json/TreeData;->sortInsertObject(Ljava/util/ArrayList;)V

    .line 3122
    invoke-static {v3}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v7

    .line 3125
    .end local v7    # "newDataObject":Ljava/lang/Object;
    :cond_2
    if-eqz p2, :cond_3

    .line 3127
    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3129
    :cond_3
    return-void
.end method

.method public addDataToNewTree(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 13
    .param p5, "key"    # Ljava/lang/String;
    .param p6, "appName"    # Ljava/lang/String;
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
            "Ljava/util/ArrayList",
            "<",
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
    .line 115
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, "idObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p7, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    move-object/from16 v0, p5

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 116
    if-eqz p4, :cond_0

    if-eqz p3, :cond_0

    .line 117
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 118
    move-object/from16 v0, p5

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 119
    move-object/from16 v0, p5

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 121
    .local v3, "book_id":Ljava/lang/String;
    const/4 v10, 0x1

    .local v10, "i":I
    :goto_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v10, v2, :cond_1

    .line 202
    .end local v3    # "book_id":Ljava/lang/String;
    .end local v10    # "i":I
    :cond_0
    return-void

    .line 123
    .restart local v3    # "book_id":Ljava/lang/String;
    .restart local v10    # "i":I
    :cond_1
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v9

    .line 124
    .local v9, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_4

    .line 121
    :cond_3
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 124
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/HashMap;

    .line 125
    .local v12, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p5

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 126
    move-object/from16 v0, p5

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 127
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 129
    move-object p2, v12

    .line 130
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v10, v2, :cond_3

    .line 132
    const/4 v11, 0x0

    .line 133
    .local v11, "newDataObject":Ljava/lang/Object;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .local v5, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p6

    invoke-direct {p0, v0, v1}, Lcom/edutech/json/TreeData;->addNewKeys(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    .line 143
    move-object/from16 v0, p6

    invoke-direct {p0, v0}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 142
    if-eqz v2, :cond_7

    .line 149
    move-object/from16 v0, p6

    invoke-direct {p0, v0}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 146
    invoke-virtual {p0, v5, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 151
    const-string/jumbo v2, "LessonPlanning"

    move-object/from16 v0, p6

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    move-object v2, p0

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    .line 152
    invoke-direct/range {v2 .. v8}, Lcom/edutech/json/TreeData;->appendPlanIdObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    .line 165
    :goto_2
    if-eqz v5, :cond_5

    .line 166
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 168
    invoke-static {v5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v11

    .line 190
    .end local v11    # "newDataObject":Ljava/lang/Object;
    :cond_5
    :goto_3
    if-eqz v11, :cond_3

    .line 193
    move-object/from16 v0, p6

    invoke-direct {p0, v0}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 191
    invoke-virtual {p0, p1, v12, v11, v2}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    goto/16 :goto_1

    .restart local v11    # "newDataObject":Ljava/lang/Object;
    :cond_6
    move-object v2, p0

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    .line 159
    invoke-direct/range {v2 .. v8}, Lcom/edutech/json/TreeData;->appendObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    goto :goto_2

    .line 171
    :cond_7
    const-string/jumbo v2, "LessonPlanning"

    move-object/from16 v0, p6

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    move-object v2, p0

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    .line 172
    invoke-direct/range {v2 .. v8}, Lcom/edutech/json/TreeData;->appendPlanIdObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    .line 184
    :goto_4
    if-eqz v5, :cond_5

    .line 185
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_5

    .line 187
    invoke-static {v5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v11

    .line 186
    goto :goto_3

    :cond_8
    move-object v2, p0

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    .line 179
    invoke-direct/range {v2 .. v8}, Lcom/edutech/json/TreeData;->appendObject(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v5

    goto :goto_4
.end method

.method public addNewKeysChange(Ljava/util/HashMap;Ljava/util/ArrayList;ZLjava/lang/String;I)V
    .locals 13
    .param p3, "isChange"    # Z
    .param p4, "appName"    # Ljava/lang/String;
    .param p5, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;Z",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v1, "GeRenChengZhang"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 296
    const-string/jumbo v1, "WrongQuestionSet"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 298
    :cond_0
    const-string/jumbo v1, "isdown"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 299
    const/16 p3, 0x1

    .line 300
    const-string/jumbo v1, "isdown"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    :cond_1
    const-string/jumbo v4, "webpath"

    .line 305
    const-string/jumbo v5, "progress"

    const-string/jumbo v6, "downloadsize"

    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p3

    .line 304
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 306
    const-string/jumbo v1, "questionprogress"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    .line 307
    const/16 p3, 0x1

    .line 308
    const-string/jumbo v1, "questionprogress"

    const-string/jumbo v3, "0"

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    :cond_2
    :goto_0
    if-eqz p3, :cond_3

    .line 384
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v7

    .line 385
    .local v7, "Newobejct":Ljava/lang/Object;
    if-eqz v7, :cond_3

    .line 386
    move/from16 v0, p5

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 387
    move/from16 v0, p5

    invoke-virtual {p2, v0, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 390
    .end local v7    # "Newobejct":Ljava/lang/Object;
    :cond_3
    return-void

    .line 310
    :cond_4
    const-string/jumbo v1, "Homework"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 311
    const-string/jumbo v1, "MyExaminationPaper"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 313
    :cond_5
    const-string/jumbo v1, "isdown"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_6

    .line 314
    const/16 p3, 0x1

    .line 315
    const-string/jumbo v1, "isdown"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    :cond_6
    const-string/jumbo v4, "webpath"

    .line 318
    const-string/jumbo v5, "progress"

    const-string/jumbo v6, "downloadsize"

    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p3

    .line 317
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 319
    const-string/jumbo v1, "attwebpath"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 322
    const-string/jumbo v4, "attwebpath"

    const-string/jumbo v5, "attprogress"

    const-string/jumbo v6, "attdownloadsize"

    move-object v1, p0

    move-object v2, p1

    move/from16 v3, p3

    .line 321
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 324
    :cond_7
    const-string/jumbo v1, "homeworkprogress"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_8

    .line 325
    const/16 p3, 0x1

    .line 326
    const-string/jumbo v1, "webpath"

    invoke-direct {p0, p1, v1}, Lcom/edutech/json/TreeData;->isNullWebpath(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 327
    const-string/jumbo v1, "homeworkprogress"

    const-string/jumbo v3, "100"

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    :cond_8
    :goto_1
    const/4 v8, 0x1

    .line 333
    .local v8, "isqProgress":Z
    const-string/jumbo v1, "question"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 335
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .local v11, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v1, "question"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 336
    invoke-virtual {p0, v11, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 338
    if-eqz v11, :cond_9

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    .line 340
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_2
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v9, v1, :cond_b

    .line 374
    .end local v9    # "j":I
    .end local v11    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_9
    const-string/jumbo v1, "qprogress"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    .line 375
    const/16 p3, 0x1

    .line 376
    if-eqz v8, :cond_f

    .line 377
    const-string/jumbo v1, "qprogress"

    const-string/jumbo v3, "100"

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 329
    .end local v8    # "isqProgress":Z
    :cond_a
    const-string/jumbo v1, "homeworkprogress"

    const-string/jumbo v3, "0"

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 342
    .restart local v8    # "isqProgress":Z
    .restart local v9    # "j":I
    .restart local v11    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_b
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v2

    .line 343
    .local v2, "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v1, "questionid"

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 345
    const-string/jumbo v4, "webpath"

    const-string/jumbo v5, "progress"

    .line 346
    const-string/jumbo v6, "downloadsize"

    move-object v1, p0

    move/from16 v3, p3

    .line 344
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 348
    const-string/jumbo v4, "qwebpath"

    const-string/jumbo v5, "qprogress"

    .line 349
    const-string/jumbo v6, "qdownloadsize"

    move-object v1, p0

    move/from16 v3, p3

    .line 347
    invoke-direct/range {v1 .. v6}, Lcom/edutech/json/TreeData;->insertProDownsize(Ljava/util/HashMap;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    .line 351
    const-string/jumbo v1, "qwebpath"

    .line 350
    invoke-direct {p0, v2, v1}, Lcom/edutech/json/TreeData;->isNullWebpath(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v8

    .line 352
    const-string/jumbo v1, "questionprogress"

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_c

    .line 353
    const/16 p3, 0x1

    .line 354
    const-string/jumbo v1, "webpath"

    invoke-direct {p0, v2, v1}, Lcom/edutech/json/TreeData;->isNullWebpath(Ljava/util/HashMap;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 356
    const-string/jumbo v1, "questionprogress"

    const-string/jumbo v3, "100"

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    :cond_c
    :goto_3
    if-eqz p3, :cond_d

    .line 363
    invoke-static {v2}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v12

    .line 364
    .local v12, "quesnewObject":Ljava/lang/Object;
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 365
    invoke-virtual {v11, v9, v12}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 367
    invoke-static {v11}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v10

    .line 368
    .local v10, "quesArrayObject":Ljava/lang/Object;
    const-string/jumbo v1, "question"

    invoke-virtual {p1, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    .end local v10    # "quesArrayObject":Ljava/lang/Object;
    .end local v12    # "quesnewObject":Ljava/lang/Object;
    :cond_d
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_2

    .line 358
    :cond_e
    const-string/jumbo v1, "questionprogress"

    const-string/jumbo v3, "0"

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 379
    .end local v2    # "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9    # "j":I
    .end local v11    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_f
    const-string/jumbo v1, "qprogress"

    const-string/jumbo v3, "0"

    invoke-virtual {p1, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method public addNewKeysLessonPlan(Ljava/util/HashMap;Ljava/util/ArrayList;ZLjava/lang/String;I)V
    .locals 14
    .param p3, "isChange"    # Z
    .param p4, "appName"    # Ljava/lang/String;
    .param p5, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;Z",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 476
    .local p1, "tempDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "dataObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 478
    .local v6, "itemsObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v12, "items"

    invoke-virtual {p1, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 477
    invoke-virtual {p0, v6, v12}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 479
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lez v12, :cond_0

    .line 481
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_0
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v7, v12, :cond_1

    .line 507
    if-eqz p3, :cond_0

    .line 510
    invoke-static {v6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 511
    .local v3, "arrayitemObject":Ljava/lang/Object;
    const-string/jumbo v12, "items"

    invoke-virtual {p1, v12, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    invoke-static {p1}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v8

    .line 513
    .local v8, "newobject":Ljava/lang/Object;
    move-object/from16 v0, p2

    move/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 514
    move-object/from16 v0, p2

    move/from16 v1, p5

    invoke-virtual {v0, v1, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 517
    .end local v3    # "arrayitemObject":Ljava/lang/Object;
    .end local v7    # "j":I
    .end local v8    # "newobject":Ljava/lang/Object;
    :cond_0
    return-void

    .line 483
    .restart local v7    # "j":I
    :cond_1
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v10

    .line 484
    .local v10, "tempItemMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v12, "webpath"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_3

    .line 485
    const-string/jumbo v12, "webpath"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 488
    .local v11, "webpath":Ljava/lang/String;
    if-eqz v11, :cond_3

    .line 489
    const-string/jumbo v12, ""

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 490
    const-string/jumbo v12, "progress"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-eqz v12, :cond_2

    .line 491
    const-string/jumbo v12, "downloadsize"

    invoke-virtual {v10, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    if-nez v12, :cond_3

    .line 492
    :cond_2
    const/16 p3, 0x1

    .line 494
    const-string/jumbo v9, "0"

    .line 495
    .local v9, "progress":Ljava/lang/String;
    const-wide/16 v4, 0x0

    .line 496
    .local v4, "downloadsize":J
    const-string/jumbo v12, "progress"

    invoke-virtual {v10, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    const-string/jumbo v12, "downloadsize"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v10, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    invoke-static {v10}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v2

    .line 500
    .local v2, "NewItemobejct":Ljava/lang/Object;
    if-eqz v2, :cond_3

    .line 501
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 502
    invoke-virtual {v6, v7, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 481
    .end local v2    # "NewItemobejct":Ljava/lang/Object;
    .end local v4    # "downloadsize":J
    .end local v9    # "progress":Ljava/lang/String;
    .end local v11    # "webpath":Ljava/lang/String;
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0
.end method

.method public appendid(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 4
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
    .line 1479
    .local p1, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v1, ""

    .line 1480
    .local v1, "sourceId":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 1486
    return-object v1

    .line 1481
    :cond_0
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1482
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1480
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1484
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
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
    .line 29
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "oldHead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 30
    .local v0, "newTree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getTree(Ljava/lang/Object;)Lcom/edutech/json/Tree;

    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 33
    invoke-virtual {v0, p2}, Lcom/edutech/json/Tree;->removeHead(Ljava/lang/Object;)V

    .line 34
    invoke-virtual {p2, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    invoke-virtual {v0, p2}, Lcom/edutech/json/Tree;->setHead(Ljava/lang/Object;)V

    .line 40
    :goto_0
    return-void

    .line 38
    :cond_0
    invoke-virtual {p2, p4, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public createSubTrees(Lcom/edutech/json/Tree;Ljava/util/HashMap;)V
    .locals 8
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
    .line 206
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 208
    .local v1, "datalist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :try_start_0
    iget-object v6, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 209
    const-string/jumbo v5, "children"

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONArray;

    .line 208
    invoke-virtual {v6, v5}, Lcom/edutech/json/CommonJSONParser;->parseJSONArray(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 214
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .local v4, "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    if-eqz v1, :cond_0

    .line 218
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 226
    :cond_0
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v3

    .line 230
    .local v3, "newSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    return-void

    .line 210
    .end local v3    # "newSuccessors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4    # "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :catch_0
    move-exception v2

    .line 212
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 218
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v4    # "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 221
    .local v0, "children":Ljava/lang/Object;
    iget-object v6, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 222
    const-string/jumbo v7, "children"

    .line 221
    invoke-static {p1, v4, v6, v0, v7}, Lcom/edutech/json/JsonParse;->childrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public deletePlanFile(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p2, "json"    # Ljava/lang/String;
    .param p3, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "key"    # Ljava/lang/String;
    .param p6, "key1"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 2851
    .local p1, "booktree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct {p0, p1, p2, p5, p6}, Lcom/edutech/json/TreeData;->deleteFile(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 2853
    .local v0, "deletenode":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v3, "DaoXueBen"

    invoke-direct {p0, v3}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 2854
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2856
    .local v1, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "DaoXueBen"

    invoke-direct {p0, v3}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 2855
    invoke-virtual {p0, v1, v3}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 2857
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 2858
    invoke-direct {p0, v1, p5, p3}, Lcom/edutech/json/TreeData;->getRemoveObject(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 2859
    .local v2, "removeObject":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 2861
    invoke-direct {p0, v2, p4}, Lcom/edutech/json/TreeData;->getRemoveItem(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 2866
    .end local v1    # "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "removeObject":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method public deleteSingleFile(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p2, "json"    # Ljava/lang/String;
    .param p3, "sourceId"    # Ljava/lang/String;
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "key1"    # Ljava/lang/String;
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
            ")V"
        }
    .end annotation

    .prologue
    .line 2832
    .local p1, "booktree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct {p0, p1, p2, p4, p5}, Lcom/edutech/json/TreeData;->deleteFile(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 2835
    .local v0, "deletenode":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v3, "DaoXueBen"

    invoke-direct {p0, v3}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 2836
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2838
    .local v1, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "DaoXueBen"

    invoke-direct {p0, v3}, Lcom/edutech/json/TreeData;->getDataName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 2837
    invoke-virtual {p0, v1, v3}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v1

    .line 2839
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 2840
    invoke-direct {p0, v1, p4, p3}, Lcom/edutech/json/TreeData;->getRemoveObject(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 2841
    .local v2, "removeObject":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 2842
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2845
    .end local v1    # "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v2    # "removeObject":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method public deleteSourceFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 17
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
    .line 990
    .local p4, "sourceIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 991
    .local v5, "deletetree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v4, 0x0

    .line 992
    .local v4, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v1, "children"

    .line 993
    const-string/jumbo v6, "children"

    .line 992
    move-object/from16 v0, p1

    invoke-static {v5, v0, v1, v6}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v5

    .line 995
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 997
    invoke-virtual {v5}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 998
    .local v2, "bookId":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v6, "/"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 999
    const-string/jumbo v6, "/json.json"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 998
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1000
    .local v14, "bookJsonPath":Ljava/lang/String;
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1001
    .local v13, "bookJsonFile":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1003
    invoke-static {v14}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1004
    .local v15, "json":Ljava/lang/String;
    const-string/jumbo v1, "data"

    const-string/jumbo v6, "children"

    invoke-static {v4, v15, v1, v6}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v4

    .line 1005
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1006
    invoke-virtual {v4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1008
    invoke-virtual {v4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    move-object/from16 v0, p5

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1009
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1010
    .local v3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1012
    invoke-virtual {v4}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v5}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    move-object/from16 v1, p0

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    .line 1011
    invoke-direct/range {v1 .. v12}, Lcom/edutech/json/TreeData;->getSourceIdList(Ljava/lang/String;Ljava/util/ArrayList;Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1015
    invoke-static {v4}, Lcom/edutech/json/JsonCreate;->createjson(Lcom/edutech/json/Tree;)Ljava/lang/String;

    move-result-object v16

    .line 1016
    .local v16, "newjson":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-static {v0, v14}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    .line 1021
    .end local v2    # "bookId":Ljava/lang/String;
    .end local v3    # "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v13    # "bookJsonFile":Ljava/io/File;
    .end local v14    # "bookJsonPath":Ljava/lang/String;
    .end local v15    # "json":Ljava/lang/String;
    .end local v16    # "newjson":Ljava/lang/String;
    :cond_0
    return-object p4
.end method

.method public examAddNewKeys(Ljava/util/HashMap;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .param p2, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
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
    .line 3082
    .local p1, "jsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 3083
    .local v1, "ischange":Z
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3084
    .local v0, "examObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v2, "data"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 3085
    const-string/jumbo v2, "data"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3086
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 3087
    const/4 v1, 0x1

    .line 3088
    invoke-direct {p0, v0, p2}, Lcom/edutech/json/TreeData;->addNewKeys(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3091
    :cond_0
    if-eqz v1, :cond_1

    .line 3092
    const-string/jumbo v2, "data"

    invoke-static {v0}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3094
    :cond_1
    return-object p1
.end method

.method public getAllBookNeedDownList(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 12
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
    .line 525
    .local p1, "downloadlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 526
    .local v7, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-static {v7, p2}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 527
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 565
    return-object p1

    .line 527
    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/edutech/json/Books;

    .line 529
    .local v8, "tempBook":Lcom/edutech/json/Books;
    invoke-virtual {v8}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v3

    .line 531
    .local v3, "bookid":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v6

    .line 532
    .local v6, "bookpath":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string/jumbo v10, ""

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 534
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 535
    move-object/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 534
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 537
    .local v2, "bookfilepath":Ljava/lang/String;
    const-string/jumbo v10, "DaoXueBenNew"

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 538
    const-string/jumbo v10, "DaoXueBen"

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 539
    const-string/jumbo v10, "ZuoYeFuDao"

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 540
    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 543
    :cond_3
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 544
    .local v1, "bookfiledir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 545
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "json.json"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 546
    .local v5, "bookjsonfilepath":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 549
    .local v4, "bookjsonfile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 550
    const-string/jumbo v10, "Homework"

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 552
    const-string/jumbo v10, "MyExaminationPaper"

    move-object/from16 v0, p5

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 554
    :cond_4
    move-object/from16 v0, p5

    invoke-direct {p0, p1, v8, v5, v0}, Lcom/edutech/json/TreeData;->getBookExamDownList(Ljava/util/ArrayList;Lcom/edutech/json/Books;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    .line 556
    goto/16 :goto_0

    .line 557
    :cond_5
    move-object/from16 v0, p5

    invoke-direct {p0, p1, v8, v5, v0}, Lcom/edutech/json/TreeData;->getBookDownList(Ljava/util/ArrayList;Lcom/edutech/json/Books;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    goto/16 :goto_0
.end method

.method public getFileDownloadList(Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4
    .param p3, "appName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            ")V"
        }
    .end annotation

    .prologue
    .line 3317
    .local p1, "localjsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p2, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    const-string/jumbo v2, "data"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 3319
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3321
    .local v0, "fileObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v2, "data"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3320
    invoke-virtual {p0, v0, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3322
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3327
    .end local v0    # "fileObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 3322
    .restart local v0    # "fileObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3323
    .local v1, "tempObject":Ljava/lang/Object;
    const-string/jumbo v3, ""

    invoke-direct {p0, v3, v1, p2, p3}, Lcom/edutech/json/TreeData;->addToneedDownloadListGeRen(Ljava/lang/String;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    goto :goto_0
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
    .line 3497
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lt v1, v4, :cond_0

    .line 3512
    return-object p2

    .line 3498
    :cond_0
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3501
    .local v2, "id":Ljava/lang/String;
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 3502
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 3497
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3502
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 3504
    .local v3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 3505
    invoke-virtual {v3, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3507
    move-object p2, v3

    .line 3508
    goto :goto_1
.end method

.method public getNeedDownloadList(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 6
    .param p2, "downloadJson"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
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
    .line 237
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v2, 0x0

    .line 238
    .local v2, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v0, "children"

    .line 239
    const-string/jumbo v1, "children"

    .line 238
    invoke-static {v2, p2, v0, v1}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v2

    .line 243
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 244
    invoke-virtual/range {v0 .. v5}, Lcom/edutech/json/TreeData;->updateJsonTree(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 245
    :cond_0
    return-object p5
.end method

.method public getUpdateJsonObject(Lcom/edutech/json/Tree;Ljava/util/ArrayList;)Ljava/util/HashMap;
    .locals 4
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
    .line 1512
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1513
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1514
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1515
    .local v0, "id":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1518
    .local v1, "sId":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1520
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    invoke-direct {p0, p1, v2, p2}, Lcom/edutech/json/TreeData;->getjsonObject(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object v2

    .line 1523
    .end local v0    # "id":Ljava/lang/String;
    .end local v1    # "sId":Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 4
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
    .line 3059
    .local p1, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 3060
    iget-object v2, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    invoke-virtual {v2, p2}, Lcom/edutech/json/CommonJSONParser;->isJsonArray(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3062
    invoke-virtual {p0, p2}, Lcom/edutech/json/TreeData;->parseValueList(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3063
    .local v0, "newObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 3064
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3076
    .end local v0    # "newObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-object p1

    .line 3064
    .restart local v0    # "newObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3065
    .local v1, "tempobject":Ljava/lang/Object;
    iget-object v3, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    invoke-virtual {v3, v1}, Lcom/edutech/json/CommonJSONParser;->isJsonArray(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 3067
    invoke-virtual {p0, p1, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    goto :goto_0

    .line 3070
    :cond_2
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getWebPathHashMap(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;)Ljava/util/HashMap;
    .locals 1
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
            ">;>;)",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2824
    .local p1, "deletetree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "booktree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v0, 0x0

    .line 2826
    .local v0, "wpHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    return-object v0
.end method

.method public getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p4, "key"    # Ljava/lang/String;
    .param p5, "questionid"    # Ljava/lang/String;
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
    .line 3458
    .line 3459
    .local p1, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "idhead":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p3, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v7

    .line 3460
    .local v7, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_0
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 3489
    return-object p5

    .line 3460
    :cond_1
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 3462
    .local v3, "tempSuccessors":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_0

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 3464
    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 3465
    .local v11, "id":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3466
    const-string/jumbo v1, "data"

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 3467
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 3469
    .local v9, "dataidarraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v1, "data"

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3468
    invoke-virtual {p0, v9, v1}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 3471
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 3473
    :try_start_0
    iget-object v2, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    .line 3475
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 3474
    invoke-virtual {v2, v1}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v8

    .line 3476
    .local v8, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v8, :cond_2

    move-object/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 3477
    move-object/from16 v0, p4

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p5

    .end local v8    # "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9    # "dataidarraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    :goto_1
    move-object v1, p0

    move-object v2, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    .line 3485
    invoke-virtual/range {v1 .. v6}, Lcom/edutech/json/TreeData;->getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    goto :goto_0

    .line 3479
    .restart local v9    # "dataidarraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :catch_0
    move-exception v10

    .line 3481
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public parseValueList(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 3
    .param p1, "dataObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 957
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 958
    .local v0, "common":Lcom/edutech/json/CommonJSONParser;
    const/4 v2, 0x0

    .line 960
    .local v2, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :try_start_0
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "dataObject":Ljava/lang/Object;
    invoke-virtual {v0, p1}, Lcom/edutech/json/CommonJSONParser;->parseJSONArray(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 968
    :goto_0
    return-object v2

    .line 961
    :catch_0
    move-exception v1

    .line 963
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 964
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 966
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public removeSourceId(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "sourceId"    # Ljava/lang/String;

    .prologue
    .line 974
    const-string/jumbo v0, "_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 975
    const/4 v0, 0x0

    const-string/jumbo v1, "_"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 979
    :goto_0
    return-object p1

    .line 977
    :cond_0
    const-string/jumbo p1, ""

    goto :goto_0
.end method

.method public sourceidToList(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
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
    .line 1491
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1492
    .local v2, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_1

    const-string/jumbo v3, ""

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1494
    :cond_0
    :goto_0
    const-string/jumbo v3, "_"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    .line 1501
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 1502
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1504
    :cond_1
    return-object v2

    .line 1495
    :cond_2
    const-string/jumbo v3, "_"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1496
    .local v0, "end":I
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1497
    .local v1, "id":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1498
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_0

    .line 1499
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public treeToList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "json"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "key1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    .line 2968
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2969
    .local v1, "treeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 2970
    .local v2, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {v2, p1, p3, p3}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v2

    .line 2971
    if-nez v2, :cond_0

    move-object v6, v1

    .line 2978
    .end local v1    # "treeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local v6, "treeList":Ljava/lang/Object;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    return-object v6

    .line 2973
    .end local v6    # "treeList":Ljava/lang/Object;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v1    # "treeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {v2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2975
    invoke-virtual {v2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2977
    :cond_1
    invoke-virtual {v2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    move-object v0, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/edutech/json/TreeData;->toList(Ljava/util/ArrayList;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    move-object v6, v1

    .line 2978
    .restart local v6    # "treeList":Ljava/lang/Object;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    goto :goto_0
.end method

.method public updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p2, "ischange"    # Z
    .param p8, "webpath"    # Ljava/lang/String;
    .param p9, "oldProgress"    # Ljava/lang/String;
    .param p10, "downloadsize"    # J
    .param p12, "appName"    # Ljava/lang/String;
    .param p13, "keydownloadsize"    # Ljava/lang/String;
    .param p14, "keyprogress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;Z",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 2099
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .local p4, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p5, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p6, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p7, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 2159
    :goto_1
    return p2

    .line 2104
    :cond_0
    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2106
    invoke-virtual {p6, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2107
    invoke-static {p10, p11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p6, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2108
    invoke-virtual {p6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2109
    invoke-virtual {p7, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2111
    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2112
    const-string/jumbo v2, "100"

    invoke-virtual {p5, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2121
    :goto_2
    const-string/jumbo v2, "DaoXueBen"

    move-object/from16 v0, p12

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2123
    invoke-static {p5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2122
    move-object/from16 v0, p14

    invoke-virtual {p0, p1, p3, v2, v0}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 2126
    invoke-static {p6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2125
    move-object/from16 v0, p13

    invoke-virtual {p0, p1, p3, v2, v0}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 2155
    :goto_3
    const/4 p2, 0x1

    .line 2156
    goto :goto_1

    .line 2115
    :cond_1
    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2116
    invoke-virtual {p5, v1, p9}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 2129
    :cond_2
    const-string/jumbo v2, "DaoXueBenNew"

    move-object/from16 v0, p12

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2131
    invoke-static {p5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2130
    move-object/from16 v0, p14

    invoke-virtual {p3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2133
    invoke-static {p6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2132
    move-object/from16 v0, p13

    invoke-virtual {p3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 2140
    :cond_3
    const-string/jumbo v2, "ExamImage"

    move-object/from16 v0, p12

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 2142
    const-string/jumbo v2, "qprogress"

    .line 2143
    invoke-static {p5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 2142
    invoke-virtual {p3, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2144
    const-string/jumbo v2, "qdownloadsize"

    .line 2145
    invoke-static {p6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 2144
    invoke-virtual {p3, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 2149
    :cond_4
    invoke-static {p5}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2148
    move-object/from16 v0, p14

    invoke-virtual {p3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2151
    invoke-static {p6}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v2

    .line 2150
    move-object/from16 v0, p13

    invoke-virtual {p3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 2099
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0
.end method

.method public updateDxProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 28
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
    .param p9, "keywebpath"    # Ljava/lang/String;
    .param p10, "keypath"    # Ljava/lang/String;
    .param p11, "keydownloadsize"    # Ljava/lang/String;
    .param p12, "keyprogress"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1633
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v27, "-1"

    .line 1635
    .local v27, "totalprogress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 1637
    .local v26, "sizekey":Ljava/lang/String;
    const-string/jumbo v4, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1638
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 1640
    .local v22, "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v4, "dxitems"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1639
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v22

    .line 1641
    if-eqz v22, :cond_1

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 1642
    const/16 v23, 0x0

    .local v23, "i":I
    :goto_0
    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v23

    if-lt v0, v4, :cond_2

    .line 1717
    :cond_0
    :goto_1
    invoke-static/range {v22 .. v22}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v4

    .line 1718
    const-string/jumbo v5, "dxitems"

    .line 1716
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2, v4, v5}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 1721
    .end local v22    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v23    # "i":I
    :cond_1
    return-object v27

    .line 1643
    .restart local v22    # "dxitemsobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v23    # "i":I
    :cond_2
    const/4 v6, 0x0

    .line 1645
    .local v6, "ischange":Z
    invoke-virtual/range {v22 .. v23}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v7

    .line 1646
    .local v7, "dxitemstempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v7, :cond_4

    .line 1647
    const-string/jumbo v4, "dxid"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 1648
    const-string/jumbo v4, "dxid"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1649
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1648
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1649
    if-eqz v4, :cond_4

    .line 1650
    move-object/from16 v0, p9

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1651
    move-object/from16 v0, p10

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1652
    move-object/from16 v0, p12

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1653
    move-object/from16 v0, p11

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1654
    move-object/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 1655
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1656
    .local v8, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 1657
    .local v25, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1658
    .local v9, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1659
    .local v11, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1661
    .local v10, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p9

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1660
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1663
    move-object/from16 v0, p10

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1662
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v25

    .line 1665
    move-object/from16 v0, p12

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1664
    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 1667
    move-object/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1666
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v11

    .line 1670
    move-object/from16 v0, p11

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1668
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v4}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1671
    if-eqz v8, :cond_3

    if-eqz v25, :cond_3

    .line 1672
    if-eqz v9, :cond_3

    .line 1673
    if-eqz v10, :cond_3

    .line 1674
    if-eqz v11, :cond_3

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v12, p4

    move-object/from16 v13, p5

    move-wide/from16 v14, p6

    move-object/from16 v16, p8

    move-object/from16 v17, p11

    move-object/from16 v18, p12

    .line 1675
    invoke-virtual/range {v4 .. v18}, Lcom/edutech/json/TreeData;->updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    .line 1682
    if-nez v6, :cond_3

    .line 1684
    const-string/jumbo v4, "DaoXueBenNew"

    move-object/from16 v0, p8

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1686
    const-string/jumbo v4, "exams"

    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_3

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move v15, v6

    move-object/from16 v16, v27

    move-object/from16 v17, v7

    move-object/from16 v18, p4

    move-object/from16 v19, p5

    move-wide/from16 v20, p6

    .line 1688
    invoke-direct/range {v13 .. v21}, Lcom/edutech/json/TreeData;->updateExamsProgress(Lcom/edutech/json/Tree;ZLjava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v27

    .line 1693
    const-string/jumbo v4, "examsprogress"

    move-object/from16 v0, v27

    invoke-virtual {v7, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1695
    const/4 v6, 0x1

    .line 1701
    .end local v8    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v10    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v11    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v25    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    if-eqz v6, :cond_0

    .line 1703
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v24

    .line 1704
    .local v24, "newObject":Ljava/lang/Object;
    if-eqz v24, :cond_0

    .line 1706
    invoke-virtual/range {v22 .. v23}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1707
    invoke-virtual/range {v22 .. v24}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto/16 :goto_1

    .line 1642
    .end local v24    # "newObject":Ljava/lang/Object;
    :cond_4
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_0
.end method

.method public updateErrorStatus(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/edutech/json/Tree;)V
    .locals 28
    .param p1, "booksJsonPath"    # Ljava/lang/String;
    .param p2, "appName"    # Ljava/lang/String;
    .param p3, "offlineDownloadDir"    # Ljava/lang/String;
    .param p4, "inerror"    # I
    .param p5, "needUpdateBookid"    # Ljava/lang/String;
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
    .line 3343
    .local p6, "idtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const-string/jumbo v7, "id"

    .line 3344
    .local v7, "key":Ljava/lang/String;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 3345
    .local v15, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    move-object/from16 v0, p1

    invoke-static {v15, v0}, Lcom/edutech/json/JsonParse;->parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v15

    .line 3346
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :cond_0
    :goto_0
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3451
    return-void

    .line 3346
    :cond_1
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/edutech/json/Books;

    .line 3348
    .local v25, "tempBook":Lcom/edutech/json/Books;
    invoke-virtual/range {v25 .. v25}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v11

    .line 3349
    .local v11, "bookid":Ljava/lang/String;
    invoke-virtual/range {v25 .. v25}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v14

    .line 3350
    .local v14, "bookpath":Ljava/lang/String;
    if-eqz v11, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 3351
    move-object/from16 v0, p5

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3352
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 3353
    .local v10, "bookfilepath":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3354
    .local v9, "bookfiledir":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3355
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "json.json"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 3356
    .local v13, "bookjsonfilepath":Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3357
    .local v12, "bookjsonfile":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 3358
    const/16 v26, 0x0

    .line 3360
    .local v26, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-static {v13}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 3361
    .local v19, "json":Ljava/lang/String;
    const-string/jumbo v3, "data"

    .line 3362
    const-string/jumbo v4, "children"

    .line 3361
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-static {v0, v1, v3, v4}, Lcom/edutech/json/JsonParse;->parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;

    move-result-object v26

    .line 3364
    if-eqz v26, :cond_0

    invoke-virtual/range {v26 .. v26}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 3365
    invoke-virtual/range {v26 .. v26}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    invoke-virtual {v3, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 3366
    const/16 v18, 0x0

    .line 3368
    .local v18, "isTreeUpdate":Z
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 3369
    .local v6, "idList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3370
    const-string/jumbo v8, ""

    .line 3372
    .local v8, "questionid":Ljava/lang/String;
    invoke-virtual/range {p6 .. p6}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    move-object/from16 v3, p0

    move-object/from16 v4, p6

    .line 3371
    invoke-virtual/range {v3 .. v8}, Lcom/edutech/json/TreeData;->getidList(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 3374
    if-eqz v8, :cond_3

    .line 3375
    const-string/jumbo v3, ""

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 3377
    invoke-virtual/range {v26 .. v26}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/HashMap;

    .line 3378
    .local v16, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_3

    .line 3381
    invoke-virtual/range {v26 .. v26}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 3380
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v3, v6, v7}, Lcom/edutech/json/TreeData;->getNeedDownHead(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v16

    .line 3382
    const-string/jumbo v3, "question"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 3384
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 3387
    .local v24, "questionobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "question"

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 3385
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v3}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v24

    .line 3388
    if-eqz v24, :cond_3

    .line 3390
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_3

    .line 3391
    const/16 v17, 0x0

    .line 3392
    .local v17, "i":I
    :goto_1
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 3391
    move/from16 v0, v17

    if-lt v0, v3, :cond_4

    .line 3429
    :cond_2
    :goto_2
    invoke-static/range {v24 .. v24}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v3

    .line 3430
    const-string/jumbo v4, "question"

    .line 3425
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/edutech/json/TreeData;->changeTreeData(Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/String;)V

    .line 3436
    .end local v16    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v17    # "i":I
    .end local v24    # "questionobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_3
    if-eqz v18, :cond_0

    .line 3439
    invoke-static/range {v26 .. v26}, Lcom/edutech/json/JsonCreate;->createjson(Lcom/edutech/json/Tree;)Ljava/lang/String;

    move-result-object v21

    .line 3440
    .local v21, "newjson":Ljava/lang/String;
    move-object/from16 v0, v21

    invoke-static {v0, v13}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_0

    .line 3395
    .end local v21    # "newjson":Ljava/lang/String;
    .restart local v16    # "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v17    # "i":I
    .restart local v24    # "questionobjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_4
    move-object/from16 v0, v24

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 3394
    invoke-static {v3}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v23

    .line 3396
    .local v23, "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 3398
    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 3399
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v22

    .line 3400
    .local v22, "qid":Ljava/lang/String;
    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 3402
    const-string/jumbo v3, "inerror"

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 3401
    if-eqz v3, :cond_5

    .line 3404
    const-string/jumbo v3, "inerror"

    .line 3405
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 3404
    move-object/from16 v0, v23

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3406
    const/16 v18, 0x1

    .line 3410
    .end local v22    # "qid":Ljava/lang/String;
    :cond_5
    if-eqz v18, :cond_6

    .line 3412
    invoke-static/range {v23 .. v23}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v20

    .line 3413
    .local v20, "newObject":Ljava/lang/Object;
    if-eqz v20, :cond_2

    .line 3416
    move-object/from16 v0, v24

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 3418
    move-object/from16 v0, v24

    move/from16 v1, v17

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 3392
    .end local v20    # "newObject":Ljava/lang/Object;
    :cond_6
    add-int/lit8 v17, v17, 0x1

    goto :goto_1
.end method

.method public updateFormJson(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 12
    .param p1, "questionid"    # Ljava/lang/String;
    .param p2, "bookJsonPath"    # Ljava/lang/String;
    .param p3, "status"    # I

    .prologue
    .line 3161
    invoke-static {p2}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3162
    .local v6, "localjson":Ljava/lang/String;
    iget-object v10, p0, Lcom/edutech/json/TreeData;->common:Lcom/edutech/json/CommonJSONParser;

    invoke-virtual {v10, v6}, Lcom/edutech/json/CommonJSONParser;->parse(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    .line 3163
    .local v4, "jsonMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, 0x0

    .line 3164
    .local v3, "ischange":Z
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3165
    .local v0, "examObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz v4, :cond_0

    const-string/jumbo v10, "id"

    invoke-virtual {v4, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 3166
    const-string/jumbo v10, "data"

    invoke-virtual {v4, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 3168
    const-string/jumbo v10, "data"

    invoke-virtual {v4, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {p0, v0, v10}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 3169
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_0

    .line 3170
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lt v2, v10, :cond_2

    .line 3195
    .end local v2    # "i":I
    :cond_0
    :goto_1
    if-eqz v3, :cond_1

    .line 3196
    invoke-direct {p0, v0}, Lcom/edutech/json/TreeData;->sortInsertObject(Ljava/util/ArrayList;)V

    .line 3197
    invoke-static {v0}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v8

    .line 3198
    .local v8, "newObject":Ljava/lang/Object;
    const-string/jumbo v10, "data"

    invoke-virtual {v4, v10, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3199
    invoke-static {v4}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v5

    .line 3200
    .local v5, "jsonObject":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10, p2}, Lcom/edutech/json/JsonCreate;->saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z

    .line 3202
    .end local v5    # "jsonObject":Ljava/lang/Object;
    .end local v8    # "newObject":Ljava/lang/Object;
    :cond_1
    return-void

    .line 3171
    .restart local v2    # "i":I
    :cond_2
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 3173
    .local v9, "tempObject":Ljava/lang/Object;
    invoke-static {v9}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v1

    .line 3174
    .local v1, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v1, :cond_5

    const-string/jumbo v10, "id"

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_5

    .line 3176
    const-string/jumbo v10, "id"

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 3177
    const/4 v10, 0x1

    if-ne p3, v10, :cond_4

    .line 3178
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 3188
    :cond_3
    :goto_2
    const/4 v3, 0x1

    .line 3189
    goto :goto_1

    .line 3179
    :cond_4
    const/4 v10, 0x2

    if-ne p3, v10, :cond_3

    .line 3180
    const-string/jumbo v10, "status"

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 3181
    const-string/jumbo v10, "status"

    const-string/jumbo v11, "2"

    invoke-virtual {v1, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3183
    invoke-static {v1}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v7

    .line 3184
    .local v7, "newExamObject":Ljava/lang/Object;
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 3185
    invoke-virtual {v0, v2, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_2

    .line 3170
    .end local v7    # "newExamObject":Ljava/lang/Object;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public updateGeRenProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
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
            ")V"
        }
    .end annotation

    .prologue
    .line 3333
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 3335
    .local v2, "isChange":Z
    const-string/jumbo v11, "webpath"

    const-string/jumbo v12, "path"

    .line 3336
    const-string/jumbo v13, "progress"

    const-string/jumbo v14, "downloadsize"

    const-string/jumbo v15, "size"

    move-object/from16 v1, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-wide/from16 v8, p6

    move-object/from16 v10, p8

    .line 3334
    invoke-direct/range {v1 .. v15}, Lcom/edutech/json/TreeData;->updateHMExamProAndSize(ZLcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    .line 3338
    return-void
.end method

.method public updateHMProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 22
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
    .line 1728
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .line 1730
    .local v4, "isChange":Z
    const-string/jumbo v13, "webpath"

    const-string/jumbo v14, "path"

    .line 1731
    const-string/jumbo v15, "progress"

    const-string/jumbo v16, "downloadsize"

    const-string/jumbo v17, "size"

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-wide/from16 v10, p6

    move-object/from16 v12, p8

    .line 1729
    invoke-direct/range {v3 .. v17}, Lcom/edutech/json/TreeData;->updateHMExamProAndSize(ZLcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 1736
    if-nez v4, :cond_0

    .line 1738
    const-string/jumbo v3, "question"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1740
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 1742
    .local v19, "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v3, "question"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 1741
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v19

    .line 1743
    if-eqz v19, :cond_0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 1745
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 1793
    .end local v2    # "j":I
    .end local v19    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_0
    return-void

    .line 1747
    .restart local v2    # "j":I
    .restart local v19    # "quesObjectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/edutech/json/JsonParse;->geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;

    move-result-object v7

    .line 1748
    .local v7, "quesObjectMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v3, "questionid"

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1752
    const-string/jumbo v12, "ExamMp"

    .line 1753
    const-string/jumbo v13, "webpath"

    const-string/jumbo v14, "path"

    const-string/jumbo v15, "progress"

    .line 1754
    const-string/jumbo v16, "downloadsize"

    const-string/jumbo v17, "size"

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-wide/from16 v10, p6

    .line 1750
    invoke-direct/range {v3 .. v17}, Lcom/edutech/json/TreeData;->updateHMExamProAndSize(ZLcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 1755
    if-eqz v4, :cond_3

    .line 1758
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v20

    .line 1759
    .local v20, "quesnewObject":Ljava/lang/Object;
    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1760
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1762
    invoke-static/range {v19 .. v19}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v18

    .line 1763
    .local v18, "quesArrayObject":Ljava/lang/Object;
    const-string/jumbo v3, "question"

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1745
    .end local v18    # "quesArrayObject":Ljava/lang/Object;
    .end local v20    # "quesnewObject":Ljava/lang/Object;
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1769
    :cond_3
    const-string/jumbo v12, "ExamImage"

    .line 1770
    const-string/jumbo v13, "qwebpath"

    const-string/jumbo v14, "qpath"

    const-string/jumbo v15, "qprogress"

    .line 1771
    const-string/jumbo v16, "qdownloadsize"

    const-string/jumbo v17, "qsize"

    move-object/from16 v3, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    move-wide/from16 v10, p6

    .line 1767
    invoke-direct/range {v3 .. v17}, Lcom/edutech/json/TreeData;->updateHMExamProAndSize(ZLcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 1772
    if-eqz v4, :cond_2

    .line 1774
    invoke-static {v7}, Lcom/edutech/json/JsonCreate;->MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;

    move-result-object v20

    .line 1775
    .restart local v20    # "quesnewObject":Ljava/lang/Object;
    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1776
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 1778
    invoke-static/range {v19 .. v19}, Lcom/edutech/json/JsonCreate;->toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v18

    .line 1779
    .restart local v18    # "quesArrayObject":Ljava/lang/Object;
    const-string/jumbo v3, "question"

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1781
    const-string/jumbo v10, "0"

    .line 1783
    .local v10, "totalprogress":Ljava/lang/String;
    const-string/jumbo v11, "qprogress"

    .line 1784
    const-string/jumbo v12, "qdownloadsize"

    const-string/jumbo v13, "qsize"

    move-object/from16 v8, p0

    move-object/from16 v9, p3

    .line 1782
    invoke-direct/range {v8 .. v13}, Lcom/edutech/json/TreeData;->updateQprogress(Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1785
    const-string/jumbo v3, "qprogress"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public updateJsonTree(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 11
    .param p3, "key"    # Ljava/lang/String;
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
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
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
    .line 47
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "localtree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p5, "needDownloadList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    .line 50
    .local v9, "headid":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    .line 53
    .local v10, "localheadid":Ljava/lang/String;
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v5, "localIdParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    invoke-virtual {p1}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 61
    invoke-virtual {p2}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v6, p3

    move-object v7, p4

    move-object/from16 v8, p5

    .line 60
    invoke-direct/range {v0 .. v8}, Lcom/edutech/json/TreeData;->compareData(Lcom/edutech/json/Tree;Lcom/edutech/json/Tree;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 65
    .end local v5    # "localIdParentList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "headid":Ljava/lang/String;
    .end local v10    # "localheadid":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public updateProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
    .param p9, "keywebpath"    # Ljava/lang/String;
    .param p10, "keypath"    # Ljava/lang/String;
    .param p11, "keydownloadsize"    # Ljava/lang/String;
    .param p12, "keyprogress"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1555
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v22, "-1"

    .line 1556
    .local v22, "totalprogress":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1557
    .local v4, "ischange":Z
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 1558
    .local v21, "sizekey":Ljava/lang/String;
    move-object/from16 v0, p3

    move-object/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p3

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1559
    move-object/from16 v0, p3

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1560
    move-object/from16 v0, p3

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1561
    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1562
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1563
    .local v6, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 1564
    .local v20, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1565
    .local v7, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1566
    .local v9, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1567
    .local v8, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    move-object/from16 v0, p3

    move-object/from16 v1, p9

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v6

    .line 1568
    move-object/from16 v0, p3

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v20

    .line 1569
    move-object/from16 v0, p3

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 1570
    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    .line 1572
    move-object/from16 v0, p3

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1571
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 1573
    if-eqz v6, :cond_3

    if-eqz v20, :cond_3

    if-eqz v7, :cond_3

    .line 1574
    if-eqz v8, :cond_3

    if-eqz v9, :cond_3

    .line 1576
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_3

    .line 1577
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 1578
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 1579
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 1580
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v5, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move-wide/from16 v12, p6

    move-object/from16 v14, p8

    move-object/from16 v15, p11

    move-object/from16 v16, p12

    .line 1582
    invoke-virtual/range {v2 .. v16}, Lcom/edutech/json/TreeData;->updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 1587
    if-eqz v4, :cond_2

    .line 1588
    const-string/jumbo v2, "WrongQuestionSet"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1589
    const-string/jumbo v2, "ZuoYeFuDao"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1590
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v8, v9}, Lcom/edutech/json/TreeData;->updateTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v14

    .line 1593
    .end local v22    # "totalprogress":Ljava/lang/String;
    .local v14, "totalprogress":Ljava/lang/String;
    :goto_0
    if-nez v4, :cond_1

    .line 1594
    const-string/jumbo v2, "DaoXueBen"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1596
    const-string/jumbo v2, "exams"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move v13, v4

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move-object/from16 v17, p5

    move-wide/from16 v18, p6

    .line 1598
    invoke-direct/range {v11 .. v19}, Lcom/edutech/json/TreeData;->updateExamsProgress(Lcom/edutech/json/Tree;ZLjava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v14

    .line 1608
    .end local v6    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v20    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    :goto_1
    return-object v14

    .end local v14    # "totalprogress":Ljava/lang/String;
    .restart local v6    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v7    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v8    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v9    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v20    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v22    # "totalprogress":Ljava/lang/String;
    :cond_2
    move-object/from16 v14, v22

    .end local v22    # "totalprogress":Ljava/lang/String;
    .restart local v14    # "totalprogress":Ljava/lang/String;
    goto :goto_0

    .end local v6    # "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v7    # "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v8    # "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v9    # "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v14    # "totalprogress":Ljava/lang/String;
    .end local v20    # "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .restart local v22    # "totalprogress":Ljava/lang/String;
    :cond_3
    move-object/from16 v14, v22

    .end local v22    # "totalprogress":Ljava/lang/String;
    .restart local v14    # "totalprogress":Ljava/lang/String;
    goto :goto_1
.end method

.method public updateTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 12
    .param p1, "totalprogress"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2072
    .local p2, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .local p3, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-wide/16 v8, 0x0

    .line 2073
    .local v8, "totalsize":J
    const-wide/16 v6, 0x0

    .line 2074
    .local v6, "totaldownloadsize":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 2081
    const-wide/16 v10, 0x0

    cmp-long v1, v8, v10

    if-nez v1, :cond_1

    .line 2082
    const-string/jumbo p1, "0"

    .line 2089
    :goto_1
    return-object p1

    .line 2075
    :cond_0
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 2076
    .local v4, "tempsize":J
    add-long/2addr v8, v4

    .line 2077
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 2078
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2077
    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 2079
    .local v2, "tempdownloadsize":J
    add-long/2addr v6, v2

    .line 2074
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2083
    .end local v2    # "tempdownloadsize":J
    .end local v4    # "tempsize":J
    :cond_1
    cmp-long v1, v8, v6

    if-nez v1, :cond_2

    .line 2084
    const-string/jumbo p1, "100"

    .line 2085
    goto :goto_1

    .line 2087
    :cond_2
    long-to-float v1, v6

    const/high16 v10, 0x42c80000    # 100.0f

    mul-float/2addr v1, v10

    long-to-float v10, v8

    div-float/2addr v1, v10

    float-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 2086
    goto :goto_1
.end method

.method public updateXINHomeworkProgressAndSize(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 30
    .param p2, "sourceId"    # Ljava/lang/String;
    .param p4, "webpath"    # Ljava/lang/String;
    .param p5, "oldProgress"    # Ljava/lang/String;
    .param p6, "downloadsize"    # J
    .param p8, "appName"    # Ljava/lang/String;
    .param p9, "keywebpath"    # Ljava/lang/String;
    .param p10, "keypath"    # Ljava/lang/String;
    .param p11, "keydownloadsize"    # Ljava/lang/String;
    .param p12, "keyprogress"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 3538
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v26, "-1"

    .line 3539
    .local v26, "totalprogress":Ljava/lang/String;
    const/4 v4, 0x0

    .line 3540
    .local v4, "ischange":Z
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-direct {v0, v1}, Lcom/edutech/json/TreeData;->getSizeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 3542
    .local v25, "sizekey":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 3543
    .local v6, "webpathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 3544
    .local v27, "webpathList1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 3546
    .local v28, "webpathList2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 3547
    .local v20, "pathList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 3548
    .local v21, "pathList1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 3549
    .local v22, "pathList2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 3551
    .local v7, "progressList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 3552
    .local v9, "sizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 3553
    .local v23, "sizeList1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 3555
    .local v24, "sizeList2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 3558
    .local v8, "downloadsizeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const-string/jumbo v2, "webpath"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3557
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v27

    .line 3560
    const-string/jumbo v2, "reswebpath"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3559
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v28

    .line 3561
    const-string/jumbo v2, "path"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v21

    .line 3563
    const-string/jumbo v2, "respath"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3562
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v22

    .line 3564
    const-string/jumbo v2, "size"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v23

    .line 3566
    const-string/jumbo v2, "ressize"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3565
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v24

    .line 3567
    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3568
    move-object/from16 v0, v28

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3569
    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3570
    move-object/from16 v0, v20

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3571
    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3572
    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 3574
    move-object/from16 v0, p3

    move-object/from16 v1, p12

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v7

    .line 3576
    move-object/from16 v0, p3

    move-object/from16 v1, p11

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 3575
    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v2}, Lcom/edutech/json/TreeData;->getValueList(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v8

    .line 3577
    const-string/jumbo v2, "Test2:"

    const-string/jumbo v3, "1213"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3578
    if-eqz v6, :cond_3

    if-eqz v20, :cond_3

    if-eqz v7, :cond_3

    .line 3579
    if-eqz v8, :cond_3

    if-eqz v9, :cond_3

    .line 3581
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eqz v2, :cond_3

    .line 3582
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 3583
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 3584
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 3585
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 3586
    const-string/jumbo v2, "Test2:"

    const-string/jumbo v3, "1216"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3587
    const-string/jumbo v2, "Test2:"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static/range {p4 .. p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, ">>>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v0, p6

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3588
    const-string/jumbo v2, "Test2:"

    invoke-virtual {v6}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3589
    const-string/jumbo v2, "Test2:"

    invoke-virtual {v9}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3590
    const-string/jumbo v2, "Test2:"

    invoke-virtual {v8}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v5, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    move-wide/from16 v12, p6

    move-object/from16 v14, p8

    move-object/from16 v15, p11

    move-object/from16 v16, p12

    .line 3591
    invoke-virtual/range {v2 .. v16}, Lcom/edutech/json/TreeData;->updateDownloadsize(Lcom/edutech/json/Tree;ZLjava/util/HashMap;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    .line 3596
    if-eqz v4, :cond_2

    .line 3597
    const-string/jumbo v2, "WrongQuestionSet"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3598
    const-string/jumbo v2, "ZuoYeFuDao"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 3599
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v8, v9}, Lcom/edutech/json/TreeData;->updateTotalProgress(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v14

    .line 3602
    .end local v26    # "totalprogress":Ljava/lang/String;
    .local v14, "totalprogress":Ljava/lang/String;
    :goto_0
    if-nez v4, :cond_1

    .line 3603
    const-string/jumbo v2, "DaoXueBen"

    move-object/from16 v0, p8

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3604
    const-string/jumbo v2, "exams"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move v13, v4

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move-object/from16 v17, p5

    move-wide/from16 v18, p6

    .line 3606
    invoke-direct/range {v11 .. v19}, Lcom/edutech/json/TreeData;->updateExamsProgress(Lcom/edutech/json/Tree;ZLjava/lang/String;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v14

    .line 3616
    :cond_1
    :goto_1
    return-object v14

    .end local v14    # "totalprogress":Ljava/lang/String;
    .restart local v26    # "totalprogress":Ljava/lang/String;
    :cond_2
    move-object/from16 v14, v26

    .end local v26    # "totalprogress":Ljava/lang/String;
    .restart local v14    # "totalprogress":Ljava/lang/String;
    goto :goto_0

    .end local v14    # "totalprogress":Ljava/lang/String;
    .restart local v26    # "totalprogress":Ljava/lang/String;
    :cond_3
    move-object/from16 v14, v26

    .end local v26    # "totalprogress":Ljava/lang/String;
    .restart local v14    # "totalprogress":Ljava/lang/String;
    goto :goto_1
.end method
