.class Lcom/edutech/appmanage/MainActivity$MyAdapter;
.super Landroid/widget/BaseAdapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

.field context:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1379
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 1380
    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->context:Landroid/content/Context;

    .line 1381
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 1382
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;
    .locals 1

    .prologue
    .line 1372
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    return-object v0
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 1386
    sget-object v0, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 1391
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 1396
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1403
    if-nez p2, :cond_5

    .line 1404
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->mInflater:Landroid/view/LayoutInflater;

    const v7, 0x7f030077

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 1406
    new-instance v5, Landroid/widget/AbsListView$LayoutParams;

    .line 1407
    const/4 v6, -0x1

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v7}, Lcom/edutech/appmanage/MainActivity;->access$18(Lcom/edutech/appmanage/MainActivity;)I

    move-result v7

    .line 1406
    invoke-direct {v5, v6, v7}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    .line 1408
    .local v5, "params":Landroid/widget/AbsListView$LayoutParams;
    invoke-virtual {p2, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1409
    new-instance v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;)V

    .line 1412
    .local v1, "holder":Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;
    const v6, 0x7f0a01cd

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/LinearLayout;

    .line 1411
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->layout:Landroid/widget/LinearLayout;

    .line 1414
    const v6, 0x7f0a01d0

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 1413
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->name:Landroid/widget/TextView;

    .line 1416
    const v6, 0x7f0a01d1

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 1415
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->code:Landroid/widget/TextView;

    .line 1418
    const v6, 0x7f0a01ce

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 1417
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    .line 1422
    const v6, 0x7f0a01d2

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 1421
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1424
    const v6, 0x7f0a01d3

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 1423
    iput-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    .line 1427
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    .line 1428
    .local v4, "para":Landroid/view/ViewGroup$LayoutParams;
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v6}, Lcom/edutech/appmanage/MainActivity;->access$19(Lcom/edutech/appmanage/MainActivity;)I

    move-result v6

    iput v6, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1429
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v6}, Lcom/edutech/appmanage/MainActivity;->access$20(Lcom/edutech/appmanage/MainActivity;)I

    move-result v6

    iput v6, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1430
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    invoke-virtual {v6, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1431
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1437
    .end local v4    # "para":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "params":Landroid/widget/AbsListView$LayoutParams;
    :goto_0
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    if-eqz v6, :cond_4

    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_4

    .line 1438
    new-instance v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-direct {v6, v7}, Lcom/edutech/appmanage/MainActivity$AppInfo;-><init>(Lcom/edutech/appmanage/MainActivity;)V

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    .line 1439
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6, p1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iput-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    .line 1440
    const-string/jumbo v6, "AppmanageMainActivity"

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1441
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-boolean v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    if-eqz v6, :cond_a

    .line 1442
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setFocusable(Z)V

    .line 1443
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setFocusable(Z)V

    .line 1444
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1445
    const v8, 0x7f08003e

    .line 1444
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1446
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1447
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1448
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1449
    const v8, 0x7f0200e1

    .line 1448
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 1447
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1450
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    .line 1451
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1452
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1453
    const v8, 0x7f0200e1

    .line 1452
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 1451
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1454
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1455
    const v8, 0x7f0c0004

    .line 1454
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setTextColor(I)V

    .line 1459
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_0

    .line 1462
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-boolean v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    if-eqz v6, :cond_0

    .line 1463
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1464
    const v8, 0x7f0801a0

    .line 1463
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1468
    :cond_0
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_1

    .line 1469
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v0, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 1471
    .local v0, "apkname":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-lt v2, v6, :cond_6

    .line 1499
    .end local v0    # "apkname":Ljava/lang/String;
    .end local v2    # "i":I
    :cond_1
    :goto_2
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setVisibility(I)V

    .line 1503
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_2

    .line 1504
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1506
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-boolean v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->update:Z

    if-eqz v6, :cond_8

    .line 1513
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->code:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1514
    const v9, 0x7f0801a2

    .line 1513
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1515
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v8, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->local_versionName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1516
    const-string/jumbo v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1517
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1518
    const v9, 0x7f0801a3

    .line 1517
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 1519
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v8, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1513
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1520
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1521
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 1522
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1523
    const v8, 0x7f0200f2

    .line 1522
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 1521
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1524
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1525
    const v8, 0x7f0801a1

    .line 1524
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1526
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1527
    new-instance v7, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;

    invoke-direct {v7, p0, p1, v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;ILcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1585
    new-instance v6, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;

    invoke-direct {v6, p0, v1, p1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;I)V

    invoke-virtual {p2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1652
    :cond_2
    :goto_3
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    if-eqz v6, :cond_3

    .line 1653
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_3

    .line 1654
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_9

    .line 1655
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v7, v7, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1662
    :cond_3
    :goto_4
    const v6, 0x7f0a01d2

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 1663
    new-instance v7, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;

    invoke-direct {v7, p0, v1, p1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1716
    const v6, 0x7f0a01d3

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 1717
    new-instance v7, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    invoke-direct {v7, p0, p1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;I)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1991
    :cond_4
    :goto_5
    return-object p2

    .line 1433
    .end local v1    # "holder":Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;
    :cond_5
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    .restart local v1    # "holder":Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;
    goto/16 :goto_0

    .line 1472
    .restart local v0    # "apkname":Ljava/lang/String;
    .restart local v2    # "i":I
    :cond_6
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    const-string/jumbo v7, "apkname"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 1473
    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1477
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1478
    iget-object v7, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v7}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 1480
    const v8, 0x7f0801a0

    .line 1479
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1478
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 1471
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1615
    .end local v0    # "apkname":Ljava/lang/String;
    .end local v2    # "i":I
    :cond_8
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->code:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1616
    const v9, 0x7f0801a2

    .line 1615
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1617
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v8, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1615
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1620
    new-instance v6, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;

    invoke-direct {v6, p0, v1, p1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;I)V

    invoke-virtual {p2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_3

    .line 1657
    :cond_9
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    .line 1658
    const v7, 0x7f020136

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 1806
    :cond_a
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-eqz v6, :cond_4

    .line 1807
    sget-object v7, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    monitor-enter v7

    .line 1808
    :try_start_0
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1809
    const v9, 0x7f0801aa

    .line 1808
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1810
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_b

    .line 1811
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-boolean v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->doing:Z

    if-eqz v6, :cond_b

    .line 1812
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1813
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1815
    const v9, 0x7f0801ab

    .line 1814
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1813
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1818
    :cond_b
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1819
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 1820
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1821
    const v9, 0x7f0200e1

    .line 1820
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 1819
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1822
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    .line 1823
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 1824
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1825
    const v9, 0x7f0200f1

    .line 1824
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 1823
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1826
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_uninstall:Landroid/widget/Button;

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1827
    const v9, 0x7f0c0008

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    .line 1826
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 1829
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_c

    .line 1831
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v0, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 1832
    .restart local v0    # "apkname":Ljava/lang/String;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_6
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    .line 1833
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 1832
    if-lt v2, v6, :cond_e

    .line 1871
    .end local v0    # "apkname":Ljava/lang/String;
    .end local v2    # "i":I
    :cond_c
    :goto_7
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v8, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1872
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->code:Landroid/widget/TextView;

    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v9}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 1873
    const v10, 0x7f0801a2

    .line 1872
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1874
    iget-object v9, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v9, v9, Lcom/edutech/appmanage/MainActivity$AppInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1872
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1875
    sget-object v6, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    invoke-virtual {v6}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-ge p1, v6, :cond_d

    .line 1876
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v6, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_10

    .line 1877
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    .line 1878
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v8, v8, Lcom/edutech/appmanage/MainActivity$AppInfo;->appicon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1884
    :cond_d
    :goto_8
    new-instance v6, Lcom/edutech/appmanage/MainActivity$MyAdapter$6;

    invoke-direct {v6, p0}, Lcom/edutech/appmanage/MainActivity$MyAdapter$6;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;)V

    invoke-virtual {p2, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1892
    const v6, 0x7f0a01d2

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 1894
    new-instance v8, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;

    invoke-direct {v8, p0, v1, p1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;I)V

    .line 1893
    invoke-virtual {v6, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1807
    monitor-exit v7

    goto/16 :goto_5

    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 1836
    .restart local v0    # "apkname":Ljava/lang/String;
    .restart local v2    # "i":I
    :cond_e
    :try_start_1
    iget-object v6, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-boolean v3, v6, Lcom/edutech/appmanage/MainActivity$AppInfo;->islocal:Z

    .line 1837
    .local v3, "islocal":Z
    sget-object v6, Lcom/edutech/appmanage/HttpHelper;->install_num:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    .line 1838
    const-string/jumbo v8, "apkname"

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 1839
    if-nez v3, :cond_f

    .line 1843
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1844
    iget-object v8, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v8}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 1846
    const v9, 0x7f0801ab

    .line 1845
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1844
    invoke-virtual {v6, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_7

    .line 1833
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 1880
    .end local v0    # "apkname":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "islocal":Z
    :cond_10
    iget-object v6, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->image:Landroid/widget/ImageView;

    .line 1881
    const v8, 0x7f020136

    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_8
.end method
