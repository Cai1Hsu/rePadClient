.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;
.super Landroid/os/Handler;
.source "CloudClientSetActivity.java"


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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 351
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 18
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 354
    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->what:I

    sparse-switch v13, :sswitch_data_0

    .line 439
    :cond_0
    :goto_0
    :sswitch_0
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 440
    return-void

    .line 358
    :sswitch_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$3(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto :goto_0

    .line 361
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/TextView;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    .line 362
    const v15, 0x7f0801d2

    .line 361
    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/TextView;

    move-result-object v13

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 364
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$4(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/TextView;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0c0005

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 367
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0801d3

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showToast(Ljava/lang/String;)V

    .line 368
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$5(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 369
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$6(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto :goto_0

    .line 372
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$7(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    .line 373
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-virtual {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->isFinishing()Z

    move-result v13

    if-nez v13, :cond_0

    .line 374
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$8(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V

    goto/16 :goto_0

    .line 378
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$9(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/lee/demo/view/CustomProgressDialog;

    move-result-object v13

    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$10(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Z

    move-result v13

    if-nez v13, :cond_0

    sget-boolean v13, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isNewUpdate:Z

    if-nez v13, :cond_0

    .line 380
    new-instance v6, Ljava/text/DecimalFormat;

    const-string/jumbo v13, "##0.00"

    invoke-direct {v6, v13}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 381
    .local v6, "df":Ljava/text/DecimalFormat;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$11(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v14

    long-to-double v14, v14

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    mul-double v14, v14, v16

    const-wide/high16 v16, 0x4090000000000000L    # 1024.0

    div-double v14, v14, v16

    const-wide/high16 v16, 0x4090000000000000L    # 1024.0

    div-double v14, v14, v16

    invoke-virtual {v6, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    .line 382
    .local v3, "alllength":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$12(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v14

    long-to-double v14, v14

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    mul-double v14, v14, v16

    const-wide/high16 v16, 0x4090000000000000L    # 1024.0

    div-double v14, v14, v16

    const-wide/high16 v16, 0x4090000000000000L    # 1024.0

    div-double v14, v14, v16

    invoke-virtual {v6, v14, v15}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    .line 383
    .local v5, "currentPosition":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v14, "MB/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "MB"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 384
    .local v2, "allStateString":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$11(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v14

    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-nez v13, :cond_1

    .line 386
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$9(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/lee/demo/view/CustomProgressDialog;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const v16, 0x7f0802fc

    invoke-virtual/range {v15 .. v16}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v15, "  0%"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/lee/demo/view/CustomProgressDialog;->setMessage(Ljava/lang/String;)Lcom/lee/demo/view/CustomProgressDialog;

    goto/16 :goto_0

    .line 389
    :cond_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$12(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v14

    const-wide/16 v16, 0x64

    mul-long v14, v14, v16

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$11(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)J

    move-result-wide v16

    div-long v14, v14, v16

    long-to-int v10, v14

    .line 390
    .local v10, "percent":I
    const/16 v13, 0x64

    if-lt v10, v13, :cond_2

    .line 392
    const/16 v10, 0x64

    .line 394
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$9(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/lee/demo/view/CustomProgressDialog;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const v16, 0x7f0802fc

    invoke-virtual/range {v15 .. v16}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v15, "  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "%  "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/lee/demo/view/CustomProgressDialog;->setMessage(Ljava/lang/String;)Lcom/lee/demo/view/CustomProgressDialog;

    goto/16 :goto_0

    .line 400
    .end local v2    # "allStateString":Ljava/lang/String;
    .end local v3    # "alllength":Ljava/lang/String;
    .end local v5    # "currentPosition":Ljava/lang/String;
    .end local v6    # "df":Ljava/text/DecimalFormat;
    .end local v10    # "percent":I
    :sswitch_6
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$13(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v14}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->setData(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 401
    :catch_0
    move-exception v13

    goto/16 :goto_0

    .line 407
    :sswitch_7
    :try_start_1
    move-object/from16 v0, p1

    iget-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    .line 408
    .local v7, "downsize":Ljava/lang/Long;
    move-object/from16 v0, p1

    iget v11, v0, Landroid/os/Message;->arg1:I

    .line 409
    .local v11, "position":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 410
    .local v4, "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    invoke-virtual {v4, v14, v15}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setApkDownloadSize(J)V

    .line 411
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v11, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 412
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$13(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    move-result-object v13

    invoke-virtual {v13, v11}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->updateProgress(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 413
    .end local v4    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .end local v7    # "downsize":Ljava/lang/Long;
    .end local v11    # "position":I
    :catch_1
    move-exception v8

    .line 415
    .local v8, "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 420
    .end local v8    # "e":Ljava/lang/Exception;
    :sswitch_8
    :try_start_2
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 421
    .local v12, "state":I
    move-object/from16 v0, p1

    iget v11, v0, Landroid/os/Message;->arg1:I

    .line 422
    .restart local v11    # "position":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 423
    .restart local v4    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    invoke-virtual {v4, v12}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->setInstallState(I)V

    .line 424
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$14(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v11, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 425
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$13(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;

    move-result-object v13

    invoke-virtual {v13, v11}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->updateProgress(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 426
    .end local v4    # "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    .end local v11    # "position":I
    .end local v12    # "state":I
    :catch_2
    move-exception v8

    .line 428
    .restart local v8    # "e":Ljava/lang/Exception;
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 432
    .end local v8    # "e":Ljava/lang/Exception;
    :sswitch_9
    move-object/from16 v0, p1

    iget-object v9, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    .line 433
    .local v9, "path":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$2;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v13, v9}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$15(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 354
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x3e9 -> :sswitch_5
        0x1011 -> :sswitch_7
        0x1012 -> :sswitch_8
        0x1013 -> :sswitch_6
        0x1014 -> :sswitch_9
    .end sparse-switch
.end method
