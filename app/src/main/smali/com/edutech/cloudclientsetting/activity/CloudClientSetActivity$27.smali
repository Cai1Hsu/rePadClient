.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$27;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->updatePassword()V
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$27;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 4569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 4575
    if-eqz p1, :cond_0

    .line 4576
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 4577
    const/4 p1, 0x0

    .line 4579
    :cond_0
    return-void
.end method
