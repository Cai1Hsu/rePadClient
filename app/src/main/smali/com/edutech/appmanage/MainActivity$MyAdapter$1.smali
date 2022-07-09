.class Lcom/edutech/appmanage/MainActivity$MyAdapter$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity$MyAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

.field private final synthetic val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;ILcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$position:I

    iput-object p3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    .line 1527
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v5, 0x7f0801a0

    const/4 v4, 0x0

    .line 1535
    const-string/jumbo v1, "TAGS"

    new-instance v2, Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$position:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "===="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1536
    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$position:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\u66f4\u65b0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1535
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1537
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1538
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1540
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1541
    invoke-virtual {v2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 1540
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1541
    if-eqz v1, :cond_0

    .line 1543
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 1544
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1546
    const v3, 0x7f0801a4

    .line 1545
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1542
    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 1548
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1581
    :goto_0
    return-void

    .line 1551
    :cond_0
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 1552
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1554
    const v3, 0x7f0801a5

    .line 1553
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1550
    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 1556
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1557
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v1, v1, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1558
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1559
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1558
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1567
    new-instance v0, Ljava/io/File;

    .line 1568
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1569
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    .line 1570
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1571
    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1572
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1573
    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1574
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1568
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1567
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1575
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1576
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1579
    :cond_1
    iget v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$1;->val$position:I

    invoke-static {v1, v4}, Lcom/edutech/appmanage/HttpHelper;->download(II)V

    goto :goto_0
.end method
