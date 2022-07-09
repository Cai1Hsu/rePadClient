.class public Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;
.super Landroid/app/Activity;
.source "AddAdminActivity.java"


# instance fields
.field private mDPM:Landroid/app/admin/DevicePolicyManager;

.field private mDeviceAdmin:Landroid/content/ComponentName;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 30
    if-nez p1, :cond_0

    .line 31
    const-string/jumbo v1, "result"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "code:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->finish()V

    .line 33
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 34
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.edutech.getadmin"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 38
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const-string/jumbo v1, "admin"

    const-string/jumbo v2, "oncreate"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    const-string/jumbo v1, "device_policy"

    invoke-virtual {p0, v1}, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->mDPM:Landroid/app/admin/DevicePolicyManager;

    .line 21
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/edutech/mobilestudyclient/activity/SampleAdmin;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->mDeviceAdmin:Landroid/content/ComponentName;

    .line 22
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 23
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.app.extra.DEVICE_ADMIN"

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->mDeviceAdmin:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 24
    const-string/jumbo v1, "android.app.extra.ADD_EXPLANATION"

    const-string/jumbo v2, "Additional text explaining why this needs to be added."

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/edutech/mobilestudyclient/activity/AddAdminActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    return-void
.end method
