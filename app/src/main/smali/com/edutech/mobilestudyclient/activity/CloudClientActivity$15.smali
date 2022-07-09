.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getDesignView()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 656
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 661
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$47(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Z)V

    .line 663
    const-wide/16 v2, 0xbb8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 668
    :goto_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$15;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v1}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$48(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    .line 669
    return-void

    .line 664
    :catch_0
    move-exception v0

    .line 666
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
