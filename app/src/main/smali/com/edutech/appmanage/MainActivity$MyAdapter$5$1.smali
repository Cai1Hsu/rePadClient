.class Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

.field private final synthetic val$packagename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->this$2:Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->val$packagename:Ljava/lang/String;

    .line 1741
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;)Lcom/edutech/appmanage/MainActivity$MyAdapter$5;
    .locals 1

    .prologue
    .line 1741
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->this$2:Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1749
    new-instance v0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;

    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->val$packagename:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;Ljava/lang/String;)V

    .line 1785
    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->start()V

    .line 1786
    return-void
.end method
