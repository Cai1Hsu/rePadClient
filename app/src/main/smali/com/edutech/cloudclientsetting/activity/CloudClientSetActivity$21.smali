.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2213
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 2224
    :goto_0
    return-void

    .line 2215
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2216
    const-class v2, Lcom/mining/app/zxing/activity/MipcaActivityCapture;

    .line 2215
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2219
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2220
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$21;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 2213
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0094
        :pswitch_0
    .end packed-switch
.end method
