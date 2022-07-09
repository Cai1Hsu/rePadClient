.class final Lcom/pgyersdk/b/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/b/b;


# direct methods
.method constructor <init>(Lcom/pgyersdk/b/b;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .prologue
    :try_start_0
    iget-object v0, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-static {v0}, Lcom/pgyersdk/b/b;->a(Lcom/pgyersdk/b/b;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pgyersdk/c/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "buildNo"

    iget-object v1, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-static {v1}, Lcom/pgyersdk/b/b;->a(Lcom/pgyersdk/b/b;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pgyersdk/c/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-static {v1}, Lcom/pgyersdk/b/b;->b(Lcom/pgyersdk/b/b;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-static {v1}, Lcom/pgyersdk/b/b;->c(Lcom/pgyersdk/b/b;)Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/pgyersdk/b/d;->a:Lcom/pgyersdk/b/b;

    invoke-static {v1}, Lcom/pgyersdk/b/b;->c(Lcom/pgyersdk/b/b;)Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
