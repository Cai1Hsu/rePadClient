.class final Lcom/pgyersdk/feedback/h;
.super Landroid/os/AsyncTask;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/c;

.field private final synthetic b:Landroid/graphics/Bitmap;

.field private final synthetic c:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/c;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/h;->a:Lcom/pgyersdk/feedback/c;

    iput-object p2, p0, Lcom/pgyersdk/feedback/h;->b:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/pgyersdk/feedback/h;->c:Ljava/lang/String;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/pgyersdk/feedback/h;->b:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/pgyersdk/feedback/h;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pgyersdk/c/i;->a(Landroid/graphics/Bitmap;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method protected final synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Ljava/lang/Boolean;

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/pgyersdk/feedback/c;->b()Lcom/pgyersdk/feedback/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/pgyersdk/feedback/c;->b()Lcom/pgyersdk/feedback/b;

    move-result-object v0

    iget-object v1, p0, Lcom/pgyersdk/feedback/h;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v1}, Lcom/pgyersdk/feedback/c;->b(Lcom/pgyersdk/feedback/c;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/pgyersdk/feedback/b;->a(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Lcom/pgyersdk/feedback/c;->b()Lcom/pgyersdk/feedback/b;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/pgyersdk/feedback/c;->b()Lcom/pgyersdk/feedback/b;

    goto :goto_0
.end method
