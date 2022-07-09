.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->removeIllegalApks()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 2574
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 2580
    const-wide/16 v2, 0xbb8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2585
    :goto_0
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "A10-70LC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "TB-8703N"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "TB-8604F"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "A10-70F"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "YiJiao"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "YOGATablet2-1050LC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2586
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "S1016PRO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "P990S.V"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "D13B"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "QC80A"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "N5110ZB"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, ".T360Z"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "P583"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "P350"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "P550"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M856.V"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "S1016.V1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "S106.V1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "S1016E"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_1

    .line 2589
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$49(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$24;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$50(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$54(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 2594
    :cond_1
    :goto_1
    return-void

    .line 2581
    :catch_0
    move-exception v0

    .line 2583
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    .line 2590
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    goto :goto_1
.end method
