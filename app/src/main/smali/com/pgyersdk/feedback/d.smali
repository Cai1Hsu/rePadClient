.class final Lcom/pgyersdk/feedback/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/c;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/c;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    iput-object p2, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v2, 0x0

    const-string/jumbo v0, "android.permission.INTERNET"

    iget-object v1, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/c;)Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "\u9700\u8981\u6dfb\u52a0android.permission.INTERNET\u6743\u9650"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void

    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->b(Lcom/pgyersdk/feedback/c;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pgyersdk/c/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->c(Lcom/pgyersdk/feedback/c;)Lcom/pgyersdk/d/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/d/a;->b()Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->b(Lcom/pgyersdk/feedback/c;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->d(Lcom/pgyersdk/feedback/c;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    move-result-object v0

    iget-object v1, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v1}, Lcom/pgyersdk/feedback/c;->a(Lcom/pgyersdk/feedback/c;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pgyersdk/c/e;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/pgyersdk/c/e;->a()Lcom/pgyersdk/c/e;

    const-string/jumbo v1, ".jpg"

    invoke-static {v0, v1}, Lcom/pgyersdk/c/e;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->c(Lcom/pgyersdk/feedback/c;)Lcom/pgyersdk/d/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/d/a;->b()Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v1, v2

    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lt v1, v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->c(Lcom/pgyersdk/feedback/c;)Lcom/pgyersdk/d/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/d/a;->a()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pgyersdk/c/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/pgyersdk/feedback/c;->a(Landroid/content/DialogInterface;Ljava/lang/Boolean;)V

    iget-object v0, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    invoke-static {}, Lcom/pgyersdk/a/b;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_3
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_4
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/pgyersdk/feedback/c;->a(Landroid/content/DialogInterface;Ljava/lang/Boolean;)V

    new-instance v0, Lcom/pgyersdk/b/e;

    iget-object v1, p0, Lcom/pgyersdk/feedback/d;->b:Landroid/content/Context;

    const-string/jumbo v2, "http://www.pgyer.com/apiv1/feedback/add"

    iget-object v3, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v3}, Lcom/pgyersdk/feedback/c;->c(Lcom/pgyersdk/feedback/c;)Lcom/pgyersdk/d/a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/pgyersdk/d/a;->a()Landroid/widget/EditText;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, ""

    iget-object v6, p0, Lcom/pgyersdk/feedback/d;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v6}, Lcom/pgyersdk/feedback/c;->e(Lcom/pgyersdk/feedback/c;)Landroid/os/Handler;

    move-result-object v6

    invoke-direct/range {v0 .. v6}, Lcom/pgyersdk/b/e;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/os/Handler;)V

    invoke-virtual {v0}, Lcom/pgyersdk/b/e;->a()V

    invoke-static {v0}, Lcom/pgyersdk/c/a;->a(Landroid/os/AsyncTask;)V

    goto/16 :goto_0
.end method
