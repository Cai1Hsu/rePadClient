.class Lcom/edutech/appmanage/DownLoadManage$MyAdapter;
.super Landroid/widget/BaseAdapter;
.source "DownLoadManage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/DownLoadManage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field click:I

.field context:Landroid/content/Context;

.field holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/edutech/appmanage/DownLoadManage;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/DownLoadManage;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 159
    const/4 v0, -0x1

    iput v0, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->click:I

    .line 165
    iput-object p2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->context:Landroid/content/Context;

    .line 166
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 167
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;)Lcom/edutech/appmanage/DownLoadManage;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->this$0:Lcom/edutech/appmanage/DownLoadManage;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 171
    sget-object v0, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 176
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 181
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/16 v6, 0x8

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 189
    if-nez p2, :cond_1

    .line 190
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v3, 0x7f030015

    .line 191
    const/4 v4, 0x0

    .line 190
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 192
    new-instance v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    invoke-direct {v2, p0}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;-><init>(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;)V

    iput-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 194
    iget-object v3, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 195
    const v2, 0x7f0a0046

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 194
    iput-object v2, v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadCancel:Landroid/widget/Button;

    .line 196
    iget-object v3, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 197
    const v2, 0x7f0a0045

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    .line 196
    iput-object v2, v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    .line 198
    iget-object v3, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 199
    const v2, 0x7f0a0047

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 198
    iput-object v2, v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadTip:Landroid/widget/TextView;

    .line 200
    iget-object v3, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 201
    const v2, 0x7f0a0044

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 200
    iput-object v2, v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadPrecent:Landroid/widget/TextView;

    .line 202
    iget-object v3, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    .line 203
    const v2, 0x7f0a0043

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 202
    iput-object v2, v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadSize:Landroid/widget/TextView;

    .line 204
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    invoke-virtual {p2, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 209
    :goto_0
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->downloadManagerPro:Lcom/edutech/appmanage/utils/DownloadManagerPro;

    .line 210
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 211
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    const-string/jumbo v4, "downid"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 210
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/edutech/appmanage/utils/DownloadManagerPro;->getBytesAndStatus(J)[I

    move-result-object v0

    .line 217
    .local v0, "bytesAndStatus":[I
    const/4 v2, 0x2

    aget v1, v0, v2

    .line 218
    .local v1, "status":I
    invoke-static {v1}, Lcom/edutech/appmanage/DownLoadManage;->isDownloading(I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 219
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 220
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadTip:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 221
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 222
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 236
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 237
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 238
    const-string/jumbo v3, "type"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 237
    if-ne v9, v2, :cond_2

    .line 239
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v3, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadTip:Landroid/widget/TextView;

    sget-object v4, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 240
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 241
    const-string/jumbo v5, "position"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 240
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    .line 241
    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 239
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadSize:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 263
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadPrecent:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 264
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadCancel:Landroid/widget/Button;

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setVisibility(I)V

    .line 265
    aget v2, v0, v9

    if-gez v2, :cond_3

    .line 266
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v9}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 267
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadPrecent:Landroid/widget/TextView;

    const-string/jumbo v3, "0%"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadSize:Landroid/widget/TextView;

    const-string/jumbo v3, "0M/0M"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    :goto_2
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadCancel:Landroid/widget/Button;

    new-instance v3, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;

    invoke-direct {v3, p0, p1}, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$1;-><init>(Lcom/edutech/appmanage/DownLoadManage$MyAdapter;I)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 322
    :goto_3
    return-object p2

    .line 206
    .end local v0    # "bytesAndStatus":[I
    .end local v1    # "status":I
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iput-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    goto/16 :goto_0

    .line 257
    .restart local v0    # "bytesAndStatus":[I
    .restart local v1    # "status":I
    :cond_2
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v3, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadTip:Landroid/widget/TextView;

    sget-object v4, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 258
    sget-object v2, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 259
    const-string/jumbo v5, "position"

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 258
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    .line 259
    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 257
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 270
    :cond_3
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 271
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    aget v3, v0, v9

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 272
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    aget v3, v0, v8

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 273
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadPrecent:Landroid/widget/TextView;

    .line 274
    aget v3, v0, v8

    int-to-long v4, v3

    aget v3, v0, v9

    int-to-long v6, v3

    .line 273
    invoke-static {v4, v5, v6, v7}, Lcom/edutech/appmanage/DownLoadManage;->getNotiPercent(JJ)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadSize:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget v4, v0, v8

    int-to-long v4, v4

    invoke-static {v4, v5}, Lcom/edutech/appmanage/DownLoadManage;->getAppSize(J)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 276
    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget v4, v0, v9

    int-to-long v4, v4

    invoke-static {v4, v5}, Lcom/edutech/appmanage/DownLoadManage;->getAppSize(J)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 275
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 291
    :cond_4
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadTip:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 292
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v6}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 293
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 294
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v8}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 295
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadSize:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 296
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadPrecent:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 297
    iget-object v2, p0, Lcom/edutech/appmanage/DownLoadManage$MyAdapter;->holder:Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder;->downloadCancel:Landroid/widget/Button;

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_3
.end method
