.class Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;
.super Landroid/widget/BaseAdapter;
.source "CloudClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NoticeAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;
    }
.end annotation


# instance fields
.field private noticeMsgs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/Noticebean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;


# direct methods
.method constructor <init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;)V
    .locals 1

    .prologue
    .line 5340
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 5342
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->noticeMsgs:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 5350
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->noticeMsgs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 5356
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->noticeMsgs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 5362
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 5369
    if-nez p2, :cond_0

    .line 5371
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030013

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 5372
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;

    invoke-direct {v0, p0}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;-><init>(Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;)V

    .line 5373
    .local v0, "holder":Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;
    const v1, 0x7f0a003d

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;->discuss_adapter_web:Landroid/widget/TextView;

    .line 5374
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 5379
    :goto_0
    iget-object v2, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;->discuss_adapter_web:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "\u4f5c\u4e1a: "

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->noticeMsgs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/edutech/mobilestudyclient/util/Noticebean;

    invoke-virtual {v1}, Lcom/edutech/mobilestudyclient/util/Noticebean;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5380
    iget-object v1, v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;->discuss_adapter_web:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->this$0:Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;

    invoke-virtual {v2}, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c004b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 5381
    return-object p2

    .line 5377
    .end local v0    # "holder":Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;

    .restart local v0    # "holder":Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter$Holder;
    goto :goto_0
.end method

.method public setDatas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/edutech/mobilestudyclient/util/Noticebean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 5345
    .local p1, "datas":Ljava/util/List;, "Ljava/util/List<Lcom/edutech/mobilestudyclient/util/Noticebean;>;"
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity$NoticeAdapter;->noticeMsgs:Ljava/util/List;

    .line 5346
    return-void
.end method
