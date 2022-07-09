.class Lcom/edutech/appmanage/MainActivity$MyAdapter$3;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iput p3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->val$position:I

    .line 1620
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1625
    const-string/jumbo v1, "AppmanageMainActivity"

    const-string/jumbo v2, "\u51c6\u5907\u6253\u5f00\u3002\u3002\u3002"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1626
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1628
    const v2, 0x7f0801a0

    .line 1627
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1629
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->val$holder:Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$MyAdapter$ViewHolder;->btn_start:Landroid/widget/Button;

    .line 1630
    invoke-virtual {v2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    .line 1629
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 1630
    if-eqz v1, :cond_0

    .line 1632
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 1633
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1635
    const v3, 0x7f0801a4

    .line 1634
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1636
    const/4 v3, 0x0

    .line 1631
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 1637
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1647
    :goto_0
    return-void

    .line 1639
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1641
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1643
    sget-object v1, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1644
    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->val$position:I

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v1, v1, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 1642
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 1645
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$3;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/edutech/appmanage/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
