.class public Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;
.super Landroid/app/Dialog;
.source "CustomProgressDialog.java"


# instance fields
.field private apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

.field private apkUpdateList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;"
        }
    .end annotation
.end field

.field private context:Landroid/content/Context;

.field private ctmdialog_list:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    const v0, 0x7f090003

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 30
    iput-object p2, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    .line 31
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->context:Landroid/content/Context;

    .line 32
    const v0, 0x7f03000e

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->setContentView(I)V

    .line 33
    const v0, 0x7f0a0035

    invoke-virtual {p0, v0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->ctmdialog_list:Landroid/widget/ListView;

    .line 34
    iput-object p2, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    .line 35
    new-instance v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    invoke-direct {v0, v1, p1}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;-><init>(Ljava/util/List;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    .line 36
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->ctmdialog_list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 37
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 38
    return-void
.end method


# virtual methods
.method public resetData()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 67
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    .line 68
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 69
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    .line 70
    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->ctmdialog_list:Landroid/widget/ListView;

    .line 71
    return-void
.end method

.method public setData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 52
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    .line 53
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->setData(Ljava/util/List;)V

    .line 54
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->notifyDataSetChanged()V

    .line 55
    return-void
.end method

.method public updateProgress(I)V
    .locals 4
    .param p1, "itemIndex"    # I

    .prologue
    .line 57
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->ctmdialog_list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    .line 59
    .local v1, "visiblePosition":I
    sub-int v2, p1, v1

    if-ltz v2, :cond_0

    .line 60
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->ctmdialog_list:Landroid/widget/ListView;

    sub-int v3, p1, v1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 61
    .local v0, "view":Landroid/view/View;
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomProgressDialog;->apkUpdateAdapter:Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;

    invoke-virtual {v2, v0, p1}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->updateView(Landroid/view/View;I)V

    .line 64
    .end local v0    # "view":Landroid/view/View;
    :cond_0
    return-void
.end method
