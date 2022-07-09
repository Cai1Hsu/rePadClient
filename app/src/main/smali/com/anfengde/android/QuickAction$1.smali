.class Lcom/anfengde/android/QuickAction$1;
.super Ljava/lang/Object;
.source "QuickAction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/android/QuickAction;->addActionItem(Lcom/anfengde/android/ActionItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/android/QuickAction;

.field private final synthetic val$actionId:I

.field private final synthetic val$pos:I


# direct methods
.method constructor <init>(Lcom/anfengde/android/QuickAction;II)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    iput p2, p0, Lcom/anfengde/android/QuickAction$1;->val$pos:I

    iput p3, p0, Lcom/anfengde/android/QuickAction$1;->val$actionId:I

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 188
    iget-object v0, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    invoke-static {v0}, Lcom/anfengde/android/QuickAction;->access$0(Lcom/anfengde/android/QuickAction;)Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 189
    iget-object v0, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    invoke-static {v0}, Lcom/anfengde/android/QuickAction;->access$0(Lcom/anfengde/android/QuickAction;)Lcom/anfengde/android/QuickAction$OnActionItemClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    iget v2, p0, Lcom/anfengde/android/QuickAction$1;->val$pos:I

    iget v3, p0, Lcom/anfengde/android/QuickAction$1;->val$actionId:I

    invoke-interface {v0, v1, v2, v3}, Lcom/anfengde/android/QuickAction$OnActionItemClickListener;->onItemClick(Lcom/anfengde/android/QuickAction;II)V

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    iget v1, p0, Lcom/anfengde/android/QuickAction$1;->val$pos:I

    invoke-virtual {v0, v1}, Lcom/anfengde/android/QuickAction;->getActionItem(I)Lcom/anfengde/android/ActionItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/anfengde/android/ActionItem;->isSticky()Z

    move-result v0

    if-nez v0, :cond_1

    .line 193
    iget-object v0, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/anfengde/android/QuickAction;->access$1(Lcom/anfengde/android/QuickAction;Z)V

    .line 195
    iget-object v0, p0, Lcom/anfengde/android/QuickAction$1;->this$0:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v0}, Lcom/anfengde/android/QuickAction;->dismiss()V

    .line 197
    :cond_1
    return-void
.end method
