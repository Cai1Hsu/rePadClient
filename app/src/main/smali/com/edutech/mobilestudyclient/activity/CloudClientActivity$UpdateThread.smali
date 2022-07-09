.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;
.super Ljava/lang/Thread;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UpdateThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 794
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 52

    .prologue
    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const/16 v48, 0x1

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$22(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 801
    const-wide/16 v48, 0xfa0

    :try_start_0
    invoke-static/range {v48 .. v49}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 806
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v47

    if-eqz v47, :cond_1

    .line 808
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/util/ArrayList;->clear()V

    .line 813
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const-string/jumbo v48, ""

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$25(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;)V

    .line 814
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const-string/jumbo v48, "privatekey"

    .line 815
    const/16 v49, 0x0

    .line 814
    invoke-virtual/range {v47 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v33

    .line 816
    .local v33, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v47, "key"

    const-string/jumbo v48, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v47

    move-object/from16 v2, v48

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 817
    .local v29, "privatekey":Ljava/lang/String;
    const-string/jumbo v47, "apihost"

    const-string/jumbo v48, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v47

    move-object/from16 v2, v48

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 818
    .local v16, "ip":Ljava/lang/String;
    const-string/jumbo v47, "name"

    const-string/jumbo v48, ""

    move-object/from16 v0, v33

    move-object/from16 v1, v47

    move-object/from16 v2, v48

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    .line 819
    .local v42, "username":Ljava/lang/String;
    if-eqz v16, :cond_0

    const-string/jumbo v47, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    if-nez v47, :cond_0

    if-eqz v42, :cond_0

    const-string/jumbo v47, ""

    move-object/from16 v0, v42

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    if-nez v47, :cond_0

    if-eqz v29, :cond_0

    const-string/jumbo v47, ""

    move-object/from16 v0, v29

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    if-eqz v47, :cond_3

    .line 820
    :cond_0
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v11

    .line 821
    .local v11, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v11, :cond_2

    .line 956
    .end local v11    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_2
    return-void

    .line 802
    .end local v16    # "ip":Ljava/lang/String;
    .end local v29    # "privatekey":Ljava/lang/String;
    .end local v33    # "sharePre":Landroid/content/SharedPreferences;
    .end local v42    # "username":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 804
    .local v9, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    .line 811
    .end local v9    # "e1":Ljava/lang/InterruptedException;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    new-instance v48, Ljava/util/ArrayList;

    invoke-direct/range {v48 .. v48}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$24(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/ArrayList;)V

    goto/16 :goto_1

    .line 825
    .restart local v11    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v16    # "ip":Ljava/lang/String;
    .restart local v29    # "privatekey":Ljava/lang/String;
    .restart local v33    # "sharePre":Landroid/content/SharedPreferences;
    .restart local v42    # "username":Ljava/lang/String;
    :cond_2
    const-string/jumbo v47, "ip"

    move-object/from16 v0, v47

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .end local v16    # "ip":Ljava/lang/String;
    check-cast v16, Ljava/lang/String;

    .line 826
    .restart local v16    # "ip":Ljava/lang/String;
    const-string/jumbo v47, "usercode"

    move-object/from16 v0, v47

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v42

    .end local v42    # "username":Ljava/lang/String;
    check-cast v42, Ljava/lang/String;

    .line 827
    .restart local v42    # "username":Ljava/lang/String;
    const-string/jumbo v47, "privatekey"

    move-object/from16 v0, v47

    invoke-virtual {v11, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    .end local v29    # "privatekey":Ljava/lang/String;
    check-cast v29, Ljava/lang/String;

    .line 829
    .end local v11    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v29    # "privatekey":Ljava/lang/String;
    :cond_3
    new-instance v47, Ljava/lang/StringBuilder;

    const-string/jumbo v48, "http://"

    invoke-direct/range {v47 .. v48}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v47

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    .line 830
    const-string/jumbo v48, "/api/app/projectcode/ebag/os/android/"

    invoke-virtual/range {v47 .. v48}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    .line 829
    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v39

    .line 831
    .local v39, "url":Ljava/lang/String;
    new-instance v28, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v28

    move-object/from16 v1, v39

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 832
    .local v28, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v47, "X-Edutech-Entity"

    move-object/from16 v0, v28

    move-object/from16 v1, v47

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 833
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 834
    .local v14, "imestamp":J
    new-instance v47, Ljava/lang/StringBuilder;

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v48

    invoke-direct/range {v47 .. v48}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v47

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 835
    .local v34, "sign":Ljava/lang/String;
    const-string/jumbo v47, "X-Edutech-Sign"

    new-instance v48, Ljava/lang/StringBuilder;

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v49

    invoke-direct/range {v48 .. v49}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v49, "+"

    invoke-virtual/range {v48 .. v49}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    move-object/from16 v0, v48

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v48

    invoke-virtual/range {v48 .. v48}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    move-object/from16 v0, v28

    move-object/from16 v1, v47

    move-object/from16 v2, v48

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 836
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 837
    .local v6, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v32, Ljava/util/ArrayList;

    invoke-direct/range {v32 .. v32}, Ljava/util/ArrayList;-><init>()V

    .line 838
    .local v32, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v20, 0x0

    .line 840
    .local v20, "launchereNeedUpdate":Z
    :try_start_1
    move-object/from16 v0, v28

    invoke-virtual {v6, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v30

    .line 841
    .local v30, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    move-object/from16 v1, v30

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$26(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v31

    .line 842
    .local v31, "result":Ljava/lang/String;
    new-instance v18, Lorg/json/JSONObject;

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 843
    .local v18, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v47, "status"

    move-object/from16 v0, v18

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v38

    .line 844
    .local v38, "status":Z
    const-string/jumbo v47, "errorNum"

    move-object/from16 v0, v18

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    .line 845
    .local v10, "errorNum":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    new-instance v48, Ljava/util/ArrayList;

    invoke-direct/range {v48 .. v48}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$27(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;)V

    .line 846
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    new-instance v48, Ljava/util/ArrayList;

    invoke-direct/range {v48 .. v48}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$28(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;)V

    .line 847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const-wide/16 v48, 0x0

    invoke-static/range {v47 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$29(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;J)V

    .line 848
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const-wide/16 v48, 0x0

    invoke-static/range {v47 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$30(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;J)V

    .line 849
    new-instance v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    invoke-direct {v4}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;-><init>()V

    .line 850
    .local v4, "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    if-nez v38, :cond_4

    if-nez v10, :cond_5

    .line 851
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const/16 v48, 0x1

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$31(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 852
    const-string/jumbo v47, "data"

    move-object/from16 v0, v18

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 853
    .local v7, "data":Lorg/json/JSONArray;
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v47

    if-lez v47, :cond_5

    .line 854
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 857
    .local v21, "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    .line 856
    move-object/from16 v0, v21

    move-object/from16 v1, v47

    invoke-static {v0, v1}, Lcom/edutech/utils/SystemInfoHelper;->getSystemInfo(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v21

    .line 858
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_3
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v47

    move/from16 v0, v47

    if-lt v12, v0, :cond_8

    .line 921
    new-instance v23, Landroid/os/Message;

    invoke-direct/range {v23 .. v23}, Landroid/os/Message;-><init>()V

    .line 922
    .local v23, "msg":Landroid/os/Message;
    const/16 v47, 0x1013

    move/from16 v0, v47

    move-object/from16 v1, v23

    iput v0, v1, Landroid/os/Message;->what:I

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 924
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$33(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v47

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v48, v0

    move-object/from16 v0, v47

    move-object/from16 v1, v48

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/edutech/mobilestudyclient/util/Utils;->saveUpdateApks(Ljava/util/List;Landroid/content/Context;Ljava/lang/String;)V

    .line 925
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v48, v0

    invoke-static/range {v48 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$33(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v48

    move-object/from16 v0, v47

    move-object/from16 v1, v32

    move-object/from16 v2, v48

    invoke-static {v0, v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$34(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v32

    .line 926
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v47

    if-eqz v47, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v47

    const-string/jumbo v48, ""

    invoke-virtual/range {v47 .. v48}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    if-nez v47, :cond_5

    .line 927
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v32

    move-object/from16 v1, v47

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 928
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v47

    const-string/jumbo v48, "com.launcher.activity"

    invoke-virtual/range {v47 .. v48}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 936
    .end local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .end local v7    # "data":Lorg/json/JSONArray;
    .end local v10    # "errorNum":I
    .end local v12    # "i":I
    .end local v18    # "jobj":Lorg/json/JSONObject;
    .end local v21    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v23    # "msg":Landroid/os/Message;
    .end local v30    # "response":Lorg/apache/http/HttpResponse;
    .end local v31    # "result":Ljava/lang/String;
    .end local v38    # "status":Z
    :cond_5
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v47

    if-eqz v47, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v47

    invoke-virtual/range {v47 .. v47}, Ljava/util/ArrayList;->size()I

    move-result v47

    if-lez v47, :cond_6

    .line 938
    new-instance v13, Landroid/content/Intent;

    invoke-direct {v13}, Landroid/content/Intent;-><init>()V

    .line 939
    .local v13, "intent":Landroid/content/Intent;
    const-string/jumbo v47, "com.launch.addapks"

    move-object/from16 v0, v47

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 940
    const-string/jumbo v47, "packages"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v48, v0

    invoke-static/range {v48 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$23(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/ArrayList;

    move-result-object v48

    move-object/from16 v0, v47

    move-object/from16 v1, v48

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 941
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    invoke-virtual {v0, v13}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 943
    .end local v13    # "intent":Landroid/content/Intent;
    :cond_6
    if-eqz v20, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v47

    invoke-static/range {v47 .. v47}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v47

    if-nez v47, :cond_7

    .line 945
    new-instance v24, Landroid/os/Message;

    invoke-direct/range {v24 .. v24}, Landroid/os/Message;-><init>()V

    .line 946
    .local v24, "msg1":Landroid/os/Message;
    const/16 v47, 0x4

    move/from16 v0, v47

    move-object/from16 v1, v24

    iput v0, v1, Landroid/os/Message;->what:I

    .line 947
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 948
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const/16 v48, -0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$35(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v49

    const/16 v50, 0x1014

    invoke-static/range {v47 .. v50}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$36(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;ILjava/lang/Object;I)V

    .line 950
    .end local v24    # "msg1":Landroid/os/Message;
    :cond_7
    new-instance v25, Landroid/os/Message;

    invoke-direct/range {v25 .. v25}, Landroid/os/Message;-><init>()V

    .line 951
    .local v25, "msg3":Landroid/os/Message;
    const/16 v47, 0x3

    move/from16 v0, v47

    move-object/from16 v1, v25

    iput v0, v1, Landroid/os/Message;->what:I

    .line 952
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->installHandler:Landroid/os/Handler;

    move-object/from16 v47, v0

    move-object/from16 v0, v47

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 953
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const-string/jumbo v48, "resumeconfig"

    const/16 v49, 0x0

    invoke-virtual/range {v47 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v35

    .line 954
    .local v35, "sp":Landroid/content/SharedPreferences;
    invoke-interface/range {v35 .. v35}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v47

    const-string/jumbo v48, "updateapks"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v50

    move-object/from16 v0, v47

    move-object/from16 v1, v48

    move-wide/from16 v2, v50

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v47

    invoke-interface/range {v47 .. v47}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    invoke-static/range {v47 .. v48}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$22(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    goto/16 :goto_2

    .line 859
    .end local v25    # "msg3":Landroid/os/Message;
    .end local v35    # "sp":Landroid/content/SharedPreferences;
    .restart local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .restart local v7    # "data":Lorg/json/JSONArray;
    .restart local v10    # "errorNum":I
    .restart local v12    # "i":I
    .restart local v18    # "jobj":Lorg/json/JSONObject;
    .restart local v21    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v30    # "response":Lorg/apache/http/HttpResponse;
    .restart local v31    # "result":Ljava/lang/String;
    .restart local v38    # "status":Z
    :cond_8
    :try_start_2
    invoke-virtual {v7, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    .line 860
    .local v19, "json":Lorg/json/JSONObject;
    const-string/jumbo v47, "appwebpath"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 861
    .local v5, "apkUrl":Ljava/lang/String;
    const-string/jumbo v47, "appsize"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v36

    .line 862
    .local v36, "size":J
    const-string/jumbo v47, "apkname"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 863
    .local v26, "name":Ljava/lang/String;
    const-string/jumbo v47, "versionname"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v43

    .line 864
    .local v43, "version":Ljava/lang/String;
    const-string/jumbo v47, "packagename"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 865
    .local v27, "packagename":Ljava/lang/String;
    const-string/jumbo v47, "versioncode"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v46

    .line 866
    .local v46, "versionCode":Ljava/lang/String;
    const-wide/16 v44, 0x1

    .line 868
    .local v44, "vercodeLong":J
    :try_start_3
    invoke-static/range {v46 .. v46}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    move-result-wide v44

    .line 873
    :goto_5
    const/16 v17, 0x0

    .line 874
    .local v17, "isInstall":Z
    :try_start_4
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v47

    :goto_6
    invoke-interface/range {v47 .. v47}, Ljava/util/Iterator;->hasNext()Z

    move-result v48

    if-nez v48, :cond_b

    .line 903
    :goto_7
    if-nez v17, :cond_a

    .line 904
    const-string/jumbo v47, "com.launcher.activity"

    move-object/from16 v0, v27

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v47

    if-eqz v47, :cond_9

    const/16 v20, 0x1

    .line 905
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$32(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)J

    move-result-wide v48

    add-long v48, v48, v36

    invoke-static/range {v47 .. v49}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$29(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;J)V

    .line 906
    new-instance v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .end local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-direct {v4}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;-><init>()V

    .line 907
    .restart local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setPackagename(Ljava/lang/String;)V

    .line 908
    const-wide/16 v48, 0x0

    move-wide/from16 v0, v48

    invoke-virtual {v4, v0, v1}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkDownloadSize(J)V

    .line 909
    move-wide/from16 v0, v36

    invoke-virtual {v4, v0, v1}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkSize(J)V

    .line 910
    const/16 v47, -0x1

    move/from16 v0, v47

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setInstallState(I)V

    .line 911
    const-string/jumbo v47, ""

    move-object/from16 v0, v47

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkLocalPath(Ljava/lang/String;)V

    .line 912
    const-string/jumbo v47, "appwebpath"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v47

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkUrl(Ljava/lang/String;)V

    .line 913
    const-string/jumbo v47, "apkname"

    move-object/from16 v0, v19

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    move-object/from16 v0, v47

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setAppName(Ljava/lang/String;)V

    .line 914
    move-object/from16 v0, v46

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setVersioncode(Ljava/lang/String;)V

    .line 915
    move-object/from16 v0, v43

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setVersionname(Ljava/lang/String;)V

    .line 916
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$33(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v47

    move-object/from16 v0, v47

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 917
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$UpdateThread;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    move-object/from16 v47, v0

    invoke-static/range {v47 .. v47}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$12(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/util/List;

    move-result-object v47

    move-object/from16 v0, v47

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 858
    :cond_a
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_3

    .line 874
    :cond_b
    invoke-interface/range {v47 .. v47}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/HashMap;

    .line 876
    .local v22, "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v48, "packagename"

    move-object/from16 v0, v22

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    .line 875
    if-eqz v48, :cond_d

    .line 879
    const-string/jumbo v48, "packagename"

    move-object/from16 v0, v22

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v48

    .line 878
    move-object/from16 v0, v27

    move-object/from16 v1, v48

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    move-result v48

    .line 879
    if-eqz v48, :cond_d

    .line 881
    const/16 v17, 0x1

    .line 882
    const-wide/16 v40, 0x1

    .line 884
    .local v40, "tempcode":J
    :try_start_5
    const-string/jumbo v47, "versioncode"

    move-object/from16 v0, v22

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v47

    check-cast v47, Ljava/lang/String;

    invoke-static/range {v47 .. v47}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    move-result-wide v40

    .line 890
    :goto_8
    :try_start_6
    const-string/jumbo v47, "versioncode"

    move-object/from16 v0, v22

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v47

    .line 889
    if-eqz v47, :cond_c

    .line 892
    const-string/jumbo v47, "versionname"

    move-object/from16 v0, v22

    move-object/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v47

    .line 891
    if-eqz v47, :cond_c

    .line 893
    cmp-long v47, v44, v40

    if-lez v47, :cond_c

    .line 894
    const/16 v17, 0x0

    .line 895
    goto/16 :goto_7

    .line 887
    :catch_1
    move-exception v8

    .line 888
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_8

    .line 932
    .end local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .end local v5    # "apkUrl":Ljava/lang/String;
    .end local v7    # "data":Lorg/json/JSONArray;
    .end local v8    # "e":Ljava/lang/Exception;
    .end local v10    # "errorNum":I
    .end local v12    # "i":I
    .end local v17    # "isInstall":Z
    .end local v18    # "jobj":Lorg/json/JSONObject;
    .end local v19    # "json":Lorg/json/JSONObject;
    .end local v21    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v22    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v26    # "name":Ljava/lang/String;
    .end local v27    # "packagename":Ljava/lang/String;
    .end local v30    # "response":Lorg/apache/http/HttpResponse;
    .end local v31    # "result":Ljava/lang/String;
    .end local v36    # "size":J
    .end local v38    # "status":Z
    .end local v40    # "tempcode":J
    .end local v43    # "version":Ljava/lang/String;
    .end local v44    # "vercodeLong":J
    .end local v46    # "versionCode":Ljava/lang/String;
    :catch_2
    move-exception v8

    .line 934
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_4

    .line 896
    .end local v8    # "e":Ljava/lang/Exception;
    .restart local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .restart local v5    # "apkUrl":Ljava/lang/String;
    .restart local v7    # "data":Lorg/json/JSONArray;
    .restart local v10    # "errorNum":I
    .restart local v12    # "i":I
    .restart local v17    # "isInstall":Z
    .restart local v18    # "jobj":Lorg/json/JSONObject;
    .restart local v19    # "json":Lorg/json/JSONObject;
    .restart local v21    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v22    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v26    # "name":Ljava/lang/String;
    .restart local v27    # "packagename":Ljava/lang/String;
    .restart local v30    # "response":Lorg/apache/http/HttpResponse;
    .restart local v31    # "result":Ljava/lang/String;
    .restart local v36    # "size":J
    .restart local v38    # "status":Z
    .restart local v40    # "tempcode":J
    .restart local v43    # "version":Ljava/lang/String;
    .restart local v44    # "vercodeLong":J
    .restart local v46    # "versionCode":Ljava/lang/String;
    :cond_c
    const/16 v17, 0x1

    .line 898
    goto/16 :goto_7

    .line 900
    .end local v40    # "tempcode":J
    :cond_d
    const/16 v17, 0x0

    goto/16 :goto_6

    .line 869
    .end local v17    # "isInstall":Z
    .end local v22    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_3
    move-exception v47

    goto/16 :goto_5

    .line 871
    :catch_4
    move-exception v47

    goto/16 :goto_5

    .line 885
    .restart local v17    # "isInstall":Z
    .restart local v22    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v40    # "tempcode":J
    :catch_5
    move-exception v47

    goto :goto_8
.end method
