.class Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;
.super Landroid/os/AsyncTask;
.source "DiscussActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/DiscussActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DiscussSubjectsAsync"
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
    .line 183
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .locals 13
    .param p1, "arg0"    # [Ljava/lang/String;

    .prologue
    .line 188
    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "http://"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v11}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 189
    const-string/jumbo v11, "/api/subject/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 188
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 190
    .local v9, "url":Ljava/lang/String;
    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v10, v9}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v4

    .line 191
    .local v4, "get":Lorg/apache/http/client/methods/HttpGet;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 193
    .local v0, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_0
    invoke-virtual {v0, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 194
    .local v6, "response":Lorg/apache/http/HttpResponse;
    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v10, v6}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$2(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v7

    .line 195
    .local v7, "result":Ljava/lang/String;
    const-string/jumbo v10, "updateresult"

    invoke-static {v10, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 197
    .local v5, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v10, "status"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    .line 198
    .local v8, "status":Z
    const-string/jumbo v10, "errorNum"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 199
    .local v3, "errorNum":I
    const-string/jumbo v10, "errorInfo"

    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 200
    .local v2, "errorInfo":Ljava/lang/String;
    const-string/jumbo v10, "updateresult"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v12, "error:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    if-nez v8, :cond_0

    .line 208
    .end local v2    # "errorInfo":Ljava/lang/String;
    .end local v3    # "errorNum":I
    .end local v5    # "jobj":Lorg/json/JSONObject;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    .end local v7    # "result":Ljava/lang/String;
    .end local v8    # "status":Z
    :cond_0
    :goto_0
    const-string/jumbo v10, ""

    return-object v10

    .line 204
    :catch_0
    move-exception v1

    .line 206
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Landroid/widget/SimpleAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 220
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussSubjectsAsync;->this$0:Lcom/edutech/cloudclientsetting/activity/DiscussActivity;

    invoke-direct {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;-><init>(Lcom/edutech/cloudclientsetting/activity/DiscussActivity;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, ""

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/edutech/cloudclientsetting/activity/DiscussActivity$DiscussDetailsAsync;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 222
    :cond_1
    return-void
.end method
