.class final Lcom/pgyersdk/feedback/e;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/c;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/c;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/e;->a:Lcom/pgyersdk/feedback/c;

    iput-object p2, p0, Lcom/pgyersdk/feedback/e;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/pgyersdk/feedback/c;->a(Landroid/content/DialogInterface;Ljava/lang/Boolean;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v0

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v1

    iget-object v2, p0, Lcom/pgyersdk/feedback/e;->b:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/pgyersdk/c/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pgyersdk/c/e;->a(Ljava/lang/String;)V

    return-void
.end method
