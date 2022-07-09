.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initNewLayout()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 732
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 733
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const-string/jumbo v2, "com.hjwordgames"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 734
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v2, 0x14000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 735
    if-eqz v0, :cond_0

    .line 736
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$16;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v2, v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->startActivity(Landroid/content/Intent;)V

    .line 738
    :cond_0
    return-void
.end method
