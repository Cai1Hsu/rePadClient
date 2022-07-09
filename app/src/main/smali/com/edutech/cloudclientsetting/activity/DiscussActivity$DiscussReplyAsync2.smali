.class Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;
.super Landroid/os/AsyncTask;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DiscussReplyAsync2"
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
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)V
    .locals 0

    .prologue
    .line 379
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 384
    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v12, "http://"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v12, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v12}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 385
    const-string/jumbo v12, "/api/interaction/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 384
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 386
    .local v10, "url":Ljava/lang/String;
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v11, v10}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$6(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v6

    .line 388
    .local v6, "put":Lorg/apache/http/client/methods/HttpPost;
    :try_start_0
    new-instance v3, Lorg/apache/http/entity/mime/MultipartEntity;

    invoke-direct {v3}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>()V

    .line 389
    .local v3, "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    const-string/jumbo v11, "messageid"

    new-instance v12, Lorg/apache/http/entity/mime/content/StringBody;

    iget-object v13, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11, v12}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 390
    const-string/jumbo v11, "type"

    new-instance v12, Lorg/apache/http/entity/mime/content/StringBody;

    const-string/jumbo v13, "2"

    invoke-direct {v12, v13}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v11, v12}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 391
    invoke-virtual {v6, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 396
    .end local v3    # "entity":Lorg/apache/http/entity/mime/MultipartEntity;
    :goto_0
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 398
    .local v0, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_1
    invoke-virtual {v0, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 399
    .local v7, "response":Lorg/apache/http/HttpResponse;
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v11, v7}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v8

    .line 400
    .local v8, "result":Ljava/lang/String;
    const-string/jumbo v11, "updateresult"

    invoke-static {v11, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 402
    .local v5, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v11, "status"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    .line 403
    .local v9, "status":Z
    const-string/jumbo v11, "errorNum"

    invoke-virtual {v5, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v4

    .line 404
    .local v4, "errorNum":I
    if-nez v9, :cond_0

    .line 410
    .end local v4    # "errorNum":I
    .end local v5    # "jobj":Lorg/json/JSONObject;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "result":Ljava/lang/String;
    .end local v9    # "status":Z
    :cond_0
    :goto_1
    const-string/jumbo v11, ""

    return-object v11

    .line 392
    .end local v0    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :catch_0
    move-exception v2

    .line 394
    .local v2, "e1":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 406
    .end local v2    # "e1":Ljava/lang/Exception;
    .restart local v0    # "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :catch_1
    move-exception v1

    .line 408
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 416
    return-void
.end method
