.class public Lcom/edutech/mobilestudyclient/activity/SampleAdmin;
.super Landroid/app/admin/DeviceAdminReceiver;
.source "SampleAdmin.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/admin/DeviceAdminReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisableRequested(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 26
    const-string/jumbo v0, "This is an optional message to warn the user about disabling."

    return-object v0
.end method

.method public onDisabled(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 31
    const-string/jumbo v0, "Sample Device Admin: disabled"

    invoke-virtual {p0, p1, v0}, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;->showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 32
    return-void
.end method

.method public onEnabled(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 21
    const-string/jumbo v0, "Sample Device Admin: enabled"

    invoke-virtual {p0, p1, v0}, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;->showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 22
    return-void
.end method

.method public onPasswordChanged(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 36
    const-string/jumbo v0, "Sample Device Admin: pw changed"

    invoke-virtual {p0, p1, v0}, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;->showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 37
    return-void
.end method

.method public onPasswordFailed(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    const-string/jumbo v0, "Sample Device Admin: pw failed"

    invoke-virtual {p0, p1, v0}, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;->showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 42
    return-void
.end method

.method public onPasswordSucceeded(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 46
    const-string/jumbo v0, "Sample Device Admin: pw succeeded"

    invoke-virtual {p0, p1, v0}, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;->showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 47
    return-void
.end method

.method showToast(Landroid/content/Context;Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "msg"    # Ljava/lang/CharSequence;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 17
    return-void
.end method
