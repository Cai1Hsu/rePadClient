.class public Lcom/edutech/json/JsonCreate;
.super Ljava/lang/Object;
.source "JsonCreate.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static MaptoJSONObject(Ljava/util/HashMap;)Ljava/lang/Object;
    .locals 3
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
    .line 224
    .local p0, "data":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .line 226
    .local v2, "object":Ljava/lang/Object;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .local v1, "jsonobject":Lorg/json/JSONObject;
    move-object v2, v1

    .line 232
    .end local v1    # "jsonobject":Lorg/json/JSONObject;
    .end local v2    # "object":Ljava/lang/Object;
    :goto_0
    return-object v2

    .line 228
    .restart local v2    # "object":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static createBooksJson(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Books;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    new-instance v16, Lorg/json/JSONStringer;

    invoke-direct/range {v16 .. v16}, Lorg/json/JSONStringer;-><init>()V

    .line 117
    .local v16, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 118
    const-string/jumbo v17, "data"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 119
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 120
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-lt v15, v0, :cond_0

    .line 146
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 147
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v15    # "i":I
    :goto_1
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v17

    return-object v17

    .line 121
    .restart local v15    # "i":I
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/json/Books;

    .line 122
    .local v2, "book":Lcom/edutech/json/Books;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 123
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getbook_id()Ljava/lang/String;

    move-result-object v8

    .line 124
    .local v8, "bookid":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getbook_name()Ljava/lang/String;

    move-result-object v9

    .line 126
    .local v9, "bookname":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getBookdownloadsize()J

    move-result-wide v6

    .line 127
    .local v6, "bookdownloadsize":J
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getBooksize()J

    move-result-wide v12

    .line 128
    .local v12, "booksize":J
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getbook_path()Ljava/lang/String;

    move-result-object v10

    .line 130
    .local v10, "bookpath":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getProgress()Ljava/lang/String;

    move-result-object v11

    .line 131
    .local v11, "bookprogress":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getBook_updatetime()Ljava/lang/String;

    move-result-object v5

    .line 132
    .local v5, "book_updatetime":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getBook_isnew()I

    move-result v3

    .line 133
    .local v3, "book_isnew":I
    invoke-virtual {v2}, Lcom/edutech/json/Books;->getBook_total()I

    move-result v4

    .line 134
    .local v4, "book_total":I
    const-string/jumbo v17, "id"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 135
    const-string/jumbo v17, "name"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 136
    const-string/jumbo v17, "path"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 138
    const-string/jumbo v17, "downloadsize"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v7}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 139
    const-string/jumbo v17, "size"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12, v13}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 140
    const-string/jumbo v17, "progress"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 141
    const-string/jumbo v17, "updatetime"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 142
    const-string/jumbo v17, "isnew"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    int-to-long v0, v3

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 143
    const-string/jumbo v17, "total"

    invoke-virtual/range {v16 .. v17}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v17

    int-to-long v0, v4

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONStringer;

    .line 144
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 149
    .end local v2    # "book":Lcom/edutech/json/Books;
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

    .line 151
    .local v14, "e":Ljava/lang/Exception;
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method private static createchildrenjson(Lorg/json/JSONStringer;Lcom/edutech/json/Tree;Ljava/util/HashMap;)Lorg/json/JSONStringer;
    .locals 11
    .param p0, "jsonStringer"    # Lorg/json/JSONStringer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONStringer;",
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
            ">;)",
            "Lorg/json/JSONStringer;"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p2, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1, p2}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    .line 66
    .local v0, "Successors":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 108
    return-object p0

    .line 66
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 69
    .local v6, "successor":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    invoke-virtual {p0}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 70
    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    .line 71
    .local v5, "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 72
    .local v4, "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 73
    const/4 v2, 0x0

    .line 74
    .local v2, "islast":Z
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_2

    .line 82
    if-eqz v2, :cond_1

    .line 83
    invoke-virtual {p1, v6}, Lcom/edutech/json/Tree;->getSuccessors(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    if-nez v8, :cond_4

    .line 85
    const-string/jumbo v8, "children"

    invoke-virtual {p0, v8}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v8

    const-string/jumbo v9, "children"

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 95
    :cond_1
    :goto_2
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 96
    .end local v2    # "islast":Z
    .end local v4    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 74
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v2    # "islast":Z
    .restart local v4    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 75
    .local v3, "keyStr":Ljava/lang/String;
    const-string/jumbo v9, "children"

    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 76
    const/4 v2, 0x1

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-virtual {p0, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v9

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 99
    .end local v2    # "islast":Z
    .end local v3    # "keyStr":Ljava/lang/String;
    .end local v4    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 101
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 88
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "islast":Z
    .restart local v4    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    :try_start_2
    const-string/jumbo v8, "children"

    invoke-virtual {p0, v8}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 89
    invoke-virtual {p0}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 90
    invoke-static {p0, p1, v6}, Lcom/edutech/json/JsonCreate;->createchildrenjson(Lorg/json/JSONStringer;Lcom/edutech/json/Tree;Ljava/util/HashMap;)Lorg/json/JSONStringer;

    .line 91
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2
.end method

.method public static createjson(Lcom/edutech/json/Tree;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/edutech/json/Tree",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {p0}, Lcom/edutech/json/Tree;->getHead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 26
    .local v1, "head":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Lorg/json/JSONStringer;

    invoke-direct {v3}, Lorg/json/JSONStringer;-><init>()V

    .line 28
    .local v3, "jsonStringer":Lorg/json/JSONStringer;
    if-eqz v1, :cond_1

    .line 30
    new-instance v3, Lorg/json/JSONStringer;

    .end local v3    # "jsonStringer":Lorg/json/JSONStringer;
    invoke-direct {v3}, Lorg/json/JSONStringer;-><init>()V

    .line 32
    .restart local v3    # "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v3}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 33
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    .line 34
    .local v6, "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    .local v5, "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 36
    const/4 v2, 0x0

    .line 37
    .local v2, "islast":Z
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    const-string/jumbo v7, "data"

    invoke-virtual {v3, v7}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 46
    invoke-virtual {v3}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 47
    invoke-static {v3, p0, v1}, Lcom/edutech/json/JsonCreate;->createchildrenjson(Lorg/json/JSONStringer;Lcom/edutech/json/Tree;Ljava/util/HashMap;)Lorg/json/JSONStringer;

    .line 48
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 50
    :cond_0
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v2    # "islast":Z
    .end local v5    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 37
    .restart local v2    # "islast":Z
    .restart local v5    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v6    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 38
    .local v4, "keyStr":Ljava/lang/String;
    const-string/jumbo v8, "data"

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 39
    const/4 v2, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_3
    invoke-virtual {v3, v4}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v8

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 52
    .end local v2    # "islast":Z
    .end local v4    # "keyStr":Ljava/lang/String;
    .end local v5    # "keylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "keyset":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static saveJsonToLocal(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p0, "json"    # Ljava/lang/String;
    .param p1, "jsonpath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 163
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 165
    .local v1, "jsonFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 166
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "dir":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "/newJson.Json"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 169
    .local v3, "newjsonPath":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 170
    .local v2, "newJsonFile":Ljava/io/File;
    invoke-static {p0, v3}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 171
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 172
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 173
    invoke-virtual {v2, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 192
    .end local v0    # "dir":Ljava/lang/String;
    .end local v2    # "newJsonFile":Ljava/io/File;
    .end local v3    # "newjsonPath":Ljava/lang/String;
    :cond_0
    :goto_0
    return v4

    .restart local v0    # "dir":Ljava/lang/String;
    .restart local v2    # "newJsonFile":Ljava/io/File;
    .restart local v3    # "newjsonPath":Ljava/lang/String;
    :cond_1
    move v4, v5

    .line 180
    goto :goto_0

    .line 185
    .end local v0    # "dir":Ljava/lang/String;
    .end local v2    # "newJsonFile":Ljava/io/File;
    .end local v3    # "newjsonPath":Ljava/lang/String;
    :cond_2
    invoke-static {p0, p1}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    move v4, v5

    .line 192
    goto :goto_0
.end method

.method public static toJSONArrayObject(Ljava/util/ArrayList;)Ljava/lang/Object;
    .locals 6
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
    .line 204
    .local p0, "objectList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 205
    .local v2, "object":Ljava/lang/Object;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 207
    .local v1, "jsonArray":Lorg/json/JSONArray;
    :try_start_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 210
    move-object v2, v1

    .line 216
    .end local v2    # "object":Ljava/lang/Object;
    :goto_1
    return-object v2

    .line 207
    .restart local v2    # "object":Ljava/lang/Object;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 208
    .local v3, "tempObject":Ljava/lang/Object;
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 211
    .end local v3    # "tempObject":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
