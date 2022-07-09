.class final Lcom/pgyersdk/d/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field final synthetic a:Lcom/pgyersdk/d/a;


# direct methods
.method constructor <init>(Lcom/pgyersdk/d/a;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/d/d;->a:Lcom/pgyersdk/d/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p2, "isChecked"    # Z

    .prologue
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/d/d;->a:Lcom/pgyersdk/d/a;

    invoke-static {v0}, Lcom/pgyersdk/d/a;->a(Lcom/pgyersdk/d/a;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/pgyersdk/d/d;->a:Lcom/pgyersdk/d/a;

    invoke-static {v0}, Lcom/pgyersdk/d/a;->a(Lcom/pgyersdk/d/a;)Landroid/widget/ImageView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
