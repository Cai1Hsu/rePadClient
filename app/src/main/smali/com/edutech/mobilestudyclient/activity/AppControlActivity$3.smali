.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$3;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 392
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 397
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$3;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->finish()V

    .line 398
    return-void
.end method
