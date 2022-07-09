.class Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;
.super Ljava/lang/Object;
.source "sysProtectService.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->showDialog(Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 289
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v7

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Dialog;->isShowing()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 290
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-static {v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$0(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;)Landroid/app/Dialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Dialog;->dismiss()V

    .line 291
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->access$1(Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;Landroid/app/Dialog;)V

    .line 334
    :cond_0
    const-string/jumbo v4, "com.edutech.wificonn"

    .line 335
    .local v4, "packageBook":Ljava/lang/String;
    const-string/jumbo v5, "com.edutech.wificonn.WifiConnActivity"

    .line 337
    .local v5, "packageClass":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v7}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 338
    const/4 v8, 0x0

    .line 337
    invoke-virtual {v7, v4, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    .line 339
    .local v6, "pinfo":Landroid/content/pm/PackageInfo;
    if-eqz v6, :cond_1

    .line 340
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    .local v0, "component":Landroid/content/ComponentName;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 343
    .local v3, "intent_book":Landroid/content/Intent;
    const-string/jumbo v7, "android.intent.category.LAUNCHER"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 344
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 345
    const-string/jumbo v7, "android.intent.action.MAIN"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 346
    const/high16 v7, 0x10000000

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 347
    iget-object v7, p0, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService$4;->this$0:Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;

    invoke-virtual {v7, v3}, Lcom/edutech/mobilestudyclient/activity/service/sysProtectService;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 356
    .end local v0    # "component":Landroid/content/ComponentName;
    .end local v3    # "intent_book":Landroid/content/Intent;
    .end local v6    # "pinfo":Landroid/content/pm/PackageInfo;
    :cond_1
    :goto_0
    return-void

    .line 349
    :catch_0
    move-exception v2

    .line 351
    .local v2, "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 352
    .end local v2    # "e1":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v1

    .line 354
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
