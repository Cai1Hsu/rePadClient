.class final Lcom/pgyersdk/feedback/j;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/pgyersdk/feedback/m;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    iput-object p2, p0, Lcom/pgyersdk/feedback/j;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    new-instance v0, Lcom/pgyersdk/feedback/k;

    iget-object v1, p0, Lcom/pgyersdk/feedback/j;->b:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/pgyersdk/feedback/k;-><init>(Lcom/pgyersdk/feedback/j;Landroid/content/Context;)V

    :try_start_0
    invoke-static {}, Lcom/pgyersdk/feedback/c;->a()Lcom/pgyersdk/feedback/c;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/a;)Lcom/pgyersdk/feedback/c;

    move-result-object v0

    iget-object v1, p0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v1}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pgyersdk/feedback/c;->a(Z)Lcom/pgyersdk/feedback/c;

    iget-object v1, p0, Lcom/pgyersdk/feedback/j;->b:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pgyersdk/feedback/c;->a(Landroid/content/Context;)Lcom/pgyersdk/d/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
