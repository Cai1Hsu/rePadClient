.class Lcom/mongodb/SingleServerCluster$1;
.super Ljava/lang/Object;
.source "SingleServerCluster.java"

# interfaces
.implements Lcom/mongodb/ChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/SingleServerCluster;-><init>(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ClusterableServerFactory;Lcom/mongodb/ClusterListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/ChangeListener",
        "<",
        "Lcom/mongodb/ServerDescription;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/SingleServerCluster;


# direct methods
.method constructor <init>(Lcom/mongodb/SingleServerCluster;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public stateChanged(Lcom/mongodb/ChangeEvent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ChangeEvent",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "event":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<Lcom/mongodb/ServerDescription;>;"
    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 48
    .local v0, "descriptionToPublish":Lcom/mongodb/ServerDescription;
    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->isOk()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-virtual {v1}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ClusterSettings;->getRequiredClusterType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-virtual {v1}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ClusterSettings;->getRequiredClusterType()Lcom/mongodb/ClusterType;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getClusterType()Lcom/mongodb/ClusterType;

    move-result-object v1

    if-eq v2, v1, :cond_1

    .line 51
    const/4 v0, 0x0

    .line 60
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-static {v1, v0}, Lcom/mongodb/SingleServerCluster;->access$000(Lcom/mongodb/SingleServerCluster;Lcom/mongodb/ServerDescription;)V

    .line 61
    return-void

    .line 53
    :cond_1
    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-virtual {v1}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ClusterSettings;->getRequiredClusterType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-virtual {v1}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ClusterSettings;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/mongodb/SingleServerCluster$1;->this$0:Lcom/mongodb/SingleServerCluster;

    invoke-virtual {v1}, Lcom/mongodb/SingleServerCluster;->getSettings()Lcom/mongodb/ClusterSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ClusterSettings;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getSetName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 56
    const/4 v0, 0x0

    goto :goto_0
.end method
