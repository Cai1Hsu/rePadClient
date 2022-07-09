.class Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;
.super Landroid/os/AsyncTask;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DiscussReplyAsync"
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
    .line 317
    .local p2, "hmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    .line 316
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 318
    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    .line 319
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 17
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 323
    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "http://"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v15}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 324
    const-string/jumbo v15, "/api/interaction/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 323
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 325
    .local v13, "url":Ljava/lang/String;
    const-string/jumbo v12, ""

    .line 326
    .local v12, "type":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 327
    .local v2, "content":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    if-eqz v14, :cond_1

    .line 329
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v15, "type"

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 331
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v15, "type"

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "type":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 333
    .restart local v12    # "type":Ljava/lang/String;
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v15, "content"

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 335
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->map:Ljava/util/HashMap;

    const-string/jumbo v15, "content"

    invoke-virtual {v14, v15}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "content":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 338
    .restart local v2    # "content":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v14, v13}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$6(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v8

    .line 339
    .local v8, "put":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v14, "url"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v16, ",type:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ",content:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    :try_start_0
    new-instance v5, Lorg/apache/http/entity/mime/MultipartEntity;

    invoke-direct {v5}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 342
    .local v5, "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    const-string/jumbo v14, "messageid"

    new-instance v15, Lorg/apache/http/entity/mime/content/StringBody;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v14, v15}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 343
    if-eqz v2, :cond_2

    const-string/jumbo v14, ""

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 345
    const-string/jumbo v14, "content"

    new-instance v15, Lorg/apache/http/entity/mime/content/StringBody;

    const-string/jumbo v16, "UTF-8"

    invoke-static/range {v16 .. v16}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v2, v0}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    invoke-virtual {v5, v14, v15}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 347
    :cond_2
    if-eqz v12, :cond_3

    const-string/jumbo v14, ""

    invoke-virtual {v12, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_3

    .line 349
    const-string/jumbo v14, "type"

    new-instance v15, Lorg/apache/http/entity/mime/content/StringBody;

    invoke-direct {v15, v12}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v14, v15}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 351
    :cond_3
    invoke-virtual {v8, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    .end local v5    # "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    :goto_0
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 358
    .local v1, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_1
    invoke-virtual {v1, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    .line 359
    .local v9, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v14, v9}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v10

    .line 360
    .local v10, "result":Ljava/lang/String;
    const-string/jumbo v14, "updateresult"

    invoke-static {v14, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 362
    .local v7, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v14, "status"

    invoke-virtual {v7, v14}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    .line 363
    .local v11, "status":Z
    const-string/jumbo v14, "errorNum"

    invoke-virtual {v7, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 364
    .local v6, "errorNum":I
    if-nez v11, :cond_4

    .line 370
    .end local v6    # "errorNum":I
    .end local v7    # "jobj":Lorg/json/JSONObject;
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    .end local v10    # "result":Ljava/lang/String;
    .end local v11    # "status":Z
    :cond_4
    :goto_1
    const-string/jumbo v14, ""

    return-object v14

    .line 352
    .end local v1    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :catch_0
    move-exception v4

    .line 354
    .local v4, "e1":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 366
    .end local v4    # "e1":Ljava/lang/Exception;
    .restart local v1    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :catch_1
    move-exception v3

    .line 368
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 377
    return-void
.end method
