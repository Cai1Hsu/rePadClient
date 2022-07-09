.class public final Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "DownLoadManage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/DownLoadManage$MyAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field public downloadCancel:Landroid/widget/Button;

.field public downloadPrecent:Landroid/widget/TextView;

.field public downloadProgress:Landroid/widget/ProgressBar;

.field public downloadSize:Landroid/widget/TextView;

.field public downloadTip:Landroid/widget/TextView;

.field final synthetic this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;


# direct methods
.method public constructor <init>(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;)V
    .locals 0

    .prologue
    .line 326
    iput-object p1, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->this$1:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
