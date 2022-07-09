.class public Lcom/edutech/json/JsonParse;
.super Ljava/lang/Object;
.source "JsonParse.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static childrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .param p2, "common"    # Lcom/edutech/json/CommonJSONParser;
    .param p3, "children"    # Ljava/lang/Object;
    .param p4, "arraykey1"    # Ljava/lang/String;
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/edutech/json/CommonJSONParser;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p1, "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :try_start_0
    check-cast p3, Lorg/json/JSONObject;

    .end local p3    # "children":Ljava/lang/Object;
    invoke-virtual {p2, p3}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    .line 65
    .local v1, "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {p0, v4, v1}, Lcom/edutech/json/Tree;->addLeaf(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    :cond_0
    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 70
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/edutech/json/CommonJSONParser;->parseValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 74
    .local v2, "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 78
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 79
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 89
    .end local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    :goto_1
    return-void

    .line 74
    .restart local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 76
    .local v0, "children1":Ljava/lang/Object;
    invoke-static {p0, p1, p2, v0, p4}, Lcom/edutech/json/JsonParse;->childrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 84
    .end local v0    # "children1":Ljava/lang/Object;
    .end local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :catch_0
    move-exception v3

    .line 86
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method public static geteObjectToMap(Ljava/lang/Object;)Ljava/util/HashMap;
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
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
    .line 149
    new-instance v0, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v0}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 150
    .local v0, "common":Lcom/edutech/json/CommonJSONParser;
    const/4 v2, 0x0

    .line 151
    .local v2, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p0, :cond_0

    move-object v3, v2

    .line 164
    .end local v2    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local p0    # "object":Ljava/lang/Object;
    .local v3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_0
    return-object v3

    .line 154
    .end local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_0
    :try_start_0
    check-cast p0, Lorg/json/JSONObject;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-virtual {v0, p0}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    :goto_1
    move-object v3, v2

    .line 164
    .end local v2    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    goto :goto_0

    .line 157
    .end local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    .line 159
    .local v1, "e1":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 160
    .end local v1    # "e1":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 162
    .local v1, "e1":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static isBooleanTrue(Ljava/util/HashMap;Ljava/lang/String;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
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
    .line 169
    .local p0, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 171
    .local v0, "boolIsTrue":Z
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 176
    :goto_0
    return v0

    .line 172
    :catch_0
    move-exception v1

    .line 174
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static newchildrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .param p2, "common"    # Lcom/edutech/json/CommonJSONParser;
    .param p3, "children"    # Ljava/lang/Object;
    .param p4, "arraykey1"    # Ljava/lang/String;
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
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Lcom/edutech/json/CommonJSONParser;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .local p1, "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :try_start_0
    check-cast p3, Lorg/json/JSONObject;

    .end local p3    # "children":Ljava/lang/Object;
    invoke-virtual {p2, p3}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    .line 96
    .local v1, "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 97
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {p0, v4, v1}, Lcom/edutech/json/Tree;->addLeaf(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    :cond_0
    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 101
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/edutech/json/CommonJSONParser;->parseValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 105
    .local v2, "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 109
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 110
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 123
    .end local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_1
    :goto_1
    return-void

    .line 105
    .restart local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 107
    .local v0, "children1":Ljava/lang/Object;
    invoke-static {p0, p1, p2, v0, p4}, Lcom/edutech/json/JsonParse;->childrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 115
    .end local v0    # "children1":Ljava/lang/Object;
    .end local v1    # "childrenhash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "childrenlist1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :catch_0
    move-exception v3

    .line 117
    .local v3, "e":Lorg/json/JSONException;
    invoke-virtual {v3}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 118
    .end local v3    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v3

    .line 120
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static parseBooksJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 23
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Books;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/json/Books;",
            ">;"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "books":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/json/Books;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    .line 184
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 185
    .local v15, "bookjson":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_1

    .line 188
    :try_start_0
    invoke-virtual {v15}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :cond_0
    :goto_0
    return-object p0

    .line 190
    :catch_0
    move-exception v16

    .line 192
    .local v16, "e":Ljava/io/IOException;
    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 196
    .end local v16    # "e":Ljava/io/IOException;
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 197
    .local v18, "json":Ljava/lang/String;
    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_0

    .line 202
    :try_start_1
    new-instance v20, Lorg/json/JSONTokener;

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 203
    .local v20, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/json/JSONObject;

    .line 204
    .local v19, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v22, "data"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 206
    .local v2, "array":Lorg/json/JSONArray;
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v22

    move/from16 v0, v17

    move/from16 v1, v22

    if-ge v0, v1, :cond_0

    .line 207
    move/from16 v0, v17

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v21

    .line 208
    .local v21, "object":Lorg/json/JSONObject;
    new-instance v3, Lcom/edutech/json/Books;

    invoke-direct {v3}, Lcom/edutech/json/Books;-><init>()V

    .line 209
    .local v3, "book":Lcom/edutech/json/Books;
    const-string/jumbo v22, "id"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 211
    .local v6, "book_id":Ljava/lang/String;
    const-string/jumbo v22, "downloadsize"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 212
    .local v4, "book_downloadsize":J
    const-string/jumbo v22, "size"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 213
    .local v12, "book_size":J
    const-string/jumbo v22, "name"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 214
    .local v8, "book_name":Ljava/lang/String;
    const-string/jumbo v22, "path"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 216
    .local v9, "book_path":Ljava/lang/String;
    const-string/jumbo v22, "progress"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 217
    .local v10, "book_progress":Ljava/lang/String;
    const-string/jumbo v22, "updatetime"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 218
    .local v14, "book_updatetime":Ljava/lang/String;
    const-string/jumbo v22, "isnew"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v7

    .line 219
    .local v7, "book_isnew":I
    const-string/jumbo v22, "total"

    invoke-static/range {v21 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v11

    .line 221
    .local v11, "book_total":I
    invoke-virtual {v3, v6}, Lcom/edutech/json/Books;->setbook_id(Ljava/lang/String;)V

    .line 222
    invoke-virtual {v3, v8}, Lcom/edutech/json/Books;->setbook_name(Ljava/lang/String;)V

    .line 224
    invoke-virtual {v3, v4, v5}, Lcom/edutech/json/Books;->setBookdownloadsize(J)V

    .line 225
    invoke-virtual {v3, v12, v13}, Lcom/edutech/json/Books;->setBooksize(J)V

    .line 226
    invoke-virtual {v3, v9}, Lcom/edutech/json/Books;->setbook_path(Ljava/lang/String;)V

    .line 228
    invoke-virtual {v3, v10}, Lcom/edutech/json/Books;->setProgress(Ljava/lang/String;)V

    .line 229
    invoke-virtual {v3, v14}, Lcom/edutech/json/Books;->setBook_updatetime(Ljava/lang/String;)V

    .line 230
    invoke-virtual {v3, v7}, Lcom/edutech/json/Books;->setBook_isnew(I)V

    .line 231
    invoke-virtual {v3, v11}, Lcom/edutech/json/Books;->setBook_total(I)V

    .line 232
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 206
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 234
    .end local v2    # "array":Lorg/json/JSONArray;
    .end local v3    # "book":Lcom/edutech/json/Books;
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

    .line 236
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static parsejson(Lcom/edutech/json/Tree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/json/Tree;
    .locals 9
    .param p1, "json"    # Ljava/lang/String;
    .param p2, "arraykey"    # Ljava/lang/String;
    .param p3, "arraykey1"    # Ljava/lang/String;
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
    .line 21
    .local p0, "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    if-eqz p2, :cond_2

    if-eqz p2, :cond_0

    const-string/jumbo v7, ""

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    :cond_0
    if-eqz p3, :cond_2

    if-eqz p3, :cond_1

    const-string/jumbo v7, ""

    invoke-virtual {v7, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    :cond_1
    if-eqz p1, :cond_2

    if-eqz p1, :cond_3

    const-string/jumbo v7, ""

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 57
    :cond_2
    :goto_0
    return-object p0

    .line 26
    :cond_3
    new-instance v2, Lcom/edutech/json/CommonJSONParser;

    invoke-direct {v2}, Lcom/edutech/json/CommonJSONParser;-><init>()V

    .line 27
    .local v2, "common":Lcom/edutech/json/CommonJSONParser;
    invoke-virtual {v2, p1}, Lcom/edutech/json/CommonJSONParser;->parse(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 30
    .local v0, "book":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v0, :cond_2

    .line 32
    new-instance p0, Lcom/edutech/json/Tree;

    .end local p0    # "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct {p0, v0}, Lcom/edutech/json/Tree;-><init>(Ljava/lang/Object;)V

    .line 34
    .restart local p0    # "tree":Lcom/edutech/json/Tree;, "Lcom/edutech/json/Tree<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 38
    :try_start_0
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONArray;

    invoke-virtual {v2, v7}, Lcom/edutech/json/CommonJSONParser;->parseJSONArray(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v3

    .line 39
    .local v3, "datalist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz v3, :cond_2

    .line 43
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .local v6, "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    const/4 v5, 0x0

    .line 46
    .local v5, "i":I
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 47
    .local v1, "children":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    .line 49
    invoke-static {p0, v6, v2, v1, p3}, Lcom/edutech/json/JsonParse;->childrenlist(Lcom/edutech/json/Tree;Ljava/util/ArrayList;Lcom/edutech/json/CommonJSONParser;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 52
    .end local v1    # "children":Ljava/lang/Object;
    .end local v3    # "datalist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    .end local v5    # "i":I
    .end local v6    # "parentlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :catch_0
    move-exception v4

    .line 54
    .local v4, "e":Lorg/json/JSONException;
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
