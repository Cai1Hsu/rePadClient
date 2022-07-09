.class Lcom/edutech/idauthentication/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/idauthentication/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/idauthentication/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/idauthentication/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$2;->this$0:Lcom/edutech/idauthentication/MainActivity;

    .line 941
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 26

    .prologue
    .line 946
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->selfpackageName:Ljava/lang/String;

    if-eqz v22, :cond_5

    .line 948
    invoke-static {}, Lcom/edutech/utils/XmlLoadHelper;->loadIpXml()Ljava/util/HashMap;

    move-result-object v8

    .line 949
    .local v8, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v22, "ip"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 950
    .local v10, "ip":Ljava/lang/String;
    const-string/jumbo v22, "username"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 951
    .local v21, "username":Ljava/lang/String;
    if-eqz v10, :cond_5

    if-eqz v21, :cond_5

    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    .line 952
    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    .line 955
    move-object/from16 v0, v21

    invoke-static {v10, v0}, Lcom/edutech/idauthentication/AppEnvironment;->SETTING_APK_UPDATE_HTTPPOST_URL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 959
    .local v20, "url":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    .line 960
    sget-object v22, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    .line 959
    move-object/from16 v0, v22

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 961
    .local v6, "edutechDir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_0

    .line 963
    :try_start_0
    invoke-static {v6}, Lcom/edutech/idauthentication/FileInOutHelper;->deleteDir(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 970
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/idauthentication/MainActivity$2;->this$0:Lcom/edutech/idauthentication/MainActivity;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/edutech/idauthentication/MainActivity;->getUpdateJson(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 975
    .local v11, "json":Ljava/lang/String;
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 978
    .local v12, "jsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v11, :cond_1

    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_1

    .line 979
    invoke-static {v12, v11}, Lcom/edutech/idauthentication/JsonHelper;->dataParse(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v12

    .line 985
    :cond_1
    new-instance v7, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    sget-object v23, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 986
    const-string/jumbo v23, "apk.json"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 985
    move-object/from16 v0, v22

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 987
    .local v7, "file":Ljava/io/File;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 990
    .local v15, "localjsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 993
    new-instance v22, Ljava/lang/StringBuilder;

    sget-object v23, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 994
    const-string/jumbo v23, "apk.json"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 993
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lcom/edutech/idauthentication/JsonHelper;->getFileString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 995
    .local v14, "localjson":Ljava/lang/String;
    invoke-static {v15, v14}, Lcom/edutech/idauthentication/JsonHelper;->dataParse(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v15

    .line 1000
    .end local v14    # "localjson":Ljava/lang/String;
    :cond_2
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1003
    .local v13, "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/idauthentication/MainActivity$2;->this$0:Lcom/edutech/idauthentication/MainActivity;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    move-object/from16 v22, v0

    .line 1002
    move-object/from16 v0, v22

    invoke-static {v13, v0}, Lcom/edutech/utils/SystemInfoHelper;->getSystemInfo(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v13

    .line 1008
    new-instance v4, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    sget-object v23, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v23, "apkinfo.json"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1009
    .local v4, "apkjsonFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_3

    .line 1010
    invoke-static {v4}, Lcom/edutech/idauthentication/FileInOutHelper;->createNewFile(Ljava/io/File;)Z

    .line 1012
    :cond_3
    new-instance v22, Ljava/lang/StringBuilder;

    sget-object v23, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v23, "apkinfo.json"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-static {v11, v0}, Lcom/edutech/idauthentication/JsonHelper;->CreateFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 1016
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    move-object/from16 v0, v22

    invoke-static {v0, v12, v15, v13}, Lcom/edutech/utils/SystemInfoHelper;->compareAppInfo(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1022
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v22

    :goto_1
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-nez v23, :cond_6

    .line 1028
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    sput-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    .line 1031
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    .line 1032
    sget-object v23, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    .line 1031
    invoke-static/range {v22 .. v23}, Lcom/edutech/utils/SystemInfoHelper;->startDownLoadList(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1033
    const/4 v9, 0x0

    .line 1035
    .local v9, "i":I
    :cond_4
    :goto_2
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    if-gtz v22, :cond_7

    .line 1066
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    if-nez v22, :cond_5

    .line 1067
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    if-lez v22, :cond_5

    .line 1071
    new-instance v16, Landroid/os/Message;

    invoke-direct/range {v16 .. v16}, Landroid/os/Message;-><init>()V

    .line 1072
    .local v16, "message":Landroid/os/Message;
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, v16

    iput v0, v1, Landroid/os/Message;->what:I

    .line 1073
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/idauthentication/MainActivity$2;->this$0:Lcom/edutech/idauthentication/MainActivity;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/edutech/idauthentication/MainActivity;->access$0(Lcom/edutech/idauthentication/MainActivity;)Landroid/os/Handler;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1078
    .end local v4    # "apkjsonFile":Ljava/io/File;
    .end local v6    # "edutechDir":Ljava/io/File;
    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "i":I
    .end local v10    # "ip":Ljava/lang/String;
    .end local v11    # "json":Ljava/lang/String;
    .end local v12    # "jsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v13    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v15    # "localjsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v16    # "message":Landroid/os/Message;
    .end local v20    # "url":Ljava/lang/String;
    .end local v21    # "username":Ljava/lang/String;
    :cond_5
    return-void

    .line 964
    .restart local v6    # "edutechDir":Ljava/io/File;
    .restart local v8    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v10    # "ip":Ljava/lang/String;
    .restart local v20    # "url":Ljava/lang/String;
    .restart local v21    # "username":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 966
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 1022
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v4    # "apkjsonFile":Ljava/io/File;
    .restart local v7    # "file":Ljava/io/File;
    .restart local v11    # "json":Ljava/lang/String;
    .restart local v12    # "jsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v13    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v15    # "localjsonAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_6
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 1023
    .local v18, "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v23, "redownload_count"

    const-string/jumbo v24, "0"

    move-object/from16 v0, v18

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1038
    .end local v18    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v9    # "i":I
    :cond_7
    const-wide/16 v22, 0xbb8

    :try_start_1
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1043
    :goto_3
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    if-lez v22, :cond_9

    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    move/from16 v0, v22

    if-eq v9, v0, :cond_9

    .line 1044
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 1045
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_8
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-nez v22, :cond_a

    .line 1061
    :cond_9
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v22

    const/16 v23, 0x5

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_4

    .line 1063
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkdownloadlist:Ljava/util/ArrayList;

    sget-object v23, Lcom/edutech/idauthentication/MainActivity;->apkTaskList:Ljava/util/ArrayList;

    .line 1062
    invoke-static/range {v22 .. v23}, Lcom/edutech/utils/SystemInfoHelper;->startDownLoadList(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    goto/16 :goto_2

    .line 1039
    :catch_1
    move-exception v5

    .line 1041
    .local v5, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v5}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3

    .line 1045
    .end local v5    # "e":Ljava/lang/InterruptedException;
    :cond_a
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 1046
    .restart local v18    # "temp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v22, Lcom/edutech/idauthentication/MainActivity;->apkfinList:Ljava/util/ArrayList;

    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :cond_b
    :goto_4
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_8

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 1047
    .local v19, "temp1":Ljava/lang/String;
    new-instance v25, Ljava/lang/StringBuilder;

    sget-object v22, Lcom/edutech/idauthentication/AppEnvironment;->FOLDER_EDUTECH:Ljava/lang/String;

    invoke-static/range {v22 .. v22}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1048
    const-string/jumbo v22, "appname"

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 1047
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1049
    .local v17, "path":Ljava/lang/String;
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_b

    .line 1052
    const-string/jumbo v22, "is_down_finish"

    .line 1053
    const-string/jumbo v25, "1"

    .line 1051
    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4
.end method
