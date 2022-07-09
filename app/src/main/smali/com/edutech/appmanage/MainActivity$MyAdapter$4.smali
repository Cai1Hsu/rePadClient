.class Lcom/edutech/appmanage/MainActivity$MyAdapter$4;
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
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iput p3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$position:I

    .line 1663
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v6, 0x7f0801a0

    const/4 v5, 0x0

    .line 1666
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1668
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1670
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v2

    .line 1671
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v3}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1673
    const v4, 0x7f0801a4

    .line 1672
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1669
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1674
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1713
    :goto_0
    return-void

    .line 1675
    :cond_0
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1676
    const v3, 0x7f0801a1

    .line 1675
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1677
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1679
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v2

    .line 1680
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v3}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1682
    const v4, 0x7f0801a5

    .line 1681
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1678
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1683
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1684
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1685
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v3}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1686
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1685
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1694
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    .line 1695
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 1696
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1697
    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1698
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1699
    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$MyAdapter;->appinfo:Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1694
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1700
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1701
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1703
    :cond_1
    iget v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$position:I

    invoke-static {v2, v5}, Lcom/edutech/appmanage/HttpHelper;->download(II)V

    goto/16 :goto_0

    .line 1705
    .end local v0    # "file":Ljava/io/File;
    :cond_2
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1707
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 1709
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1710
    iget v4, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->val$position:I

    invoke-virtual {v2, v4}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 1708
    invoke-virtual {v3, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 1711
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$4;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/edutech/appmanage/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method
