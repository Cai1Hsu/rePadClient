.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->showNoticeDetails()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 5303
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 5308
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$58(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 5310
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$28;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$58(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 5312
    :cond_0
    return-void
.end method
