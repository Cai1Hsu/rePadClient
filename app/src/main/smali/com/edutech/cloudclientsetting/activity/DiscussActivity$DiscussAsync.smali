.class Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;
.super Landroid/os/AsyncTask;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DiscussAsync"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field map:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;


# direct methods
.method public constructor <init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p2, "hmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    .line 95
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 97
    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    .line 98
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 17
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 102
    const-string/jumbo v13, ""

    .line 103
    .local v13, "subjectId":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 104
    .local v7, "keyword":Ljava/lang/String;
    const-string/jumbo v8, ""

    .line 105
    .local v8, "page":Ljava/lang/String;
    const-string/jumbo v9, ""

    .line 106
    .local v9, "pagenum":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    if-eqz v15, :cond_3

    .line 108
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "keyword"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 110
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "keyword"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "keyword":Ljava/lang/String;
    check-cast v7, Ljava/lang/String;

    .line 112
    .restart local v7    # "keyword":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "subjectid"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    .line 114
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "subjectid"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "subjectId":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 116
    .restart local v13    # "subjectId":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "page"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 118
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "page"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "page":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 120
    .restart local v8    # "page":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "pagenum"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 122
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v16, "pagenum"

    invoke-virtual/range {v15 .. v16}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "pagenum":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 125
    .restart local v9    # "pagenum":Ljava/lang/String;
    :cond_3
    new-instance v15, Ljava/lang/StringBuilder;

    const-string/jumbo v16, "http://"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 126
    const-string/jumbo v16, "/api/interaction"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 125
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 127
    .local v14, "url":Ljava/lang/String;
    const-string/jumbo v15, ""

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_4

    if-eqz v7, :cond_4

    .line 129
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, "/keyword/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 131
    :cond_4
    const-string/jumbo v15, ""

    invoke-virtual {v8, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_5

    if-eqz v8, :cond_5

    .line 133
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, "/page/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 135
    :cond_5
    const-string/jumbo v15, ""

    invoke-virtual {v13, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6

    if-eqz v13, :cond_6

    .line 137
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, "/subjectid/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 139
    :cond_6
    const-string/jumbo v15, ""

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_7

    if-eqz v9, :cond_7

    .line 141
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, "/pagenum/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 143
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v15, v14}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v5

    .line 144
    .local v5, "get":Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 146
    .local v1, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_0
    invoke-virtual {v1, v5}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 147
    .local v10, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v15, v10}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v11

    .line 148
    .local v11, "result":Ljava/lang/String;
    const-string/jumbo v15, "updateresult"

    invoke-static {v15, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 150
    .local v6, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v15, "status"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    .line 151
    .local v12, "status":Z
    const-string/jumbo v15, "errorNum"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 154
    .local v4, "errorNum":I
    if-nez v12, :cond_8

    if-nez v4, :cond_9

    .line 155
    :cond_8
    const-string/jumbo v15, "data"

    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 156
    .local v2, "data":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v15, v2}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$3(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .end local v2    # "data":Lorg/json/JSONArray;
    .end local v4    # "errorNum":I
    .end local v6    # "jobj":Lorg/json/JSONObject;
    .end local v10    # "response":Lorg/apache/http/HttpResponse;
    .end local v11    # "result":Ljava/lang/String;
    .end local v12    # "status":Z
    :cond_9
    :goto_0
    const-string/jumbo v15, ""

    return-object v15

    .line 158
    :catch_0
    move-exception v3

    .line 160
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 174
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, ""

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 176
    :cond_1
    return-void
.end method
