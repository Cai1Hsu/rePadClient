.class final Lcom/pgyersdk/d/b;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/pgyersdk/d/a;


# direct methods
.method constructor <init>(Lcom/pgyersdk/d/a;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/d/b;->a:Lcom/pgyersdk/d/a;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/pgyersdk/d/b;->a:Lcom/pgyersdk/d/a;

    invoke-static {v1}, Lcom/pgyersdk/d/a;->a(Lcom/pgyersdk/d/a;)Landroid/widget/ImageView;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pgyersdk/d/b;->a:Lcom/pgyersdk/d/a;

    invoke-static {v1}, Lcom/pgyersdk/d/a;->a(Lcom/pgyersdk/d/a;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-static {v0}, Lcom/pgyersdk/c/i;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/pgyersdk/d/b;->a:Lcom/pgyersdk/d/a;

    invoke-static {v0}, Lcom/pgyersdk/d/a;->b(Lcom/pgyersdk/d/a;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x4e22

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/pgyersdk/d/b;->a:Lcom/pgyersdk/d/a;

    invoke-static {v1}, Lcom/pgyersdk/d/a;->b(Lcom/pgyersdk/d/a;)Landroid/os/Handler;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x4e22
        :pswitch_0
    .end packed-switch
.end method
