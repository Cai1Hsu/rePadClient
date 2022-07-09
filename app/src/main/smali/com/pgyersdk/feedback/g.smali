.class final Lcom/pgyersdk/feedback/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/c;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/c;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/g;->a:Lcom/pgyersdk/feedback/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/pgyersdk/feedback/g;->a:Lcom/pgyersdk/feedback/c;

    invoke-static {v0}, Lcom/pgyersdk/feedback/c;->f(Lcom/pgyersdk/feedback/c;)V

    return-void
.end method
