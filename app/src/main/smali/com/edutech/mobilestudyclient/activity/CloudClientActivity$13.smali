.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;
.super Ljava/lang/Object;
.source "CloudClientActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->initWidget()V
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
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    .line 493
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 4
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 499
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    const-string/jumbo v2, "eyeproc"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 500
    .local v0, "sp":Landroid/content/SharedPreferences;
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$13;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v1, v2, p2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->access$44(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;Landroid/content/Context;Z)V

    .line 501
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "state"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 502
    return-void
.end method
