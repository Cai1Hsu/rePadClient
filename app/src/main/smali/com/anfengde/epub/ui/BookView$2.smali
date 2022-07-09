.class Lcom/anfengde/epub/ui/BookView$2;
.super Ljava/lang/Object;
.source "BookView.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/anfengde/epub/ui/BookView;->showAddbooksWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/BookView;


# direct methods
.method constructor <init>(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    .line 618
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 623
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$39(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v2, "img"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget v2, Lcom/anfengde/epub/ui/R$drawable;->ex_folder:I

    if-ne v1, v2, :cond_0

    .line 624
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$39(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v3, "info"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/anfengde/epub/ui/BookView;->access$40(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V

    .line 625
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$41(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/anfengde/epub/ui/BookView;->access$42(Lcom/anfengde/epub/ui/BookView;Ljava/util/List;)V

    .line 626
    new-instance v0, Lcom/anfengde/epub/ui/BookListAdapter;

    .line 627
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$39(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;

    move-result-object v2

    .line 626
    invoke-direct {v0, v1, v2}, Lcom/anfengde/epub/ui/BookListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 628
    .local v0, "adapter":Lcom/anfengde/epub/ui/BookListAdapter;
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$43(Lcom/anfengde/epub/ui/BookView;)Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 636
    .end local v0    # "adapter":Lcom/anfengde/epub/ui/BookListAdapter;
    :goto_0
    return-void

    .line 630
    :cond_0
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$44(Lcom/anfengde/epub/ui/BookView;)Landroid/widget/PopupWindow;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/PopupWindow;->dismiss()V

    .line 631
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v2

    .line 632
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "javascript:$(\'#filepath\').attr(\'value\',\'"

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 633
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$2;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$39(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 634
    const-string/jumbo v4, "info"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 633
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 634
    const-string/jumbo v3, "\')"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 632
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
