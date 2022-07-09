.class Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;
.super Ljava/lang/Object;
.source "PasswdDialogActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v4, 0x0

    .line 377
    const-string/jumbo v2, "LockTask"

    const-string/jumbo v3, "onKey"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    const/4 v2, 0x4

    if-ne p2, v2, :cond_1

    .line 379
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V

    .line 380
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 381
    .local v1, "intent":Landroid/content/Intent;
    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 382
    const-string/jumbo v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 383
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v2, "com.launcher.activity"

    const-string/jumbo v3, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    .local v0, "cn":Landroid/content/ComponentName;
    if-eqz v0, :cond_0

    .line 386
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 387
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v2, v1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->startActivity(Landroid/content/Intent;)V

    .line 389
    :cond_0
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->finish()V

    .line 391
    .end local v0    # "cn":Landroid/content/ComponentName;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_1
    return v4
.end method
