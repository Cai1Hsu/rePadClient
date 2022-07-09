.class Lcom/edutech/appmanage/MainActivity$MyAdapter$5$2;
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


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$2;->this$2:Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    .line 1791
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1799
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1800
    return-void
.end method
