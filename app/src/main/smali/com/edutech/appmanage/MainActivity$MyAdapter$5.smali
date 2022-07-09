.class Lcom/edutech/appmanage/MainActivity$MyAdapter$5;
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

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    iput p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->val$position:I

    .line 1717
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;)Lcom/edutech/appmanage/MainActivity$MyAdapter;
    .locals 1

    .prologue
    .line 1717
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1721
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1722
    iget v3, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->val$position:I

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v1, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->packagename:Ljava/lang/String;

    .line 1724
    .local v1, "packagename":Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .line 1725
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    .line 1724
    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1727
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1728
    const v3, 0x7f08003f

    .line 1727
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1726
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 1730
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1732
    const v5, 0x7f0801a6

    .line 1731
    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1733
    sget-object v2, Lcom/edutech/appmanage/MainActivity;->market_applist:Ljava/util/LinkedList;

    .line 1734
    iget v5, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->val$position:I

    invoke-virtual {v2, v5}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/edutech/appmanage/MainActivity$AppInfo;

    iget-object v2, v2, Lcom/edutech/appmanage/MainActivity$AppInfo;->appname:Ljava/lang/String;

    .line 1733
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1735
    iget-object v4, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v4}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 1737
    const v5, 0x7f0801a7

    .line 1736
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1735
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1730
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1729
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1739
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1740
    const v3, 0x7f0801a8

    .line 1739
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1741
    new-instance v3, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;

    invoke-direct {v3, p0, v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;Ljava/lang/String;)V

    .line 1738
    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1789
    iget-object v2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->this$1:Lcom/edutech/appmanage/MainActivity$MyAdapter;

    invoke-static {v2}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 1790
    const v3, 0x7f0801a9

    .line 1789
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1791
    new-instance v3, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$2;

    invoke-direct {v3, p0}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$2;-><init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;)V

    .line 1788
    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1802
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1803
    return-void
.end method
