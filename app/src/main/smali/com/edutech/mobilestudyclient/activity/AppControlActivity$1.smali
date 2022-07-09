.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$1;
.super Ljava/lang/Object;
.source "AppControlActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/AppControlActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 331
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$1;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    const v1, 0x7f08020b

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 332
    return-void
.end method
