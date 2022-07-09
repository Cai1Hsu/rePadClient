.class Lcom/edutech/idauthentication/MainActivity$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/idauthentication/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/idauthentication/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/idauthentication/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$1;->this$0:Lcom/edutech/idauthentication/MainActivity;

    .line 912
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 916
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 933
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 934
    return-void

    .line 924
    :pswitch_1
    new-instance v0, Lcom/edutech/utils/InstallApkHelper;

    iget-object v1, p0, Lcom/edutech/idauthentication/MainActivity$1;->this$0:Lcom/edutech/idauthentication/MainActivity;

    sget-object v2, Lcom/edutech/idauthentication/MainActivity;->selfpackageName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/edutech/utils/InstallApkHelper;-><init>(Lcom/edutech/idauthentication/MainActivity;Ljava/lang/String;)V

    .line 926
    .local v0, "installapk":Lcom/edutech/utils/InstallApkHelper;
    invoke-virtual {v0}, Lcom/edutech/utils/InstallApkHelper;->InstallAll()V

    .line 927
    const/4 v1, 0x0

    sput-boolean v1, Lcom/edutech/idauthentication/MainActivity;->isDown:Z

    goto :goto_0

    .line 916
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
