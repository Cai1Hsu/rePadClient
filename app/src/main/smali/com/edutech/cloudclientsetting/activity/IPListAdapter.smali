.class public Lcom/edutech/cloudclientsetting/activity/IPListAdapter;
.super Landroid/widget/BaseAdapter;
.source "IPListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;,
        Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;
    }
.end annotation


# instance fields
.field ipControl:Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;

.field ips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mcontext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;)V
    .locals 0
    .param p2, "mcontext"    # Landroid/content/Context;
    .param p3, "ipcontrol"    # Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;",
            ")V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "ips":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    .line 23
    iput-object p2, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->mcontext:Landroid/content/Context;

    .line 24
    iput-object p3, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ipControl:Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;

    .line 25
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 36
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, p1, :cond_1

    :cond_0
    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 42
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 48
    new-instance v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;

    invoke-direct {v0, p0}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;-><init>(Lcom/edutech/cloudclientsetting/activity/IPListAdapter;)V

    .line 49
    .local v0, "holder":Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;
    if-nez p2, :cond_0

    .line 51
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->mcontext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030006

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 52
    const v1, 0x7f0a0023

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    .line 53
    const v1, 0x7f0a0024

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;->tv_delete:Landroid/widget/TextView;

    .line 54
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 59
    :goto_0
    iget-object v2, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    iget-object v1, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;->tv_delete:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$1;

    invoke-direct {v2, p0, p1}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$1;-><init>(Lcom/edutech/cloudclientsetting/activity/IPListAdapter;I)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    iget-object v1, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;->tv_ip:Landroid/widget/TextView;

    new-instance v2, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;

    invoke-direct {v2, p0, p1}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;-><init>(Lcom/edutech/cloudclientsetting/activity/IPListAdapter;I)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    return-object p2

    .line 57
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;
    check-cast v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;

    .restart local v0    # "holder":Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder;
    goto :goto_0
.end method

.method public setIps(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "ips":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    .line 87
    return-void
.end method
