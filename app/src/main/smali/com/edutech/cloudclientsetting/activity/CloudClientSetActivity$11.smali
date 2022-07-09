.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2944
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;)Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;
    .locals 1

    .prologue
    .line 2944
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 2950
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, v8, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x6

    if-lt v8, v9, :cond_0

    .line 2951
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, v8, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x6

    if-ge v8, v9, :cond_2

    .line 2952
    :cond_0
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 2953
    .local v3, "msg":Landroid/os/Message;
    const/16 v8, 0xd

    iput v8, v3, Landroid/os/Message;->what:I

    .line 2954
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v8

    const-wide/16 v10, 0x3e8

    invoke-virtual {v8, v3, v10, v11}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 3021
    .end local v3    # "msg":Landroid/os/Message;
    :cond_1
    :goto_0
    return-void

    .line 2958
    :cond_2
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$52(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    if-eqz v8, :cond_7

    .line 2959
    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$52(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-interface {v9}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 2961
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v8, v8, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    if-eqz v8, :cond_1

    .line 2962
    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-interface {v9}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 2963
    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, v9, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-interface {v9}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 2967
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2968
    const-string/jumbo v9, "privatekey"

    const/4 v10, 0x0

    .line 2967
    invoke-virtual {v8, v9, v10}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 2969
    .local v5, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "name"

    const-string/jumbo v9, ""

    invoke-interface {v5, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 2970
    .local v7, "userName":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 2972
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    new-instance v9, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;

    invoke-direct {v9, p0, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;-><init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2981
    :cond_3
    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 2984
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, v9, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    invoke-interface {v9}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$53(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 2985
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, v9, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->oldpwd:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v9

    .line 2986
    invoke-interface {v9}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v10, v10, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->newpwd:Landroid/widget/EditText;

    invoke-virtual {v10}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v10

    invoke-interface {v10}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v10

    .line 2985
    invoke-virtual {v8, v7, v9, v10}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->ModifyPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2987
    .local v4, "result":Ljava/lang/String;
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 2989
    .restart local v3    # "msg":Landroid/os/Message;
    :try_start_0
    const-string/jumbo v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 2990
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    iget-object v9, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080220

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$54(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 2991
    const/16 v8, 0xc

    iput v8, v3, Landroid/os/Message;->what:I

    .line 2992
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v8

    const-wide/16 v10, 0x1f4

    invoke-virtual {v8, v3, v10, v11}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 3008
    :catch_0
    move-exception v0

    .line 3010
    .local v0, "e":Lorg/json/JSONException;
    const/16 v8, 0xc

    iput v8, v3, Landroid/os/Message;->what:I

    .line 3011
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 3013
    .end local v0    # "e":Lorg/json/JSONException;
    :goto_1
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v8

    const-wide/16 v10, 0x1f4

    invoke-virtual {v8, v3, v10, v11}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_0

    .line 2995
    :cond_4
    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 2996
    .local v2, "jobj":Lorg/json/JSONObject;
    const-string/jumbo v8, "status"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    .line 2997
    .local v6, "status":Z
    if-nez v6, :cond_5

    .line 2998
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v9, "errorInfo"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$54(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 2999
    const/16 v8, 0xc

    iput v8, v3, Landroid/os/Message;->what:I

    goto :goto_1

    .line 3001
    :cond_5
    new-instance v1, Ljava/io/File;

    sget-object v8, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->URLFILEPATH:Ljava/lang/String;

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3002
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 3003
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 3005
    :cond_6
    const/16 v8, 0xb

    iput v8, v3, Landroid/os/Message;->what:I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 3017
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "jobj":Lorg/json/JSONObject;
    .end local v3    # "msg":Landroid/os/Message;
    .end local v4    # "result":Ljava/lang/String;
    .end local v5    # "sharePre":Landroid/content/SharedPreferences;
    .end local v6    # "status":Z
    .end local v7    # "userName":Ljava/lang/String;
    :cond_7
    new-instance v3, Landroid/os/Message;

    invoke-direct {v3}, Landroid/os/Message;-><init>()V

    .line 3018
    .restart local v3    # "msg":Landroid/os/Message;
    const/16 v8, 0x10

    iput v8, v3, Landroid/os/Message;->what:I

    .line 3019
    iget-object v8, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v8

    const-wide/16 v10, 0x3e8

    invoke-virtual {v8, v3, v10, v11}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_0
.end method
