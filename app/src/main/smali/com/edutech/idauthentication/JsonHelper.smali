.class public Lcom/edutech/idauthentication/JsonHelper;
.super Ljava/lang/Object;
.source "JsonHelper.java"


# static fields
.field public static final ID_XML_File:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 28
    const-string/jumbo v1, "CloudClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 29
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 30
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 31
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "id.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/JsonHelper;->ID_XML_File:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CreateFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "Json"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 813
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 815
    .local v2, "newFile":Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 817
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/FileOutputStream;->write([B)V

    .line 818
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 819
    const/4 v3, 0x1

    .line 833
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :goto_0
    return v3

    .line 820
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v0

    .line 822
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 824
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v0

    .line 826
    .local v0, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 828
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v0

    .line 830
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static alogparserJson(Ljava/lang/String;Ljava/lang/String;Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;
    .locals 20
    .param p0, "StudentId"    # Ljava/lang/String;
    .param p1, "machineId"    # Ljava/lang/String;
    .param p2, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p3, "logjson"    # Ljava/lang/String;

    .prologue
    .line 213
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 262
    :goto_0
    return-object p2

    .line 220
    :cond_0
    :try_start_0
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 221
    .local v17, "object":Lorg/json/JSONObject;
    const-string/jumbo v18, "UserID"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 222
    .local v14, "UserID":Ljava/lang/String;
    const-string/jumbo v18, "Type"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 223
    .local v13, "Type":Ljava/lang/String;
    const-string/jumbo v18, "SubjectID"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 224
    .local v11, "SubjectID":Ljava/lang/String;
    const-string/jumbo v18, "BookID"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 225
    .local v6, "BookID":Ljava/lang/String;
    const-string/jumbo v18, "BookName"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 228
    .local v7, "BookName":Ljava/lang/String;
    const-string/jumbo v18, "SectionsID"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 229
    .local v10, "SectionsID":Ljava/lang/String;
    const-string/jumbo v18, "AssetsID"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "AssetsID":Ljava/lang/String;
    const-string/jumbo v18, "AssetsName"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 231
    .local v5, "AssetsName":Ljava/lang/String;
    const-string/jumbo v18, "FirstTime"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 232
    .local v8, "FirstTime":Ljava/lang/String;
    const-string/jumbo v18, "LastTime"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 233
    .local v9, "LastTime":Ljava/lang/String;
    const-string/jumbo v18, "TotalTime"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 234
    .local v12, "TotalTime":Ljava/lang/String;
    const-string/jumbo v18, "VisitCount"

    invoke-static/range {v17 .. v18}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 235
    .local v15, "VisitCount":Ljava/lang/String;
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 236
    const-string/jumbo v12, "0"

    .line 237
    :cond_1
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 238
    const-string/jumbo v15, "0"

    .line 239
    :cond_2
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_3

    const-string/jumbo v18, "NULL"

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 240
    :cond_3
    move-object/from16 v14, p0

    .line 241
    :cond_4
    const-string/jumbo v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_5

    const-string/jumbo v18, "NULL"

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 242
    :cond_5
    invoke-static {}, Lcom/edutech/idauthentication/SystemTimeHelper;->getTheSystemTime()Ljava/lang/String;

    move-result-object v8

    .line 243
    :cond_6
    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/edutech/idauthentication/LogInfo;->setUserID(Ljava/lang/String;)V

    .line 244
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setMachineID(Ljava/lang/String;)V

    .line 245
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/edutech/idauthentication/LogInfo;->setType(Ljava/lang/String;)V

    .line 246
    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lcom/edutech/idauthentication/LogInfo;->setSubjectID(Ljava/lang/String;)V

    .line 247
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Lcom/edutech/idauthentication/LogInfo;->setBookID(Ljava/lang/String;)V

    .line 248
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lcom/edutech/idauthentication/LogInfo;->setBookName(Ljava/lang/String;)V

    .line 249
    invoke-static {v10}, Lcom/edutech/idauthentication/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setSectionsID(Ljava/util/ArrayList;)V

    .line 252
    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lcom/edutech/idauthentication/LogInfo;->setAssetsID(Ljava/lang/String;)V

    .line 253
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Lcom/edutech/idauthentication/LogInfo;->setAssetsName(Ljava/lang/String;)V

    .line 254
    move-object/from16 v0, p2

    invoke-virtual {v0, v8}, Lcom/edutech/idauthentication/LogInfo;->setFirstTime(Ljava/lang/String;)V

    .line 255
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Lcom/edutech/idauthentication/LogInfo;->setLastTime(Ljava/lang/String;)V

    .line 256
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-object/from16 v0, p2

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lcom/edutech/idauthentication/LogInfo;->setTotalTime(J)V

    .line 257
    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    move-object/from16 v0, p2

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lcom/edutech/idauthentication/LogInfo;->setVisitCount(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 258
    .end local v4    # "AssetsID":Ljava/lang/String;
    .end local v5    # "AssetsName":Ljava/lang/String;
    .end local v6    # "BookID":Ljava/lang/String;
    .end local v7    # "BookName":Ljava/lang/String;
    .end local v8    # "FirstTime":Ljava/lang/String;
    .end local v9    # "LastTime":Ljava/lang/String;
    .end local v10    # "SectionsID":Ljava/lang/String;
    .end local v11    # "SubjectID":Ljava/lang/String;
    .end local v12    # "TotalTime":Ljava/lang/String;
    .end local v13    # "Type":Ljava/lang/String;
    .end local v14    # "UserID":Ljava/lang/String;
    .end local v15    # "VisitCount":Ljava/lang/String;
    .end local v17    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v16

    .line 260
    .local v16, "e":Ljava/lang/Exception;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static dataCreate(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 728
    .local p0, "dataInfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v4, Lorg/json/JSONStringer;

    invoke-direct {v4}, Lorg/json/JSONStringer;-><init>()V

    .line 730
    .local v4, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 731
    const-string/jumbo v5, "data"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 732
    invoke-virtual {v4}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 733
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v3, v5, :cond_1

    .line 746
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 747
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 753
    .end local v3    # "i":I
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "apk.json"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 754
    .local v1, "apkpath":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 755
    .local v0, "apkJsonFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 756
    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 758
    :cond_0
    invoke-virtual {v4}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v1}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 765
    return-void

    .line 734
    .end local v0    # "apkJsonFile":Ljava/io/File;
    .end local v1    # "apkpath":Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 735
    const-string/jumbo v5, "appname"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "appname"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 736
    const-string/jumbo v5, "packagename"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "packagename"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 737
    const-string/jumbo v5, "versioncode"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "versioncode"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 738
    const-string/jumbo v5, "versionname"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "versionname"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 739
    const-string/jumbo v5, "appwebpath"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "appwebpath"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 740
    const-string/jumbo v6, ""

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "is_down_finish"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 741
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v6, "is_down_finish"

    const-string/jumbo v7, "0"

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 743
    :cond_2
    const-string/jumbo v5, "is_down_finish"

    invoke-virtual {v4, v5}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    const-string/jumbo v7, "is_down_finish"

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/JsonHelper;->getDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 744
    invoke-virtual {v4}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 733
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 749
    .end local v3    # "i":I
    :catch_0
    move-exception v2

    .line 751
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public static dataParse(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 17
    .param p1, "json"    # Ljava/lang/String;
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
    .line 662
    .local p0, "dataInfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    :try_start_0
    new-instance v8, Lorg/json/JSONTokener;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 663
    .local v8, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v8}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;

    .line 664
    .local v7, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v14, "status"

    invoke-static {v7, v14}, Lcom/edutech/idauthentication/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v12

    .line 665
    .local v12, "status":Z
    const-string/jumbo v14, "errorNum"

    invoke-static {v7, v14}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v4

    .line 666
    .local v4, "errorNum":I
    const-string/jumbo v14, "errorInfo"

    invoke-static {v7, v14}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 668
    .local v3, "errorInfo":Ljava/lang/String;
    if-eqz v12, :cond_0

    if-nez v4, :cond_0

    const-string/jumbo v14, ""

    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 670
    const-string/jumbo v14, "data"

    invoke-virtual {v7, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 671
    .local v1, "array":Lorg/json/JSONArray;
    const-string/jumbo v14, "apkUpdate"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "jsonAppInfoList = "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lt v5, v14, :cond_1

    .line 724
    .end local v1    # "array":Lorg/json/JSONArray;
    .end local v3    # "errorInfo":Ljava/lang/String;
    .end local v4    # "errorNum":I
    .end local v5    # "i":I
    .end local v7    # "jsonObject":Lorg/json/JSONObject;
    .end local v8    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v12    # "status":Z
    :cond_0
    :goto_1
    return-object p0

    .line 675
    .restart local v1    # "array":Lorg/json/JSONArray;
    .restart local v3    # "errorInfo":Ljava/lang/String;
    .restart local v4    # "errorNum":I
    .restart local v5    # "i":I
    .restart local v7    # "jsonObject":Lorg/json/JSONObject;
    .restart local v8    # "jsonTokener":Lorg/json/JSONTokener;
    .restart local v12    # "status":Z
    :cond_1
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 686
    .local v11, "object":Lorg/json/JSONObject;
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 687
    .local v13, "tempdatainfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v11, :cond_3

    .line 689
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v9

    .line 690
    .local v9, "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-nez v14, :cond_4

    .line 709
    .end local v9    # "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    const-string/jumbo v14, "is_down_finish"

    const-string/jumbo v15, "0"

    invoke-virtual {v13, v14, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 673
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 691
    .restart local v9    # "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 692
    .local v10, "keyStr":Ljava/lang/String;
    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 693
    .local v6, "itemObject":Ljava/lang/Object;
    if-eqz v6, :cond_2

    .line 695
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v10, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 715
    .end local v1    # "array":Lorg/json/JSONArray;
    .end local v3    # "errorInfo":Ljava/lang/String;
    .end local v4    # "errorNum":I
    .end local v5    # "i":I
    .end local v6    # "itemObject":Ljava/lang/Object;
    .end local v7    # "jsonObject":Lorg/json/JSONObject;
    .end local v8    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v9    # "keyIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v10    # "keyStr":Ljava/lang/String;
    .end local v11    # "object":Lorg/json/JSONObject;
    .end local v12    # "status":Z
    .end local v13    # "tempdatainfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 718
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 719
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 721
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 867
    const/4 v0, 0x0

    .line 868
    .local v0, "Name":Z
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 872
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 887
    :goto_0
    return v0

    .line 874
    :catch_0
    move-exception v1

    .line 876
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 877
    const/4 v0, 0x0

    goto :goto_0

    .line 878
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 880
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 884
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getDefault(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 768
    if-nez p0, :cond_0

    .line 769
    const-string/jumbo p0, ""

    .line 770
    :cond_0
    return-object p0
.end method

.method public static getExamLog(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/edutech/idauthentication/LogInfo;
    .locals 2
    .param p0, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p1, "MachineID"    # Ljava/lang/String;
    .param p2, "Type"    # Ljava/lang/String;
    .param p3, "UserID"    # Ljava/lang/String;
    .param p4, "SubjectID"    # Ljava/lang/String;
    .param p5, "BookID"    # Ljava/lang/String;
    .param p6, "BookName"    # Ljava/lang/String;
    .param p7, "AssetsID"    # Ljava/lang/String;
    .param p8, "AssetsName"    # Ljava/lang/String;

    .prologue
    .line 268
    invoke-static {p3}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setUserID(Ljava/lang/String;)V

    .line 269
    invoke-static {p1}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setMachineID(Ljava/lang/String;)V

    .line 270
    invoke-static {p2}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setType(Ljava/lang/String;)V

    .line 271
    invoke-static {p4}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setSubjectID(Ljava/lang/String;)V

    .line 272
    invoke-static {p5}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setBookID(Ljava/lang/String;)V

    .line 273
    invoke-static {p6}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setBookName(Ljava/lang/String;)V

    .line 274
    invoke-static {p7}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setAssetsID(Ljava/lang/String;)V

    .line 275
    invoke-static {p8}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setAssetsName(Ljava/lang/String;)V

    .line 276
    invoke-static {}, Lcom/edutech/idauthentication/SystemTimeHelper;->getTheSystemTime()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setFirstTime(Ljava/lang/String;)V

    .line 277
    const-string/jumbo v0, ""

    invoke-static {v0}, Lcom/edutech/idauthentication/JsonHelper;->setDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/edutech/idauthentication/LogInfo;->setLastTime(Ljava/lang/String;)V

    .line 278
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setTotalTime(J)V

    .line 279
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setVisitCount(J)V

    .line 281
    return-object p0
.end method

.method public static getFileString(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 779
    const-string/jumbo v5, ""

    .line 780
    .local v5, "res":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 781
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    move-object v6, v5

    .line 802
    :goto_0
    return-object v6

    .line 784
    :cond_0
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 788
    .local v3, "fin":Ljava/io/FileInputStream;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    move-result v4

    .line 789
    .local v4, "length":I
    new-array v0, v4, [B

    .line 790
    .local v0, "buffer":[B
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    .line 791
    const-string/jumbo v6, "UTF-8"

    invoke-static {v0, v6}, Lorg/apache/http/util/EncodingUtils;->getString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 792
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 797
    .end local v0    # "buffer":[B
    .end local v3    # "fin":Ljava/io/FileInputStream;
    .end local v4    # "length":I
    :goto_1
    if-nez v5, :cond_1

    .line 799
    const-string/jumbo v6, ""

    goto :goto_0

    .line 793
    :catch_0
    move-exception v1

    .line 795
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    move-object v6, v5

    .line 802
    goto :goto_0
.end method

.method public static getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 896
    const/4 v0, 0x0

    .line 897
    .local v0, "Name":I
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 901
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v0

    .line 916
    :goto_0
    return v0

    .line 903
    :catch_0
    move-exception v1

    .line 905
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 906
    const/4 v0, 0x0

    goto :goto_0

    .line 907
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 909
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 913
    .end local v1    # "e":Ljava/lang/Exception;
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
    .line 948
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 953
    .local v3, "temparray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 956
    .local v1, "jsonarray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 971
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :goto_1
    return-object v3

    .line 958
    .restart local v1    # "jsonarray":Lorg/json/JSONArray;
    .restart local v2    # "k":I
    :cond_0
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 956
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 962
    .end local v1    # "jsonarray":Lorg/json/JSONArray;
    .end local v2    # "k":I
    :catch_0
    move-exception v0

    .line 964
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 965
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 967
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static getLongPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;
    .locals 4
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 925
    const-wide/16 v0, 0x0

    .line 926
    .local v0, "Name":J
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 930
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-wide v0

    .line 945
    :goto_0
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    return-object v3

    .line 932
    :catch_0
    move-exception v2

    .line 934
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 935
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 936
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 938
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 942
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public static getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 842
    const-string/jumbo v0, ""

    .line 843
    .local v0, "Name":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 847
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 858
    :goto_0
    return-object v0

    .line 849
    :catch_0
    move-exception v1

    .line 851
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 852
    const-string/jumbo v0, ""

    .line 854
    goto :goto_0

    .line 855
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static getStringJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string/jumbo v1, ""

    .line 85
    .local v1, "idjson":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 86
    .local v3, "idxmljson":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 90
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v1

    .line 100
    .end local v1    # "idjson":Ljava/lang/String;
    .local v2, "idjson":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 92
    .end local v2    # "idjson":Ljava/lang/String;
    .restart local v1    # "idjson":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v1

    .line 95
    .end local v1    # "idjson":Ljava/lang/String;
    .restart local v2    # "idjson":Ljava/lang/String;
    goto :goto_0

    .line 99
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "idjson":Ljava/lang/String;
    .restart local v1    # "idjson":Ljava/lang/String;
    :cond_0
    invoke-static {p0}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    .line 100
    .end local v1    # "idjson":Ljava/lang/String;
    .restart local v2    # "idjson":Ljava/lang/String;
    goto :goto_0
.end method

.method public static idXmlCreate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .param p0, "username"    # Ljava/lang/String;
    .param p1, "stuId"    # Ljava/lang/String;

    .prologue
    .line 109
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    const-string/jumbo v12, ""

    invoke-virtual {v12, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    const-string/jumbo v12, ""

    invoke-virtual {v12, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 110
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v11, "usernamelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v10, "stuidlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 113
    .local v4, "isexistuser":Z
    sget-object v12, Lcom/edutech/idauthentication/JsonHelper;->ID_XML_File:Ljava/lang/String;

    invoke-static {v12}, Lcom/edutech/idauthentication/JsonHelper;->getStringJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 114
    .local v3, "idjson":Ljava/lang/String;
    const-string/jumbo v12, ""

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 116
    if-nez v4, :cond_0

    .line 118
    invoke-virtual {v11, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    :cond_0
    invoke-static {v11, v10}, Lcom/edutech/idauthentication/JsonHelper;->idXmlFileCreate(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 167
    .end local v3    # "idjson":Ljava/lang/String;
    .end local v4    # "isexistuser":Z
    .end local v10    # "stuidlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v11    # "usernamelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    :goto_0
    return-void

    .line 126
    .restart local v3    # "idjson":Ljava/lang/String;
    .restart local v4    # "isexistuser":Z
    .restart local v10    # "stuidlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v11    # "usernamelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    :try_start_0
    new-instance v7, Lorg/json/JSONTokener;

    invoke-direct {v7, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 127
    .local v7, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v7}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    .line 128
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v12, "data"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 130
    .local v0, "array":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lt v2, v12, :cond_4

    .line 148
    if-nez v4, :cond_3

    .line 150
    invoke-virtual {v11, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    :cond_3
    invoke-static {v11, v10}, Lcom/edutech/idauthentication/JsonHelper;->idXmlFileCreate(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 154
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "jsonTokener":Lorg/json/JSONTokener;
    :catch_0
    move-exception v1

    .line 156
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 132
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v2    # "i":I
    .restart local v5    # "jsonObject":Lorg/json/JSONObject;
    .restart local v7    # "jsonTokener":Lorg/json/JSONTokener;
    :cond_4
    :try_start_1
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 133
    .local v9, "object":Lorg/json/JSONObject;
    const-string/jumbo v12, "username"

    invoke-static {v9, v12}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 134
    .local v8, "jsonUserName":Ljava/lang/String;
    const-string/jumbo v12, "stuid"

    invoke-static {v9, v12}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 135
    .local v6, "jsonStuId":Ljava/lang/String;
    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 136
    const/4 v4, 0x1

    .line 137
    invoke-virtual {v11, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    invoke-virtual {v10, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 142
    :cond_5
    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public static idXmlFileCreate(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "usernamelist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p1, "stuidlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Lorg/json/JSONStringer;

    invoke-direct {v2}, Lorg/json/JSONStringer;-><init>()V

    .line 178
    .local v2, "jsonStringer":Lorg/json/JSONStringer;
    :try_start_0
    invoke-virtual {v2}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 179
    const-string/jumbo v3, "data"

    invoke-virtual {v2, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 180
    invoke-virtual {v2}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 181
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lt v1, v3, :cond_1

    .line 187
    :cond_0
    invoke-virtual {v2}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 188
    invoke-virtual {v2}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .end local v1    # "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/edutech/idauthentication/JsonHelper;->ID_XML_File:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 203
    return-void

    .line 182
    .restart local v1    # "i":I
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 183
    const-string/jumbo v3, "username"

    invoke-virtual {v2, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v3

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 184
    const-string/jumbo v3, "stuid"

    invoke-virtual {v2, v3}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v3

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 185
    invoke-virtual {v2}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    .end local v1    # "i":I
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static idXmlParse(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p0, "userName"    # Ljava/lang/String;

    .prologue
    .line 39
    const-string/jumbo v8, "-1"

    .line 40
    .local v8, "stuId":Ljava/lang/String;
    if-nez p0, :cond_0

    move-object v9, v8

    .line 81
    .end local v8    # "stuId":Ljava/lang/String;
    .local v9, "stuId":Ljava/lang/String;
    :goto_0
    return-object v9

    .line 44
    .end local v9    # "stuId":Ljava/lang/String;
    .restart local v8    # "stuId":Ljava/lang/String;
    :cond_0
    const-string/jumbo v10, ""

    invoke-virtual {v10, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    move-object v9, v8

    .line 46
    .end local v8    # "stuId":Ljava/lang/String;
    .restart local v9    # "stuId":Ljava/lang/String;
    goto :goto_0

    .line 49
    .end local v9    # "stuId":Ljava/lang/String;
    .restart local v8    # "stuId":Ljava/lang/String;
    :cond_1
    sget-object v10, Lcom/edutech/idauthentication/JsonHelper;->ID_XML_File:Ljava/lang/String;

    invoke-static {v10}, Lcom/edutech/idauthentication/JsonHelper;->getStringJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "idjson":Ljava/lang/String;
    const-string/jumbo v10, ""

    invoke-virtual {v10, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    move-object v9, v8

    .line 53
    .end local v8    # "stuId":Ljava/lang/String;
    .restart local v9    # "stuId":Ljava/lang/String;
    goto :goto_0

    .line 58
    .end local v9    # "stuId":Ljava/lang/String;
    .restart local v8    # "stuId":Ljava/lang/String;
    :cond_2
    :try_start_0
    new-instance v5, Lorg/json/JSONTokener;

    invoke-direct {v5, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 59
    .local v5, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v5}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 60
    .local v4, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v10, "data"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 62
    .local v0, "array":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lt v2, v10, :cond_3

    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .end local v5    # "jsonTokener":Lorg/json/JSONTokener;
    :goto_2
    move-object v9, v8

    .line 81
    .end local v8    # "stuId":Ljava/lang/String;
    .restart local v9    # "stuId":Ljava/lang/String;
    goto :goto_0

    .line 64
    .end local v9    # "stuId":Ljava/lang/String;
    .restart local v0    # "array":Lorg/json/JSONArray;
    .restart local v2    # "i":I
    .restart local v4    # "jsonObject":Lorg/json/JSONObject;
    .restart local v5    # "jsonTokener":Lorg/json/JSONTokener;
    .restart local v8    # "stuId":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 65
    .local v7, "object":Lorg/json/JSONObject;
    const-string/jumbo v10, "username"

    invoke-static {v7, v10}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 66
    .local v6, "jsonUserName":Ljava/lang/String;
    invoke-virtual {p0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 68
    const-string/jumbo v10, "stuid"

    invoke-static {v7, v10}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    move-object v9, v8

    .line 69
    .end local v8    # "stuId":Ljava/lang/String;
    .restart local v9    # "stuId":Ljava/lang/String;
    goto :goto_0

    .line 62
    .end local v9    # "stuId":Ljava/lang/String;
    .restart local v8    # "stuId":Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 74
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .end local v5    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v6    # "jsonUserName":Ljava/lang/String;
    .end local v7    # "object":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public static logscreateJson(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 24
    .param p0, "logInfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p1, "logPath"    # Ljava/lang/String;

    .prologue
    .line 382
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 385
    .local v21, "logs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/idauthentication/LogInfo;>;"
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/edutech/idauthentication/JsonHelper;->updateLogInfo(Ljava/util/ArrayList;Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v21

    .line 387
    new-instance v19, Lorg/json/JSONStringer;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONStringer;-><init>()V

    .line 388
    .local v19, "jsonStringer":Lorg/json/JSONStringer;
    const-string/jumbo v10, ""

    .line 389
    .local v10, "MachineID":Ljava/lang/String;
    const-string/jumbo v15, ""

    .line 390
    .local v15, "UserID":Ljava/lang/String;
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v22

    if-lez v22, :cond_0

    .line 391
    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/edutech/idauthentication/LogInfo;

    invoke-virtual/range {v22 .. v22}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v15

    .line 392
    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/edutech/idauthentication/LogInfo;

    invoke-virtual/range {v22 .. v22}, Lcom/edutech/idauthentication/LogInfo;->getMachineID()Ljava/lang/String;

    move-result-object v10

    .line 395
    :cond_0
    :try_start_0
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 396
    const-string/jumbo v22, "UserID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 397
    const-string/jumbo v22, "MachineID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 398
    const-string/jumbo v22, "data"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 399
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 400
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_0
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v22

    move/from16 v0, v18

    move/from16 v1, v22

    if-lt v0, v1, :cond_1

    .line 432
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 433
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 439
    .end local v18    # "i":I
    :goto_1
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v22

    return-object v22

    .line 401
    .restart local v18    # "i":I
    :cond_1
    :try_start_1
    move-object/from16 v0, v21

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/edutech/idauthentication/LogInfo;

    .line 402
    .local v20, "loginfo":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->object()Lorg/json/JSONStringer;

    .line 403
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v14

    .line 404
    .local v14, "Type":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getSubjectID()Ljava/lang/String;

    move-result-object v12

    .line 405
    .local v12, "SubjectID":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getBookID()Ljava/lang/String;

    move-result-object v6

    .line 406
    .local v6, "BookID":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getBookName()Ljava/lang/String;

    move-result-object v7

    .line 407
    .local v7, "BookName":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getSectionsID()Ljava/util/ArrayList;

    move-result-object v11

    .line 410
    .local v11, "SectionsID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v4

    .line 411
    .local v4, "AssetsID":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getAssetsName()Ljava/lang/String;

    move-result-object v5

    .line 412
    .local v5, "AssetsName":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getFirstTime()Ljava/lang/String;

    move-result-object v8

    .line 413
    .local v8, "FirstTime":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getLastTime()Ljava/lang/String;

    move-result-object v9

    .line 414
    .local v9, "LastTime":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getTotalTime()J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    .line 415
    .local v13, "TotalTime":Ljava/lang/String;
    invoke-virtual/range {v20 .. v20}, Lcom/edutech/idauthentication/LogInfo;->getVisitCount()J

    move-result-wide v22

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    .line 417
    .local v16, "VisitCount":Ljava/lang/String;
    const-string/jumbo v22, "Type"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 418
    const-string/jumbo v22, "SubjectID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 419
    const-string/jumbo v22, "BookID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 420
    const-string/jumbo v22, "BookName"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 421
    const-string/jumbo v22, "SectionsID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-static {v0, v11, v1}, Lcom/edutech/idauthentication/JsonHelper;->setJsonArray(Lorg/json/JSONStringer;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 424
    const-string/jumbo v22, "AssetsID"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 425
    const-string/jumbo v22, "AssetsName"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 426
    const-string/jumbo v22, "FirstTime"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 427
    const-string/jumbo v22, "LastTime"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 428
    const-string/jumbo v22, "TotalTime"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 429
    const-string/jumbo v22, "VisitCount"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;

    .line 430
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONStringer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 400
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_0

    .line 435
    .end local v4    # "AssetsID":Ljava/lang/String;
    .end local v5    # "AssetsName":Ljava/lang/String;
    .end local v6    # "BookID":Ljava/lang/String;
    .end local v7    # "BookName":Ljava/lang/String;
    .end local v8    # "FirstTime":Ljava/lang/String;
    .end local v9    # "LastTime":Ljava/lang/String;
    .end local v11    # "SectionsID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "SubjectID":Ljava/lang/String;
    .end local v13    # "TotalTime":Ljava/lang/String;
    .end local v14    # "Type":Ljava/lang/String;
    .end local v16    # "VisitCount":Ljava/lang/String;
    .end local v18    # "i":I
    .end local v20    # "loginfo":Lcom/edutech/idauthentication/LogInfo;
    :catch_0
    move-exception v17

    .line 437
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1
.end method

.method public static logsparserJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 28
    .param p1, "logPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/idauthentication/LogInfo;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/idauthentication/LogInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "logs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/idauthentication/LogInfo;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    .line 305
    new-instance v24, Ljava/io/File;

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 306
    .local v24, "logjson":Ljava/io/File;
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->exists()Z

    move-result v26

    if-nez v26, :cond_1

    .line 308
    :try_start_0
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 370
    :cond_0
    :goto_0
    return-object p0

    .line 310
    :catch_0
    move-exception v18

    .line 312
    .local v18, "e":Ljava/io/IOException;
    invoke-virtual/range {v18 .. v18}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 316
    .end local v18    # "e":Ljava/io/IOException;
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 318
    .local v20, "json":Ljava/lang/String;
    const-string/jumbo v26, ""

    move-object/from16 v0, v26

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-nez v26, :cond_0

    .line 322
    :try_start_1
    new-instance v22, Lorg/json/JSONTokener;

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 323
    .local v22, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/json/JSONObject;

    .line 324
    .local v21, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v26, "UserID"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 325
    .local v15, "UserID":Ljava/lang/String;
    const-string/jumbo v26, "MachineID"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 326
    .local v10, "MachineID":Ljava/lang/String;
    const-string/jumbo v26, "data"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 328
    .local v17, "array":Lorg/json/JSONArray;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v19

    move/from16 v1, v26

    if-ge v0, v1, :cond_0

    .line 329
    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v25

    .line 330
    .local v25, "object":Lorg/json/JSONObject;
    new-instance v23, Lcom/edutech/idauthentication/LogInfo;

    invoke-direct/range {v23 .. v23}, Lcom/edutech/idauthentication/LogInfo;-><init>()V

    .line 331
    .local v23, "loginfo":Lcom/edutech/idauthentication/LogInfo;
    const-string/jumbo v26, "Type"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 332
    .local v14, "Type":Ljava/lang/String;
    const-string/jumbo v26, "SubjectID"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 333
    .local v12, "SubjectID":Ljava/lang/String;
    const-string/jumbo v26, "BookID"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 334
    .local v6, "BookID":Ljava/lang/String;
    const-string/jumbo v26, "BookName"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 335
    .local v7, "BookName":Ljava/lang/String;
    const-string/jumbo v26, "SectionsID"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 338
    .local v11, "SectionsID":Ljava/lang/String;
    const-string/jumbo v26, "AssetsID"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 339
    .local v4, "AssetsID":Ljava/lang/String;
    const-string/jumbo v26, "AssetsName"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 340
    .local v5, "AssetsName":Ljava/lang/String;
    const-string/jumbo v26, "FirstTime"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 341
    .local v8, "FirstTime":Ljava/lang/String;
    const-string/jumbo v26, "LastTime"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 342
    .local v9, "LastTime":Ljava/lang/String;
    const-string/jumbo v26, "TotalTime"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 343
    .local v13, "TotalTime":Ljava/lang/String;
    const-string/jumbo v26, "VisitCount"

    invoke-static/range {v25 .. v26}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 344
    .local v16, "VisitCount":Ljava/lang/String;
    const-string/jumbo v26, ""

    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_2

    .line 345
    const-string/jumbo v13, "0"

    .line 346
    :cond_2
    const-string/jumbo v26, ""

    move-object/from16 v0, v26

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_3

    .line 347
    const-string/jumbo v16, "0"

    .line 349
    :cond_3
    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Lcom/edutech/idauthentication/LogInfo;->setUserID(Ljava/lang/String;)V

    .line 350
    move-object/from16 v0, v23

    invoke-virtual {v0, v10}, Lcom/edutech/idauthentication/LogInfo;->setMachineID(Ljava/lang/String;)V

    .line 351
    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Lcom/edutech/idauthentication/LogInfo;->setType(Ljava/lang/String;)V

    .line 352
    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Lcom/edutech/idauthentication/LogInfo;->setSubjectID(Ljava/lang/String;)V

    .line 353
    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Lcom/edutech/idauthentication/LogInfo;->setBookID(Ljava/lang/String;)V

    .line 354
    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lcom/edutech/idauthentication/LogInfo;->setBookName(Ljava/lang/String;)V

    .line 355
    invoke-static {v11}, Lcom/edutech/idauthentication/JsonHelper;->getJsonArray(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v26

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setSectionsID(Ljava/util/ArrayList;)V

    .line 358
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lcom/edutech/idauthentication/LogInfo;->setAssetsID(Ljava/lang/String;)V

    .line 359
    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Lcom/edutech/idauthentication/LogInfo;->setAssetsName(Ljava/lang/String;)V

    .line 360
    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lcom/edutech/idauthentication/LogInfo;->setFirstTime(Ljava/lang/String;)V

    .line 361
    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Lcom/edutech/idauthentication/LogInfo;->setLastTime(Ljava/lang/String;)V

    .line 362
    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v26

    move-object/from16 v0, v23

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/edutech/idauthentication/LogInfo;->setTotalTime(J)V

    .line 363
    invoke-static/range {v16 .. v16}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v26

    move-object/from16 v0, v23

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lcom/edutech/idauthentication/LogInfo;->setVisitCount(J)V

    .line 364
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 328
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_1

    .line 366
    .end local v4    # "AssetsID":Ljava/lang/String;
    .end local v5    # "AssetsName":Ljava/lang/String;
    .end local v6    # "BookID":Ljava/lang/String;
    .end local v7    # "BookName":Ljava/lang/String;
    .end local v8    # "FirstTime":Ljava/lang/String;
    .end local v9    # "LastTime":Ljava/lang/String;
    .end local v10    # "MachineID":Ljava/lang/String;
    .end local v11    # "SectionsID":Ljava/lang/String;
    .end local v12    # "SubjectID":Ljava/lang/String;
    .end local v13    # "TotalTime":Ljava/lang/String;
    .end local v14    # "Type":Ljava/lang/String;
    .end local v15    # "UserID":Ljava/lang/String;
    .end local v16    # "VisitCount":Ljava/lang/String;
    .end local v17    # "array":Lorg/json/JSONArray;
    .end local v19    # "i":I
    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    .end local v22    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v23    # "loginfo":Lcom/edutech/idauthentication/LogInfo;
    .end local v25    # "object":Lorg/json/JSONObject;
    :catch_1
    move-exception v18

    .line 368
    .local v18, "e":Ljava/lang/Exception;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static parseHttpPostReturnJson(Ljava/lang/String;)I
    .locals 12
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 574
    const-string/jumbo v11, ""

    invoke-virtual {v11, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 615
    :cond_0
    :goto_0
    return v6

    .line 579
    :cond_1
    :try_start_0
    new-instance v4, Lorg/json/JSONTokener;

    invoke-direct {v4, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 580
    .local v4, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v4}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    .line 581
    .local v3, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v11, "status"

    invoke-static {v3, v11}, Lcom/edutech/idauthentication/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v5

    .line 582
    .local v5, "status":Z
    const-string/jumbo v11, "errorNum"

    invoke-static {v3, v11}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v2

    .line 583
    .local v2, "errorNum":I
    const-string/jumbo v11, "errorInfo"

    invoke-static {v3, v11}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 588
    .local v1, "errorInfo":Ljava/lang/String;
    if-eqz v5, :cond_2

    if-nez v2, :cond_2

    const-string/jumbo v11, ""

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v11

    if-nez v11, :cond_0

    .line 592
    :cond_2
    if-nez v5, :cond_3

    if-ne v2, v7, :cond_3

    move v6, v7

    .line 594
    goto :goto_0

    .line 595
    :cond_3
    if-nez v5, :cond_4

    if-ne v2, v8, :cond_4

    move v6, v8

    .line 597
    goto :goto_0

    .line 598
    :cond_4
    if-nez v5, :cond_5

    if-ne v2, v9, :cond_5

    move v6, v9

    .line 600
    goto :goto_0

    .line 601
    :cond_5
    if-nez v5, :cond_6

    if-ne v2, v10, :cond_6

    move v6, v10

    .line 603
    goto :goto_0

    .line 606
    :cond_6
    const/4 v6, -0x1

    goto :goto_0

    .line 608
    .end local v1    # "errorInfo":Ljava/lang/String;
    .end local v2    # "errorNum":I
    .end local v3    # "jsonObject":Lorg/json/JSONObject;
    .end local v4    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v5    # "status":Z
    :catch_0
    move-exception v0

    .line 610
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 612
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 614
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static parseSetPwdReturnJson(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 625
    const-string/jumbo v9, "strResult"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "parseHttpPostReturnJson:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    const-string/jumbo v6, ""

    .line 627
    .local v6, "password":Ljava/lang/String;
    const-string/jumbo v9, ""

    invoke-virtual {v9, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    move-object v7, v6

    .line 656
    .end local v6    # "password":Ljava/lang/String;
    .local v7, "password":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 632
    .end local v7    # "password":Ljava/lang/String;
    .restart local v6    # "password":Ljava/lang/String;
    :cond_0
    :try_start_0
    new-instance v5, Lorg/json/JSONTokener;

    invoke-direct {v5, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 633
    .local v5, "jsonTokener":Lorg/json/JSONTokener;
    invoke-virtual {v5}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 634
    .local v4, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v9, "status"

    invoke-static {v4, v9}, Lcom/edutech/idauthentication/JsonHelper;->getBooleanPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v8

    .line 635
    .local v8, "status":Z
    const-string/jumbo v9, "errorNum"

    invoke-static {v4, v9}, Lcom/edutech/idauthentication/JsonHelper;->getIntPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v3

    .line 636
    .local v3, "errorNum":I
    const-string/jumbo v9, "errorInfo"

    invoke-static {v4, v9}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 637
    .local v2, "errorInfo":Ljava/lang/String;
    const-string/jumbo v9, "data"

    invoke-static {v4, v9}, Lcom/edutech/idauthentication/JsonHelper;->getPropertyName(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 642
    .local v0, "data":Ljava/lang/String;
    if-eqz v8, :cond_1

    if-nez v3, :cond_1

    const-string/jumbo v9, ""

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v9

    if-eqz v9, :cond_1

    .line 643
    move-object v6, v0

    move-object v7, v6

    .line 644
    .end local v6    # "password":Ljava/lang/String;
    .restart local v7    # "password":Ljava/lang/String;
    goto :goto_0

    .line 647
    .end local v0    # "data":Ljava/lang/String;
    .end local v2    # "errorInfo":Ljava/lang/String;
    .end local v3    # "errorNum":I
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .end local v5    # "jsonTokener":Lorg/json/JSONTokener;
    .end local v7    # "password":Ljava/lang/String;
    .end local v8    # "status":Z
    .restart local v6    # "password":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 649
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_1
    move-object v7, v6

    .line 656
    .end local v6    # "password":Ljava/lang/String;
    .restart local v7    # "password":Ljava/lang/String;
    goto :goto_0

    .line 651
    .end local v7    # "password":Ljava/lang/String;
    .restart local v6    # "password":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 653
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private static setDefault(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "strDate"    # Ljava/lang/String;

    .prologue
    .line 289
    const-string/jumbo v0, "NULL"

    .line 290
    .local v0, "strdefault":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 294
    .end local v0    # "strdefault":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "strdefault":Ljava/lang/String;
    :cond_0
    move-object v0, p0

    goto :goto_0
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
    .line 976
    .local p1, "arraylist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 979
    .local v0, "arraylistsize":I
    :try_start_0
    invoke-virtual {p0, p2}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONStringer;

    .line 980
    invoke-virtual {p0}, Lorg/json/JSONStringer;->array()Lorg/json/JSONStringer;

    .line 981
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-lt v2, v0, :cond_0

    .line 984
    invoke-virtual {p0}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONStringer;

    .line 995
    .end local v2    # "k":I
    :goto_1
    return-void

    .line 982
    .restart local v2    # "k":I
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONStringer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 981
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 986
    .end local v2    # "k":I
    :catch_0
    move-exception v1

    .line 988
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    .line 989
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 991
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static updateLogInfo(Ljava/util/ArrayList;Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 24
    .param p1, "loginfo"    # Lcom/edutech/idauthentication/LogInfo;
    .param p2, "logPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/idauthentication/LogInfo;",
            ">;",
            "Lcom/edutech/idauthentication/LogInfo;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/idauthentication/LogInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 449
    .local p0, "logs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/idauthentication/LogInfo;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/JsonHelper;->logsparserJson(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    .line 450
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v18

    .line 451
    .local v18, "UserID":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getMachineID()Ljava/lang/String;

    move-result-object v14

    .line 452
    .local v14, "MachineID":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v17

    .line 453
    .local v17, "Type":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getSubjectID()Ljava/lang/String;

    move-result-object v16

    .line 454
    .local v16, "SubjectID":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getBookID()Ljava/lang/String;

    move-result-object v10

    .line 455
    .local v10, "BookID":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getBookName()Ljava/lang/String;

    move-result-object v11

    .line 456
    .local v11, "BookName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getSectionsID()Ljava/util/ArrayList;

    move-result-object v15

    .line 459
    .local v15, "SectionsID":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v8

    .line 460
    .local v8, "AssetsID":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getAssetsName()Ljava/lang/String;

    move-result-object v9

    .line 461
    .local v9, "AssetsName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getFirstTime()Ljava/lang/String;

    move-result-object v13

    .line 462
    .local v13, "FirstTime":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getLastTime()Ljava/lang/String;

    move-result-object v3

    .line 463
    .local v3, "LastTime":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getTotalTime()J

    move-result-wide v4

    .line 464
    .local v4, "TotalTime":J
    invoke-virtual/range {p1 .. p1}, Lcom/edutech/idauthentication/LogInfo;->getVisitCount()J

    move-result-wide v6

    .line 465
    .local v6, "VisitCount":J
    const/16 v19, 0x0

    .line 466
    .local v19, "isfoundLog":Z
    const-string/jumbo v12, "NULL"

    .line 467
    .local v12, "Default":Ljava/lang/String;
    const-string/jumbo v21, ""

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    const-string/jumbo v21, "-1"

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1

    .line 555
    :cond_0
    :goto_0
    return-object p0

    .line 471
    :cond_1
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    .line 473
    .local v20, "longType":I
    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_2

    const/16 v21, 0xc

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_3

    :cond_2
    const/16 v21, 0xe

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 475
    :cond_3
    packed-switch v20, :pswitch_data_0

    .line 548
    :cond_4
    if-nez v19, :cond_0

    .line 549
    invoke-virtual/range {p0 .. p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 479
    :pswitch_0
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v21, v4, v22

    if-eqz v21, :cond_0

    .line 482
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_5
    :goto_1
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 483
    .local v2, "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getBookID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_5

    .line 484
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_1

    .line 489
    .end local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    :pswitch_1
    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v21, v4, v22

    if-eqz v21, :cond_0

    .line 492
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_6
    :goto_2
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 493
    .restart local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_6

    .line 494
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_2

    .line 499
    .end local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    :pswitch_2
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v21, v4, v22

    if-eqz v21, :cond_0

    .line 502
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_7
    :goto_3
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 503
    .restart local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 504
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_3

    .line 515
    .end local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    :pswitch_3
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    const-wide/16 v22, 0x0

    cmp-long v21, v4, v22

    if-eqz v21, :cond_0

    .line 518
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_8
    :goto_4
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 519
    .restart local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getSubjectID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    .line 520
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_4

    .line 526
    .end local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    :pswitch_4
    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 529
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_9
    :goto_5
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 530
    .restart local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getSubjectID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_9

    .line 531
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_5

    .line 536
    .end local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    :pswitch_5
    invoke-virtual {v12, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_0

    .line 539
    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :cond_a
    :goto_6
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_4

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/idauthentication/LogInfo;

    .line 540
    .restart local v2    # "log":Lcom/edutech/idauthentication/LogInfo;
    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_a

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getUserID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_a

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getBookID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_a

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsID()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_a

    invoke-virtual {v2}, Lcom/edutech/idauthentication/LogInfo;->getAssetsName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_a

    .line 541
    invoke-static/range {v2 .. v7}, Lcom/edutech/idauthentication/JsonHelper;->updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z

    move-result v19

    goto :goto_6

    .line 475
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method

.method public static updateTime_Count(Lcom/edutech/idauthentication/LogInfo;Ljava/lang/String;JJ)Z
    .locals 2
    .param p0, "log"    # Lcom/edutech/idauthentication/LogInfo;
    .param p1, "LastTime"    # Ljava/lang/String;
    .param p2, "TotalTime"    # J
    .param p4, "VisitCount"    # J

    .prologue
    .line 559
    invoke-virtual {p0, p1}, Lcom/edutech/idauthentication/LogInfo;->setLastTime(Ljava/lang/String;)V

    .line 560
    invoke-virtual {p0}, Lcom/edutech/idauthentication/LogInfo;->getTotalTime()J

    move-result-wide v0

    add-long/2addr v0, p2

    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setTotalTime(J)V

    .line 561
    invoke-virtual {p0}, Lcom/edutech/idauthentication/LogInfo;->getVisitCount()J

    move-result-wide v0

    add-long/2addr v0, p4

    invoke-virtual {p0, v0, v1}, Lcom/edutech/idauthentication/LogInfo;->setVisitCount(J)V

    .line 562
    const/4 v0, 0x1

    return v0
.end method
