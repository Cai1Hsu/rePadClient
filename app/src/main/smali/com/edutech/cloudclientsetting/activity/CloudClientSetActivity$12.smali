.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 3259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 3263
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, " "

    const-string/jumbo v16, ""

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$21(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 3264
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x7

    if-le v13, v14, :cond_0

    .line 3265
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x7

    invoke-virtual {v13, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 3266
    .local v10, "subhttp":Ljava/lang/String;
    const-string/jumbo v13, "http://"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 3268
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$1(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x7

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$21(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 3269
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3270
    .local v6, "message":Landroid/os/Message;
    const/16 v13, 0x65

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3271
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 3277
    .end local v6    # "message":Landroid/os/Message;
    .end local v10    # "subhttp":Ljava/lang/String;
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v13

    invoke-interface {v13}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v9

    .line 3278
    .local v9, "struserName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$19(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v13

    invoke-interface {v13}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v8

    .line 3279
    .local v8, "strpassWord":Ljava/lang/String;
    if-eqz v9, :cond_1

    if-eqz v8, :cond_1

    .line 3280
    const-string/jumbo v13, " "

    const-string/jumbo v14, ""

    invoke-virtual {v9, v13, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 3281
    const-string/jumbo v13, " "

    const-string/jumbo v14, ""

    invoke-virtual {v8, v13, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 3283
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$56(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 3284
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13, v8}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$57(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3292
    .end local v8    # "strpassWord":Ljava/lang/String;
    .end local v9    # "struserName":Ljava/lang/String;
    :goto_0
    const/4 v3, -0x1

    .line 3293
    .local v3, "flag":I
    const-string/jumbo v13, "CloudClientSetActivity"

    const-string/jumbo v14, "writeXml"

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3294
    const-string/jumbo v13, "CloudClientSetActivity"

    const-string/jumbo v14, "2152"

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3295
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v13

    .line 3296
    invoke-interface {v13}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3295
    sput-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->MOBILESTUDYSERVERIP:Ljava/lang/String;

    .line 3297
    .local v4, "ip":Ljava/lang/String;
    const-string/jumbo v13, " "

    const-string/jumbo v14, ""

    invoke-virtual {v4, v13, v14}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3298
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x7

    if-le v13, v14, :cond_2

    .line 3299
    const/4 v13, 0x0

    const/4 v14, 0x7

    invoke-virtual {v4, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 3300
    .restart local v10    # "subhttp":Ljava/lang/String;
    const-string/jumbo v13, "http://"

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 3302
    const/4 v13, 0x7

    invoke-virtual {v4, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 3303
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$52(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3304
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v13

    invoke-virtual {v13, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3307
    .end local v10    # "subhttp":Ljava/lang/String;
    :cond_2
    const-string/jumbo v13, "/"

    invoke-virtual {v4, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 3309
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3310
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x3eb

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3311
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 3373
    :goto_1
    return-void

    .line 3285
    .end local v3    # "flag":I
    .end local v4    # "ip":Ljava/lang/String;
    .end local v6    # "message":Landroid/os/Message;
    :catch_0
    move-exception v2

    .line 3287
    .local v2, "e1":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 3314
    .end local v2    # "e1":Ljava/lang/Exception;
    .restart local v3    # "flag":I
    .restart local v4    # "ip":Ljava/lang/String;
    :cond_3
    if-eqz v4, :cond_4

    if-eqz v4, :cond_5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v13

    if-gtz v13, :cond_5

    .line 3315
    :cond_4
    const-string/jumbo v4, "192.168.0.88"

    .line 3316
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    const-string/jumbo v14, "http://"

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "/api/config"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 3317
    .local v11, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v14, "wifi"

    invoke-virtual {v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/net/wifi/WifiManager;

    .line 3318
    .local v12, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v12}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v13

    invoke-virtual {v13}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v5

    .line 3319
    .local v5, "m_szWLANMAC":Ljava/lang/String;
    if-eqz v5, :cond_6

    const-string/jumbo v13, "02:00:00:00:00:00"

    invoke-virtual {v5, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 3321
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getMacAddr()Ljava/lang/String;

    move-result-object v5

    .line 3323
    :cond_6
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v14, "/mac/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 3324
    const/4 v7, 0x0

    .line 3327
    .local v7, "result":Ljava/lang/String;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$58(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$59(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v7

    .line 3333
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v14, ""

    invoke-static {v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$54(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    .line 3334
    if-eqz v7, :cond_7

    const-string/jumbo v13, ""

    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7

    .line 3335
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13, v7}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$60(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)I

    move-result v3

    .line 3338
    :cond_7
    const/4 v13, 0x1

    if-ne v3, v13, :cond_8

    .line 3339
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3340
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x14

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3341
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3342
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 3328
    .end local v6    # "message":Landroid/os/Message;
    :catch_1
    move-exception v1

    .line 3330
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 3343
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_8
    if-nez v3, :cond_9

    .line 3345
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3346
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x1f

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3347
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3348
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 3349
    .end local v6    # "message":Landroid/os/Message;
    :cond_9
    const/4 v13, 0x2

    if-ne v3, v13, :cond_a

    .line 3351
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3352
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x20

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3353
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3354
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 3355
    .end local v6    # "message":Landroid/os/Message;
    :cond_a
    const/4 v13, -0x2

    if-ne v3, v13, :cond_b

    .line 3357
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3358
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x3ea

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3359
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3360
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 3361
    .end local v6    # "message":Landroid/os/Message;
    :cond_b
    const/16 v13, -0x64

    if-ne v3, v13, :cond_c

    .line 3363
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3364
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x3ed

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3365
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3366
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1

    .line 3368
    .end local v6    # "message":Landroid/os/Message;
    :cond_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 3369
    .restart local v6    # "message":Landroid/os/Message;
    const/16 v13, 0x15

    iput v13, v6, Landroid/os/Message;->what:I

    .line 3370
    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3371
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$12;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$31(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v13

    invoke-virtual {v13, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1
.end method
