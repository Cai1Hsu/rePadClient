.class Lcom/edutech/appmanage/MainActivity$MyAdapter$2;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iput p3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->val$position:I

    .line 1585
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1590
    const-string/jumbo v1, "AppmanageMainActivity"

    const-string/jumbo v2, "\u51c6\u5907\u6253\u5f00\u3002\u3002\u3002"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1591
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1593
    const v2, 0x7f0801a0

    .line 1592
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1594
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1595
    invoke-virtual {v2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 1594
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1595
    if-eqz v1, :cond_0

    .line 1597
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 1598
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1600
    const v3, 0x7f0801a4

    .line 1599
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1601
    const/4 v3, 0x0

    .line 1596
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 1602
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1612
    :goto_0
    return-void

    .line 1604
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1606
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1608
    sget-object v1, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1609
    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->val$position:I

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v1, v1, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 1607
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 1610
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$2;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/edutech/appmanage/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
