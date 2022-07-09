.class Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;
.super Landroid/os/AsyncTask;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DiscussDetailsAsync"
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
    .line 276
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 281
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "http://"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v10}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 282
    const-string/jumbo v10, "/api/interaction/messageid/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v10}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 281
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 283
    .local v8, "url":Ljava/lang/String;
    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v9, v8}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v3

    .line 284
    .local v3, "get":Lorg/apache/http/client/methods/HttpGet;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 286
    .local v0, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_0
    invoke-virtual {v0, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 287
    .local v5, "response":Lorg/apache/http/HttpResponse;
    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v9, v5}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v6

    .line 288
    .local v6, "result":Ljava/lang/String;
    const-string/jumbo v9, "updateresult"

    invoke-static {v9, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 290
    .local v4, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v9, "status"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    .line 291
    .local v7, "status":Z
    const-string/jumbo v9, "errorNum"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 292
    .local v2, "errorNum":I
    if-nez v7, :cond_0

    .line 298
    .end local v2    # "errorNum":I
    .end local v4    # "jobj":Lorg/json/JSONObject;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "result":Ljava/lang/String;
    .end local v7    # "status":Z
    :cond_0
    :goto_0
    const-string/jumbo v9, ""

    return-object v9

    .line 294
    :catch_0
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 7
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 304
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 305
    .local v0, "map1":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 306
    .local v1, "map2":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "type"

    const-string/jumbo v3, "1"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    const-string/jumbo v2, "content"

    const-string/jumbo v3, "huan ying jia ru \u8ba8\u8bba"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    const-string/jumbo v2, "type"

    const-string/jumbo v3, "2"

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    new-instance v2, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;

    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {v2, v3, v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/util/HashMap;)V

    new-array v3, v6, [Ljava/lang/String;

    const-string/jumbo v4, ""

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 310
    new-instance v2, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;

    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {v2, v3}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)V

    new-array v3, v6, [Ljava/lang/String;

    const-string/jumbo v4, ""

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussReplyAsync2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 311
    return-void
.end method
