.class Lcom/edutech/mobilestudyclient/activity/AppControlActivity$6;
.super Ljava/lang/Object;
.source "AppControlActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->initWidget()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/AppControlActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$6;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    .line 296
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .param p1, "arg0"    # Landroid/text/Editable;

    .prologue
    .line 314
    invoke-interface {p1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 315
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/AppControlActivity$6;->this$0:Lcom/edutech/mobilestudyclient/activity/AppControlActivity;

    iget-object v2, v2, Lcom/edutech/mobilestudyclient/activity/AppControlActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 316
    .local v1, "msg":Landroid/os/Message;
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 317
    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    .line 318
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 319
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 309
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "arg0"    # Ljava/lang/CharSequence;
    .param p2, "arg1"    # I
    .param p3, "arg2"    # I
    .param p4, "arg3"    # I

    .prologue
    .line 302
    return-void
.end method
