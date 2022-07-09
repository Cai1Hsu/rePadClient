.class Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;
.super Ljava/lang/Object;
.source "CloudClientSetActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->showLanguageChooseDialog()V
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
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    .line 1735
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 1740
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v3, "language"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1741
    .local v1, "sp":Landroid/content/SharedPreferences;
    if-nez p2, :cond_0

    .line 1743
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v3, "chinese"

    invoke-static {v2, v3}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 1744
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "language"

    const-string/jumbo v4, "chinese"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1745
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1746
    .local v0, "message":Landroid/os/Message;
    const/16 v2, 0x66

    iput v2, v0, Landroid/os/Message;->what:I

    .line 1747
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1757
    :goto_0
    return-void

    .line 1750
    .end local v0    # "message":Landroid/os/Message;
    :cond_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    const-string/jumbo v3, "en"

    invoke-static {v2, v3}, Lcom/edutech/mobilestudyclient/LanguageUtils;->SetLanguage(Landroid/content/Context;Ljava/lang/String;)V

    .line 1751
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "language"

    const-string/jumbo v4, "en"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1752
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1753
    .restart local v0    # "message":Landroid/os/Message;
    const/16 v2, 0x67

    iput v2, v0, Landroid/os/Message;->what:I

    .line 1754
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity$15;->this$0:Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;

    invoke-static {v2}, Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;->access$55(Lcom/edutech/cloudclientsetting/activity/CloudClientSetActivity;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
