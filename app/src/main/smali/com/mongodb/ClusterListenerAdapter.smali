.class abstract Lcom/mongodb/ClusterListenerAdapter;
.super Ljava/lang/Object;
.source "ClusterListenerAdapter.java"

# interfaces
.implements Lcom/mongodb/ClusterListener;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clusterClosed(Lcom/mongodb/ClusterEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ClusterEvent;

    .prologue
    .line 24
    return-void
.end method

.method public clusterDescriptionChanged(Lcom/mongodb/ClusterDescriptionChangedEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ClusterDescriptionChangedEvent;

    .prologue
    .line 27
    return-void
.end method

.method public clusterOpened(Lcom/mongodb/ClusterEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ClusterEvent;

    .prologue
    .line 21
    return-void
.end method
