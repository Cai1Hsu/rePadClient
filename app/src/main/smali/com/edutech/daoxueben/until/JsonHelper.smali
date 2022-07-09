.class public Lcom/edutech/daoxueben/until/JsonHelper;
.super Ljava/lang/Object;
.source "JsonHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static CreateDir()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1061
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1062
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1063
    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1064
    const-string/jumbo v3, "JSONFile"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1065
    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1061
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1068
    .local v0, "SQLMessagePath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1069
    .local v1, "sqlmessagepath":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1070
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 1072
    :cond_0
    return-object v0
.end method

.method public static declared-synchronized CreateFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "Json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1115
    const-class v4, Lcom/edutech/daoxueben/until/JsonHelper;

    monitor-enter v4

    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1117
    .local v2, "newFile":Ljava/io/File;
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1119
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_2
    const-string/jumbo v5, "UTF-8"

    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 1120
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1121
    const/4 v3, 0x1

    .line 1131
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :goto_0
    monitor-exit v4

    return v3

    .line 1122
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 1124
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1126
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v0

    .line 1128
    .local v0, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 1115
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v2    # "newFile":Ljava/io/File;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static bookUpdatePostCreateJson(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookUpdateInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1008
    .local p0, "updateinfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookUpdateInfo;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-nez v9, :cond_0

    .line 1010
    const-string/jumbo v9, ""

    .line 1040
    :goto_0
    return-object v9

    .line 1013
    :cond_0
    new-instance v4, Lorg/json/JSONStringer;

    invoke-direct {v4}, Lorg/json/JSONStringer;-><init>()V

    .line 1015
    .local v4, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 1016
    const-string/jumbo v9, "data"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 1017
    invoke-virtual {v4}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 1018
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lt v2, v9, :cond_1

    .line 1033
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 1034
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1040
    .end local v2    # "i":I
    :goto_2
    invoke-virtual {v4}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 1019
    .restart local v2    # "i":I
    :cond_1
    :try_start_1
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/daoxueben/until/BookUpdateInfo;

    .line 1020
    .local v0, "bookupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 1021
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getid()Ljava/lang/String;

    move-result-object v3

    .line 1022
    .local v3, "id":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->gettype()Ljava/lang/String;

    move-result-object v7

    .line 1023
    .local v7, "type":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getsource()Ljava/lang/String;

    move-result-object v5

    .line 1024
    .local v5, "source":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->getupdatetime()Ljava/lang/String;

    move-result-object v8

    .line 1025
    .local v8, "updatetime":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/daoxueben/until/BookUpdateInfo;->gettotal()I

    move-result v6

    .line 1026
    .local v6, "total":I
    const-string/jumbo v9, "id"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    invoke-virtual {v9, v3}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 1027
    const-string/jumbo v9, "type"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    invoke-virtual {v9, v7}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 1028
    const-string/jumbo v9, "source"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    invoke-virtual {v9, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 1029
    const-string/jumbo v9, "updatetime"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    invoke-virtual {v9, v8}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 1030
    const-string/jumbo v9, "total"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    int-to-long v10, v6

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 1031
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1018
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1036
    .end local v0    # "bookupdateinfo":Lcom/edutech/daoxueben/until/BookUpdateInfo;
    .end local v2    # "i":I
    .end local v3    # "id":Ljava/lang/String;
    .end local v5    # "source":Ljava/lang/String;
    .end local v6    # "total":I
    .end local v7    # "type":Ljava/lang/String;
    .end local v8    # "updatetime":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1038
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public static bookscreateJson(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/OldBooks;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 620
    .local p0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    new-instance v16, Lorg/json/JSONStringer;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONStringer;-><init>()V

    .line 622
    .local v16, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 623
    const-string/jumbo v17, "data"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 624
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 625
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-lt v15, v0, :cond_0

    .line 652
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 653
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 659
    .end local v15    # "i":I
    :goto_1
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v17

    return-object v17

    .line 626
    .restart local v15    # "i":I
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/daoxueben/until/OldBooks;

    .line 627
    .local v2, "book":Lcom/edutech/daoxueben/until/OldBooks;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 628
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v8

    .line 629
    .local v8, "bookid":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_name()Ljava/lang/String;

    move-result-object v9

    .line 631
    .local v9, "bookname":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getBookdownloadsize()J

    move-result-wide v6

    .line 632
    .local v6, "bookdownloadsize":J
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getBooksize()J

    move-result-wide v12

    .line 633
    .local v12, "booksize":J
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_path()Ljava/lang/String;

    move-result-object v10

    .line 636
    .local v10, "bookpath":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getProgress()Ljava/lang/String;

    move-result-object v11

    .line 637
    .local v11, "bookprogress":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_updatetime()Ljava/lang/String;

    move-result-object v5

    .line 638
    .local v5, "book_updatetime":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_isnew()I

    move-result v3

    .line 639
    .local v3, "book_isnew":I
    invoke-virtual {v2}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_total()I

    move-result v4

    .line 640
    .local v4, "book_total":I
    const-string/jumbo v17, "id"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 641
    const-string/jumbo v17, "name"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 642
    const-string/jumbo v17, "path"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 644
    const-string/jumbo v17, "downloadsize"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 645
    const-string/jumbo v17, "size"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12, v13}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 646
    const-string/jumbo v17, "progress"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 647
    const-string/jumbo v17, "updatetime"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 648
    const-string/jumbo v17, "isnew"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    int-to-long v0, v3

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 649
    const-string/jumbo v17, "total"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    int-to-long v0, v4

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 650
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 625
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 655
    .end local v2    # "book":Lcom/edutech/daoxueben/until/OldBooks;
    .end local v3    # "book_isnew":I
    .end local v4    # "book_total":I
    .end local v5    # "book_updatetime":Ljava/lang/String;
    .end local v6    # "bookdownloadsize":J
    .end local v8    # "bookid":Ljava/lang/String;
    .end local v9    # "bookname":Ljava/lang/String;
    .end local v10    # "bookpath":Ljava/lang/String;
    .end local v11    # "bookprogress":Ljava/lang/String;
    .end local v12    # "booksize":J
    .end local v15    # "i":I
    :catch_0
    move-exception v14

    .line 657
    .local v14, "e":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public static booksparserJson(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/OldBooks;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/OldBooks;",
            ">;"
        }
    .end annotation

    .prologue
    .line 346
    .local p0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    .line 348
    new-instance v15, Ljava/io/File;

    sget-object v22, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    move-object/from16 v0, v22

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 349
    .local v15, "bookjson":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_1

    .line 353
    :try_start_0
    invoke-virtual {v15}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    :cond_0
    :goto_0
    return-object p0

    .line 355
    :catch_0
    move-exception v16

    .line 357
    .local v16, "e":Ljava/io/IOException;
    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 362
    .end local v16    # "e":Ljava/io/IOException;
    :cond_1
    sget-object v22, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    invoke-static/range {v22 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 365
    .local v18, "json":Ljava/lang/String;
    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_0

    .line 372
    :try_start_1
    new-instance v20, Lorg/json/JSONTokener;

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 373
    .local v20, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/json/JSONObject;

    .line 374
    .local v19, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v22, "data"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 376
    .local v2, "array":Lorg/json/JSONArray;
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v22

    move/from16 v0, v17

    move/from16 v1, v22

    if-ge v0, v1, :cond_0

    .line 377
    move/from16 v0, v17

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 378
    .local v21, "object":Lorg/json/JSONObject;
    new-instance v3, Lcom/edutech/daoxueben/until/OldBooks;

    invoke-direct {v3}, Lcom/edutech/daoxueben/until/OldBooks;-><init>()V

    .line 379
    .local v3, "book":Lcom/edutech/daoxueben/until/OldBooks;
    const-string/jumbo v22, "id"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 380
    .local v6, "book_id":Ljava/lang/String;
    const-string/jumbo v22, "name"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 382
    .local v8, "book_name":Ljava/lang/String;
    const-string/jumbo v22, "downloadsize"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 383
    .local v4, "book_downloadsize":J
    const-string/jumbo v22, "size"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 384
    .local v12, "book_size":J
    const-string/jumbo v22, "path"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 386
    .local v9, "book_path":Ljava/lang/String;
    const-string/jumbo v22, "progress"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 387
    .local v10, "book_progress":Ljava/lang/String;
    const-string/jumbo v22, "updatetime"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 388
    .local v14, "book_updatetime":Ljava/lang/String;
    const-string/jumbo v22, "isnew"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v7

    .line 389
    .local v7, "book_isnew":I
    const-string/jumbo v22, "total"

    invoke-static/range {v21 .. v22}, Lcom/edutech/daoxueben/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v11

    .line 391
    .local v11, "book_total":I
    invoke-virtual {v3, v6}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 392
    invoke-virtual {v3, v8}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_name(Ljava/lang/String;)V

    .line 394
    invoke-virtual {v3, v4, v5}, Lcom/edutech/daoxueben/until/OldBooks;->setBookdownloadsize(J)V

    .line 395
    invoke-virtual {v3, v12, v13}, Lcom/edutech/daoxueben/until/OldBooks;->setBooksize(J)V

    .line 396
    invoke-virtual {v3, v9}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_path(Ljava/lang/String;)V

    .line 398
    invoke-virtual {v3, v10}, Lcom/edutech/daoxueben/until/OldBooks;->setProgress(Ljava/lang/String;)V

    .line 399
    invoke-virtual {v3, v14}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_updatetime(Ljava/lang/String;)V

    .line 400
    invoke-virtual {v3, v7}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_isnew(I)V

    .line 401
    invoke-virtual {v3, v11}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_total(I)V

    .line 402
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 376
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 404
    .end local v2    # "array":Lorg/json/JSONArray;
    .end local v3    # "book":Lcom/edutech/daoxueben/until/OldBooks;
    .end local v4    # "book_downloadsize":J
    .end local v6    # "book_id":Ljava/lang/String;
    .end local v7    # "book_isnew":I
    .end local v8    # "book_name":Ljava/lang/String;
    .end local v9    # "book_path":Ljava/lang/String;
    .end local v10    # "book_progress":Ljava/lang/String;
    .end local v11    # "book_total":I
    .end local v12    # "book_size":J
    .end local v14    # "book_updatetime":Ljava/lang/String;
    .end local v17    # "i":I
    .end local v19    # "jsonObject":Lorg/json/JSONObject;
    .end local v20    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v21    # "object":Lorg/json/JSONObject;
    :catch_1
    move-exception v16

    .line 406
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static createExamsInfo(ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 14
    .param p0, "jsupdate"    # I
    .param p1, "bookid"    # Ljava/lang/String;
    .param p2, "dxid"    # Ljava/lang/String;
    .param p4, "studentid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 817
    .local p3, "exams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lez v9, :cond_0

    const-string/jumbo v9, ""

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string/jumbo v9, ""

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 818
    const-string/jumbo v3, ""

    .line 819
    .local v3, "json":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONStringer;

    invoke-direct {v4}, Lorg/json/JSONStringer;-><init>()V

    .line 821
    .local v4, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 822
    const-string/jumbo v9, "studentid"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 823
    const-string/jumbo v9, "exams"

    invoke-virtual {v4, v9}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 824
    invoke-virtual {v4}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 825
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 845
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 846
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 854
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 857
    new-instance v9, Ljava/lang/StringBuilder;

    sget-object v10, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 858
    .local v7, "pathdir":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    sget-object v10, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ".json"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 859
    .local v6, "path":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 860
    .local v5, "outFile":Ljava/io/File;
    if-nez p0, :cond_2

    .line 862
    invoke-static {v7}, Lcom/edutech/daoxueben/until/FileInOutHelper;->fileIsExists(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 865
    invoke-static {v5}, Lcom/edutech/daoxueben/until/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 866
    invoke-static {v3, v6}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 881
    .end local v3    # "json":Ljava/lang/String;
    .end local v4    # "jsonStringer":Lorg/json/JSONStringer;
    .end local v5    # "outFile":Ljava/io/File;
    .end local v6    # "path":Ljava/lang/String;
    .end local v7    # "pathdir":Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 825
    .restart local v3    # "json":Ljava/lang/String;
    .restart local v4    # "jsonStringer":Lorg/json/JSONStringer;
    :cond_1
    :try_start_1
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/edutech/daoxueben/until/ExamsInfo;

    .line 827
    .local v8, "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 828
    const-string/jumbo v10, "id"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_id()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 829
    const-string/jumbo v10, "questionid"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getquestion_id()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 830
    const-string/jumbo v10, "body"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_body()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 831
    const-string/jumbo v10, "type"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_type()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 832
    const-string/jumbo v10, "answer"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_answer()I

    move-result v11

    int-to-long v12, v11

    invoke-virtual {v10, v12, v13}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 833
    const-string/jumbo v10, "result"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_result()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 834
    const-string/jumbo v10, "studentresult"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_studentresult()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 835
    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_webpath()Ljava/util/ArrayList;

    move-result-object v10

    const-string/jumbo v11, "webpath"

    invoke-static {v4, v10, v11}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 836
    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_path()Ljava/util/ArrayList;

    move-result-object v10

    const-string/jumbo v11, "path"

    invoke-static {v4, v10, v11}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 837
    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getDownloadsize()Ljava/util/ArrayList;

    move-result-object v10

    const-string/jumbo v11, "downloadsize"

    invoke-static {v4, v10, v11}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 838
    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getSize()Ljava/util/ArrayList;

    move-result-object v10

    const-string/jumbo v11, "sizes"

    invoke-static {v4, v10, v11}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 839
    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_progress()Ljava/util/ArrayList;

    move-result-object v10

    const-string/jumbo v11, "progress"

    invoke-static {v4, v10, v11}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 840
    const-string/jumbo v10, "size"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_totalsize()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 841
    const-string/jumbo v10, "updatetime"

    invoke-virtual {v4, v10}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v10

    invoke-virtual {v8}, Lcom/edutech/daoxueben/until/ExamsInfo;->getExams_updatetime()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 842
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 847
    .end local v8    # "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    :catch_0
    move-exception v2

    .line 849
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 850
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 852
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 869
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v5    # "outFile":Ljava/io/File;
    .restart local v6    # "path":Ljava/lang/String;
    .restart local v7    # "pathdir":Ljava/lang/String;
    :cond_2
    const/4 v9, 0x1

    if-ne p0, v9, :cond_0

    .line 871
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 873
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 875
    :cond_3
    invoke-static {v5}, Lcom/edutech/daoxueben/until/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 876
    invoke-static {v3, v6}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_2
.end method

.method public static getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1165
    const/4 v0, 0x0

    .line 1166
    .local v0, "Name":Z
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1170
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1181
    :goto_0
    return v0

    .line 1172
    :catch_0
    move-exception v1

    .line 1174
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 1175
    const/4 v0, 0x0

    .line 1177
    goto :goto_0

    .line 1178
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static declared-synchronized getFileString(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 1081
    const-class v7, Lcom/edutech/daoxueben/until/JsonHelper;

    monitor-enter v7

    :try_start_0
    const-string/jumbo v5, ""

    .line 1082
    .local v5, "res":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1083
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v6

    if-nez v6, :cond_0

    move-object v6, v5

    .line 1104
    :goto_0
    monitor-exit v7

    return-object v6

    .line 1086
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 1090
    .local v3, "fin":Ljava/io/FileInputStream;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    move-result v4

    .line 1091
    .local v4, "length":I
    new-array v0, v4, [B

    .line 1092
    .local v0, "buffer":[B
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 1093
    const-string/jumbo v6, "UTF-8"

    invoke-static {v0, v6}, Lorg/apache/http/util/EncodingUtils;->getString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1094
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1099
    .end local v0    # "buffer":[B
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .end local v4    # "length":I
    :goto_1
    if-nez v5, :cond_1

    .line 1101
    :try_start_2
    const-string/jumbo v6, ""

    goto :goto_0

    .line 1095
    :catch_0
    move-exception v1

    .line 1097
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 1081
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "file":Ljava/io/File;
    .end local v5    # "res":Ljava/lang/String;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .restart local v2    # "file":Ljava/io/File;
    .restart local v5    # "res":Ljava/lang/String;
    :cond_1
    move-object v6, v5

    .line 1104
    goto :goto_0
.end method

.method public static getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1215
    const/4 v0, 0x0

    .line 1216
    .local v0, "Name":I
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1220
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 1231
    :goto_0
    return v0

    .line 1222
    :catch_0
    move-exception v1

    .line 1224
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 1225
    const/4 v0, 0x0

    .line 1227
    goto :goto_0

    .line 1228
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .param p0, "objectString"    # Ljava/lang/String;
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
    .line 1255
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1260
    .local v3, "temparray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 1263
    .local v1, "jsonarray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 1274
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :goto_1
    return-object v3

    .line 1265
    .restart local v1    # "jsonarray":Lorg/json/JSONArray;
    .restart local v2    # "k":I
    :cond_0
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1263
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1269
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :catch_0
    move-exception v0

    .line 1271
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static getLongJsonArray(ILjava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p0, "webpathsize"    # I
    .param p1, "objectString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1292
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1295
    .local v3, "temparray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    const-string/jumbo v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1298
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 1301
    .local v1, "jsonarray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v2, v4, :cond_1

    .line 1330
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :cond_0
    :goto_1
    return-object v3

    .line 1303
    .restart local v1    # "jsonarray":Lorg/json/JSONArray;
    .restart local v2    # "k":I
    :cond_1
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1301
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1307
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :catch_0
    move-exception v0

    .line 1309
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 1317
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    if-lez p0, :cond_0

    .line 1320
    const/4 v2, 0x0

    .restart local v2    # "k":I
    :goto_2
    if-ge v2, p0, :cond_0

    .line 1322
    const-wide/16 v4, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1320
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method private static getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;
    .locals 4
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1190
    const-wide/16 v0, 0x0

    .line 1191
    .local v0, "Name":J
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1195
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 1206
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    return-object v3

    .line 1197
    :catch_0
    move-exception v2

    .line 1199
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 1200
    const-wide/16 v0, 0x0

    .line 1202
    goto :goto_0

    .line 1203
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public static getNeedDownloadList(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 16
    .param p1, "downloadjson"    # Ljava/lang/String;
    .param p2, "studentid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 668
    .local p0, "peerbook":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 669
    .local v5, "downloadjsonlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 670
    .local v10, "temp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p1

    invoke-static {v0, v5, v10}, Lcom/edutech/daoxueben/until/JsonHelper;->parsedownloadjson(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 673
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 674
    .local v6, "downloadjsonlistsize":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-lt v7, v6, :cond_1

    .line 741
    :cond_0
    return-object p0

    .line 675
    :cond_1
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 676
    .local v4, "dipbook":I
    const-string/jumbo v2, ""

    .line 677
    .local v2, "bookid":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 678
    .local v3, "chapterid":Ljava/lang/String;
    const-string/jumbo v9, ""

    .line 679
    .local v9, "sectionid":Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    if-lt v8, v4, :cond_4

    .line 693
    const-string/jumbo v11, ""

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    const-string/jumbo v11, "-2"

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 698
    const-string/jumbo v11, ""

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 701
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_2
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_8

    .line 674
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 681
    :cond_4
    if-nez v8, :cond_6

    .line 683
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "bookid":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 679
    .restart local v2    # "bookid":Ljava/lang/String;
    :cond_5
    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 684
    :cond_6
    const/4 v11, 0x1

    if-ne v8, v11, :cond_7

    .line 686
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "chapterid":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 687
    .restart local v3    # "chapterid":Ljava/lang/String;
    goto :goto_3

    :cond_7
    const/4 v11, 0x2

    if-ne v8, v11, :cond_5

    .line 689
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "sectionid":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .restart local v9    # "sectionid":Ljava/lang/String;
    goto :goto_3

    .line 701
    :cond_8
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/daoxueben/until/BookInfo;

    .line 702
    .local v1, "book":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 704
    const/4 v12, 0x1

    invoke-virtual {v1, v12}, Lcom/edutech/daoxueben/until/BookInfo;->setIsdown(Z)V

    .line 705
    const/4 v12, 0x1

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_dxid()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-static {v12, v13, v14, v15, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->createExamsInfo(ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_2

    .line 711
    .end local v1    # "book":Lcom/edutech/daoxueben/until/BookInfo;
    :cond_9
    const-string/jumbo v11, ""

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 714
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_a
    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/daoxueben/until/BookInfo;

    .line 715
    .restart local v1    # "book":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getChapter_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 717
    const/4 v12, 0x1

    invoke-virtual {v1, v12}, Lcom/edutech/daoxueben/until/BookInfo;->setIsdown(Z)V

    .line 718
    const/4 v12, 0x1

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_dxid()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-static {v12, v13, v14, v15, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->createExamsInfo(ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_4

    .line 727
    .end local v1    # "book":Lcom/edutech/daoxueben/until/BookInfo;
    :cond_b
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_c
    :goto_5
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/daoxueben/until/BookInfo;

    .line 728
    .restart local v1    # "book":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getChapter_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_c

    .line 730
    const/4 v12, 0x1

    invoke-virtual {v1, v12}, Lcom/edutech/daoxueben/until/BookInfo;->setIsdown(Z)V

    .line 731
    const/4 v12, 0x1

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_dxid()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-static {v12, v13, v14, v15, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->createExamsInfo(ILjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_5
.end method

.method public static getNewBooInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/daoxueben/until/OldBooks;
    .locals 1
    .param p0, "id"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 1048
    new-instance v0, Lcom/edutech/daoxueben/until/OldBooks;

    invoke-direct {v0}, Lcom/edutech/daoxueben/until/OldBooks;-><init>()V

    .line 1050
    .local v0, "book":Lcom/edutech/daoxueben/until/OldBooks;
    invoke-virtual {v0, p0}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 1051
    invoke-virtual {v0, p1}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 1052
    invoke-virtual {v0, p2}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 1053
    return-object v0
.end method

.method public static getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1140
    const-string/jumbo v0, ""

    .line 1141
    .local v0, "Name":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1145
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1156
    :goto_0
    return-object v0

    .line 1147
    :catch_0
    move-exception v1

    .line 1149
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 1150
    const-string/jumbo v0, ""

    .line 1152
    goto :goto_0

    .line 1153
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static isJsonArray(Ljava/lang/String;)Z
    .locals 3
    .param p0, "objectString"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 1235
    if-eqz p0, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1247
    :cond_0
    :goto_0
    return v1

    .line 1239
    :cond_1
    const-string/jumbo v2, "{"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1241
    .local v0, "start":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 1243
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static parseExamsInfo(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 26
    .param p0, "bookid"    # Ljava/lang/String;
    .param p1, "dxid"    # Ljava/lang/String;
    .param p3, "json"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/ExamsInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 894
    .local p2, "exams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    :try_start_0
    new-instance v14, Lorg/json/JSONArray;

    move-object/from16 v0, p3

    invoke-direct {v14, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 896
    .local v14, "examsarray":Lorg/json/JSONArray;
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v25

    move/from16 v0, v17

    move/from16 v1, v25

    if-lt v0, v1, :cond_0

    .line 960
    .end local v14    # "examsarray":Lorg/json/JSONArray;
    .end local v17    # "i":I
    :goto_1
    return-object p2

    .line 898
    .restart local v14    # "examsarray":Lorg/json/JSONArray;
    .restart local v17    # "i":I
    :cond_0
    move/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 899
    .local v16, "examsobject":Lorg/json/JSONObject;
    const-string/jumbo v25, "id"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 900
    .local v6, "exams_id":Ljava/lang/String;
    const-string/jumbo v25, "questionid"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 901
    .local v20, "question_id":Ljava/lang/String;
    const-string/jumbo v25, "body"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 902
    .local v5, "exams_body":Ljava/lang/String;
    const-string/jumbo v25, "type"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 903
    .local v11, "exams_type":Ljava/lang/String;
    const-string/jumbo v25, "answer"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    .line 904
    .local v4, "exams_answer":I
    const-string/jumbo v25, "result"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 905
    .local v9, "exams_result":Ljava/lang/String;
    const-string/jumbo v25, "studentresult"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 906
    .local v10, "exams_studentresult":Ljava/lang/String;
    const-string/jumbo v25, "webpath"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 907
    .local v13, "exams_webpath":Ljava/lang/String;
    const-string/jumbo v25, "path"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 908
    .local v7, "exams_path":Ljava/lang/String;
    const-string/jumbo v25, "downloadsize"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 909
    .local v2, "downloadsize":Ljava/lang/String;
    const-string/jumbo v25, "size"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    .line 910
    .local v22, "totalsize":J
    const-string/jumbo v25, "sizes"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 911
    .local v21, "size":Ljava/lang/String;
    const-string/jumbo v25, "progress"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 912
    .local v8, "exams_progress":Ljava/lang/String;
    const-string/jumbo v25, "updatetime"

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 914
    .local v12, "exams_updatetime":Ljava/lang/String;
    new-instance v15, Lcom/edutech/daoxueben/until/ExamsInfo;

    invoke-direct {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;-><init>()V

    .line 915
    .local v15, "examsinfo":Lcom/edutech/daoxueben/until/ExamsInfo;
    invoke-virtual {v15, v6}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_id(Ljava/lang/String;)V

    .line 916
    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setquestion_id(Ljava/lang/String;)V

    .line 917
    invoke-virtual {v15, v5}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_body(Ljava/lang/String;)V

    .line 918
    invoke-virtual {v15, v11}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_type(Ljava/lang/String;)V

    .line 919
    invoke-virtual {v15, v4}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_answer(I)V

    .line 920
    invoke-virtual {v15, v9}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_result(Ljava/lang/String;)V

    .line 921
    move-wide/from16 v0, v22

    invoke-virtual {v15, v0, v1}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_totalsize(J)V

    .line 922
    invoke-virtual {v15, v10}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_studentresult(Ljava/lang/String;)V

    .line 923
    invoke-static {v13}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_webpath(Ljava/util/ArrayList;)V

    .line 924
    invoke-static {v7}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_path(Ljava/util/ArrayList;)V

    .line 925
    invoke-virtual {v15, v12}, Lcom/edutech/daoxueben/until/ExamsInfo;->setExams_updatetime(Ljava/lang/String;)V

    .line 927
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_webpath()Ljava/util/ArrayList;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v24

    .line 928
    .local v24, "webpathsize":I
    move/from16 v0, v24

    invoke-static {v0, v2}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongJsonArray(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setDownloadsize(Ljava/util/ArrayList;)V

    .line 929
    move/from16 v0, v24

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongJsonArray(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setSize(Ljava/util/ArrayList;)V

    .line 930
    const-string/jumbo v25, ""

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v25

    if-nez v25, :cond_2

    .line 932
    invoke-static {v8}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_progress(Ljava/util/ArrayList;)V

    .line 949
    :cond_1
    :goto_2
    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 896
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_0

    .line 938
    :cond_2
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_webpath()Ljava/util/ArrayList;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v25

    if-lez v25, :cond_1

    .line 940
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 941
    .local v19, "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v18, 0x0

    .local v18, "k":I
    :goto_3
    move/from16 v0, v18

    move/from16 v1, v24

    if-lt v0, v1, :cond_3

    .line 945
    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lcom/edutech/daoxueben/until/ExamsInfo;->setexams_progress(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 951
    .end local v2    # "downloadsize":Ljava/lang/String;
    .end local v4    # "exams_answer":I
    .end local v5    # "exams_body":Ljava/lang/String;
    .end local v6    # "exams_id":Ljava/lang/String;
    .end local v7    # "exams_path":Ljava/lang/String;
    .end local v8    # "exams_progress":Ljava/lang/String;
    .end local v9    # "exams_result":Ljava/lang/String;
    .end local v10    # "exams_studentresult":Ljava/lang/String;
    .end local v11    # "exams_type":Ljava/lang/String;
    .end local v12    # "exams_updatetime":Ljava/lang/String;
    .end local v13    # "exams_webpath":Ljava/lang/String;
    .end local v14    # "examsarray":Lorg/json/JSONArray;
    .end local v15    # "examsinfo":Lcom/edutech/daoxueben/until/ExamsInfo;
    .end local v16    # "examsobject":Lorg/json/JSONObject;
    .end local v17    # "i":I
    .end local v18    # "k":I
    .end local v19    # "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "question_id":Ljava/lang/String;
    .end local v21    # "size":Ljava/lang/String;
    .end local v22    # "totalsize":J
    .end local v24    # "webpathsize":I
    :catch_0
    move-exception v3

    .line 953
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 943
    .end local v3    # "e":Lorg/json/JSONException;
    .restart local v2    # "downloadsize":Ljava/lang/String;
    .restart local v4    # "exams_answer":I
    .restart local v5    # "exams_body":Ljava/lang/String;
    .restart local v6    # "exams_id":Ljava/lang/String;
    .restart local v7    # "exams_path":Ljava/lang/String;
    .restart local v8    # "exams_progress":Ljava/lang/String;
    .restart local v9    # "exams_result":Ljava/lang/String;
    .restart local v10    # "exams_studentresult":Ljava/lang/String;
    .restart local v11    # "exams_type":Ljava/lang/String;
    .restart local v12    # "exams_updatetime":Ljava/lang/String;
    .restart local v13    # "exams_webpath":Ljava/lang/String;
    .restart local v14    # "examsarray":Lorg/json/JSONArray;
    .restart local v15    # "examsinfo":Lcom/edutech/daoxueben/until/ExamsInfo;
    .restart local v16    # "examsobject":Lorg/json/JSONObject;
    .restart local v17    # "i":I
    .restart local v18    # "k":I
    .restart local v19    # "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v20    # "question_id":Ljava/lang/String;
    .restart local v21    # "size":Ljava/lang/String;
    .restart local v22    # "totalsize":J
    .restart local v24    # "webpathsize":I
    :cond_3
    :try_start_1
    const-string/jumbo v25, "0"

    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 941
    add-int/lit8 v18, v18, 0x1

    goto :goto_3

    .line 955
    .end local v2    # "downloadsize":Ljava/lang/String;
    .end local v4    # "exams_answer":I
    .end local v5    # "exams_body":Ljava/lang/String;
    .end local v6    # "exams_id":Ljava/lang/String;
    .end local v7    # "exams_path":Ljava/lang/String;
    .end local v8    # "exams_progress":Ljava/lang/String;
    .end local v9    # "exams_result":Ljava/lang/String;
    .end local v10    # "exams_studentresult":Ljava/lang/String;
    .end local v11    # "exams_type":Ljava/lang/String;
    .end local v12    # "exams_updatetime":Ljava/lang/String;
    .end local v13    # "exams_webpath":Ljava/lang/String;
    .end local v14    # "examsarray":Lorg/json/JSONArray;
    .end local v15    # "examsinfo":Lcom/edutech/daoxueben/until/ExamsInfo;
    .end local v16    # "examsobject":Lorg/json/JSONObject;
    .end local v17    # "i":I
    .end local v18    # "k":I
    .end local v19    # "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "question_id":Ljava/lang/String;
    .end local v21    # "size":Ljava/lang/String;
    .end local v22    # "totalsize":J
    .end local v24    # "webpathsize":I
    :catch_1
    move-exception v3

    .line 957
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public static parseHttpPostReturnJson(Ljava/lang/String;)I
    .locals 8
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 970
    const-string/jumbo v7, ""

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 995
    :cond_0
    :goto_0
    return v6

    .line 975
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 976
    .local v4, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 977
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v7, "status"

    invoke-static {v3, v7}, Lcom/edutech/daoxueben/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v5

    .line 978
    .local v5, "status":Z
    const-string/jumbo v7, "errorNum"

    invoke-static {v3, v7}, Lcom/edutech/daoxueben/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v2

    .line 979
    .local v2, "errorNum":I
    const-string/jumbo v7, "errorInfo"

    invoke-static {v3, v7}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 981
    .local v1, "errorInfo":Ljava/lang/String;
    if-eqz v5, :cond_0

    if-nez v2, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v7

    if-eqz v7, :cond_0

    .line 983
    const/4 v6, 0x1

    goto :goto_0

    .line 988
    .end local v1    # "errorInfo":Ljava/lang/String;
    .end local v2    # "errorNum":I
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v5    # "status":Z
    :catch_0
    move-exception v0

    .line 990
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 992
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 994
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static parsedownloadjson(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 11
    .param p0, "downloadjson"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 746
    .local p1, "downloadjsonlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local p2, "temp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 747
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v9, "id"

    invoke-static {v5, v9}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 748
    .local v3, "id":Ljava/lang/String;
    const-string/jumbo v9, "items"

    invoke-static {v5, v9}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 749
    .local v4, "items":Ljava/lang/String;
    const-string/jumbo v9, ""

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 751
    const-string/jumbo v9, "items"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 753
    .local v0, "array":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-nez v9, :cond_3

    .line 755
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 758
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 760
    .local v8, "temp1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_2

    .line 764
    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 766
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-ltz v9, :cond_0

    .line 767
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p2, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 772
    .end local v8    # "temp1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v2, v9, :cond_4

    .line 809
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "items":Ljava/lang/String;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    :cond_1
    :goto_3
    return-void

    .line 760
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v3    # "id":Ljava/lang/String;
    .restart local v4    # "items":Ljava/lang/String;
    .restart local v5    # "jsonObject":Lorg/json/JSONObject;
    .restart local v8    # "temp1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 762
    .local v7, "s":Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 801
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "items":Ljava/lang/String;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "s":Ljava/lang/String;
    .end local v8    # "temp1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 803
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_3

    .line 769
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v3    # "id":Ljava/lang/String;
    .restart local v4    # "items":Ljava/lang/String;
    .restart local v5    # "jsonObject":Lorg/json/JSONObject;
    :cond_3
    :try_start_1
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 804
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "items":Ljava/lang/String;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    :catch_1
    move-exception v1

    .line 806
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 773
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v2    # "i":I
    .restart local v3    # "id":Ljava/lang/String;
    .restart local v4    # "items":Ljava/lang/String;
    .restart local v5    # "jsonObject":Lorg/json/JSONObject;
    :cond_4
    :try_start_2
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 774
    .local v6, "object":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, p1, p2}, Lcom/edutech/daoxueben/until/JsonHelper;->parsedownloadjson(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 775
    add-int/lit8 v9, v2, 0x1

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ne v9, v10, :cond_5

    .line 776
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p2, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 772
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 782
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v6    # "object":Lorg/json/JSONObject;
    :cond_6
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 785
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 787
    .restart local v8    # "temp1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_7

    .line 791
    invoke-virtual {p1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 793
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    if-ltz v9, :cond_1

    .line 794
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p2, v9}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3

    .line 787
    :cond_7
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 789
    .restart local v7    # "s":Ljava/lang/String;
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4
.end method

.method public static peerbookcreateJson(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/daoxueben/until/BookInfo;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 420
    .local p0, "book":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    const-string/jumbo v4, ""

    .line 421
    .local v4, "Book_id":Ljava/lang/String;
    const-string/jumbo v5, ""

    .line 423
    .local v5, "Book_name":Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 424
    .local v2, "Book_downloadsize":J
    const-wide/16 v6, 0x0

    .line 425
    .local v6, "Book_size":J
    const-string/jumbo v8, ""

    .line 426
    .local v8, "Book_updatetime":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-nez v16, :cond_0

    .line 428
    const-string/jumbo v16, ""

    .line 611
    :goto_0
    return-object v16

    .line 431
    :cond_0
    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_id()Ljava/lang/String;

    move-result-object v4

    .line 432
    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_name()Ljava/lang/String;

    move-result-object v5

    .line 434
    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getBookdownloadsize()J

    move-result-wide v2

    .line 435
    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getBooksize()J

    move-result-wide v6

    .line 436
    const/16 v16, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getBook_updatetime()Ljava/lang/String;

    move-result-object v8

    .line 438
    new-instance v14, Lorg/json/JSONStringer;

    invoke-direct {v14}, Lorg/json/JSONStringer;-><init>()V

    .line 440
    .local v14, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 441
    const-string/jumbo v16, "id"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 442
    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 444
    const-string/jumbo v16, "downloadsize"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 445
    const-string/jumbo v16, "size"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 446
    const-string/jumbo v16, "updatetime"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 447
    const-string/jumbo v16, "data"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 448
    invoke-virtual {v14}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 449
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-lt v13, v0, :cond_1

    .line 604
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 605
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 611
    .end local v13    # "i":I
    :goto_2
    invoke-virtual {v14}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_0

    .line 450
    .restart local v13    # "i":I
    :cond_1
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/edutech/daoxueben/until/BookInfo;

    .line 451
    .local v9, "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 452
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getChapter_id()Ljava/lang/String;

    move-result-object v11

    .line 453
    .local v11, "first_chapter_id":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getchapter_name()Ljava/lang/String;

    move-result-object v12

    .line 454
    .local v12, "first_chapter_name":Ljava/lang/String;
    const-string/jumbo v16, "id"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 455
    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 456
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->isParent()Z

    move-result v16

    if-nez v16, :cond_2

    .line 457
    add-int/lit8 v13, v13, 0x1

    .line 458
    const-string/jumbo v16, "children"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 459
    invoke-virtual {v14}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 460
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 602
    :goto_3
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 607
    .end local v9    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .end local v11    # "first_chapter_id":Ljava/lang/String;
    .end local v12    # "first_chapter_name":Ljava/lang/String;
    .end local v13    # "i":I
    :catch_0
    move-exception v10

    .line 609
    .local v10, "e":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 466
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v9    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .restart local v11    # "first_chapter_id":Ljava/lang/String;
    .restart local v12    # "first_chapter_name":Ljava/lang/String;
    .restart local v13    # "i":I
    :cond_2
    :try_start_2
    const-string/jumbo v16, "children"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 467
    invoke-virtual {v14}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 474
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 475
    const-string/jumbo v16, "id"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 476
    const-string/jumbo v16, "dxid"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_dxid()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 477
    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_name()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 494
    const-string/jumbo v16, "examsprogress"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getexams_progress()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 495
    const-string/jumbo v16, "exams"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 496
    invoke-virtual {v14}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 497
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-nez v16, :cond_4

    .line 499
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 525
    :goto_4
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "webpath"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 526
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_path()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "path"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 529
    const-string/jumbo v16, "tag"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_tag()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 530
    const-string/jumbo v16, "updatetime"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v16

    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_updatetime()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 532
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_progress()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "progress"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 534
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getDownloadsize()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "downloadsize"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 535
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getSize()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "size"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 536
    const-string/jumbo v16, "isdown"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->isIsdown()Z

    move-result v16

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 537
    const-string/jumbo v16, "isnew"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->isIsnew()Z

    move-result v16

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 538
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    .line 539
    add-int/lit8 v13, v13, 0x1

    .line 540
    :goto_5
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    if-ge v13, v0, :cond_3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getchapter_name()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_6

    .line 597
    :cond_3
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    goto/16 :goto_3

    .line 503
    :cond_4
    invoke-virtual {v9}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_6
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-nez v17, :cond_5

    .line 523
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    goto/16 :goto_4

    .line 503
    :cond_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/edutech/daoxueben/until/ExamsInfo;

    .line 505
    .local v15, "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 506
    const-string/jumbo v17, "id"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_id()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 507
    const-string/jumbo v17, "questionid"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getquestion_id()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 508
    const-string/jumbo v17, "body"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_body()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 509
    const-string/jumbo v17, "type"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_type()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 510
    const-string/jumbo v17, "answer"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_answer()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 511
    const-string/jumbo v17, "result"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_result()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 512
    const-string/jumbo v17, "studentresult"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_studentresult()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 513
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_webpath()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "webpath"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 514
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_path()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "path"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 515
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getDownloadsize()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "downloadsize"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 516
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getSize()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "sizes"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 517
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_progress()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "progress"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 518
    const-string/jumbo v17, "size"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_totalsize()J

    move-result-wide v18

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 519
    const-string/jumbo v17, "updatetime"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getExams_updatetime()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 520
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    goto/16 :goto_6

    .line 542
    .end local v15    # "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    :cond_6
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 543
    const-string/jumbo v16, "id"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_id()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 544
    const-string/jumbo v16, "dxid"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_dxid()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 545
    const-string/jumbo v16, "name"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_name()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 547
    const-string/jumbo v16, "examsprogress"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getexams_progress()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 549
    const-string/jumbo v16, "exams"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 550
    invoke-virtual {v14}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 551
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v16

    if-nez v16, :cond_7

    .line 553
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 580
    :goto_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "webpath"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 581
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_path()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "path"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 584
    const-string/jumbo v16, "tag"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_tag()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 585
    const-string/jumbo v16, "updatetime"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getsection_updatetime()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 586
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_progress()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "progress"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 588
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getDownloadsize()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "downloadsize"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 589
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSize()Ljava/util/ArrayList;

    move-result-object v16

    const-string/jumbo v17, "size"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 590
    const-string/jumbo v16, "isdown"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->isIsdown()Z

    move-result v16

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 591
    const-string/jumbo v16, "isnew"

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->isIsnew()Z

    move-result v16

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONStringer;

    .line 593
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;

    .line 594
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_5

    .line 557
    :cond_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_8
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-nez v17, :cond_8

    .line 578
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    goto/16 :goto_7

    .line 557
    :cond_8
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/edutech/daoxueben/until/ExamsInfo;

    .line 559
    .restart local v15    # "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    invoke-virtual {v14}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 560
    const-string/jumbo v17, "id"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_id()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 561
    const-string/jumbo v17, "questionid"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getquestion_id()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 562
    const-string/jumbo v17, "body"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_body()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 563
    const-string/jumbo v17, "type"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_type()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 564
    const-string/jumbo v17, "answer"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_answer()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 565
    const-string/jumbo v17, "result"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_result()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 566
    const-string/jumbo v17, "studentresult"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_studentresult()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 567
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_webpath()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "webpath"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 568
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_path()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "path"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 569
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getDownloadsize()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "downloadsize"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 570
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getSize()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "sizes"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 572
    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_progress()Ljava/util/ArrayList;

    move-result-object v17

    const-string/jumbo v18, "progress"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v14, v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 573
    const-string/jumbo v17, "size"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_totalsize()J

    move-result-wide v18

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 574
    const-string/jumbo v17, "updatetime"

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    invoke-virtual {v15}, Lcom/edutech/daoxueben/until/ExamsInfo;->getExams_updatetime()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 575
    invoke-virtual {v14}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_8
.end method

.method public static peerbookparserJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 62
    .param p1, "json"    # Ljava/lang/String;
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
    .line 34
    .local p0, "book":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/BookInfo;>;"
    const-string/jumbo v10, ""

    .line 35
    .local v10, "book_id":Ljava/lang/String;
    const-string/jumbo v11, ""

    .line 37
    .local v11, "book_name":Ljava/lang/String;
    const-wide/16 v8, 0x0

    .line 38
    .local v8, "book_downloadsize":J
    const-wide/16 v12, 0x0

    .line 39
    .local v12, "book_size":J
    const-string/jumbo v15, ""

    .line 40
    .local v15, "book_updatetime":Ljava/lang/String;
    const/4 v14, 0x0

    .line 41
    .local v14, "book_total":I
    const/16 v30, 0x0

    .line 42
    .local v30, "isnew_count":I
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    .line 47
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-eqz v58, :cond_1

    .line 332
    :cond_0
    :goto_0
    return-object p0

    .line 54
    :cond_1
    :try_start_0
    new-instance v36, Lorg/json/JSONTokener;

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 55
    .local v36, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual/range {v36 .. v36}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/json/JSONObject;

    .line 56
    .local v33, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v58, "id"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 57
    const-string/jumbo v58, "name"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 59
    const-string/jumbo v58, "downloadsize"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 60
    const-string/jumbo v58, "size"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 61
    const-string/jumbo v58, "updatetime"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 66
    const-string/jumbo v58, "data"

    move-object/from16 v0, v33

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 69
    .local v6, "array":Lorg/json/JSONArray;
    const/16 v27, 0x0

    .local v27, "i":I
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v58

    move/from16 v0, v27

    move/from16 v1, v58

    if-lt v0, v1, :cond_3

    .line 249
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-nez v58, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v58

    if-lez v58, :cond_0

    .line 258
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 259
    .local v17, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    new-instance v40, Lcom/edutech/daoxueben/until/OldBooks;

    invoke-direct/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;-><init>()V

    .line 260
    .local v40, "newbook":Lcom/edutech/daoxueben/until/OldBooks;
    move-object/from16 v0, v40

    invoke-virtual {v0, v10}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 261
    move-object/from16 v0, v40

    invoke-virtual {v0, v11}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_name(Ljava/lang/String;)V

    .line 263
    move-object/from16 v0, v40

    invoke-virtual {v0, v8, v9}, Lcom/edutech/daoxueben/until/OldBooks;->setBookdownloadsize(J)V

    .line 264
    const-wide/16 v58, 0x0

    move-object/from16 v0, v40

    move-wide/from16 v1, v58

    invoke-virtual {v0, v1, v2}, Lcom/edutech/daoxueben/until/OldBooks;->setBooksize(J)V

    .line 265
    move-object/from16 v0, v40

    invoke-virtual {v0, v14}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_total(I)V

    .line 266
    const-string/jumbo v58, "100"

    move-object/from16 v0, v40

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setProgress(Ljava/lang/String;)V

    .line 267
    new-instance v58, Ljava/lang/StringBuilder;

    const-string/jumbo v59, "../offlinedownload/"

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    const-string/jumbo v59, "/"

    invoke-virtual/range {v58 .. v59}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v58

    move-object/from16 v0, v40

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_path(Ljava/lang/String;)V

    .line 268
    move-object/from16 v0, v40

    invoke-virtual {v0, v15}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_updatetime(Ljava/lang/String;)V

    .line 269
    const/16 v58, 0x0

    move-object/from16 v0, v40

    move/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_isnew(I)V

    .line 270
    invoke-static/range {v17 .. v17}, Lcom/edutech/daoxueben/until/JsonHelper;->booksparserJson(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v17

    .line 271
    const/16 v31, 0x1

    .line 272
    .local v31, "isnewbook":Z
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v58

    :cond_2
    :goto_2
    invoke-interface/range {v58 .. v58}, Ljava/util/Iterator;->hasNext()Z

    move-result v59

    if-nez v59, :cond_f

    .line 295
    if-eqz v31, :cond_11

    .line 297
    move-object/from16 v0, v17

    move-object/from16 v1, v40

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    invoke-static/range {v17 .. v17}, Lcom/edutech/daoxueben/until/JsonHelper;->bookscreateJson(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    .line 300
    .local v5, "Newjson":Ljava/lang/String;
    sget-object v58, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    move-object/from16 v0, v58

    invoke-static {v5, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v58

    if-eqz v58, :cond_0

    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-nez v58, :cond_0

    .line 302
    new-instance v58, Ljava/lang/StringBuilder;

    sget-object v59, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    invoke-static/range {v59 .. v59}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v59

    invoke-direct/range {v58 .. v59}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 303
    .local v4, "NewBookPath":Ljava/lang/String;
    new-instance v43, Ljava/io/File;

    move-object/from16 v0, v43

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 304
    .local v43, "offlinedownloaddir":Ljava/io/File;
    invoke-virtual/range {v43 .. v43}, Ljava/io/File;->exists()Z

    move-result v58

    if-nez v58, :cond_0

    .line 305
    invoke-virtual/range {v43 .. v43}, Ljava/io/File;->mkdirs()Z

    goto/16 :goto_0

    .line 70
    .end local v4    # "NewBookPath":Ljava/lang/String;
    .end local v5    # "Newjson":Ljava/lang/String;
    .end local v17    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    .end local v31    # "isnewbook":Z
    .end local v40    # "newbook":Lcom/edutech/daoxueben/until/OldBooks;
    .end local v43    # "offlinedownloaddir":Ljava/io/File;
    :cond_3
    :try_start_1
    move/from16 v0, v27

    invoke-virtual {v6, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v41

    .line 71
    .local v41, "object":Lorg/json/JSONObject;
    new-instance v37, Lorg/json/JSONTokener;

    invoke-virtual/range {v41 .. v41}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v58

    move-object/from16 v0, v37

    move-object/from16 v1, v58

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 72
    .local v37, "jsonTokener1":Lorg/json/JSONTokener;
    invoke-virtual/range {v37 .. v37}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Lorg/json/JSONObject;

    .line 73
    .local v34, "jsonObject1":Lorg/json/JSONObject;
    const-string/jumbo v58, "id"

    move-object/from16 v0, v34

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 74
    .local v18, "chapterid":Ljava/lang/String;
    const-string/jumbo v58, "name"

    move-object/from16 v0, v34

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 76
    .local v19, "chaptername":Ljava/lang/String;
    const-string/jumbo v58, "children"

    move-object/from16 v0, v34

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 78
    .local v20, "childjson":Ljava/lang/String;
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-eqz v58, :cond_5

    .line 80
    new-instance v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-direct/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;-><init>()V

    .line 81
    .local v16, "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_id(Ljava/lang/String;)V

    .line 82
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_name(Ljava/lang/String;)V

    .line 84
    move-object/from16 v0, v16

    invoke-virtual {v0, v8, v9}, Lcom/edutech/daoxueben/until/BookInfo;->setBookdownloadsize(J)V

    .line 85
    move-object/from16 v0, v16

    invoke-virtual {v0, v12, v13}, Lcom/edutech/daoxueben/until/BookInfo;->setBooksize(J)V

    .line 86
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_updatetime(Ljava/lang/String;)V

    .line 87
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setChapter_id(Ljava/lang/String;)V

    .line 88
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setchapter_name(Ljava/lang/String;)V

    .line 89
    const/16 v58, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setParent(Z)V

    .line 90
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .end local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    :cond_4
    :goto_3
    add-int/lit8 v27, v27, 0x1

    goto/16 :goto_1

    .line 93
    :cond_5
    new-instance v7, Lorg/json/JSONArray;

    move-object/from16 v0, v20

    invoke-direct {v7, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 95
    .local v7, "array2":Lorg/json/JSONArray;
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v58

    if-nez v58, :cond_6

    .line 96
    new-instance v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-direct/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;-><init>()V

    .line 97
    .restart local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_id(Ljava/lang/String;)V

    .line 98
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_name(Ljava/lang/String;)V

    .line 100
    move-object/from16 v0, v16

    invoke-virtual {v0, v8, v9}, Lcom/edutech/daoxueben/until/BookInfo;->setBookdownloadsize(J)V

    .line 101
    move-object/from16 v0, v16

    invoke-virtual {v0, v12, v13}, Lcom/edutech/daoxueben/until/BookInfo;->setBooksize(J)V

    .line 102
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_updatetime(Ljava/lang/String;)V

    .line 103
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setChapter_id(Ljava/lang/String;)V

    .line 104
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setchapter_name(Ljava/lang/String;)V

    .line 105
    const/16 v58, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setParent(Z)V

    .line 106
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 242
    .end local v6    # "array":Lorg/json/JSONArray;
    .end local v7    # "array2":Lorg/json/JSONArray;
    .end local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .end local v18    # "chapterid":Ljava/lang/String;
    .end local v19    # "chaptername":Ljava/lang/String;
    .end local v20    # "childjson":Ljava/lang/String;
    .end local v27    # "i":I
    .end local v33    # "jsonObject":Lorg/json/JSONObject;
    .end local v34    # "jsonObject1":Lorg/json/JSONObject;
    .end local v36    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v37    # "jsonTokener1":Lorg/json/JSONTokener;
    .end local v41    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v22

    .line 244
    .local v22, "e":Ljava/lang/Exception;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Exception;->printStackTrace()V

    .line 245
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    goto/16 :goto_0

    .line 109
    .end local v22    # "e":Ljava/lang/Exception;
    .restart local v6    # "array":Lorg/json/JSONArray;
    .restart local v7    # "array2":Lorg/json/JSONArray;
    .restart local v18    # "chapterid":Ljava/lang/String;
    .restart local v19    # "chaptername":Ljava/lang/String;
    .restart local v20    # "childjson":Ljava/lang/String;
    .restart local v27    # "i":I
    .restart local v33    # "jsonObject":Lorg/json/JSONObject;
    .restart local v34    # "jsonObject1":Lorg/json/JSONObject;
    .restart local v36    # "jsonTokener":Lorg/json/JSONTokener;
    .restart local v37    # "jsonTokener1":Lorg/json/JSONTokener;
    .restart local v41    # "object":Lorg/json/JSONObject;
    :cond_6
    const/16 v32, 0x0

    .local v32, "j":I
    :goto_4
    :try_start_2
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v58

    move/from16 v0, v32

    move/from16 v1, v58

    if-ge v0, v1, :cond_4

    .line 111
    move/from16 v0, v32

    invoke-virtual {v7, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v42

    .line 112
    .local v42, "object2":Lorg/json/JSONObject;
    new-instance v38, Lorg/json/JSONTokener;

    invoke-virtual/range {v42 .. v42}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v58

    move-object/from16 v0, v38

    move-object/from16 v1, v58

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 113
    .local v38, "jsonTokener2":Lorg/json/JSONTokener;
    invoke-virtual/range {v38 .. v38}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lorg/json/JSONObject;

    .line 114
    .local v35, "jsonObject2":Lorg/json/JSONObject;
    const-string/jumbo v58, "id"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    .line 115
    .local v46, "section_id":Ljava/lang/String;
    const-string/jumbo v58, "dxid"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    .line 116
    .local v45, "section_dxid":Ljava/lang/String;
    const-string/jumbo v58, "name"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    .line 117
    .local v47, "section_name":Ljava/lang/String;
    const-string/jumbo v58, "webpath"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    .line 118
    .local v52, "section_webpath":Ljava/lang/String;
    const-string/jumbo v58, "path"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v48

    .line 121
    .local v48, "section_path":Ljava/lang/String;
    const-string/jumbo v58, "exams"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 122
    .local v24, "exams":Ljava/lang/String;
    const-string/jumbo v58, "examsprogress"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 125
    .local v25, "exams_progress":Ljava/lang/String;
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v26, "examslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    move-object/from16 v0, v45

    move-object/from16 v1, v26

    move-object/from16 v2, v24

    invoke-static {v10, v0, v1, v2}, Lcom/edutech/daoxueben/until/JsonHelper;->parseExamsInfo(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v26

    .line 128
    const-wide/16 v54, 0x0

    .line 129
    .local v54, "sectionexamsize":J
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v58

    :goto_5
    invoke-interface/range {v58 .. v58}, Ljava/util/Iterator;->hasNext()Z

    move-result v59

    if-nez v59, :cond_9

    .line 134
    const-string/jumbo v58, "tag"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    .line 135
    .local v50, "section_tag":Ljava/lang/String;
    const-string/jumbo v58, "updatetime"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    .line 136
    .local v51, "section_updatetime":Ljava/lang/String;
    const-string/jumbo v58, "progress"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    .line 139
    .local v49, "section_progress":Ljava/lang/String;
    const-string/jumbo v58, "downloadsize"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 140
    .local v21, "downloadsize":Ljava/lang/String;
    const-string/jumbo v58, "size"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    .line 141
    .local v53, "size":Ljava/lang/String;
    const-string/jumbo v58, "isdown"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v28

    .line 142
    .local v28, "isdown":Z
    const-string/jumbo v58, "isnew"

    move-object/from16 v0, v35

    move-object/from16 v1, v58

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v29

    .line 143
    .local v29, "isnew":Z
    new-instance v16, Lcom/edutech/daoxueben/until/BookInfo;

    invoke-direct/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;-><init>()V

    .line 144
    .restart local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_id(Ljava/lang/String;)V

    .line 145
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_name(Ljava/lang/String;)V

    .line 147
    move-object/from16 v0, v16

    invoke-virtual {v0, v8, v9}, Lcom/edutech/daoxueben/until/BookInfo;->setBookdownloadsize(J)V

    .line 148
    move-object/from16 v0, v16

    invoke-virtual {v0, v12, v13}, Lcom/edutech/daoxueben/until/BookInfo;->setBooksize(J)V

    .line 149
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Lcom/edutech/daoxueben/until/BookInfo;->setBook_updatetime(Ljava/lang/String;)V

    .line 150
    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setChapter_id(Ljava/lang/String;)V

    .line 151
    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setchapter_name(Ljava/lang/String;)V

    .line 152
    move-object/from16 v0, v16

    move-object/from16 v1, v46

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_id(Ljava/lang/String;)V

    .line 153
    move-object/from16 v0, v16

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_dxid(Ljava/lang/String;)V

    .line 154
    move-object/from16 v0, v16

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setsection_name(Ljava/lang/String;)V

    .line 155
    move-object/from16 v0, v16

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setExams(Ljava/util/ArrayList;)V

    .line 156
    invoke-static/range {v52 .. v52}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v58

    move-object/from16 v0, v16

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_webpath(Ljava/util/ArrayList;)V

    .line 157
    invoke-static/range {v48 .. v48}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v58

    move-object/from16 v0, v16

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_path(Ljava/util/ArrayList;)V

    .line 159
    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/util/ArrayList;->size()I

    move-result v57

    .line 160
    .local v57, "webpathsize":I
    move/from16 v0, v57

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongJsonArray(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v58

    move-object/from16 v0, v16

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setDownloadsize(Ljava/util/ArrayList;)V

    .line 161
    move/from16 v0, v57

    move-object/from16 v1, v53

    invoke-static {v0, v1}, Lcom/edutech/daoxueben/until/JsonHelper;->getLongJsonArray(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v58

    move-object/from16 v0, v16

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSize(Ljava/util/ArrayList;)V

    .line 164
    move-object/from16 v0, v16

    move-object/from16 v1, v50

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setsection_tag(Ljava/lang/String;)V

    .line 165
    move-object/from16 v0, v16

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setsection_updatetime(Ljava/lang/String;)V

    .line 166
    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setIsdown(Z)V

    .line 167
    move-object/from16 v0, v16

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setIsnew(Z)V

    .line 168
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-eqz v58, :cond_b

    .line 169
    const-wide/16 v58, 0x0

    cmp-long v58, v54, v58

    if-nez v58, :cond_a

    .line 170
    const-string/jumbo v25, "100"

    .line 171
    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setexams_progress(Ljava/lang/String;)V

    .line 191
    :goto_6
    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v58

    if-nez v58, :cond_d

    .line 193
    invoke-static/range {v49 .. v49}, Lcom/edutech/daoxueben/until/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v58

    move-object/from16 v0, v16

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_progress(Ljava/util/ArrayList;)V

    .line 212
    :cond_7
    :goto_7
    const/16 v58, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v58

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setParent(Z)V

    .line 213
    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/util/ArrayList;->size()I

    move-result v58

    add-int v58, v58, v14

    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getExams()Ljava/util/ArrayList;

    move-result-object v59

    invoke-virtual/range {v59 .. v59}, Ljava/util/ArrayList;->size()I

    move-result v59

    add-int v14, v58, v59

    .line 214
    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->isIsnew()Z

    move-result v58

    if-eqz v58, :cond_8

    .line 216
    add-int/lit8 v30, v30, 0x1

    .line 219
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    add-int/lit8 v32, v32, 0x1

    goto/16 :goto_4

    .line 129
    .end local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .end local v21    # "downloadsize":Ljava/lang/String;
    .end local v28    # "isdown":Z
    .end local v29    # "isnew":Z
    .end local v49    # "section_progress":Ljava/lang/String;
    .end local v50    # "section_tag":Ljava/lang/String;
    .end local v51    # "section_updatetime":Ljava/lang/String;
    .end local v53    # "size":Ljava/lang/String;
    .end local v57    # "webpathsize":I
    :cond_9
    invoke-interface/range {v58 .. v58}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v56

    check-cast v56, Lcom/edutech/daoxueben/until/ExamsInfo;

    .line 131
    .local v56, "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    invoke-virtual/range {v56 .. v56}, Lcom/edutech/daoxueben/until/ExamsInfo;->getexams_totalsize()J

    move-result-wide v60

    add-long v54, v54, v60

    goto/16 :goto_5

    .line 174
    .end local v56    # "tempexam":Lcom/edutech/daoxueben/until/ExamsInfo;
    .restart local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .restart local v21    # "downloadsize":Ljava/lang/String;
    .restart local v28    # "isdown":Z
    .restart local v29    # "isnew":Z
    .restart local v49    # "section_progress":Ljava/lang/String;
    .restart local v50    # "section_tag":Ljava/lang/String;
    .restart local v51    # "section_updatetime":Ljava/lang/String;
    .restart local v53    # "size":Ljava/lang/String;
    .restart local v57    # "webpathsize":I
    :cond_a
    const-string/jumbo v25, "0"

    .line 175
    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setexams_progress(Ljava/lang/String;)V

    goto :goto_6

    .line 180
    :cond_b
    const-wide/16 v58, 0x0

    cmp-long v58, v54, v58

    if-nez v58, :cond_c

    .line 182
    const-string/jumbo v25, "100"

    .line 183
    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setexams_progress(Ljava/lang/String;)V

    goto :goto_6

    .line 186
    :cond_c
    move-object/from16 v0, v16

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setexams_progress(Ljava/lang/String;)V

    goto :goto_6

    .line 199
    :cond_d
    invoke-virtual/range {v16 .. v16}, Lcom/edutech/daoxueben/until/BookInfo;->getSection_webpath()Ljava/util/ArrayList;

    move-result-object v58

    invoke-virtual/range {v58 .. v58}, Ljava/util/ArrayList;->size()I

    move-result v58

    if-lez v58, :cond_7

    .line 201
    new-instance v44, Ljava/util/ArrayList;

    invoke-direct/range {v44 .. v44}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .local v44, "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v39, 0x0

    .local v39, "k":I
    :goto_8
    move/from16 v0, v39

    move/from16 v1, v57

    if-lt v0, v1, :cond_e

    .line 206
    move-object/from16 v0, v16

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/BookInfo;->setSection_progress(Ljava/util/ArrayList;)V

    goto :goto_7

    .line 204
    :cond_e
    const-string/jumbo v58, "0"

    move-object/from16 v0, v44

    move-object/from16 v1, v58

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 202
    add-int/lit8 v39, v39, 0x1

    goto :goto_8

    .line 272
    .end local v7    # "array2":Lorg/json/JSONArray;
    .end local v16    # "bookinfo":Lcom/edutech/daoxueben/until/BookInfo;
    .end local v18    # "chapterid":Ljava/lang/String;
    .end local v19    # "chaptername":Ljava/lang/String;
    .end local v20    # "childjson":Ljava/lang/String;
    .end local v21    # "downloadsize":Ljava/lang/String;
    .end local v24    # "exams":Ljava/lang/String;
    .end local v25    # "exams_progress":Ljava/lang/String;
    .end local v26    # "examslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/ExamsInfo;>;"
    .end local v28    # "isdown":Z
    .end local v29    # "isnew":Z
    .end local v32    # "j":I
    .end local v34    # "jsonObject1":Lorg/json/JSONObject;
    .end local v35    # "jsonObject2":Lorg/json/JSONObject;
    .end local v37    # "jsonTokener1":Lorg/json/JSONTokener;
    .end local v38    # "jsonTokener2":Lorg/json/JSONTokener;
    .end local v39    # "k":I
    .end local v41    # "object":Lorg/json/JSONObject;
    .end local v42    # "object2":Lorg/json/JSONObject;
    .end local v44    # "progresslist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v45    # "section_dxid":Ljava/lang/String;
    .end local v46    # "section_id":Ljava/lang/String;
    .end local v47    # "section_name":Ljava/lang/String;
    .end local v48    # "section_path":Ljava/lang/String;
    .end local v49    # "section_progress":Ljava/lang/String;
    .end local v50    # "section_tag":Ljava/lang/String;
    .end local v51    # "section_updatetime":Ljava/lang/String;
    .end local v52    # "section_webpath":Ljava/lang/String;
    .end local v53    # "size":Ljava/lang/String;
    .end local v54    # "sectionexamsize":J
    .end local v57    # "webpathsize":I
    .restart local v17    # "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/daoxueben/until/OldBooks;>;"
    .restart local v31    # "isnewbook":Z
    .restart local v40    # "newbook":Lcom/edutech/daoxueben/until/OldBooks;
    :cond_f
    invoke-interface/range {v58 .. v58}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/edutech/daoxueben/until/OldBooks;

    .line 274
    .local v23, "entry":Lcom/edutech/daoxueben/until/OldBooks;
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v59

    invoke-virtual/range {v23 .. v23}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v60

    invoke-virtual/range {v59 .. v60}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v59

    if-eqz v59, :cond_2

    .line 276
    const/16 v31, 0x0

    .line 277
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_id()Ljava/lang/String;

    move-result-object v59

    move-object/from16 v0, v23

    move-object/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_id(Ljava/lang/String;)V

    .line 278
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_name()Ljava/lang/String;

    move-result-object v59

    move-object/from16 v0, v23

    move-object/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_name(Ljava/lang/String;)V

    .line 281
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getbook_path()Ljava/lang/String;

    move-result-object v59

    move-object/from16 v0, v23

    move-object/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setbook_path(Ljava/lang/String;)V

    .line 282
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_updatetime()Ljava/lang/String;

    move-result-object v59

    move-object/from16 v0, v23

    move-object/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_updatetime(Ljava/lang/String;)V

    .line 283
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_total()I

    move-result v59

    move-object/from16 v0, v23

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_total(I)V

    .line 284
    if-nez v30, :cond_10

    .line 286
    invoke-virtual/range {v40 .. v40}, Lcom/edutech/daoxueben/until/OldBooks;->getBook_isnew()I

    move-result v59

    move-object/from16 v0, v23

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_isnew(I)V

    goto/16 :goto_2

    .line 289
    :cond_10
    const/16 v59, 0x1

    move-object/from16 v0, v23

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lcom/edutech/daoxueben/until/OldBooks;->setBook_isnew(I)V

    goto/16 :goto_2

    .line 314
    .end local v23    # "entry":Lcom/edutech/daoxueben/until/OldBooks;
    :cond_11
    invoke-static/range {v17 .. v17}, Lcom/edutech/daoxueben/until/JsonHelper;->bookscreateJson(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v5

    .line 316
    .restart local v5    # "Newjson":Ljava/lang/String;
    sget-object v58, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    move-object/from16 v0, v58

    invoke-static {v5, v0}, Lcom/edutech/daoxueben/until/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v58

    if-eqz v58, :cond_0

    const-string/jumbo v58, ""

    move-object/from16 v0, v58

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method public static setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4
    .param p0, "jsonStringer"    # Lorg/json/JSONStringer;
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONStringer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1345
    .local p1, "arraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1360
    .local v0, "arraylistsize":I
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 1361
    invoke-virtual {p0}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 1362
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 1365
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 1375
    .end local v2    # "k":I
    :goto_1
    return-void

    .line 1363
    .restart local v2    # "k":I
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1362
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1367
    .end local v2    # "k":I
    :catch_0
    move-exception v1

    .line 1369
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 1370
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 1372
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static setLongJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 4
    .param p0, "jsonStringer"    # Lorg/json/JSONStringer;
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONStringer;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1384
    .local p1, "arraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1415
    .local v0, "arraylistsize":I
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 1416
    invoke-virtual {p0}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 1417
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 1420
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 1427
    .end local v2    # "k":I
    :goto_1
    return-void

    .line 1418
    .restart local v2    # "k":I
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1417
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1422
    .end local v2    # "k":I
    :catch_0
    move-exception v1

    .line 1424
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method
