.class public Lcom/edutech/mobilestudyclient/util/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static utils:Lcom/edutech/mobilestudyclient/util/Utils;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearUpdateAPks(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 385
    const-string/jumbo v1, "updateapks"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 386
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "apks_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 387
    return-void
.end method

.method public static getAppName(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "packagename"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 501
    const-string/jumbo v1, ""

    .line 503
    .local v1, "appName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 504
    .local v3, "pm":Landroid/content/pm/PackageManager;
    const/16 v4, 0x80

    invoke-virtual {v3, p0, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 505
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v3, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 509
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v3    # "pm":Landroid/content/pm/PackageManager;
    :goto_0
    return-object v1

    .line 506
    :catch_0
    move-exception v2

    .line 507
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getFailedEbagUpdated(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 22
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "ip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 396
    const/4 v10, 0x0

    .line 397
    .local v10, "isUpdated":Z
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .local v3, "apkFailedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 452
    .end local v3    # "apkFailedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    return-object v3

    .line 402
    .restart local v3    # "apkFailedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    const-string/jumbo v19, "updateapks"

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 403
    .local v16, "sp":Landroid/content/SharedPreferences;
    new-instance v19, Ljava/lang/StringBuilder;

    const-string/jumbo v20, "apks_"

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const-string/jumbo v20, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 405
    .local v4, "apkJsonStr":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 410
    :try_start_0
    new-instance v11, Lorg/json/JSONArray;

    invoke-direct {v11, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 411
    .local v11, "jsonArray":Lorg/json/JSONArray;
    const/4 v12, 0x0

    .line 412
    .local v12, "jsonObject":Lorg/json/JSONObject;
    const/4 v8, 0x0

    .line 413
    .local v8, "isFailed":Z
    const/4 v9, 0x0

    .line 414
    .local v9, "isNeed":Z
    const-string/jumbo v5, ""

    .line 415
    .local v5, "appName":Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v19

    move/from16 v0, v19

    if-lt v7, v0, :cond_3

    .line 443
    if-nez v8, :cond_2

    .line 445
    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v19

    new-instance v20, Ljava/lang/StringBuilder;

    const-string/jumbo v21, "apks_"

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    const-string/jumbo v21, ""

    invoke-interface/range {v19 .. v21}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 452
    .end local v5    # "appName":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "isFailed":Z
    .end local v9    # "isNeed":Z
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    .end local v12    # "jsonObject":Lorg/json/JSONObject;
    :cond_2
    :goto_2
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "apkFailedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    .line 417
    .restart local v3    # "apkFailedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v5    # "appName":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v8    # "isFailed":Z
    .restart local v9    # "isNeed":Z
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    .restart local v12    # "jsonObject":Lorg/json/JSONObject;
    :cond_3
    :try_start_1
    invoke-virtual {v11, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 418
    const-string/jumbo v19, "packagename"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 419
    .local v15, "pkgName":Ljava/lang/String;
    const-string/jumbo v19, "versioncode"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 420
    .local v17, "vcode":Ljava/lang/String;
    const-string/jumbo v19, "versionname"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 421
    .local v18, "vname":Ljava/lang/String;
    const-string/jumbo v19, "appname"

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 422
    .local v14, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v15, v0, v1}, Lcom/edutech/mobilestudyclient/util/Utils;->needUpdate(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)Z

    move-result v9

    .line 423
    if-eqz v9, :cond_6

    .line 425
    const/4 v8, 0x1

    .line 426
    move-object/from16 v0, p0

    invoke-static {v15, v0}, Lcom/edutech/mobilestudyclient/util/Utils;->getAppName(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 427
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-nez v19, :cond_5

    .line 429
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_7

    const/16 v13, 0x10

    .line 430
    .local v13, "length":I
    :goto_3
    const-string/jumbo v19, "_"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 432
    const-string/jumbo v19, "_"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result v13

    .line 435
    :cond_4
    const/16 v19, 0x0

    :try_start_2
    move/from16 v0, v19

    invoke-virtual {v14, v0, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v5

    .line 440
    .end local v13    # "length":I
    :cond_5
    :goto_4
    :try_start_3
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v20, ": v"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 429
    :cond_7
    invoke-virtual {v14}, Ljava/lang/String;->length()I
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-result v13

    goto :goto_3

    .line 447
    .end local v5    # "appName":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "isFailed":Z
    .end local v9    # "isNeed":Z
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    .end local v12    # "jsonObject":Lorg/json/JSONObject;
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "pkgName":Ljava/lang/String;
    .end local v17    # "vcode":Ljava/lang/String;
    .end local v18    # "vname":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 448
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_2

    .line 436
    .end local v6    # "e":Lorg/json/JSONException;
    .restart local v5    # "appName":Ljava/lang/String;
    .restart local v7    # "i":I
    .restart local v8    # "isFailed":Z
    .restart local v9    # "isNeed":Z
    .restart local v11    # "jsonArray":Lorg/json/JSONArray;
    .restart local v12    # "jsonObject":Lorg/json/JSONObject;
    .restart local v13    # "length":I
    .restart local v14    # "name":Ljava/lang/String;
    .restart local v15    # "pkgName":Ljava/lang/String;
    .restart local v17    # "vcode":Ljava/lang/String;
    .restart local v18    # "vname":Ljava/lang/String;
    :catch_1
    move-exception v19

    goto :goto_4

    .line 449
    .end local v5    # "appName":Ljava/lang/String;
    .end local v7    # "i":I
    .end local v8    # "isFailed":Z
    .end local v9    # "isNeed":Z
    .end local v11    # "jsonArray":Lorg/json/JSONArray;
    .end local v12    # "jsonObject":Lorg/json/JSONObject;
    .end local v13    # "length":I
    .end local v14    # "name":Ljava/lang/String;
    .end local v15    # "pkgName":Ljava/lang/String;
    .end local v17    # "vcode":Ljava/lang/String;
    .end local v18    # "vname":Ljava/lang/String;
    :catch_2
    move-exception v19

    goto/16 :goto_2
.end method

.method public static init()Lcom/edutech/mobilestudyclient/util/Utils;
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lcom/edutech/mobilestudyclient/util/Utils;->utils:Lcom/edutech/mobilestudyclient/util/Utils;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/edutech/mobilestudyclient/util/Utils;

    invoke-direct {v0}, Lcom/edutech/mobilestudyclient/util/Utils;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/util/Utils;->utils:Lcom/edutech/mobilestudyclient/util/Utils;

    .line 43
    :cond_0
    sget-object v0, Lcom/edutech/mobilestudyclient/util/Utils;->utils:Lcom/edutech/mobilestudyclient/util/Utils;

    return-object v0
.end method

.method public static needUpdate(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 8
    .param p0, "packagename"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "code"    # Ljava/lang/String;

    .prologue
    .line 464
    const-string/jumbo v5, "AppUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    const/4 v2, 0x0

    .line 466
    .local v2, "need":Z
    const/4 v3, 0x1

    .line 468
    .local v3, "vcode":I
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v3

    .line 478
    :goto_0
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 479
    const/4 v6, 0x0

    .line 478
    invoke-virtual {v5, p0, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 480
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget v4, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 481
    .local v4, "versionCode":I
    if-le v3, v4, :cond_0

    .line 483
    const/4 v2, 0x1

    .line 485
    :cond_0
    const-string/jumbo v5, "AppUtils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 490
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v4    # "versionCode":I
    :goto_1
    return v2

    .line 469
    :catch_0
    move-exception v0

    .line 471
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    goto :goto_0

    .line 473
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v0

    .line 475
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 486
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v0

    .line 488
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static saveUpdateApks(Ljava/util/List;Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 370
    .local p0, "apks":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    if-eqz p1, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 372
    :cond_0
    invoke-static {p1, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->clearUpdateAPks(Landroid/content/Context;Ljava/lang/String;)V

    .line 378
    :goto_0
    return-void

    .line 375
    :cond_1
    const-string/jumbo v1, "updateapks"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 376
    .local v0, "sp":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "apks_"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method


# virtual methods
.method public Unzip(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 16
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "targetDir"    # Ljava/lang/String;

    .prologue
    .line 324
    const v1, 0x19000

    .line 328
    .local v1, "BUFFER":I
    const/4 v5, 0x0

    .line 329
    .local v5, "dest":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v13, Ljava/util/zip/ZipInputStream;

    new-instance v14, Ljava/io/BufferedInputStream;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v13, v14}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .local v13, "zis":Ljava/util/zip/ZipInputStream;
    move-object v6, v5

    .line 332
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .local v6, "dest":Ljava/io/BufferedOutputStream;
    :goto_0
    :try_start_1
    invoke-virtual {v13}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v7

    .local v7, "entry":Ljava/util/zip/ZipEntry;
    if-nez v7, :cond_0

    .line 356
    invoke-virtual {v13}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 360
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .end local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_1
    return-void

    .line 336
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_0
    :try_start_2
    new-array v4, v1, [B

    .line 337
    .local v4, "data":[B
    invoke-virtual {v7}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v12

    .line 339
    .local v12, "strEntry":Ljava/lang/String;
    new-instance v9, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v9, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 340
    .local v9, "entryFile":Ljava/io/File;
    new-instance v8, Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v8, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 341
    .local v8, "entryDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_1

    .line 342
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 345
    :cond_1
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 346
    .local v11, "fos":Ljava/io/FileOutputStream;
    new-instance v5, Ljava/io/BufferedOutputStream;

    invoke-direct {v5, v11, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 347
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :goto_2
    const/4 v14, 0x0

    :try_start_3
    invoke-virtual {v13, v4, v14, v1}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v2

    .local v2, "count":I
    const/4 v14, -0x1

    if-ne v2, v14, :cond_2

    .line 350
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 351
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    move-object v6, v5

    .line 352
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_0

    .line 348
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :cond_2
    const/4 v14, 0x0

    invoke-virtual {v5, v4, v14, v2}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 352
    .end local v2    # "count":I
    :catch_0
    move-exception v10

    .line 353
    .end local v4    # "data":[B
    .end local v8    # "entryDir":Ljava/io/File;
    .end local v9    # "entryFile":Ljava/io/File;
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .end local v12    # "strEntry":Ljava/lang/String;
    .local v10, "ex":Ljava/lang/Exception;
    :goto_3
    :try_start_4
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-object v6, v5

    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_0

    .line 357
    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .end local v7    # "entry":Ljava/util/zip/ZipEntry;
    .end local v10    # "ex":Ljava/lang/Exception;
    .end local v13    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    :catch_1
    move-exception v3

    .line 358
    .local v3, "cwj":Ljava/lang/Exception;
    :goto_4
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 357
    .end local v3    # "cwj":Ljava/lang/Exception;
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v13    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_2
    move-exception v3

    move-object v5, v6

    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_4

    .line 352
    .end local v5    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v7    # "entry":Ljava/util/zip/ZipEntry;
    :catch_3
    move-exception v10

    move-object v5, v6

    .end local v6    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "dest":Ljava/io/BufferedOutputStream;
    goto :goto_3
.end method

.method public copyBinFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 72
    const/4 v2, 0x0

    .line 73
    .local v2, "inBuffer":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 75
    .local v3, "outBuffer":Ljava/io/OutputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    .end local v2    # "inBuffer":Ljava/io/InputStream;
    invoke-direct {v2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 76
    .restart local v2    # "inBuffer":Ljava/io/InputStream;
    new-instance v3, Ljava/io/BufferedOutputStream;

    .end local v3    # "outBuffer":Ljava/io/OutputStream;
    invoke-direct {v3, p2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 78
    .restart local v3    # "outBuffer":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 81
    .local v0, "byteData":I
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 82
    const/4 v4, -0x1

    if-ne v0, v4, :cond_2

    .line 90
    if-eqz v2, :cond_0

    .line 91
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 92
    :cond_0
    if-eqz v3, :cond_1

    .line 93
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 98
    :cond_1
    :goto_1
    return-void

    .line 84
    :cond_2
    :try_start_2
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 86
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 90
    if-eqz v2, :cond_3

    .line 91
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 92
    :cond_3
    if-eqz v3, :cond_1

    .line 93
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 94
    :catch_1
    move-exception v1

    .line 95
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 88
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 90
    if-eqz v2, :cond_4

    .line 91
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 92
    :cond_4
    if-eqz v3, :cond_5

    .line 93
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 97
    :cond_5
    :goto_2
    throw v4

    .line 94
    :catch_2
    move-exception v1

    .line 95
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 94
    .end local v1    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 95
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public copyBinFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "fileFromPath"    # Ljava/lang/String;
    .param p2, "fileToPath"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lcom/edutech/mobilestudyclient/util/Utils;->createFileIfNotExist(Ljava/lang/String;)Ljava/io/File;

    .line 55
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 57
    const/4 v1, 0x0

    .line 58
    .local v1, "in":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 61
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .end local v1    # "in":Ljava/io/InputStream;
    .local v2, "in":Ljava/io/InputStream;
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v3    # "out":Ljava/io/OutputStream;
    .local v4, "out":Ljava/io/OutputStream;
    move-object v3, v4

    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    move-object v1, v2

    .line 67
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :goto_0
    invoke-virtual {p0, v1, v3}, Lcom/edutech/mobilestudyclient/util/Utils;->copyBinFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 68
    return-void

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/io/FileNotFoundException;
    :goto_1
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 63
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_1
.end method

.method public copyDictFile(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 6
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "newPath"    # Ljava/lang/String;

    .prologue
    .line 202
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 203
    const/4 v2, 0x0

    .line 204
    .local v2, "bytesum":I
    const/4 v1, 0x0

    .line 206
    .local v1, "byteread":I
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 207
    .local v4, "fs":Ljava/io/FileOutputStream;
    const/16 v5, 0x5a4

    new-array v0, v5, [B

    .line 208
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v5, -0x1

    if-ne v1, v5, :cond_0

    .line 213
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 220
    .end local v0    # "buffer":[B
    .end local v1    # "byteread":I
    .end local v2    # "bytesum":I
    .end local v4    # "fs":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 210
    .restart local v0    # "buffer":[B
    .restart local v1    # "byteread":I
    .restart local v2    # "bytesum":I
    .restart local v4    # "fs":Ljava/io/FileOutputStream;
    :cond_0
    add-int/2addr v2, v1

    .line 211
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 215
    .end local v0    # "buffer":[B
    .end local v1    # "byteread":I
    .end local v2    # "bytesum":I
    .end local v4    # "fs":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    .line 216
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public copyDictUTFFile(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 6
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 225
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 226
    const/4 v2, 0x0

    .line 227
    .local v2, "bytesum":I
    const/4 v1, 0x0

    .line 229
    .local v1, "byteread":I
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 230
    .local v4, "fs":Ljava/io/FileOutputStream;
    const/16 v5, 0x200

    new-array v0, v5, [B

    .line 231
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v5, -0x1

    if-ne v1, v5, :cond_0

    .line 236
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 243
    .end local v0    # "buffer":[B
    .end local v1    # "byteread":I
    .end local v2    # "bytesum":I
    .end local v4    # "fs":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 233
    .restart local v0    # "buffer":[B
    .restart local v1    # "byteread":I
    .restart local v2    # "bytesum":I
    .restart local v4    # "fs":Ljava/io/FileOutputStream;
    :cond_0
    add-int/2addr v2, v1

    .line 234
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 238
    .end local v0    # "buffer":[B
    .end local v1    # "byteread":I
    .end local v2    # "bytesum":I
    .end local v4    # "fs":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    .line 239
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public copyDictUTFFile2(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 12
    .param p1, "inStream"    # Ljava/io/InputStream;
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    .line 271
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 273
    const/4 v0, 0x0

    .line 274
    .local v0, "br":Ljava/io/BufferedReader;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 277
    .local v7, "sb":Ljava/lang/StringBuffer;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "UTF-8"

    invoke-direct {v10, p1, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 279
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "line":Ljava/lang/String;
    if-nez v5, :cond_0

    .line 284
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 285
    .local v4, "file2":Ljava/io/File;
    const/4 v8, 0x0

    .line 287
    .local v8, "writer":Ljava/io/Writer;
    :try_start_2
    new-instance v9, Ljava/io/OutputStreamWriter;

    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string/jumbo v11, "UTF-8"

    invoke-direct {v9, v10, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v8    # "writer":Ljava/io/Writer;
    .local v9, "writer":Ljava/io/Writer;
    move-object v8, v9

    .line 296
    .end local v9    # "writer":Ljava/io/Writer;
    .restart local v8    # "writer":Ljava/io/Writer;
    :goto_1
    :try_start_3
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v6

    .line 299
    .local v6, "s3":Ljava/lang/String;
    :try_start_4
    invoke-virtual {v8, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 305
    :goto_2
    :try_start_5
    invoke-virtual {v8}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 315
    :goto_3
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    move-object v0, v1

    .line 321
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v4    # "file2":Ljava/io/File;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "s3":Ljava/lang/String;
    .end local v8    # "writer":Ljava/io/Writer;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_4
    return-void

    .line 281
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    :cond_0
    :try_start_7
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_0

    .line 311
    .end local v5    # "line":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 312
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    .local v2, "e":Ljava/io/IOException;
    :goto_5
    :try_start_8
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 315
    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1

    goto :goto_4

    .line 316
    :catch_1
    move-exception v2

    .line 317
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 288
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "file2":Ljava/io/File;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v8    # "writer":Ljava/io/Writer;
    :catch_2
    move-exception v3

    .line 290
    .local v3, "e1":Ljava/io/UnsupportedEncodingException;
    :try_start_a
    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_1

    .line 313
    .end local v3    # "e1":Ljava/io/UnsupportedEncodingException;
    .end local v4    # "file2":Ljava/io/File;
    .end local v5    # "line":Ljava/lang/String;
    .end local v8    # "writer":Ljava/io/Writer;
    :catchall_0
    move-exception v10

    move-object v0, v1

    .line 315
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_6
    :try_start_b
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_6

    .line 319
    :goto_7
    throw v10

    .line 291
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "file2":Ljava/io/File;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v8    # "writer":Ljava/io/Writer;
    :catch_3
    move-exception v3

    .line 293
    .local v3, "e1":Ljava/io/FileNotFoundException;
    :try_start_c
    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1

    .line 300
    .end local v3    # "e1":Ljava/io/FileNotFoundException;
    .restart local v6    # "s3":Ljava/lang/String;
    :catch_4
    move-exception v2

    .line 302
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 306
    .end local v2    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v2

    .line 308
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_3

    .line 316
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "file2":Ljava/io/File;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "s3":Ljava/lang/String;
    .end local v8    # "writer":Ljava/io/Writer;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :catch_6
    move-exception v2

    .line 317
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_7

    .line 316
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "file2":Ljava/io/File;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "s3":Ljava/lang/String;
    .restart local v8    # "writer":Ljava/io/Writer;
    :catch_7
    move-exception v2

    .line 317
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_4

    .line 313
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "file2":Ljava/io/File;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "s3":Ljava/lang/String;
    .end local v8    # "writer":Ljava/io/Writer;
    :catchall_1
    move-exception v10

    goto :goto_6

    .line 311
    :catch_8
    move-exception v2

    goto :goto_5
.end method

.method public copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 122
    const/4 v0, 0x0

    .line 123
    .local v0, "br":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 125
    .local v2, "bw":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v6, p1, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v6, Ljava/io/OutputStreamWriter;

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v6, p2, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v6}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_5

    .end local v2    # "bw":Ljava/io/BufferedWriter;
    .local v3, "bw":Ljava/io/BufferedWriter;
    move-object v2, v3

    .end local v3    # "bw":Ljava/io/BufferedWriter;
    .restart local v2    # "bw":Ljava/io/BufferedWriter;
    move-object v0, v1

    .line 132
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_0
    const/4 v4, 0x0

    .line 134
    .local v4, "data":Ljava/lang/String;
    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    if-nez v4, :cond_0

    .line 141
    :try_start_3
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 142
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 147
    :goto_2
    return-void

    .line 127
    .end local v4    # "data":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 129
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    :goto_3
    invoke-virtual {v5}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 135
    .end local v5    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v4    # "data":Ljava/lang/String;
    :cond_0
    :try_start_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 137
    :catch_1
    move-exception v5

    .line 138
    .local v5, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 141
    :try_start_6
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 142
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    .line 143
    :catch_2
    move-exception v5

    .line 144
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 139
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 141
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 142
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    .line 146
    :goto_4
    throw v6

    .line 143
    :catch_3
    move-exception v5

    .line 144
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4

    .line 143
    .end local v5    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v5

    .line 144
    .restart local v5    # "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 127
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "data":Ljava/lang/String;
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_5
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_3
.end method

.method public copyFile(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "targetFilePath"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 109
    const/4 v1, 0x0

    .line 112
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "out":Ljava/io/OutputStream;
    .local v2, "out":Ljava/io/OutputStream;
    move-object v1, v2

    .line 117
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v1    # "out":Ljava/io/OutputStream;
    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/edutech/mobilestudyclient/util/Utils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 118
    return-void

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0
.end method

.method public createFileIfNotExist(Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 174
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 178
    :try_start_0
    new-instance v2, Ljava/io/File;

    const/4 v3, 0x0

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 179
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :cond_0
    :goto_0
    return-object v1

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public createNewFile(Ljava/lang/String;)V
    .locals 2
    .param p1, "targetFilePath"    # Ljava/lang/String;

    .prologue
    .line 155
    invoke-virtual {p0, p1}, Lcom/edutech/mobilestudyclient/util/Utils;->createFileIfNotExist(Ljava/lang/String;)Ljava/io/File;

    .line 158
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .local v1, "targetFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 161
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v0

    .line 163
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public isExist(Ljava/lang/String;)Z
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 188
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 189
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    const/4 v1, 0x1

    .line 192
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public merge([Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 9
    .param p1, "fileNames"    # [Ljava/lang/String;
    .param p2, "TargetFileName"    # Ljava/lang/String;
    .param p3, "mContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p0, p2}, Lcom/edutech/mobilestudyclient/util/Utils;->createNewFile(Ljava/lang/String;)V

    .line 250
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 251
    .local v3, "fout":Ljava/io/File;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 252
    .local v6, "out":Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, p1

    if-lt v4, v7, :cond_0

    .line 262
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 267
    .end local v3    # "fout":Ljava/io/File;
    .end local v4    # "i":I
    .end local v6    # "out":Ljava/io/FileOutputStream;
    :goto_1
    return-void

    .line 254
    .restart local v3    # "fout":Ljava/io/File;
    .restart local v4    # "i":I
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :cond_0
    invoke-virtual {p3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v7

    aget-object v8, p1, v4

    invoke-virtual {v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 256
    .local v5, "in":Ljava/io/InputStream;
    const v7, 0x19000

    new-array v0, v7, [B

    .line 257
    .local v0, "b":[B
    :goto_2
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "c":I
    const/4 v7, -0x1

    if-ne v1, v7, :cond_1

    .line 260
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 252
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 258
    :cond_1
    const/4 v7, 0x0

    invoke-virtual {v6, v0, v7, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 263
    .end local v0    # "b":[B
    .end local v1    # "c":I
    .end local v3    # "fout":Ljava/io/File;
    .end local v4    # "i":I
    .end local v5    # "in":Ljava/io/InputStream;
    .end local v6    # "out":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 265
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
