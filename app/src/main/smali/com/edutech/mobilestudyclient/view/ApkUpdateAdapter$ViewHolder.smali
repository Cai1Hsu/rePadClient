.class Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "ApkUpdateAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field adapter_apk_nameTv:Landroid/widget/TextView;

.field adapter_apk_progressPb:Landroid/widget/ProgressBar;

.field adapter_apk_stateTv:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->this$0:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
