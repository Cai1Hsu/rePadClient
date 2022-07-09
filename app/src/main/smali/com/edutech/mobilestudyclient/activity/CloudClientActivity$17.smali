.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->uploadLogs()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

.field private final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/io/File;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iput-object p2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->val$file:Ljava/io/File;

    .line 1705
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 1710
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "http://"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$49(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "/api/padlog/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1711
    .local v8, "url":Ljava/lang/String;
    const-string/jumbo v4, ""

    .line 1713
    .local v4, "json":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->val$file:Ljava/io/File;

    const-string/jumbo v10, "UTF-8"

    invoke-static {v9, v10}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 1718
    :goto_0
    if-eqz v8, :cond_0

    if-eqz v4, :cond_0

    const-string/jumbo v9, ""

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string/jumbo v9, ""

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 1719
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v9}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$50(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$51(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->httpPostInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v2

    .line 1720
    .local v2, "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1721
    .local v6, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v9, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v10, "data"

    invoke-direct {v9, v10, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1725
    :try_start_1
    new-instance v9, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string/jumbo v10, "UTF-8"

    invoke-direct {v9, v6, v10}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1726
    new-instance v9, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v9}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-virtual {v9, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 1727
    .local v3, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result v9

    const/16 v10, 0xc8

    if-ne v9, v10, :cond_1

    .line 1730
    :try_start_2
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v7

    .line 1731
    .local v7, "strResult":Ljava/lang/String;
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1732
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v9, "status"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 1733
    iget-object v9, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$17;->val$file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->delete()Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1755
    .end local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    .end local v6    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v7    # "strResult":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 1714
    :catch_0
    move-exception v1

    .line 1716
    .local v1, "e1":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 1735
    .end local v1    # "e1":Ljava/io/IOException;
    .restart local v2    # "httpRequest":Lorg/apache/http/client/methods/HttpPost;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v6    # "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    :catch_1
    move-exception v0

    .line 1736
    .local v0, "e":Lorg/json/JSONException;
    :try_start_3
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 1746
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_2
    move-exception v0

    .line 1748
    .local v0, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v0}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto :goto_1

    .line 1743
    .end local v0    # "e":Lorg/apache/http/client/ClientProtocolException;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :cond_1
    :try_start_4
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "Error Response: "

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_1

    .line 1750
    .end local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_3
    move-exception v0

    .line 1752
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 1739
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_4
    move-exception v9

    goto :goto_1

    .line 1737
    :catch_5
    move-exception v9

    goto :goto_1
.end method
