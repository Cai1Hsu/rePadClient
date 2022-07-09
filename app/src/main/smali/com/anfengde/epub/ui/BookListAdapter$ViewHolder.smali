.class public final Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "BookListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/BookListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field public img:Landroid/widget/ImageView;

.field public info:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/anfengde/epub/ui/BookListAdapter;

.field public title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/anfengde/epub/ui/BookListAdapter;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->this$0:Lcom/anfengde/epub/ui/BookListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
