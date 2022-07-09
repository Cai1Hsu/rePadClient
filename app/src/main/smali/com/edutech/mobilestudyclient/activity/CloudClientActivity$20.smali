.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$20;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initSuiningView()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$20;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 2397
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 2402
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$20;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$53(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;I)V

    .line 2403
    return-void
.end method
