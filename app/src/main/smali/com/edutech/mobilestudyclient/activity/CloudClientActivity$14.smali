.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->setDefaultSetting()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 572
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 576
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$45(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 577
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$14;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$46(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    .line 578
    return-void
.end method
