.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 2194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2200
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$85(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2201
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$85(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 2202
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$20;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$86(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;Landroid/app/AlertDialog;)V

    .line 2204
    :cond_0
    return-void
.end method
