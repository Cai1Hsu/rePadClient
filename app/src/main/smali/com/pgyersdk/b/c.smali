.class final Lcom/pgyersdk/b/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/b/b;


# direct methods
.method constructor <init>(Lcom/pgyersdk/b/b;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/b/c;->a:Lcom/pgyersdk/b/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/pgyersdk/b/c;->a:Lcom/pgyersdk/b/b;

    invoke-virtual {v0}, Lcom/pgyersdk/b/b;->b()V

    return-void
.end method
