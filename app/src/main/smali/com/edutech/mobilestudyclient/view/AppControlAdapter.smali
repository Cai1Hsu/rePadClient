.class public Lcom/edutech/mobilestudyclient/view/AppControlAdapter;
.super Landroid/widget/BaseAdapter;
.source "AppControlAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private details:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0
    .param p2, "mContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "details":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/util/AppDetails;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    .line 27
    iput-object p2, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->mContext:Landroid/content/Context;

    .line 28
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getDetails()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 54
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "arg2"    # Landroid/view/ViewGroup;

    .prologue
    .line 61
    if-nez p2, :cond_3

    .line 63
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f030009

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 64
    new-instance v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;-><init>(Lcom/edutech/mobilestudyclient/view/AppControlAdapter;)V

    .line 65
    .local v1, "holder":Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;
    const v5, 0x7f0a002c

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->img_icon:Landroid/widget/ImageView;

    .line 66
    const v5, 0x7f0a002d

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->tv_name:Landroid/widget/TextView;

    .line 67
    const v5, 0x7f0a002e

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->tv_version:Landroid/widget/TextView;

    .line 68
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 73
    :goto_0
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, p1, :cond_2

    .line 75
    iget-object v5, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/util/AppDetails;

    .line 76
    .local v0, "appinfo":Lcom/edutech/mobilestudyclient/util/AppDetails;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 77
    .local v2, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppName()Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/edutech/mobilestudyclient/util/AppDetails;->getAppVersion()Ljava/lang/String;

    move-result-object v4

    .line 79
    .local v4, "version":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 81
    iget-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->img_icon:Landroid/widget/ImageView;

    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 83
    :cond_0
    if-eqz v3, :cond_1

    .line 85
    iget-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->tv_name:Landroid/widget/TextView;

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    :cond_1
    if-eqz v4, :cond_2

    .line 89
    iget-object v5, v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;->tv_version:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string/jumbo v7, "V: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .end local v0    # "appinfo":Lcom/edutech/mobilestudyclient/util/AppDetails;
    .end local v2    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "version":Ljava/lang/String;
    :cond_2
    return-object p2

    .line 71
    .end local v1    # "holder":Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;
    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;

    .restart local v1    # "holder":Lcom/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder;
    goto :goto_0
.end method

.method public setDetails(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/AppDetails;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "details":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/util/AppDetails;>;"
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/AppControlAdapter;->details:Ljava/util/List;

    .line 37
    return-void
.end method
