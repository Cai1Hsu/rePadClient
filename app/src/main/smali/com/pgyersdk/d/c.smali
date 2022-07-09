.class final Lcom/pgyersdk/d/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/d/a;


# direct methods
.method constructor <init>(Lcom/pgyersdk/d/a;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/d/c;->a:Lcom/pgyersdk/d/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    iget-object v0, p0, Lcom/pgyersdk/d/c;->a:Lcom/pgyersdk/d/a;

    invoke-static {v0}, Lcom/pgyersdk/d/a;->c(Lcom/pgyersdk/d/a;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/d/c;->a:Lcom/pgyersdk/d/a;

    invoke-static {v0}, Lcom/pgyersdk/d/a;->c(Lcom/pgyersdk/d/a;)Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
