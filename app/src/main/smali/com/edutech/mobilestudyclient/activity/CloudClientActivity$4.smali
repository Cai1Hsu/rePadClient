.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 4291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 4297
    const/4 v2, 0x0

    .line 4298
    .local v2, "userlicenseFlag":Z
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 4299
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$4;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$10(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Lcom/edutech/idauthentication/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/idauthentication/MainActivity;->checkIDAuth()I

    move-result v0

    .line 4300
    .local v0, "result":I
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 4301
    .local v1, "sdk_version":I
    const-string/jumbo v3, "iaduth"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "result1:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4306
    if-eqz v0, :cond_0

    .line 4307
    const/4 v2, 0x0

    .line 4312
    :goto_0
    if-eqz v2, :cond_1

    .line 4313
    const/4 v3, 0x1

    sput-boolean v3, Lcom/mobilestudyclient/application/My_Application;->Allow_Flag:Z

    .line 4317
    :goto_1
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 4318
    return-void

    .line 4309
    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    .line 4315
    :cond_1
    const/4 v3, 0x0

    sput-boolean v3, Lcom/mobilestudyclient/application/My_Application;->Allow_Flag:Z

    goto :goto_1
.end method
