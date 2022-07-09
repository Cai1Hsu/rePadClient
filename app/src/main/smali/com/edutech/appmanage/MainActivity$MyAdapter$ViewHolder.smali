.class public final Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity$MyAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field public btn_start:Landroid/widget/Button;

.field public btn_uninstall:Landroid/widget/Button;

.field public code:Landroid/widget/TextView;

.field public image:Landroid/widget/ImageView;

.field public layout:Landroid/widget/LinearLayout;

.field public name:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;


# direct methods
.method public constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;)V
    .locals 0

    .prologue
    .line 1995
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
