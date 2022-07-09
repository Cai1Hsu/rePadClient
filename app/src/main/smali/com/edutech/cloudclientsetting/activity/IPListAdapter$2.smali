.class Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;
.super Ljava/lang/Object;
.source "IPListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

.field private final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/edutech/cloudclientsetting/activity/IPListAdapter;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iput p2, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->val$position:I

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ipControl:Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v1, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ipControl:Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;

    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->this$0:Lcom/edutech/cloudclientsetting/activity/IPListAdapter;

    iget-object v0, v0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter;->ips:Ljava/util/List;

    iget v2, p0, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$2;->val$position:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0}, Lcom/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface;->okIp(Ljava/lang/String;)V

    .line 80
    :cond_0
    return-void
.end method
