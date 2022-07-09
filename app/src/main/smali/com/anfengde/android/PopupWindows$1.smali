.class Lcom/anfengde/android/PopupWindows$1;
.super Ljava/lang/Object;
.source "PopupWindows.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/android/PopupWindows;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/android/PopupWindows;


# direct methods
.method constructor <init>(Lcom/anfengde/android/PopupWindows;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/anfengde/android/PopupWindows$1;->this$0:Lcom/anfengde/android/PopupWindows;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 41
    iget-object v0, p0, Lcom/anfengde/android/PopupWindows$1;->this$0:Lcom/anfengde/android/PopupWindows;

    iget-object v0, v0, Lcom/anfengde/android/PopupWindows;->mWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 46
    :cond_0
    return v2
.end method
