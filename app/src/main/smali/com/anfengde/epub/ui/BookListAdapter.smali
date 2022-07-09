.class public Lcom/anfengde/epub/ui/BookListAdapter;
.super Landroid/widget/BaseAdapter;
.source "BookListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 18
    iput-object p2, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    .line 19
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookListAdapter;->context:Landroid/content/Context;

    .line 20
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 31
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 37
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 40
    const/4 v0, 0x0

    .line 41
    .local v0, "holder":Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    if-nez p2, :cond_0

    .line 42
    new-instance v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;

    .end local v0    # "holder":Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;-><init>(Lcom/anfengde/epub/ui/BookListAdapter;)V

    .line 43
    .restart local v0    # "holder":Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookListAdapter;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 44
    sget v2, Lcom/anfengde/epub/ui/R$layout;->afd_books_list_item:I

    const/4 v3, 0x0

    .line 43
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 45
    sget v1, Lcom/anfengde/epub/ui/R$id;->afd_img:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->img:Landroid/widget/ImageView;

    .line 46
    sget v1, Lcom/anfengde/epub/ui/R$id;->afd_title:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    .line 47
    sget v1, Lcom/anfengde/epub/ui/R$id;->afd_info:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->info:Landroid/widget/TextView;

    .line 48
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    :goto_0
    iget-object v2, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->img:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 53
    const-string/jumbo v3, "img"

    .line 52
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 54
    iget-object v2, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v3, "title"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    iget-object v2, v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;->info:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookListAdapter;->mData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v3, "info"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    return-object p2

    .line 50
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    check-cast v0, Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;

    .restart local v0    # "holder":Lcom/anfengde/epub/ui/BookListAdapter$ViewHolder;
    goto :goto_0
.end method
