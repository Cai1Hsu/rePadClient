.class Lcom/edutech/appmanage/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 329
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 330
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->progress_handler:Landroid/os/Handler;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 342
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$0(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v6}, Lcom/edutech/appmanage/MainActivity;->access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v7}, Lcom/edutech/appmanage/MainActivity;->access$2(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lcom/edutech/appmanage/MainActivity;->access$3(Lcom/edutech/appmanage/MainActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/edutech/appmanage/MainActivity;->login_res:I

    .line 343
    const-string/jumbo v3, "AppmanageMainActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "LOGIN_RES   :"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget v5, v5, Lcom/edutech/appmanage/MainActivity;->login_res:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget v3, v3, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v3, :cond_3

    .line 345
    const/4 v3, -0x1

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget v4, v4, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v3, v4, :cond_1

    .line 347
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 355
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->load_info()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/edutech/appmanage/MainActivity;->unlink_parse(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 447
    :goto_1
    monitor-exit p0

    return-void

    .line 348
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget v3, v3, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-ne v8, v3, :cond_2

    .line 350
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 329
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 351
    :cond_2
    :try_start_2
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget v3, v3, Lcom/edutech/appmanage/MainActivity;->login_res:I

    if-eqz v3, :cond_0

    .line 353
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->wrong_handler:Landroid/os/Handler;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    .line 397
    :cond_3
    const-string/jumbo v3, "AppmanageMainActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "usercode=="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "http://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$0(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 399
    const-string/jumbo v4, "/api/pad-login/code/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "/pwd/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$2(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 398
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 400
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$4(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    .line 398
    invoke-static {v3, v4, v5}, Lcom/edutech/appmanage/HttpHelper;->getin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 401
    .local v1, "res_id":Ljava/lang/String;
    const-string/jumbo v3, "AppmanageMainActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "333---RES_ID  :"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    const/4 v0, 0x0

    .line 403
    .local v0, "infor":Ljava/lang/String;
    if-eqz v1, :cond_5

    .line 404
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v3, v1}, Lcom/edutech/appmanage/MainActivity;->parse_studentid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 405
    .local v2, "stu_id":Ljava/lang/String;
    if-nez v2, :cond_4

    .line 406
    const-string/jumbo v3, "AppmanageMainActivity"

    const-string/jumbo v4, "338"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->handler_toast:Landroid/os/Handler;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1

    .line 411
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "http://"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$0(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 412
    const-string/jumbo v4, "/api/app/projectcode/myapp/os/android"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 411
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 412
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity;->access$1(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v4

    .line 413
    iget-object v5, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v5}, Lcom/edutech/appmanage/MainActivity;->access$4(Lcom/edutech/appmanage/MainActivity;)Ljava/lang/String;

    move-result-object v5

    .line 411
    invoke-static {v3, v4, v5}, Lcom/edutech/appmanage/HttpHelper;->getin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 414
    const-string/jumbo v3, "AppmanageMainActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "346-infor--->"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    if-eqz v0, :cond_6

    .line 438
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->unlink_handler:Landroid/os/Handler;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 439
    invoke-static {v0}, Lcom/edutech/appmanage/utils/SharedPreferencesHelper;->save_info(Ljava/lang/String;)V

    .line 446
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->parse_json()V

    goto/16 :goto_1

    .line 416
    .end local v2    # "stu_id":Ljava/lang/String;
    :cond_5
    const-string/jumbo v3, "AppmanageMainActivity"

    const-string/jumbo v4, "345"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->handler_toast:Landroid/os/Handler;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_1

    .line 441
    .restart local v2    # "stu_id":Ljava/lang/String;
    :cond_6
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$1;->this$0:Lcom/edutech/appmanage/MainActivity;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity;->handler_toast:Landroid/os/Handler;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_1
.end method
