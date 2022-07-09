.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->userLicenseAgreementDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

.field private final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iput-object p2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->val$dialog:Landroid/app/AlertDialog;

    .line 4744
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 4748
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v2, "myAgreement"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$55(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/content/SharedPreferences;)V

    .line 4749
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$56(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "agreement_key"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 4750
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$26;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 4751
    return-void
.end method
