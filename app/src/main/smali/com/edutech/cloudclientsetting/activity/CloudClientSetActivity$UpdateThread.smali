.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;
.super Ljava/lang/Thread;
.source "CloudClientSetActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UpdateThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 758
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 45

    .prologue
    .line 764
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v41

    if-eqz v41, :cond_8

    .line 766
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/util/ArrayList;->clear()V

    .line 771
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const-string/jumbo v42, ""

    invoke-static/range {v41 .. v42}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$65(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 772
    const/16 v41, 0x1

    sput-boolean v41, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 773
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const-wide/16 v42, 0x0

    invoke-static/range {v41 .. v43}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$66(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;J)V

    .line 774
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const-wide/16 v42, 0x0

    invoke-static/range {v41 .. v43}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$67(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;J)V

    .line 775
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const-string/jumbo v42, "privatekey"

    .line 776
    const/16 v43, 0x0

    .line 775
    invoke-virtual/range {v41 .. v43}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v28

    .line 777
    .local v28, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v41, "key"

    const-string/jumbo v42, ""

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 778
    .local v24, "privatekey":Ljava/lang/String;
    const-string/jumbo v41, "apihost"

    const-string/jumbo v42, ""

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 779
    .local v15, "ip":Ljava/lang/String;
    const-string/jumbo v41, "name"

    const-string/jumbo v42, ""

    move-object/from16 v0, v28

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 780
    .local v36, "username":Ljava/lang/String;
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v10

    .line 781
    .local v10, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v10, :cond_1

    const-string/jumbo v41, ""

    move-object/from16 v0, v41

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-nez v41, :cond_0

    const-string/jumbo v41, ""

    move-object/from16 v0, v36

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-eqz v41, :cond_1

    .line 782
    :cond_0
    const-string/jumbo v41, "ip"

    move-object/from16 v0, v41

    invoke-virtual {v10, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "ip":Ljava/lang/String;
    check-cast v15, Ljava/lang/String;

    .line 783
    .restart local v15    # "ip":Ljava/lang/String;
    const-string/jumbo v41, "usercode"

    move-object/from16 v0, v41

    invoke-virtual {v10, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    .end local v36    # "username":Ljava/lang/String;
    check-cast v36, Ljava/lang/String;

    .line 784
    .restart local v36    # "username":Ljava/lang/String;
    const-string/jumbo v41, "privatekey"

    move-object/from16 v0, v41

    invoke-virtual {v10, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    .end local v24    # "privatekey":Ljava/lang/String;
    check-cast v24, Ljava/lang/String;

    .line 786
    .restart local v24    # "privatekey":Ljava/lang/String;
    :cond_1
    new-instance v41, Ljava/lang/StringBuilder;

    const-string/jumbo v42, "http://"

    invoke-direct/range {v41 .. v42}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v41

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v41

    .line 787
    const-string/jumbo v42, "/api/app/projectcode/ebag/os/android/"

    invoke-virtual/range {v41 .. v42}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v41

    .line 786
    invoke-virtual/range {v41 .. v41}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    .line 788
    .local v33, "url":Ljava/lang/String;
    new-instance v23, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v23

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 789
    .local v23, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v41, "X-Edutech-Entity"

    move-object/from16 v0, v23

    move-object/from16 v1, v41

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    const-string/jumbo v41, "updateresult"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    invoke-direct/range {v42 .. v43}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v43, ","

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    const-string/jumbo v43, ","

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v41 .. v42}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 791
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 792
    .local v12, "imestamp":J
    new-instance v41, Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v42

    invoke-direct/range {v41 .. v42}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v41

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v41

    move-object/from16 v0, v41

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v41

    invoke-static/range {v41 .. v41}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 793
    .local v29, "sign":Ljava/lang/String;
    const-string/jumbo v41, "X-Edutech-Sign"

    new-instance v42, Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v43

    invoke-direct/range {v42 .. v43}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v43, "+"

    invoke-virtual/range {v42 .. v43}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    move-object/from16 v0, v42

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v42

    invoke-virtual/range {v42 .. v42}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v42

    move-object/from16 v0, v23

    move-object/from16 v1, v41

    move-object/from16 v2, v42

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 794
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 795
    .local v6, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 796
    .local v27, "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 798
    .local v5, "apksTemp":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    :try_start_0
    move-object/from16 v0, v23

    invoke-virtual {v6, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v25

    .line 799
    .local v25, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$68(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v26

    .line 800
    .local v26, "result":Ljava/lang/String;
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 801
    .local v17, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v41, "status"

    move-object/from16 v0, v17

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v32

    .line 802
    .local v32, "status":Z
    const-string/jumbo v41, "errorNum"

    move-object/from16 v0, v17

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 804
    .local v9, "errorNum":I
    if-nez v32, :cond_2

    if-nez v9, :cond_4

    .line 805
    :cond_2
    const-string/jumbo v41, "data"

    move-object/from16 v0, v17

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 807
    .local v7, "data":Lorg/json/JSONArray;
    if-eqz v7, :cond_f

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v41

    if-lez v41, :cond_f

    .line 808
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 811
    .local v19, "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    .line 810
    move-object/from16 v0, v19

    move-object/from16 v1, v41

    invoke-static {v0, v1}, Lcom/edutech/utils/SystemInfoHelper;->getSystemInfo(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v19

    .line 812
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    new-instance v42, Ljava/util/ArrayList;

    invoke-direct/range {v42 .. v42}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v41 .. v42}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$69(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;)V

    .line 813
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v41

    move/from16 v0, v41

    if-ge v11, v0, :cond_3

    sget-boolean v41, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    if-nez v41, :cond_9

    .line 878
    :cond_3
    sget-boolean v41, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-nez v41, :cond_e

    .line 880
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v19

    move-object/from16 v2, v27

    invoke-static {v0, v7, v1, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$70(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Lorg/json/JSONArray;Ljava/util/ArrayList;Ljava/util/List;)Ljava/util/List;

    move-result-object v27

    .line 889
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$72(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v41

    if-eqz v41, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$72(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v41

    const-string/jumbo v42, ""

    invoke-virtual/range {v41 .. v42}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v41

    if-nez v41, :cond_4

    .line 890
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$72(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v27

    move-object/from16 v1, v41

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v41

    const-string/jumbo v42, "com.launcher.activity"

    invoke-virtual/range {v41 .. v42}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 901
    .end local v7    # "data":Lorg/json/JSONArray;
    .end local v9    # "errorNum":I
    .end local v11    # "i":I
    .end local v17    # "jobj":Lorg/json/JSONObject;
    .end local v19    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v25    # "response":Lorg/apache/http/HttpResponse;
    .end local v26    # "result":Ljava/lang/String;
    .end local v32    # "status":Z
    :cond_4
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v41

    if-eqz v41, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v41

    invoke-virtual/range {v41 .. v41}, Ljava/util/ArrayList;->size()I

    move-result v41

    if-lez v41, :cond_5

    .line 903
    new-instance v14, Landroid/content/Intent;

    invoke-direct {v14}, Landroid/content/Intent;-><init>()V

    .line 904
    .local v14, "intent":Landroid/content/Intent;
    const-string/jumbo v41, "com.launch.addapks"

    move-object/from16 v0, v41

    invoke-virtual {v14, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 905
    const-string/jumbo v41, "packages"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v42, v0

    invoke-static/range {v42 .. v42}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$63(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/ArrayList;

    move-result-object v42

    move-object/from16 v0, v41

    move-object/from16 v1, v42

    invoke-virtual {v14, v0, v1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 906
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-virtual {v0, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 908
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_5
    const/16 v41, 0x0

    sput-boolean v41, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isupdating:Z

    .line 909
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const/16 v42, 0x2

    const/16 v43, 0x2

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    const/16 v44, 0x2

    invoke-static/range {v41 .. v44}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    .line 910
    sget-boolean v41, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-eqz v41, :cond_10

    .line 912
    if-eqz v5, :cond_6

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v41

    if-gtz v41, :cond_7

    .line 914
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const/16 v42, 0x3

    const/16 v43, 0x3

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    const/16 v44, 0x3

    invoke-static/range {v41 .. v44}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    .line 927
    :cond_7
    :goto_4
    return-void

    .line 769
    .end local v5    # "apksTemp":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    .end local v6    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v10    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "imestamp":J
    .end local v15    # "ip":Ljava/lang/String;
    .end local v23    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v24    # "privatekey":Ljava/lang/String;
    .end local v27    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v28    # "sharePre":Landroid/content/SharedPreferences;
    .end local v29    # "sign":Ljava/lang/String;
    .end local v33    # "url":Ljava/lang/String;
    .end local v36    # "username":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    new-instance v42, Ljava/util/ArrayList;

    invoke-direct/range {v42 .. v42}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v41 .. v42}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$64(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 814
    .restart local v5    # "apksTemp":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    .restart local v6    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v7    # "data":Lorg/json/JSONArray;
    .restart local v9    # "errorNum":I
    .restart local v10    # "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "i":I
    .restart local v12    # "imestamp":J
    .restart local v15    # "ip":Ljava/lang/String;
    .restart local v17    # "jobj":Lorg/json/JSONObject;
    .restart local v19    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v23    # "post":Lorg/apache/http/client/methods/HttpPost;
    .restart local v24    # "privatekey":Ljava/lang/String;
    .restart local v25    # "response":Lorg/apache/http/HttpResponse;
    .restart local v26    # "result":Ljava/lang/String;
    .restart local v27    # "resultList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v28    # "sharePre":Landroid/content/SharedPreferences;
    .restart local v29    # "sign":Ljava/lang/String;
    .restart local v32    # "status":Z
    .restart local v33    # "url":Ljava/lang/String;
    .restart local v36    # "username":Ljava/lang/String;
    :cond_9
    :try_start_1
    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v18

    .line 815
    .local v18, "json":Lorg/json/JSONObject;
    const-string/jumbo v41, "appsize"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v30

    .line 816
    .local v30, "size":J
    const-string/jumbo v41, "versionname"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 817
    .local v37, "version":Ljava/lang/String;
    const-string/jumbo v41, "packagename"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 818
    .local v22, "packagename":Ljava/lang/String;
    const-string/jumbo v41, "versioncode"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v40

    .line 819
    .local v40, "versionCode":Ljava/lang/String;
    const-wide/16 v38, 0x1

    .line 821
    .local v38, "vercodeLong":J
    :try_start_2
    invoke-static/range {v40 .. v40}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-wide v38

    .line 827
    :goto_5
    const/16 v16, 0x0

    .line 828
    .local v16, "isInstall":Z
    const/4 v4, 0x0

    .line 829
    .local v4, "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    :try_start_3
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v41

    :goto_6
    invoke-interface/range {v41 .. v41}, Ljava/util/Iterator;->hasNext()Z

    move-result v42

    if-nez v42, :cond_b

    .line 862
    :goto_7
    if-nez v16, :cond_a

    .line 863
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$11(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v42

    add-long v42, v42, v30

    invoke-static/range {v41 .. v43}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$66(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;J)V

    .line 864
    new-instance v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .end local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-direct {v4}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;-><init>()V

    .line 865
    .restart local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setPackagename(Ljava/lang/String;)V

    .line 866
    const-wide/16 v42, 0x0

    move-wide/from16 v0, v42

    invoke-virtual {v4, v0, v1}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkDownloadSize(J)V

    .line 867
    move-wide/from16 v0, v30

    invoke-virtual {v4, v0, v1}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkSize(J)V

    .line 868
    const/16 v41, -0x1

    move/from16 v0, v41

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setInstallState(I)V

    .line 869
    const-string/jumbo v41, ""

    move-object/from16 v0, v41

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkLocalPath(Ljava/lang/String;)V

    .line 870
    const-string/jumbo v41, "appwebpath"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkUrl(Ljava/lang/String;)V

    .line 871
    const-string/jumbo v41, "apkname"

    move-object/from16 v0, v18

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setAppName(Ljava/lang/String;)V

    .line 872
    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setVersioncode(Ljava/lang/String;)V

    .line 873
    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setVersionname(Ljava/lang/String;)V

    .line 874
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v41

    move-object/from16 v0, v41

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 875
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 813
    :cond_a
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_1

    .line 829
    :cond_b
    invoke-interface/range {v41 .. v41}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/util/HashMap;

    .line 831
    .local v20, "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v42, "packagename"

    move-object/from16 v0, v20

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v42

    .line 830
    if-eqz v42, :cond_d

    .line 834
    const-string/jumbo v42, "packagename"

    move-object/from16 v0, v20

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v42

    .line 833
    move-object/from16 v0, v22

    move-object/from16 v1, v42

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v42

    .line 834
    if-eqz v42, :cond_d

    .line 836
    const/16 v16, 0x1

    .line 837
    const-wide/16 v34, 0x1

    .line 840
    .local v34, "tempcode":J
    :try_start_4
    const-string/jumbo v41, "versioncode"

    move-object/from16 v0, v20

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Ljava/lang/String;

    .line 839
    invoke-static/range {v41 .. v41}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result-wide v34

    .line 848
    :goto_8
    :try_start_5
    const-string/jumbo v41, "versioncode"

    move-object/from16 v0, v20

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v41

    .line 847
    if-eqz v41, :cond_c

    .line 850
    const-string/jumbo v41, "versionname"

    move-object/from16 v0, v20

    move-object/from16 v1, v41

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v41

    .line 849
    if-eqz v41, :cond_c

    .line 851
    cmp-long v41, v38, v34

    if-lez v41, :cond_c

    .line 852
    const/16 v16, 0x0

    .line 853
    goto/16 :goto_7

    .line 854
    :cond_c
    const/16 v16, 0x1

    .line 856
    goto/16 :goto_7

    .line 858
    .end local v34    # "tempcode":J
    :cond_d
    const/16 v16, 0x0

    goto/16 :goto_6

    .line 883
    .end local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .end local v16    # "isInstall":Z
    .end local v18    # "json":Lorg/json/JSONObject;
    .end local v20    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v22    # "packagename":Ljava/lang/String;
    .end local v30    # "size":J
    .end local v37    # "version":Ljava/lang/String;
    .end local v38    # "vercodeLong":J
    .end local v40    # "versionCode":Ljava/lang/String;
    :cond_e
    new-instance v21, Landroid/os/Message;

    invoke-direct/range {v21 .. v21}, Landroid/os/Message;-><init>()V

    .line 884
    .local v21, "msg":Landroid/os/Message;
    const/16 v41, 0x1013

    move/from16 v0, v41

    move-object/from16 v1, v21

    iput v0, v1, Landroid/os/Message;->what:I

    .line 885
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$62(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v41

    move-object/from16 v0, v41

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 886
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    invoke-static/range {v41 .. v41}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v41

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v42, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v42

    invoke-static {v0, v1, v15}, Lcom/edutech/mobilestudyclient/util/Utils;->saveUpdateApks(Ljava/util/List;Landroid/content/Context;Ljava/lang/String;)V

    .line 887
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v27

    invoke-static {v0, v1, v5}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$71(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v27

    goto/16 :goto_2

    .line 894
    .end local v11    # "i":I
    .end local v19    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v21    # "msg":Landroid/os/Message;
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    invoke-static {v0, v15}, Lcom/edutech/mobilestudyclient/util/Utils;->clearUpdateAPks(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_3

    .line 897
    .end local v7    # "data":Lorg/json/JSONArray;
    .end local v9    # "errorNum":I
    .end local v17    # "jobj":Lorg/json/JSONObject;
    .end local v25    # "response":Lorg/apache/http/HttpResponse;
    .end local v26    # "result":Ljava/lang/String;
    .end local v32    # "status":Z
    :catch_0
    move-exception v8

    .line 899
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_3

    .line 918
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_10
    if-eqz v27, :cond_11

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v41

    if-gtz v41, :cond_12

    .line 919
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const/16 v42, 0x3

    const/16 v43, 0x3

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    const/16 v44, 0x3

    invoke-static/range {v41 .. v44}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    goto/16 :goto_4

    .line 922
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$74(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/util/List;)V

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$UpdateThread;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v41, v0

    const/16 v42, 0x1

    const/16 v43, 0x1

    invoke-static/range {v43 .. v43}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v43

    const/16 v44, 0x1

    invoke-static/range {v41 .. v44}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$73(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;ILjava/lang/Object;I)V

    goto/16 :goto_4

    .line 822
    .restart local v7    # "data":Lorg/json/JSONArray;
    .restart local v9    # "errorNum":I
    .restart local v11    # "i":I
    .restart local v17    # "jobj":Lorg/json/JSONObject;
    .restart local v18    # "json":Lorg/json/JSONObject;
    .restart local v19    # "localAppInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v22    # "packagename":Ljava/lang/String;
    .restart local v25    # "response":Lorg/apache/http/HttpResponse;
    .restart local v26    # "result":Ljava/lang/String;
    .restart local v30    # "size":J
    .restart local v32    # "status":Z
    .restart local v37    # "version":Ljava/lang/String;
    .restart local v38    # "vercodeLong":J
    .restart local v40    # "versionCode":Ljava/lang/String;
    :catch_1
    move-exception v41

    goto/16 :goto_5

    .line 824
    :catch_2
    move-exception v41

    goto/16 :goto_5

    .line 843
    .restart local v4    # "apkUpdateBean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .restart local v16    # "isInstall":Z
    .restart local v20    # "localTempApp":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v34    # "tempcode":J
    :catch_3
    move-exception v41

    goto/16 :goto_8

    .line 841
    :catch_4
    move-exception v41

    goto/16 :goto_8
.end method
