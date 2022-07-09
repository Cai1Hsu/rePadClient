.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;

.field private final synthetic val$userName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;->this$1:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;

    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;->val$userName:Ljava/lang/String;

    .line 2972
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2977
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;->this$1:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;->access$0(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11;)Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$24(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$11$1;->val$userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2978
    return-void
.end method
