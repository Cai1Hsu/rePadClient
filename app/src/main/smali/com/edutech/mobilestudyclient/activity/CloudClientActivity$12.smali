.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 5188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    .line 5193
    :goto_0
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$20(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 5211
    return-void

    .line 5195
    :cond_0
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v7, "notice"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 5196
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "lasttime"

    invoke-interface {v1, v6, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 5197
    .local v4, "start":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 5198
    .local v2, "now":J
    cmp-long v6, v4, v10

    if-eqz v6, :cond_1

    sub-long v6, v2, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    const-wide/32 v8, 0x927c0

    cmp-long v6, v6, v8

    if-ltz v6, :cond_2

    .line 5200
    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    const-string/jumbo v7, "lasttime"

    invoke-interface {v6, v7, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 5201
    iget-object v6, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$12;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v6}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$21(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V

    .line 5204
    :cond_2
    const-wide/32 v6, 0x493e0

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 5205
    :catch_0
    move-exception v0

    .line 5207
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
