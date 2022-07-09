.class Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;
.super Ljava/lang/Object;
.source "NameListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/NameListAdapter;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iput p2, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->val$position:I

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->nameControl:Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    iget v1, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->val$position:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string/jumbo v1, "code"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v1, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->nameControl:Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/NameListAdapter;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter;->names:Ljava/util/List;

    iget v2, p0, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$2;->val$position:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string/jumbo v2, "code"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0}, Lcom/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface;->okName(Ljava/lang/String;)V

    .line 88
    :cond_0
    return-void
.end method
