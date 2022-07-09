.class public Lcom/edutech/appmanage/DownLoadManage;
.super Landroid/app/Activity;
.source "DownLoadManage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/DownLoadManage$MyAdapter;
    }
.end annotation


# static fields
.field static final DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

.field public static final KB_2_BYTE:I = 0x400

.field public static final MB_2_BYTE:I = 0x100000


# instance fields
.field private adapter:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

.field private handler:Landroid/os/Handler;

.field private lv:Landroid/widget/ListView;

.field private none_down:Landroid/widget/TextView;

.field runnableUi:Ljava/lang/Runnable;

.field private thread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 101
    new-instance v0, Ljava/text/DecimalFormat;

    const-string/jumbo v1, "0.##"

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/appmanage/DownLoadManage;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    .line 103
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 77
    new-instance v0, Lcom/edutech/appmanage/DownLoadManage$1;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/DownLoadManage$1;-><init>(Lcom/edutech/appmanage/DownLoadManage;)V

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->runnableUi:Ljava/lang/Runnable;

    .line 28
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/DownLoadManage;)Lcom/edutech/appmanage/DownLoadManage$MyAdapter;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->adapter:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/appmanage/DownLoadManage;)Landroid/widget/TextView;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->none_down:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$2(Lcom/edutech/appmanage/DownLoadManage;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method public static getAppSize(J)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "size"    # J

    .prologue
    const/16 v2, 0x10

    .line 110
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gtz v0, :cond_0

    .line 111
    const-string/jumbo v0, "0M"

    .line 122
    :goto_0
    return-object v0

    .line 113
    :cond_0
    const-wide/32 v0, 0x100000

    cmp-long v0, p0, v0

    if-ltz v0, :cond_1

    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 115
    sget-object v1, Lcom/edutech/appmanage/DownLoadManage;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    long-to-double v2, p0

    const-wide/high16 v4, 0x4130000000000000L    # 1048576.0

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 116
    const-string/jumbo v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_0

    .line 117
    :cond_1
    const-wide/16 v0, 0x400

    cmp-long v0, p0, v0

    if-ltz v0, :cond_2

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 119
    sget-object v1, Lcom/edutech/appmanage/DownLoadManage;->DOUBLE_DECIMAL_FORMAT:Ljava/text/DecimalFormat;

    long-to-double v2, p0

    const-wide/high16 v4, 0x4090000000000000L    # 1024.0

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 120
    const-string/jumbo v1, "K"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_0

    .line 122
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "B"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getNotiPercent(JJ)Ljava/lang/String;
    .locals 6
    .param p0, "progress"    # J
    .param p2, "max"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 132
    const/4 v0, 0x0

    .line 133
    .local v0, "rate":I
    cmp-long v1, p0, v2

    if-lez v1, :cond_0

    cmp-long v1, p2, v2

    if-gtz v1, :cond_1

    .line 134
    :cond_0
    const/4 v0, 0x0

    .line 140
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 135
    :cond_1
    cmp-long v1, p0, p2

    if-lez v1, :cond_2

    .line 136
    const/16 v0, 0x64

    .line 137
    goto :goto_0

    .line 138
    :cond_2
    long-to-double v2, p0

    long-to-double v4, p2

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    mul-double/2addr v2, v4

    double-to-int v0, v2

    goto :goto_0
.end method

.method public static isDownloading(I)Z
    .locals 2
    .param p0, "downloadManagerStatus"    # I

    .prologue
    const/4 v0, 0x1

    .line 150
    const/4 v1, 0x2

    if-eq p0, v1, :cond_0

    .line 151
    const/4 v1, 0x4

    if-eq p0, v1, :cond_0

    .line 152
    if-eq p0, v0, :cond_0

    .line 150
    const/4 v0, 0x0

    :cond_0
    return v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 399
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 407
    :goto_0
    return-void

    .line 401
    :pswitch_0
    invoke-virtual {p0}, Lcom/edutech/appmanage/DownLoadManage;->finish()V

    goto :goto_0

    .line 399
    :pswitch_data_0
    .packed-switch 0x7f0a0040
        :pswitch_0
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v1, 0x400

    .line 40
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    invoke-virtual {p0}, Lcom/edutech/appmanage/DownLoadManage;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 44
    const v0, 0x7f030014

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/DownLoadManage;->setContentView(I)V

    .line 47
    const v0, 0x7f0a0041

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/DownLoadManage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->none_down:Landroid/widget/TextView;

    .line 48
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 49
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->none_down:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 52
    :cond_0
    const v0, 0x7f0a0042

    invoke-virtual {p0, v0}, Lcom/edutech/appmanage/DownLoadManage;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->lv:Landroid/widget/ListView;

    .line 53
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->handler:Landroid/os/Handler;

    .line 54
    new-instance v0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    invoke-direct {v0, p0, p0}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;-><init>(Lcom/edutech/appmanage/DownLoadManage;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->adapter:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    .line 55
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->lv:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/edutech/appmanage/DownLoadManage;->adapter:Lcom/edutech/appmanage/DownLoadManage$MyAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 56
    new-instance v0, Lcom/edutech/appmanage/DownLoadManage$2;

    invoke-direct {v0, p0}, Lcom/edutech/appmanage/DownLoadManage$2;-><init>(Lcom/edutech/appmanage/DownLoadManage;)V

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->thread:Ljava/lang/Thread;

    .line 73
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 74
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 97
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 98
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 93
    return-void
.end method
