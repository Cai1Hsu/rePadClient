.class Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;
.super Ljava/lang/Object;
.source "PasswdDialogActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    .line 353
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 356
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V

    .line 357
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 358
    .local v1, "intent":Landroid/content/Intent;
    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 359
    const-string/jumbo v2, "android.intent.category.LAUNCHER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 360
    new-instance v0, Landroid/content/ComponentName;

    const-string/jumbo v2, "com.launcher.activity"

    const-string/jumbo v3, "com.edutech.mobilestudyclient.activity.CloudClientActivity"

    invoke-direct {v0, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    .local v0, "cn":Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 362
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v2, v1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->startActivity(Landroid/content/Intent;)V

    .line 363
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->finish()V

    .line 364
    return-void
.end method
