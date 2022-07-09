.class Lcom/anfengde/epub/ui/BookView$1;
.super Ljava/lang/Object;
.source "BookView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/epub/ui/BookView;->initBook()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/BookView;


# direct methods
.method constructor <init>(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView$1;->this$0:Lcom/anfengde/epub/ui/BookView;

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$1;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$38(Lcom/anfengde/epub/ui/BookView;)V

    .line 190
    return-void
.end method
