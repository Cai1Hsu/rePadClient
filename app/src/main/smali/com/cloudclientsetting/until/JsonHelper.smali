.class public Lcom/cloudclientsetting/until/JsonHelper;
.super Ljava/lang/Object;
.source "JsonHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Reset_Pwd_HTTPPOST_URL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/user/index/set-answer/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static Update_Pwd_HTTPPOST_URL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;

    .prologue
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/user/type/modpwd/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 95
    .local v0, "Name":Z
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 99
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 110
    :goto_0
    return v0

    .line 101
    :catch_0
    move-exception v1

    .line 103
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 104
    const/4 v0, 0x0

    .line 106
    goto :goto_0

    .line 107
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 121
    const/4 v0, 0x0

    .line 122
    .local v0, "Name":I
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 126
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 137
    :goto_0
    return v0

    .line 128
    :catch_0
    move-exception v1

    .line 130
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 131
    const/4 v0, 0x0

    .line 133
    goto :goto_0

    .line 134
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 67
    const-string/jumbo v0, ""

    .line 68
    .local v0, "Name":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 72
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    .line 74
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 77
    const-string/jumbo v0, ""

    .line 79
    goto :goto_0

    .line 80
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static parseHttpPostReturnJson(Ljava/lang/String;)I
    .locals 14
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 25
    const-string/jumbo v11, "strResult"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "parseHttpPostReturnJson:"

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    const-string/jumbo v11, ""

    invoke-virtual {v11, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 54
    :cond_0
    :goto_0
    return v6

    .line 32
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 33
    .local v4, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 34
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v11, "status"

    invoke-static {v3, v11}, Lcom/cloudclientsetting/until/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v5

    .line 35
    .local v5, "status":Z
    const-string/jumbo v11, "errorNum"

    invoke-static {v3, v11}, Lcom/cloudclientsetting/until/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v2

    .line 36
    .local v2, "errorNum":I
    const-string/jumbo v11, "errorInfo"

    invoke-static {v3, v11}, Lcom/cloudclientsetting/until/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "errorInfo":Ljava/lang/String;
    if-eqz v5, :cond_2

    if-nez v2, :cond_2

    const-string/jumbo v11, ""

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    if-nez v11, :cond_0

    .line 40
    :cond_2
    if-nez v5, :cond_3

    if-ne v2, v7, :cond_3

    move v6, v7

    .line 41
    goto :goto_0

    .line 42
    :cond_3
    if-nez v5, :cond_4

    if-ne v2, v8, :cond_4

    move v6, v8

    .line 43
    goto :goto_0

    .line 44
    :cond_4
    if-nez v5, :cond_5

    if-ne v2, v9, :cond_5

    move v6, v9

    .line 45
    goto :goto_0

    .line 46
    :cond_5
    if-nez v5, :cond_6

    if-ne v2, v10, :cond_6

    move v6, v10

    .line 47
    goto :goto_0

    .line 49
    :cond_6
    const/4 v6, -0x1

    goto :goto_0

    .line 51
    .end local v1    # "errorInfo":Ljava/lang/String;
    .end local v2    # "errorNum":I
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v5    # "status":Z
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
