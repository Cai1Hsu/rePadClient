.class final Lcom/pgyersdk/feedback/i;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/c;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/c;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/i;->a:Lcom/pgyersdk/feedback/c;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/pgyersdk/feedback/i;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/c;)Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "\u8c22\u8c22\u4f60\u7684\u53cd\u9988"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :pswitch_1
    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v0

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v1

    iget-object v2, p0, Lcom/pgyersdk/feedback/i;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v2}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/c;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pgyersdk/c/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pgyersdk/c/e;->a(Ljava/lang/String;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x4e21
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
