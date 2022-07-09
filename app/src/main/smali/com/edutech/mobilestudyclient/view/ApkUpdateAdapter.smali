.class public Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;
.super Landroid/widget/BaseAdapter;
.source "ApkUpdateAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private apkLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0
    .param p2, "mContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/ApkUpdateBean;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "apkLists":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    .line 25
    iput-object p2, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    .line 26
    return-void
.end method

.method private updateProgress(Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;I)V
    .locals 13
    .param p1, "holder"    # Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const v12, 0x7f0c0026

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v8, 0x4090000000000000L    # 1024.0

    .line 93
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    invoke-interface {v5, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/mobilestudyclient/ApkUpdateBean;

    .line 94
    .local v2, "bean":Lcom/edutech/mobilestudyclient/ApkUpdateBean;
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_nameTv:Landroid/widget/TextView;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getAppName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    new-instance v4, Ljava/text/DecimalFormat;

    const-string/jumbo v5, "##0.00"

    invoke-direct {v4, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 96
    .local v4, "df":Ljava/text/DecimalFormat;
    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkSize()J

    move-result-wide v6

    long-to-double v6, v6

    mul-double/2addr v6, v10

    div-double/2addr v6, v8

    div-double/2addr v6, v8

    invoke-virtual {v4, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 97
    .local v1, "alllength":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkDownloadSize()J

    move-result-wide v6

    long-to-double v6, v6

    mul-double/2addr v6, v10

    div-double/2addr v6, v8

    div-double/2addr v6, v8

    invoke-virtual {v4, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    .line 98
    .local v3, "currentPosition":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "MB/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "MB"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "allStateString":Ljava/lang/String;
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_progressPb:Landroid/widget/ProgressBar;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkDownloadSize()J

    move-result-wide v6

    const-wide/16 v8, 0x64

    mul-long/2addr v6, v8

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getApkSize()J

    move-result-wide v8

    div-long/2addr v6, v8

    long-to-int v6, v6

    invoke-virtual {v5, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 100
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 101
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getInstallState()I

    move-result v5

    if-nez v5, :cond_0

    .line 103
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080227

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0c0012

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    :goto_0
    return-void

    .line 105
    :cond_0
    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getInstallState()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    .line 107
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080228

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0c0011

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 109
    :cond_1
    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/ApkUpdateBean;->getInstallState()I

    move-result v5

    const/4 v6, -0x2

    if-ne v5, v6, :cond_2

    .line 110
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0800b5

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 114
    :cond_2
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v5, p1, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    iget-object v6, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0c0023

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 43
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 50
    if-nez p2, :cond_0

    .line 52
    new-instance v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;-><init>(Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;)V

    .line 53
    .local v0, "holder":Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030005

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 54
    const v1, 0x7f0a0020

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_nameTv:Landroid/widget/TextView;

    .line 55
    const v1, 0x7f0a0021

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_progressPb:Landroid/widget/ProgressBar;

    .line 56
    const v1, 0x7f0a0022

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;->adapter_apk_stateTv:Landroid/widget/TextView;

    .line 57
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 61
    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->updateProgress(Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;I)V

    .line 62
    return-object p2

    .line 59
    .end local v0    # "holder":Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;

    .restart local v0    # "holder":Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    goto :goto_0
.end method

.method public setData(Ljava/util/List;)V
    .locals 0
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
    .line 65
    .local p1, "lists":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/ApkUpdateBean;>;"
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->apkLists:Ljava/util/List;

    .line 66
    return-void
.end method

.method public updateView(Landroid/view/View;I)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "index"    # I

    .prologue
    .line 73
    if-nez p1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;

    .line 77
    .local v0, "holder":Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;
    if-eqz v0, :cond_0

    .line 84
    invoke-direct {p0, v0, p2}, Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter;->updateProgress(Lcom/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder;I)V

    goto :goto_0
.end method
