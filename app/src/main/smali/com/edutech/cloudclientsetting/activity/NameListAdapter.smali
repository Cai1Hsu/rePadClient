.class public Lcom/edutech/cloudclientsetting/activity/NameListAdapter;
.super Landroid/widget/BaseAdapter;
.source "NameListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;,
        Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;
    }
.end annotation


# instance fields
.field mcontext:Landroid/content/Context;

.field nameControl:Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;

.field names:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;)V
    .locals 0
    .param p2, "mcontext"    # Landroid/content/Context;
    .param p3, "nameControl"    # Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Landroid/content/Context;",
            "Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;",
            ")V"
        }
    .end annotation

    .prologue
    .line 23
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    .line 25
    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->mcontext:Landroid/content/Context;

    .line 26
    iput-object p3, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->nameControl:Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;

    .line 27
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    :cond_0
    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 44
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 50
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;-><init>(Lcom/edutech/cloudclientsetting/activity/NameListAdapter;)V

    .line 51
    .local v0, "holder":Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;
    if-nez p2, :cond_1

    .line 53
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->mcontext:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030006

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 54
    const v3, 0x7f0a0023

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    .line 55
    const v3, 0x7f0a0024

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;->tv_delete:Landroid/widget/TextView;

    .line 56
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 61
    :goto_0
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 62
    .local v2, "infoMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, ""

    .line 63
    .local v1, "info":Ljava/lang/String;
    const-string/jumbo v3, "name"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, "code"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 65
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "code"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, ":  "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v3, "name"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 67
    :cond_0
    iget-object v3, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v3, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;->tv_delete:Landroid/widget/TextView;

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$1;

    invoke-direct {v4, p0, p1}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$1;-><init>(Lcom/edutech/cloudclientsetting/activity/NameListAdapter;I)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    iget-object v3, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    new-instance v4, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;

    invoke-direct {v4, p0, p1}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;-><init>(Lcom/edutech/cloudclientsetting/activity/NameListAdapter;I)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    return-object p2

    .line 59
    .end local v1    # "info":Ljava/lang/String;
    .end local v2    # "infoMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;
    check-cast v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;

    .restart local v0    # "holder":Lcom/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder;
    goto :goto_0
.end method

.method public setIps(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    .line 95
    return-void
.end method
