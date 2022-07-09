.class public Lcom/edutech/json/CommonJSONParser;
.super Ljava/lang/Object;
.source "CommonJSONParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isJsonArray(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 63
    if-eqz p1, :cond_0

    .line 65
    :try_start_0
    instance-of v2, p1, Lorg/json/JSONArray;

    if-eqz v2, :cond_1

    .line 67
    const/4 v1, 0x1

    .line 80
    :cond_0
    :goto_0
    return v1

    .line 68
    :cond_1
    instance-of v2, p1, Lorg/json/JSONObject;

    if-nez v2, :cond_0

    .line 72
    instance-of v2, p1, Ljava/lang/String;

    if-nez v2, :cond_0

    instance-of v2, p1, Ljava/lang/Boolean;

    if-nez v2, :cond_0

    instance-of v2, p1, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    goto :goto_0

    .line 76
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public parse(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .param p1, "jsonStr"    # Ljava/lang/String;
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
    .line 18
    const/4 v3, 0x0

    .line 19
    .local v3, "result":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    .line 21
    :try_start_0
    new-instance v2, Lorg/json/JSONTokener;

    invoke-direct {v2, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 22
    .local v2, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 28
    .local v1, "jsonObject":Lorg/json/JSONObject;
    invoke-virtual {p0, v1}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 37
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "jsonTokener":Lorg/json/JSONTokener;
    :cond_0
    :goto_0
    return-object v3

    .line 29
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 32
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 34
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public parseJSONArray(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "jsonArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v2, 0x0

    .line 86
    .local v2, "valueList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    if-eqz p1, :cond_0

    .line 88
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "valueList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .restart local v2    # "valueList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v0, v3, :cond_1

    .line 97
    .end local v0    # "i":I
    :cond_0
    return-object v2

    .line 90
    .restart local v0    # "i":I
    :cond_1
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 91
    .local v1, "itemObject":Ljava/lang/Object;
    if-eqz v1, :cond_2

    .line 92
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 5
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 102
    const/4 v3, 0x0

    .line 103
    .local v3, "valueObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p1, :cond_1

    .line 104
    new-instance v3, Ljava/util/HashMap;

    .end local v3    # "valueObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 105
    .restart local v3    # "valueObject":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 106
    .local v1, "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2

    .line 116
    .end local v1    # "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    return-object v3

    .line 107
    .restart local v1    # "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 108
    .local v2, "keyStr":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 109
    .local v0, "itemObject":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public parseValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "inputObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 40
    const/4 v1, 0x0

    .line 42
    .local v1, "outputObject":Ljava/lang/Object;
    if-eqz p1, :cond_0

    .line 44
    :try_start_0
    instance-of v2, p1, Lorg/json/JSONArray;

    if-eqz v2, :cond_1

    .line 46
    check-cast p1, Lorg/json/JSONArray;

    .end local p1    # "inputObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/edutech/json/CommonJSONParser;->parseJSONArray(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v1

    .line 59
    .end local v1    # "outputObject":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object v1

    .line 47
    .restart local v1    # "outputObject":Ljava/lang/Object;
    .restart local p1    # "inputObject":Ljava/lang/Object;
    :cond_1
    instance-of v2, p1, Lorg/json/JSONObject;

    if-eqz v2, :cond_2

    .line 49
    check-cast p1, Lorg/json/JSONObject;

    .end local p1    # "inputObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/edutech/json/CommonJSONParser;->parseJSONObject(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    .line 50
    .local v1, "outputObject":Ljava/util/HashMap;
    goto :goto_0

    .local v1, "outputObject":Ljava/lang/Object;
    .restart local p1    # "inputObject":Ljava/lang/Object;
    :cond_2
    instance-of v2, p1, Ljava/lang/String;

    if-nez v2, :cond_3

    instance-of v2, p1, Ljava/lang/Boolean;

    if-nez v2, :cond_3

    instance-of v2, p1, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    .line 51
    :cond_3
    move-object v1, p1

    goto :goto_0

    .line 54
    .end local p1    # "inputObject":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
