.class Lcom/edutech/appmanage/MainActivity$MyAdapter$7;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iput p3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$position:I

    .line 1894
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v5, 0x7f0801ab

    .line 1897
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1898
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1900
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v3, v3, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1901
    invoke-virtual {v3}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 1900
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1901
    if-nez v2, :cond_1

    .line 1905
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v2

    .line 1906
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v3}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1908
    const v4, 0x7f0801ac

    .line 1907
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1909
    const/4 v4, 0x0

    .line 1904
    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1910
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1911
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1912
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$position:I

    if-le v2, v3, :cond_1

    .line 1913
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1914
    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$position:I

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v0, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->apkname:Ljava/lang/String;

    .line 1915
    .local v0, "apkname":Ljava/lang/String;
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1916
    iget-object v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v3}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 1917
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1916
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1919
    new-instance v1, Ljava/io/File;

    .line 1920
    new-instance v2, Ljava/lang/StringBuilder;

    .line 1921
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 1922
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1923
    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1924
    sget-object v3, Lcom/edutech/appmanage/MainActivity;->FOLDER_MAIN:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1925
    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1926
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1920
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1919
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1975
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1976
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1980
    :cond_0
    iget v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$7;->val$position:I

    .line 1981
    const/4 v3, 0x1

    .line 1979
    invoke-static {v2, v3}, Lcom/edutech/appmanage/HttpHelper;->download(II)V

    .line 1984
    .end local v0    # "apkname":Ljava/lang/String;
    .end local v1    # "file":Ljava/io/File;
    :cond_1
    return-void
.end method
