.class Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;
.super Ljava/lang/Thread;
.source "PasswdDialogActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HostPwd"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V
    .locals 0

    .prologue
    .line 96
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 25

    .prologue
    .line 104
    const-string/jumbo v17, ""

    .line 105
    .local v17, "result":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    move-object/from16 v22, v0

    const-string/jumbo v23, "privatekey"

    .line 106
    const/16 v24, 0x0

    .line 105
    invoke-virtual/range {v22 .. v24}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v18

    .line 107
    .local v18, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v22, "key"

    const-string/jumbo v23, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 108
    .local v15, "privatekey":Ljava/lang/String;
    const-string/jumbo v22, "apihost"

    const-string/jumbo v23, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 109
    .local v9, "ip":Ljava/lang/String;
    const-string/jumbo v22, "name"

    const-string/jumbo v23, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 110
    .local v21, "username":Ljava/lang/String;
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v8

    .line 111
    .local v8, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v8, :cond_1

    if-eqz v9, :cond_0

    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_0

    const-string/jumbo v22, ""

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_1

    .line 112
    :cond_0
    const-string/jumbo v22, "ip"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "ip":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 113
    .restart local v9    # "ip":Ljava/lang/String;
    const-string/jumbo v22, "usercode"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    .end local v21    # "username":Ljava/lang/String;
    check-cast v21, Ljava/lang/String;

    .line 115
    .restart local v21    # "username":Ljava/lang/String;
    const-string/jumbo v22, "privatekey"

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "privatekey":Ljava/lang/String;
    check-cast v15, Ljava/lang/String;

    .line 117
    .restart local v15    # "privatekey":Ljava/lang/String;
    :cond_1
    new-instance v22, Ljava/lang/StringBuilder;

    const-string/jumbo v23, "http://"

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 118
    const-string/jumbo v23, "/api/padpwd"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 117
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    .line 119
    .local v20, "url":Ljava/lang/String;
    new-instance v14, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v20

    invoke-direct {v14, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 120
    .local v14, "post":Lorg/apache/http/client/methods/HttpPost;
    const-string/jumbo v22, "X-Edutech-Entity"

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string/jumbo v22, "pwd"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v24, ","

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, ","

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 123
    .local v10, "imestamp":J
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Lcom/edutech/mobilestudyclient/util/My_md5;->Md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 124
    .local v19, "sign":Ljava/lang/String;
    const-string/jumbo v22, "X-Edutech-Sign"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v24, "+"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v14, v0, v1}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 127
    .local v4, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_0
    invoke-virtual {v4, v14}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v16

    .line 128
    .local v16, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$0(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v17

    .line 129
    new-instance v12, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 130
    .local v12, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v22, "data"

    move-object/from16 v0, v22

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, "data":Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    new-instance v22, Ljava/lang/StringBuilder;

    sget-object v23, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWDFILEPATH:Ljava/lang/String;

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "pwd.xml"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 132
    .local v7, "file":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_2

    if-eqz v5, :cond_2

    const-string/jumbo v22, ""

    move-object/from16 v0, v22

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_2

    .line 134
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 136
    :cond_2
    invoke-virtual {v7}, Ljava/io/File;->createNewFile()Z

    .line 137
    new-instance v13, Ljava/io/FileOutputStream;

    invoke-direct {v13, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 138
    .local v13, "out":Ljava/io/FileOutputStream;
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 139
    if-eqz v13, :cond_3

    .line 140
    invoke-virtual {v13}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .end local v5    # "data":Ljava/lang/String;
    .end local v7    # "file":Ljava/io/File;
    .end local v12    # "jobj":Lorg/json/JSONObject;
    .end local v13    # "out":Ljava/io/FileOutputStream;
    .end local v16    # "response":Lorg/apache/http/HttpResponse;
    :cond_3
    :goto_0
    return-void

    .line 141
    :catch_0
    move-exception v6

    .line 143
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
