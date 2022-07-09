.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;
.super Ljava/lang/Object;
.source "AppControlActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/AppControlActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 431
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 437
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$5(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getVisibility()I

    move-result v3

    const/16 v4, 0x8

    if-ne v3, v4, :cond_1

    .line 439
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, p3, :cond_0

    .line 441
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$3(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    .line 442
    .local v0, "detail":Lcom/edutech/mobilestudyclient/util/AppDetails;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppPackageName()Ljava/lang/String;

    move-result-object v2

    .line 443
    .local v2, "packageName":Ljava/lang/String;
    sput-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->CleaningPackage:Ljava/lang/String;

    .line 444
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "package:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 445
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-virtual {v3, v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->startActivity(Landroid/content/Intent;)V

    .line 459
    .end local v0    # "detail":Lcom/edutech/mobilestudyclient/util/AppDetails;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "packageName":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 449
    :cond_1
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, p3, :cond_0

    .line 451
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-static {v3}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->access$2(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    .line 452
    .restart local v0    # "detail":Lcom/edutech/mobilestudyclient/util/AppDetails;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppPackageName()Ljava/lang/String;

    move-result-object v2

    .line 453
    .restart local v2    # "packageName":Ljava/lang/String;
    sput-object v2, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->CleaningPackage:Ljava/lang/String;

    .line 454
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "package:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 455
    .restart local v1    # "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$5;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    invoke-virtual {v3, v1}, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
