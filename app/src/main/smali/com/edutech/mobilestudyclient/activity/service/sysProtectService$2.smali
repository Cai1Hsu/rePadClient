.class Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;
.super Landroid/content/BroadcastReceiver;
.source "sysProtectService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    .line 374
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 378
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    .line 379
    .local v2, "action":Ljava/lang/String;
    const-string/jumbo v13, "APKInstallReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "action = "

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 380
    const-string/jumbo v13, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 382
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 383
    .local v11, "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v13, "com.launcher.activity"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    const-string/jumbo v13, "dolphin.video.players"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    const-string/jumbo v13, "com.onlinesys.student"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    const-string/jumbo v13, "com.google.android.inputmethod.pinyin"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    const-string/jumbo v13, "com.akson.timeep"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    const-string/jumbo v13, "com.akson.timeepstudent"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    const-string/jumbo v13, "com.webgenie.swf.play"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 390
    const-string/jumbo v13, "com.ashleytech.falswf"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    const-string/jumbo v13, "cn.wps.moffice_eng"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 392
    sget-boolean v13, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isDEMO:Z

    if-eqz v13, :cond_0

    .line 394
    const-string/jumbo v13, "com.lejent.zuoyeshenqi.afanti"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 395
    const-string/jumbo v13, "com.A17zuoye.mobile.homework"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 396
    const-string/jumbo v13, "com.jinxin.namibox"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 397
    const-string/jumbo v13, "com.haojiazhang.activity"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 398
    const-string/jumbo v13, "com.youdao.dict"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    const-string/jumbo v13, "org.hisand.zidian.zhs"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    const-string/jumbo v13, "com.record.ing"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 401
    const-string/jumbo v13, "com.xueersi.parentsmeeting"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 402
    const-string/jumbo v13, "com.hjwordgames"

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 404
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v10

    .line 405
    .local v10, "packageName":Ljava/lang/String;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\u5b89\u88c5\u4e86:"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "\u5305\u540d\u7684\u7a0b\u5e8f"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 408
    const-string/jumbo v13, "package:"

    const-string/jumbo v14, ""

    invoke-virtual {v10, v13, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    .line 409
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v13

    if-eqz v13, :cond_5

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$2(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    const/4 v5, 0x1

    .line 410
    .local v5, "hasApp":Z
    :goto_0
    const-string/jumbo v13, "com.edutech"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_6

    const-string/jumbo v13, "com.launcher.activity"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_6

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_6

    const/4 v8, 0x0

    .line 411
    .local v8, "isYjapp":Z
    :goto_1
    if-nez v8, :cond_1

    if-nez v5, :cond_1

    .line 414
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getApplicationContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v10, v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->uninstall(Ljava/lang/String;Landroid/content/Context;)Z

    .line 417
    :cond_1
    if-eqz v10, :cond_2

    const-string/jumbo v13, "com.edutech.firewall"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 419
    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    .line 420
    .local v6, "in":Landroid/content/Intent;
    const-string/jumbo v13, "com.edutech.intent.TrafficStatsService"

    invoke-virtual {v6, v13}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 421
    const-string/jumbo v13, "com.edutech.firewall"

    const-string/jumbo v14, "eu.faircode.netguard.TrafficStatsService"

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 422
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13, v6}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 423
    const-string/jumbo v13, "APKInstallReceiver"

    const-string/jumbo v14, "send service "

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    .end local v6    # "in":Landroid/content/Intent;
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    iget-object v13, v13, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->logUploadTask:Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;

    if-eqz v13, :cond_3

    const-string/jumbo v13, "com.edutech"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string/jumbo v13, "dolphin.video.players"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string/jumbo v13, "cn.wps.moffice_eng"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string/jumbo v13, "com.webgenie.swf.play"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_3

    .line 427
    const/4 v13, 0x1

    sput-boolean v13, Lcom/edutech/mobilestudyclient/activity/service/logUploadTimer;->invalidApkInstall:Z

    .line 428
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v14, "lockscreen"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 429
    .local v12, "sp":Landroid/content/SharedPreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    sput-wide v14, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->installOtherAppTime:J

    .line 430
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "installtime"

    sget-wide v16, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->installOtherAppTime:J

    move-wide/from16 v0, v16

    invoke-interface {v13, v14, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 431
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "installpkg"

    invoke-interface {v13, v14, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 433
    .end local v12    # "sp":Landroid/content/SharedPreferences;
    :cond_3
    const-string/jumbo v13, "com.edutech.assistantdemo"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 435
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v13, "android.intent.action.MAIN"

    invoke-direct {v7, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 436
    .local v7, "intent2":Landroid/content/Intent;
    const/high16 v13, 0x10000000

    invoke-virtual {v7, v13}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 438
    new-instance v3, Landroid/content/ComponentName;

    const-string/jumbo v13, "com.edutech.assistantdemo"

    .line 439
    const-string/jumbo v14, "com.edutech.assistantdemo.MainActivity"

    .line 438
    invoke-direct {v3, v13, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    .local v3, "cn":Landroid/content/ComponentName;
    invoke-virtual {v7, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 443
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 444
    const-string/jumbo v14, "com.edutech.assistantdemo"

    const/4 v15, 0x0

    .line 443
    invoke-virtual {v13, v14, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 449
    .local v9, "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_2
    if-eqz v9, :cond_4

    .line 450
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13, v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startActivity(Landroid/content/Intent;)V

    .line 509
    .end local v3    # "cn":Landroid/content/ComponentName;
    .end local v5    # "hasApp":Z
    .end local v7    # "intent2":Landroid/content/Intent;
    .end local v8    # "isYjapp":Z
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v10    # "packageName":Ljava/lang/String;
    .end local v11    # "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_4
    :goto_3
    return-void

    .line 409
    .restart local v10    # "packageName":Ljava/lang/String;
    .restart local v11    # "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_5
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 410
    .restart local v5    # "hasApp":Z
    :cond_6
    const/4 v8, 0x1

    goto/16 :goto_1

    .line 445
    .restart local v3    # "cn":Landroid/content/ComponentName;
    .restart local v7    # "intent2":Landroid/content/Intent;
    .restart local v8    # "isYjapp":Z
    :catch_0
    move-exception v4

    .line 446
    .local v4, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v9, 0x0

    .line 447
    .restart local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v4}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_2

    .line 452
    .end local v3    # "cn":Landroid/content/ComponentName;
    .end local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v7    # "intent2":Landroid/content/Intent;
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :cond_7
    const-string/jumbo v13, "com.edutech.screenshot"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 453
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v13, "android.intent.action.MAIN"

    invoke-direct {v7, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 454
    .restart local v7    # "intent2":Landroid/content/Intent;
    const/high16 v13, 0x10000000

    invoke-virtual {v7, v13}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 456
    new-instance v3, Landroid/content/ComponentName;

    const-string/jumbo v13, "com.edutech.screenshot"

    .line 457
    const-string/jumbo v14, "com.edutech.screenshot.ScreenShotActivity"

    .line 456
    invoke-direct {v3, v13, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    .restart local v3    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v7, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 461
    :try_start_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 462
    const-string/jumbo v14, "com.edutech.screenshot"

    const/4 v15, 0x0

    .line 461
    invoke-virtual {v13, v14, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v9

    .line 467
    .restart local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_4
    if-eqz v9, :cond_8

    .line 468
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13, v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startActivity(Landroid/content/Intent;)V

    .line 471
    :cond_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v14, "screenshot"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 472
    .restart local v12    # "sp":Landroid/content/SharedPreferences;
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "opened"

    const/4 v15, 0x1

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_3

    .line 463
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v12    # "sp":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v4

    .line 464
    .restart local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v9, 0x0

    .line 465
    .restart local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v4}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_4

    .line 473
    .end local v3    # "cn":Landroid/content/ComponentName;
    .end local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v7    # "intent2":Landroid/content/Intent;
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :cond_9
    const-string/jumbo v13, "com.edutech.lockscreen"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 474
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v13, "android.intent.action.MAIN"

    invoke-direct {v7, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 475
    .restart local v7    # "intent2":Landroid/content/Intent;
    const/high16 v13, 0x10000000

    invoke-virtual {v7, v13}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 477
    new-instance v3, Landroid/content/ComponentName;

    const-string/jumbo v13, "com.edutech.lockscreen"

    .line 478
    const-string/jumbo v14, "com.edutech.lockscreen.MainActivity"

    .line 477
    invoke-direct {v3, v13, v14}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    .restart local v3    # "cn":Landroid/content/ComponentName;
    invoke-virtual {v7, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 482
    :try_start_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v13

    .line 483
    const-string/jumbo v14, "com.edutech.lockscreen"

    const/4 v15, 0x0

    .line 482
    invoke-virtual {v13, v14, v15}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v9

    .line 488
    .restart local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    :goto_5
    if-eqz v9, :cond_a

    .line 489
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v13, v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startActivity(Landroid/content/Intent;)V

    .line 492
    :cond_a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$2;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const-string/jumbo v14, "screenshot"

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 493
    .restart local v12    # "sp":Landroid/content/SharedPreferences;
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    const-string/jumbo v14, "locked"

    const/4 v15, 0x1

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v13

    invoke-interface {v13}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_3

    .line 484
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v12    # "sp":Landroid/content/SharedPreferences;
    :catch_2
    move-exception v4

    .line 485
    .restart local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v9, 0x0

    .line 486
    .restart local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    invoke-virtual {v4}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_5

    .line 495
    .end local v3    # "cn":Landroid/content/ComponentName;
    .end local v4    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v5    # "hasApp":Z
    .end local v7    # "intent2":Landroid/content/Intent;
    .end local v8    # "isYjapp":Z
    .end local v9    # "packageInfo2":Landroid/content/pm/PackageInfo;
    .end local v10    # "packageName":Ljava/lang/String;
    .end local v11    # "selfApps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_b
    const-string/jumbo v13, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 496
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v10

    .line 497
    .restart local v10    # "packageName":Ljava/lang/String;
    sget-object v13, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v14, Ljava/lang/StringBuilder;

    const-string/jumbo v15, "\u5378\u8f7d\u4e86:"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "\u5305\u540d\u7684\u7a0b\u5e8f"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 498
    if-eqz v10, :cond_4

    const-string/jumbo v13, "com.edutech.firewall"

    invoke-virtual {v10, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_4

    sget-boolean v13, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->openBMD:Z

    goto/16 :goto_3
.end method
